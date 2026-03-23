---
layout: post
title: "Real-Time Linux"
date: 2024-06-15
description: "Most Linux systems are good enough. Some systems have strict timing deadlines."
tags: [linux, real-time, systems, kernel]
---

When most people say a system is "fast," they mean it has high throughput. It processes a lot of data per second, or pages load quickly, or builds finish in under a minute. That's a useful property and it's what most software optimization work is aimed at.

Real-time systems are optimizing for something different. They don't care as much about average performance. They care about the worst case. The guarantee they need is not "this will usually respond in 10ms" but "this will always respond in under 1ms, every single time, no exceptions."

That's a fundamentally harder problem, and it's one I work with regularly.

## The Problem with Standard Linux

Linux is a general-purpose operating system. Its scheduler is designed to give all processes a fair share of CPU time, to maximize throughput, and to stay responsive under heavy load. These are good goals for a desktop or a server.

The problem is that achieving fairness and throughput sometimes requires the kernel to hold up other work. Interrupt handlers, memory management, locking operations — the kernel has many internal paths that, in a standard build, cannot be interrupted. If your real-time process needs to run exactly now, but the kernel is in the middle of a non-preemptible section doing something else, your process waits. That wait is called scheduling latency, and in standard Linux it can spike unpredictably.

For a web server, a latency spike of 5ms is noise. For a control system running a simulation where a missed deadline means corrupted state, it's a failure.

## What PREEMPT_RT Changes

The PREEMPT_RT patch set, which has been in development since 2005 and was finally merged into the mainline kernel with v6.12 in late 2024, addresses this by making the kernel itself fully preemptible. The key changes:

**Threaded interrupts.** Instead of running interrupt handlers in a context that can't be preempted, PREEMPT_RT converts them to kernel threads that the scheduler can manage like any other thread. A high-priority real-time task can preempt an interrupt handler if needed.

**Priority-inherited mutexes.** Standard Linux spinlocks can create priority inversion: a high-priority task waiting for a lock held by a low-priority task gets stuck behind everything the low-priority task gets preempted by. PREEMPT_RT replaces these with proper mutexes that raise the priority of the lock holder while it's blocking a higher-priority thread.

**Fully preemptible kernel paths.** The long non-preemptible sections in the kernel get eliminated or minimized, bounding the worst-case latency the scheduler can impose.

The result is a kernel where scheduling latency can be measured in microseconds rather than milliseconds, consistently, even under load.

## Tuning Beyond the Kernel

The kernel is only part of the picture. Getting deterministic latency in production requires additional work:

**CPU isolation.** You dedicate specific cores to real-time tasks using `isolcpus` boot parameters, removing them from the general scheduler pool. Background kernel threads, IRQ balancing, and RCU callbacks all get steered away from those cores. The real-time task gets CPU time without competition.

**Interrupt affinity.** Device interrupts get pinned to specific non-isolated cores so they don't interrupt your critical processes. You modify `/proc/irq/N/smp_affinity` directly, and usually disable `irqbalance` entirely since it fights against your configuration.

**Memory locking.** Real-time processes call `mlockall()` at startup to prevent their memory from being paged out. A page fault at the wrong moment will blow your latency budget immediately.

**NUMA awareness.** On multi-socket systems, memory access times depend on which socket the memory is physically on relative to where the CPU is. Binding your real-time process to CPUs and memory on the same NUMA node eliminates a whole class of latency variance.

## Hard vs. Soft Real-Time

Not everything that gets called "real-time" has the same requirements.

**Soft real-time** means deadlines are important and you try hard to meet them, but occasional misses are tolerable. Video playback is soft real-time. A dropped frame is annoying; it doesn't corrupt anything.

**Hard real-time** means missing a deadline is a system failure. Industrial control systems, flight simulation, certain medical devices. The system must guarantee deadline adherence, not just optimize for it statistically.

Most of what real-time Linux enables sits in the hard category. The industries that use it, aerospace, defense, industrial automation, simulation, aren't interested in "usually meets deadlines." They need provable bounds.

## Why This Is Getting More Relevant

The PREEMPT_RT merge into mainline is a significant milestone. For years, using real-time Linux meant carrying an out-of-tree patch set and rebuilding the kernel yourself, which made it harder to maintain and harder to justify in organizations with conservative change management policies.

With real-time capability in the upstream kernel, distributions can ship it as a supported configuration. Red Hat already has RHEL for Real Time. The barrier to adopting real-time Linux in environments that need it keeps dropping.

The systems that need deterministic behavior aren't going away either. Autonomous vehicles, robotics, increasingly complex simulation environments. If anything, the demand is growing.

Understanding what real-time actually means, and what it costs to achieve, is increasingly useful knowledge.