---
layout: page
title: Software & Systems Engineer
---

<section class="section-bio" markdown="1">

I work with systems programming, real-time computing, and simulation engineering. My background spans Linux, low-level development in C and Python, and debugging latency-critical systems where determinism and microseconds count. Currently exploring applied AI and LLM integration.

Reach me at [bryan@ramos.codes](mailto:bryan@ramos.codes)

</section>

<section class="section-skills">
<h2 class="section-heading">Stack &amp; Tools</h2>
<div class="skills-grid">
  <span class="skill-tag">C</span>
  <span class="skill-tag">Python</span>
  <span class="skill-tag">Bash</span>
  <span class="skill-tag">Linux</span>
  <span class="skill-tag">Real-Time Systems</span>
  <span class="skill-tag">Simulation Engineering</span>
  <span class="skill-tag">AI/LLM Integration</span>
  <span class="skill-tag">Automation</span>
  <span class="skill-tag">Networking</span>
  <span class="skill-tag">Docker</span>
  <span class="skill-tag">KVM/QEMU</span>
  <span class="skill-tag">Nix</span>
  <span class="skill-tag">SQL</span>
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
