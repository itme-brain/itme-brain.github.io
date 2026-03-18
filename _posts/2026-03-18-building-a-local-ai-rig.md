---
layout: post
title: "Building a Local AI Rig"
date: 2026-03-18
description: "The machine I built for local AI work, why I built it, and why good enough hardware changes how I use these tools."
tags: [ai, local-ai, hardware, rocm]
---

After deciding I wanted more of my AI workflow to run locally, the next question was what kind of machine would make that practical.

Not a benchmark trophy. Not a datacenter in a spare room. Just a workstation that could run useful models every day without making the whole thing feel like a science project.

The machine I ended up with is built around an AMD EPYC 7402P, 256 GB of RAM, a 2 TB NVMe drive, and an AMD Radeon AI PRO R9700 with 32 GB of VRAM. The board gives me real x16 PCIe slots too, which leaves room to add more GPUs later instead of rebuilding the whole machine around a dead-end platform. It runs Linux with ROCm, and ROCm has been good enough for the kind of AI work I care about.

That last part matters because a lot of local AI discussion still assumes NVIDIA is the only serious path. NVIDIA is clearly the easier default in many cases. CUDA support is better, more projects test against it first, and you run into fewer weird edges.

But "best supported" and "only workable" are not the same thing. For my use case, this AMD setup has been usable enough that I can stop thinking about the GPU most of the time and focus on the work.

## Buying Around the Hype

AI hardware pricing is strange right now.

The obvious parts are expensive because everyone wants them. New NVIDIA cards, especially the high-end ones, are priced like the market knows exactly how much demand local AI has created. I did not want to build the whole machine around paying hype-cycle prices for every component.

So the rest of the system is deliberately unglamorous: last-generation server-grade hardware that is still very capable. The EPYC platform gives me cores, memory capacity, PCIe lanes, and room to grow without paying workstation-fashion prices. It is not the newest thing, but it is exactly the kind of hardware that becomes interesting once it falls out of the datacenter upgrade cycle.

The GPU is the more deliberate bet. The Radeon AI PRO R9700 is a new card, but it was dramatically cheaper than chasing the top NVIDIA consumer cards. At roughly a fifth of the price of the NVIDIA 5090s I was seeing, the question became whether I believed the AMD software ecosystem would keep improving enough to make the tradeoff worth it.

So far, that bet looks reasonable. ROCm is not as polished as CUDA, but I am getting decent performance out of the card today. For my workloads, that matters more than having the most obvious logo on the box.

## What I Wanted From the Machine

The goal was not to beat hosted frontier models. A local workstation is not going to turn into an infinite cloud API just because it has a large GPU in it.

What I wanted was a default place to run private work.

I wanted to be able to test models without uploading notes, code, or research context to a third party. I wanted a box that could sit on my network and be available whenever I wanted to experiment. I wanted enough memory that large models, local search tools, indexing jobs, and normal development work would not constantly fight each other.

I also wanted the machine to be boring. There is a version of local AI where every session starts with debugging drivers, chasing library versions, or trying to remember which environment variables made something work last week. That gets old fast. The rig needed to be powerful enough to be useful, but stable enough to fade into the background.

## The Daily Models

The models I settled on for day-to-day use are Qwen3.6 27B and Qwen3.6 35B-A3B.

That has been a good balance for me. They are capable enough for coding help, research, summarization, and general reasoning without making every prompt feel painfully slow. They are also large enough that the local setup feels meaningfully different from running a tiny model just to prove that local inference works.

In normal use, I see roughly 25 tokens per second from the 27B model and around 60 tokens per second from the 35B-A3B model. Those are not formal benchmark numbers, but they are the numbers that matter for me: fast enough that I reach for the local models during the day instead of treating them like a novelty.

That is the line I care about: not "can I technically run a model?" but "would I actually choose to use this?"

Plenty of local AI setups clear the first bar and fail the second. A model can be private, cheap per token, and fully under your control, but if it is too slow or too weak you eventually stop reaching for it. For local AI to matter, it has to become part of the normal workflow.

This machine gets close enough to that for me.

## Why So Much System RAM?

The 256 GB of RAM is not there because every model needs it. Most of the time, the GPU is the part people talk about, and for good reason. VRAM decides a lot about what can run comfortably.

But system RAM gives the machine breathing room.

It lets me keep larger models, caches, indexing jobs, containers, build trees, and other tools around without the machine feeling fragile. It also matters for experiments where not everything fits neatly in VRAM. Local AI is not just one process running one model. It tends to become a small pile of services: inference, search, retrieval, development tools, monitoring, and whatever else I am currently testing.

I did not want the box to be useful only when treated delicately.

## ROCm Has Been Good Enough

ROCm still has rough edges. I would not pretend otherwise. Some projects assume CUDA first. Some instructions are written as if AMD users do not exist. Sometimes support depends on exactly which GPU generation, kernel, library, or build flags are involved.

But for this machine, with this GPU, it has been good enough to do real work.

That is an important distinction. I am not trying to make a universal claim that AMD is the right choice for everyone building a local AI box. If someone wants the smoothest possible path and has the budget, NVIDIA is still the safest answer.

I am saying that the AMD path is workable now in a way that matters. It is not just a curiosity. I can run my daily models, build against the stack, and get decent performance. The machine is useful.

For me, that is the threshold.

## Owning the Box Changes the Workflow

The biggest difference is psychological.

When inference is local, I use it differently. I am more willing to paste rough notes into it. I am more willing to let it chew on something unpolished. I am more willing to test odd workflows, run long experiments, and point tools at local files.

There is no per-token bill in the back of my mind. There is no question about which provider is storing what. There is no need to route every experiment through a hosted interface that was built for a general audience.

The machine is not free. The hardware cost is real. Power and heat are real. Time spent maintaining the setup is real.

But once it exists, the marginal cost of curiosity gets much lower.

That matters more than I expected.

## What It Still Does Not Solve

Local hardware does not remove all the hard parts.

The best cloud models are still better at many tasks. Long-context work still runs into memory pressure. Some software stacks are fragile. Model quality varies wildly. Quantization choices matter. A bad prompt still gives a bad answer, just privately.

There is also a maintenance burden that hosted tools hide. If something breaks, I own it. Driver updates, ROCm changes, model compatibility, build failures, disk usage, and thermal behavior all become my problem.

That is the trade.

I am comfortable with it because the machine gives me something I cannot get from a subscription: a place to experiment freely, privately, and repeatedly.

## The Point

The local rig is not about rejecting the cloud completely. It is about changing the default.

Cloud models are still part of my toolbox. But for everyday AI work, especially the parts involving private notes, security research, local code, and experiments that benefit from being close to the machine, I want a capable local path.

This setup gives me that.

It is not perfect. It does not need to be. It is fast enough, private enough, and flexible enough that I actually use it. That is the thing that matters.
