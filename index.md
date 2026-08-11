---
layout: page
title: Systems Developer
description: Bryan Ramos works with Linux, Nix, automation, local AI, and open source tools.
---

<section class="hero">
  <div class="hero-copy">
    <p class="eyebrow"><span aria-hidden="true">//</span> systems engineer · open source developer</p>
    <h1>Automation and local systems.</h1>
    <p class="hero-intro">Interested in automation, security, resilient systems design, and open-source AI. I value fine-grained control, reproducible environments, and documentation that makes a system understandable. I’d rather get something useful working, test it under real conditions, and improve it than get stuck on theory.</p>
    <div class="hero-actions">
      <a class="button button-primary" href="https://github.com/itme-brain">Work <span aria-hidden="true">→</span></a>
      <a class="button" href="{{ '/blog' | relative_url }}">Writing</a>
    </div>
  </div>
  <figure class="profile-card">
    <img src="{{ '/assets/avatar.jpg' | relative_url }}" alt="Low-poly avatar of Bryan">
    <figcaption>
      <strong>Bryan Ramos</strong>
      <span>@itme-brain</span>
    </figcaption>
  </figure>
</section>

<section class="principles" aria-label="Engineering principles">
  <div>
    <span class="principle-index">01</span>
    <strong>Solve real problems</strong>
    <p>Start with what people actually need and build from there.</p>
  </div>
  <div>
    <span class="principle-index">02</span>
    <strong>Scale through clear processes</strong>
    <p>Use reproducible development environments and documentation others can follow.</p>
  </div>
  <div>
    <span class="principle-index">03</span>
    <strong>Ship, then refine</strong>
    <p>Working software comes first. Improve it with evidence from real use.</p>
  </div>
</section>

<section class="workbench">
  <div class="section-header">
    <div>
      <p class="eyebrow"><span aria-hidden="true">//</span> work</p>
      <h2>Projects</h2>
    </div>
    <a class="text-link" href="https://github.com/itme-brain?tab=repositories">all repositories <span aria-hidden="true">→</span></a>
  </div>

  <div class="project-grid">
    <article class="project-card">
      <div class="project-heading">
        <span class="repo-icon" aria-hidden="true">git</span>
        <span class="project-state">active</span>
      </div>
      <h3><a href="https://github.com/itme-brain/web-search-mcp">web-search-mcp</a></h3>
      <p>Self-hosted web search for LLM agents, with compact evidence, citations, targeted reads, and no paid search API.</p>
      <ul class="project-meta" aria-label="Project details">
        <li>python</li>
        <li>mcp</li>
        <li>nix</li>
      </ul>
    </article>

    <article class="project-card">
      <div class="project-heading">
        <span class="repo-icon" aria-hidden="true">git</span>
        <span class="project-state">living config</span>
      </div>
      <h3><a href="https://github.com/itme-brain/nixos">nixos</a></h3>
      <p>Modular NixOS infrastructure and tooling for reproducible machines, services, and development environments.</p>
      <ul class="project-meta" aria-label="Project details">
        <li>nix</li>
        <li>linux</li>
        <li>dotfiles</li>
      </ul>
    </article>
  </div>
</section>

<div class="home-columns">
  <section class="toolbox">
    <div class="section-header compact">
      <div>
        <p class="eyebrow"><span aria-hidden="true">//</span> skills</p>
        <h2>Tools and systems</h2>
      </div>
    </div>
    <dl class="tool-list">
      <div><dt>systems</dt><dd>Linux, Real-Time &amp; Latency-Sensitive Systems, Networking, Virtualization, Simulation</dd></div>
      <div><dt>languages</dt><dd>C/C++, Python, Bash, Rust</dd></div>
      <div><dt>operations</dt><dd>Nix/NixOS, Proxmox, Docker, Git</dd></div>
      <div><dt>protocols</dt><dd>CAN, EtherCAT, ARINC 429, MIL-STD-1553</dd></div>
      <div><dt>current</dt><dd>Open-Source AI, RAG Pipelines, MCP</dd></div>
    </dl>
  </section>

  <section class="recent-notes">
    <div class="section-header compact">
      <div>
        <p class="eyebrow"><span aria-hidden="true">//</span> writing</p>
        <h2>Latest posts</h2>
      </div>
    </div>
    <div class="blog-list recent-posts">
      {% for post in site.posts limit:3 %}
      <article class="post-preview">
        <time class="post-date" datetime="{{ post.date | date: '%Y-%m-%d' }}">{{ post.date | date: "%Y.%m.%d" }}</time>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </article>
      {% endfor %}
    </div>
    <a class="text-link notes-link" href="{{ '/blog' | relative_url }}">browse the archive <span aria-hidden="true">→</span></a>
  </section>
</div>
