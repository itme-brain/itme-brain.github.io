---
layout: post
title: "Why Nostr Never Took Off"
date: 2025-11-16
description: "I was an early Nostr adopter. Two and a half years later, I find myself removing the link from my website after inactivity."
tags: [nostr, social-media, decentralization]
---

I wrote about Nostr in 2023, two and a half years ago. I was cautiously optimistic. The protocol was technically interesting, the key-based identity model was the right idea, and the community was small but engaged. I set up NIP-05 verification on my domain and started posting.

Today I removed the Nostr link from this website. Not because the protocol is gone, it isn't, but because I no longer think it's heading somewhere worth pointing people toward. I want to explain why.

## What It Became

The Nostr feed I checked daily in 2023 was predominantly Bitcoin content. That was expected given the origin story — Nostr grew out of the Bitcoin community, Jack Dorsey funded early development, and the initial network effect came from people already in that space.

What I didn't anticipate was how thoroughly that initial demographic would come to define everything about the platform. By 2024 the dominant conversation wasn't about decentralized protocols or censorship resistance in any general sense. It was a very specific cultural and political monoculture. Post something that didn't fit the consensus worldview and you'd find yourself deprioritized on every major client's algorithm, not through central moderation, but through the informal social mechanics of who runs the popular relays and which follows get amplified.

The "no censorship" promise turned out to mean something narrower: no censorship of the specific things the dominant community wanted to say. Everything else found itself slowly squeezed out not by policy but by indifference and social pressure.

## The Usenet Problem

I've been thinking about how closely this maps to Usenet's decline. Usenet was technically elegant, decentralized before decentralization was a word people used, and destroyed by two things: spam and the collapse of signal-to-noise ratio. Not in that order.

The spam came first and was partially managed through killfiles and moderated groups. But the social problem was harder. Once a community scales past a certain point, the loudest and most persistent voices dominate regardless of quality. The thoughtful people leave because the ratio of effort to reward degrades. What's left is the people who are most motivated to keep posting, which tends to correlate with having the most extreme or commercially motivated things to say.

Nostr repeated this. The relay model doesn't solve discovery; it pushes it to clients and the social graph. If the social graph is already concentrated around a particular community, discovery just reinforces that concentration. Finding interesting people outside the dominant cluster requires already knowing who they are. The protocol has no answer for this.

## Technical Problems That Never Got Solved

The key management problem is still unsolved in any practical sense for average users. Lose your key, lose your identity. Every backup solution involves either trusting someone else with your key (which recreates the custodial problem you were trying to avoid) or being technically sophisticated enough to manage hardware security appropriately.

Relay sustainability never found a clean model. The paid relay experiment had some uptake but the economics are genuinely difficult. Relays that charged too little couldn't cover costs. Relays that charged enough to be sustainable were too expensive for casual users. Free relays became spam sinks that degraded the experience for everyone.

Content discovery across relays remains primitive. The global feed on most clients is unusable noise. Finding good content still requires word of mouth in communities, which means good content in small or niche communities stays invisible.

## What the Protocol Got Right

I want to be fair. The cryptographic identity model is correct. Owning a keypair as your identity is the right design. The protocol simplicity that let dozens of clients get built is genuinely valuable. The fact that there are still active developers working on NIP extensions shows that the core idea has staying power.

The failure isn't that the protocol is wrong. The failure is that a technically correct protocol isn't sufficient to build a healthy social space. You also need thoughtful community cultivation, economic models for infrastructure, and some answer to the discovery problem that doesn't just replicate existing social hierarchies.

None of those are easy. Centralized platforms haven't solved them either, they've just hidden the problem behind algorithms tuned for engagement. But the Nostr community largely believed that solving the technical censorship problem would also solve the social problems, and that turned out not to be true.

## Where I Actually Am Now

I still believe in the principle. Cryptographic identity, open protocols, no single point of control. These are the right building blocks for communication infrastructure that can survive corporate capture.

But building on a protocol that has become an echo chamber isn't advancing those goals, it's just participating in a different kind of monoculture. I'll keep watching what happens with the underlying protocol work. If the community composition changes or the discovery problems get solved in a real way, I'll look again.

For now: the link is gone, the account still exists, and I'm still reachable at `bryan@ramos.codes`
