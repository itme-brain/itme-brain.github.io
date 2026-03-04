---
layout: page
title: Developer / Technologist
---

<section class="section-bio" markdown="1">

I work at the intersection of systems programming, real-time computing, and open-source infrastructure. My background spans Linux systems, simulation engineering and low-level development in C and Python with a growing focus on applied AI and LLM integration. I have a strong preference for auditable, modular stacks and tools that empower user autonomy.

Reach me by [email](mailto:bryan@ramos.codes) or find me on the platforms above.

Please encrypt sensitive messages using my [PGP key](/pgpkey).

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
  <span class="skill-tag">AI / LLM Integration</span>
  <span class="skill-tag">Bitcoin &amp; Lightning</span>
  <span class="skill-tag">Nostr Protocol</span>
  <span class="skill-tag">PGP/GPG</span>
  <span class="skill-tag">Tor</span>
  <span class="skill-tag">Self-Hosting</span>
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
