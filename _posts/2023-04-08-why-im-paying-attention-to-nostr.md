---
layout: post
title: "Why I'm Paying Attention to Nostr"
date: 2023-04-08
description: "Nostr is rough around the edges and the user base is tiny. I'm watching it anyway."
tags: [nostr, decentralization, social-media, bitcoin]
---

I set up my Nostr identity a few weeks ago. It took longer than it should have, involved too many copy-pasted hex strings, and the client I ended up settling on still crashes occasionally. I'm writing about it anyway because I think the underlying idea is interesting enough to track.

## What Nostr Is

Nostr stands for "Notes and Other Stuff Transmitted by Relays." The name is intentionally generic because the protocol is intentionally minimal. At its core it's just a specification for cryptographically signed JSON messages that get broadcast to relay servers. Any client can connect to any relay. Any relay can store any message. The only identity system is a public/private key pair.

There's no company, no central server, no account to create. Your identity is your key. Your posts are signed by that key. Relays can choose what to store and what to drop, but they can't forge your signature or impersonate you.

## Why This Feels Different

I've been on Twitter since around 2010. I've watched it go through multiple cycles of policy changes, API lockdowns, and relationship rewrites between the company and its users. The pattern is always the same: the platform grows, the platform becomes valuable, the platform starts extracting value from users and developers who helped make it valuable.

Mastodon tried to solve this with federation. The problem is that federation still means trusting whoever runs your instance. You're one admin burnout or one bad actor away from your data disappearing or your account being frozen. The ActivityPub model also has a moderation coordination problem where instances end up playing a constant defederation game.

Nostr's approach is different. Because your identity is a key you control, no relay operator can take your identity away. You can switch relays, run your own relay, or use multiple relays simultaneously. The protocol is simple enough that there are now dozens of clients across every platform, and they all interoperate because they're all just reading and writing the same JSON format.

## The Honest Caveats

It's early and it shows. Key management is a real problem. If you lose your private key, you lose your identity and there's no recovery. Most clients have no good answer for this. The onboarding experience for non-technical users is rough.

The user base right now skews heavily toward Bitcoin and cypherpunk communities. That's fine as a starting point but it limits the conversational surface area considerably. If you're not interested in those topics, your feed is going to be thin.

Spam and discovery are unsolved problems. Without central moderation, finding good content requires knowing who to follow, and knowing who to follow requires already being embedded in communities that point you toward people worth following.

## Why I'm Still Here

Despite all that, I set up NIP-05 verification on this domain (which is why you can find me as `bryan@ramos.codes` on Nostr clients that support it) and I'm going to keep posting. The bet I'm making is that the protocol has the right properties to survive even if individual clients and relays come and go.

The thing that keeps bringing me back is the simplicity. I can read the spec in an afternoon. I can run a relay on a small VPS. I can write a client in a weekend if I wanted to. That kind of simplicity is usually a durable property in protocols.

Whether it reaches critical mass or stays a small technical community, I don't know. But the design is right in ways that matter.

Find me on Nostr: `npub17374whevgs040xkd48gr99g0xmpxd9snqt57dsfvtp0jcjt8yjeq49rdyt`
