---
layout: post
title: "Setting Up PGP: Why Encrypted Communication Still Matters"
date: 2023-02-28
description: "A practical look at PGP, why I finally got around to setting up my own key, and why you probably should too."
tags: [security, pgp, privacy]
---

I've been putting off setting up a PGP key for years. It always felt like one of those things that lived in the intersection of "I should do this" and "how many people actually email me sensitive information." The answer to the second question is not many, but that's kind of beside the point.

This week I finally did it, published my public key on this site, and wanted to write down why I think it still matters in 2023.

## What PGP Actually Does

PGP (Pretty Good Privacy) is an encryption standard that lets two people communicate privately, even over completely untrusted channels like email. The core idea is simple: you generate a key pair. One key is public and you give it to anyone who might want to send you something private. The other key is private and never leaves your machine.

When someone wants to send you an encrypted message, they use your public key to lock it. Only your private key can open it. No server in the middle, no account needed, no company storing your messages.

It also works in reverse for signatures. You can sign something with your private key and anyone with your public key can verify the signature came from you. This is useful for verifying software downloads, signing git commits, or just proving a message wasn't tampered with.

<!-- Replace with a terminal screenshot showing gpg --gen-key output or your key fingerprint -->
![GPG key generation in a terminal](/assets/img/pgp-keygen.png)

## Why It Feels Abandoned (And Why That's Wrong)

The honest reason most people haven't set up PGP is that the tooling is rough and the UX has barely changed since the 90s. Keyservers are a mess, key discovery is unreliable, and the average person isn't going to paste an ASCII armor block into a web form to send their friend a message.

Signal exists. Matrix exists. These are genuinely better tools for real-time encrypted chat with non-technical people.

But email isn't going away, and there are specific situations where PGP is still the right tool. Submitting a security vulnerability report. Communicating with people who run their own mail servers. Signing software releases. Verifying the identity of someone you're meeting for the first time online.

The other thing PGP gives you that Signal doesn't is longevity and portability. Your key lives on your hardware. No company can deplatform you, no app can be removed from an app store, no terms of service can change. It's just math.

## Getting Started

The quickest path on Linux is through GnuPG:

```bash
gpg --full-generate-key
```

Choose RSA 4096 or Ed25519. Give it your email address. Set a passphrase. That's your key.

To export your public key so you can share it:

```bash
gpg --armor --export your@email.com
```

Paste that block on your website, upload it to keys.openpgp.org, or just email it to people. Once someone has your public key, they can encrypt messages that only you can read.

I've posted mine on the [PGP key](/pgpkey) page here. If you're sending me anything sensitive, please use it.

## One More Thing

Beyond privacy, generating your own key is a small but meaningful act of taking responsibility for your own security infrastructure. You're not trusting a company to hold your keys. You're not hoping an app stays funded and maintained. The cryptography has been audited for decades and it works.

That's worth the afternoon it takes to set up.