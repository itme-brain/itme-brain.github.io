---
layout: post
title: "Why I'm Moving More AI Work Off the Cloud"
date: 2026-02-10
description: "Cloud AI is useful, but I want more of my day-to-day AI workflow on infrastructure I control."
tags: [ai, local-ai, privacy, security]
---

I have been moving more of my AI workflow onto hardware I control.

That does not mean I am done with cloud models. I still use them, and for some tasks they are clearly the best tool available. The frontier models are fast, capable, and convenient in a way that is hard to argue with.

But convenience is not the only thing I care about.

For a growing amount of my work, especially research, security work, and personal tooling, I want fewer external dependencies. I want to decide what context leaves my machine. I want tools that keep working when an API changes, a rate limit shows up, or a provider decides a workflow no longer fits neatly inside its acceptable-use boundaries.

That has pushed me toward a local-first AI setup: local models when they make sense, local search and retrieval, and a workstation built for experimenting without asking permission from someone else's platform.

## The Problem With Renting Every Thought

Cloud AI has a strange gravity to it. It is easy to start with one hosted model, one API key, and one chat window. Then slowly more of the workflow moves there. Notes, code, research questions, logs, documents, debugging sessions, threat models. The model gets better as it sees more context, so the incentive is always to give it more.

At some point the question changes from "is this useful?" to "how much of my working memory am I comfortable routing through a service I do not control?"

Sometimes the answer is: plenty. If I am asking a general programming question, summarizing public docs, or comparing technologies, the privacy concern is low. The cloud model is just a good tool.

Other times the answer is different. If I am working through security research, private notes, closed-source code, unfinished ideas, internal infrastructure details, or anything that would be awkward to paste into a public forum, I would rather keep the default path local.

This is less about paranoia than posture. I do not want to make a sensitive workflow depend on remembering, every single time, which context is safe to send somewhere else.

## Security Work Is Often Awkwardly Shaped

Security research creates a particular kind of friction with hosted models.

A lot of legitimate defensive work looks suspicious when reduced to a prompt. Understanding exploit chains, malware behavior, persistence mechanisms, credential abuse, phishing infrastructure, evasion techniques, and post-compromise behavior is necessary if you want to defend against those things. It is also dual-use by nature.

Cloud models often handle that ambiguity by refusing broadly. I understand why. Providers are operating at huge scale, they have to make conservative policy decisions, and they do not know who is asking or why.

But from the researcher's side, broad refusal can turn a useful assistant into a wall. The model does not need to help someone cause harm to be useful. It can help explain behavior, compare mitigations, reason through detections, review lab code, or identify what a suspicious artifact is trying to do.

For that kind of work, local models matter. Not because "uncensored" should mean irresponsible, but because security work needs room to discuss uncomfortable systems honestly. Running models locally puts the responsibility where it belongs: on the person operating the tool.

## Privacy Is Also About Drafts

People often talk about privacy as if it only matters for secrets: passwords, keys, customer data, proprietary documents. Those matter, obviously.

But drafts matter too.

Half-formed ideas, personal notes, research trails, failed experiments, and weird debugging paths say a lot about how someone thinks. They are not always sensitive in the legal sense, but they are still private. I want the freedom to explore messy ideas without turning every intermediate thought into data exhaust for a remote service.

Local AI makes that easier. I can point a model at notes, logs, repos, or experiments without first filtering everything through "would I be comfortable uploading this?"

That changes the feel of the tool. It becomes less like a web service and more like part of the machine.

## Local Models Are Not Magic

There are tradeoffs.

Local models are often slower. They can be less capable than the best hosted models. Hardware is expensive, loud, hot, and occasionally annoying. Running the stack yourself means you inherit the boring parts: drivers, model formats, disk space, memory pressure, cooling, updates, broken builds, and tools that almost work.

I do not think local AI replaces cloud AI for everything. That is not the point.

The point is to own the workflows where ownership matters. If a task needs the best reasoning model in the world, I may still use a cloud model. If a task needs privacy, repeatability, looser research constraints, or deeper integration with my local environment, I want a path that does not leave my hardware.

## Tools Matter As Much As Models

Running a model locally is only one piece of the problem.

A model sitting on a workstation still needs useful context. It needs current information, documentation, source material, and a way to inspect the web. Otherwise it becomes a very private but very stale assistant.

That is why I started building more of the surrounding tooling too. Local search. Local retrieval. Local reranking. Agent tools that do not need a paid search API every time they need to answer a grounded question.

The goal is not to rebuild the entire internet in my office. It is to make the common path private and inspectable: the model, the search layer, the retrieval pipeline, and the machine they run on.

## What I Want From This Stack

I want an AI setup that feels boring in the right ways.

I want to ask questions against my own notes without thinking about where the text is going. I want to run models that are useful for security research without fighting a policy layer designed for the most abusive possible user. I want web search that is cheap enough to use freely and transparent enough to debug when the results are bad.

Most of all, I want the stack to be mine. Not because every local component is better than every cloud service, but because control changes what you are willing to build.

When the infrastructure is yours, experiments get easier. Weird ideas get cheaper. Private workflows stay private by default. And when something breaks, you can open the box and see why.

That is the direction I want more of my AI work to move in.
