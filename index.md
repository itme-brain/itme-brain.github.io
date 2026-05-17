---
layout: page
title: Linux Systems & Automation Engineer
---

<section class="section-bio" markdown="1">

I work on Linux systems, real-time computing, infrastructure automation, and applied AI tooling. My work spans low-level diagnostics, C and Python development, reproducible infrastructure, and debugging latency-sensitive critical systems.

Lately I have been focused on minimizing vendor dependencies for developer infrastructure and automation via AI.

Reach me at [bryan@ramos.codes](mailto:bryan@ramos.codes)

</section>

<section class="section-skills">
<h2 class="section-heading">Stack &amp; Tools</h2>
<div class="skills-grid">
  <span class="skill-tag">Linux</span>
  <span class="skill-tag">Real-Time Linux</span>
  <span class="skill-tag">Systems Diagnostics</span>
  <span class="skill-tag">Automation</span>
  <span class="skill-tag">Nix</span>
  <span class="skill-tag">Python</span>
  <span class="skill-tag">C</span>
  <span class="skill-tag">Bash</span>
  <span class="skill-tag">Docker</span>
  <span class="skill-tag">SQL</span>
  <span class="skill-tag">Networking</span>
  <span class="skill-tag">KVM/QEMU</span>
  <span class="skill-tag">AI Integration</span>
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
