---
layout: page
title: Linux Systems & Automation Engineer
---

<section class="section-bio" markdown="1">

I work on Linux systems, real-time computing, automation, and applied AI tooling. My work spans low-level diagnostics, C/C++ and Python development, reproducible infrastructure, and debugging latency-sensitive systems where correctness and determinism are critical.

Lately I have been focused on learning Rust, minimizing vendor dependencies for developer workflows and automation via RAG AI pipelines.

Reach me at [bryan@ramos.codes](mailto:bryan@ramos.codes)

</section>

<section class="section-skills">
<h2 class="section-heading">Stack &amp; Tools</h2>
<div class="skills-grid">
  <span class="skill-tag">Linux</span>
  <span class="skill-tag">Real-Time Systems</span>
  <span class="skill-tag">Diagnostics</span>
  <span class="skill-tag">Automation</span>
  <span class="skill-tag">Git</span>
  <span class="skill-tag">APIs</span>
  <span class="skill-tag">Service Integrations</span>
  <span class="skill-tag">Nix/NixOS</span>
  <span class="skill-tag">C/C++</span>
  <span class="skill-tag">Python</span>
  <span class="skill-tag">Bash</span>
  <span class="skill-tag">Docker</span>
  <span class="skill-tag">SQL</span>
  <span class="skill-tag">Networking</span>
  <span class="skill-tag">KVM/QEMU</span>
  <span class="skill-tag">AI/LLM Integration</span>
  <span class="skill-tag">RAG</span>
  <span class="skill-tag">MCP</span>
</div>
</section>

<section class="section-recent-posts">
<h2 class="section-heading">Recent Posts</h2>
<div class="blog-list recent-posts">
  {% for post in site.posts limit:3 %}
  <div class="post-preview">
    <span class="post-date">{{ post.date | date: "%B %-d, %Y" }}</span>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    {% if post.description %}
    <p class="post-description">{{ post.description }}</p>
    {% endif %}
  </div>
  {% endfor %}
</div>
<p class="view-all-posts"><a href="{{ '/blog' | relative_url }}">View all posts &rarr;</a></p>
</section>
