---
layout: post
title: "Experimenting With TurboQuant and MoE Caching"
date: 2026-04-16
description: "Some notes from maintaining a TurboQuant llama.cpp fork and testing whether hot MoE experts on the GPU could make a huge local model practical."
tags: [ai, llama-cpp, local-ai, inference]
---

After getting the local AI rig into a usable place, I started poking at the next obvious problem: how far could I push it?

The model I was interested in was Qwen3.5 397B-A17B. It is the kind of model that makes local inference feel ridiculous in both directions. On one hand, the fact that it can run at all on a machine in my house is impressive. On the other hand, "can run" and "is pleasant to use" are very different things.

That led me into two related experiments in my llama.cpp fork: maintaining a TurboQuant branch for long-context inference, and testing a Mixture-of-Experts cache that tried to keep the hot experts on the GPU while leaving the rest of the model in system RAM.

TurboQuant was the clear success. The MoE cache was the useful negative result.

## TurboQuant Was the Win

The TurboQuant side was not some grand original implementation from scratch. It was mostly integration and maintenance work.

There was an existing TurboQuant llama.cpp fork, and my work was mainly about rebasing that onto a newer llama.cpp release so I could use it with the rest of my setup. That kind of work is less glamorous than writing a new algorithm, but it is a big part of making local AI experiments real.

llama.cpp moves quickly. Backends change, build systems change, kernel code changes, model support changes, and a fork that worked a few months ago can become stale fast. Rebasing an inference fork is not just "resolve a conflict and move on." You have to make sure the pieces still mean the same thing after upstream moved underneath them.

I have already fallen behind again and need to redo that rebase at some point. That is the cost of carrying an experimental branch on top of a fast-moving project.

But the result was absolutely worth it.

TurboQuant attacks one of the most annoying limits in local inference: the KV cache. Long context is useful, but it is not free. Every token leaves memory behind, and at large context sizes that memory becomes a serious part of whether a model is usable at all.

The Google paper behind TurboQuant, [TurboQuant: Online Vector Quantization with Near-optimal Distortion Rate](https://huggingface.co/papers/2504.19874), argues that KV cache quantization can get extremely aggressive while staying effectively quality neutral at practical bit widths. That lines up with what I saw in practice.

With TurboQuant in my llama.cpp fork, KV cache size dropped from roughly 12 GB to about 1.2 GB while still retaining the full model's 262k token context. In normal use it felt almost entirely lossless.

That is not a small improvement. That changes what kind of long-context work is realistic on local hardware.

I would like to see llama.cpp incorporate this upstream. For now, I maintain the fork because the difference is too useful to give up.

## The MoE Cache Idea Was Different

The more uncertain experiment was the MoE cache.

Mixture-of-Experts models are strange from a systems point of view. The full model can be enormous, but each token only activates part of it. That creates an obvious temptation: if the model is too large to keep entirely on the GPU, maybe you can keep the most-used experts there and leave the rest in CPU memory.

That was the idea I wanted to test with Qwen3.5 397B-A17B.

The rough plan was:

- load the full model into system RAM
- track which experts were getting used
- keep the hot experts resident on the GPU
- fall back to CPU memory for the rest
- see whether the cache hit rate was high enough to beat the simple approach

In theory, that sounds promising. In practice, the machine still has to move data across the system in exactly the wrong places. The cache can help only if the experts it keeps on the GPU are reused often enough to make up for the cost of managing the cache and moving missed experts around.

That was the real question: not whether the idea could be implemented, but whether the hardware balance made it worth doing.

## It Worked, But It Was Slower

The cache worked.

That is worth saying clearly. The experiment was not a failure in the sense of "this could not run." The model loaded. The expert cache did what it was supposed to do. The system could keep hot experts on the GPU and run the rest out of RAM.

But the performance was not good enough.

With the MoE cache enabled, I was seeing around 8 tokens per second. With the model fully loaded in RAM and no MoE cache, I was seeing closer to 10 tokens per second.

That is not the result I wanted, but it is the result that matters.

The simpler approach was faster. Not by an enormous amount, but enough that the extra complexity was hard to justify. If a cache makes the system more complicated and still loses to the baseline, the right answer is not to pretend the cache won. The right answer is to ask why.

## The Bottleneck Was the System

This is where local AI gets interesting to me.

A lot of model discussion focuses on the model itself: parameter count, quantization, context length, benchmark scores. Those things matter, but at this scale the system around the model matters just as much.

The MoE cache was betting that GPU residency for hot experts would beat the cost of pulling everything through CPU memory. On my hardware, that bet did not pay off. The transfer costs, cache management, and actual expert access pattern did not line up well enough.

That does not mean the idea is useless. It means the idea is hardware-sensitive.

On a different machine, the answer could change. More VRAM, multiple GPUs, faster PCIe, different memory bandwidth, a different MoE activation pattern, or a smarter cache policy could move the result. This is exactly why I wanted a local rig in the first place: I can test ideas against real hardware instead of guessing.

## What I Changed in the Fork

My fork ended up with a stack of experimental pieces around this idea:

- TurboQuant rebased onto a newer llama.cpp base
- an MoE expert activation profiler
- cache configuration exposed through normal runtime flags
- hot-expert seeding from profiler output
- fixes for cache correctness issues I ran into while testing
- hysteresis so experts had to show up more than once before being promoted

Some of that was infrastructure more than optimization. Profiling, configuration, and correctness fixes are not the exciting part of an experiment, but they are what make the result believable.

Without them, it is too easy to fool yourself. Maybe the cache is faster. Maybe the workload changed. Maybe the model is silently wrong. Maybe the one prompt you tested happened to hit the right experts. The boring pieces are how you reduce that uncertainty.

## The Useful MoE Result

The useful MoE result was not "I made a 397B model fast on one consumer GPU."

I did not.

The useful result from that side of the experiment was learning where the limits were. Qwen3.5 397B-A17B could run locally on my machine. The MoE cache idea could be implemented. But on this hardware, with this setup, the cache was slower than leaving the model in RAM.

That is still progress. A negative result with numbers is better than a vague assumption. Now I know more about where the bottleneck is, what kind of hardware might change the answer, and which parts of the software stack are worth revisiting later.

I also have a fork that is easier to experiment with next time, even if it has already started to fall behind upstream again.

That is the shape of a lot of local AI work right now. The field moves quickly, the tools are uneven, and not every idea survives contact with the machine. But when the hardware is yours and the stack is inspectable, even the failed experiments leave something useful behind.
