---
layout: page
title: Bryan Ramos
description: Bryan Ramos works with Linux, Nix, automation, local AI, and open source tools.
---

<h1>bryan ramos</h1>

<h2>projects</h2>

<ul>
  <li>
    <a href="https://github.com/itme-brain/web-search-mcp">web-search-mcp</a>
  </li>
  <li>
    <a href="https://github.com/itme-brain/nixos">nixos</a>
  </li>
</ul>

<h2>writing</h2>

<ul>
  {% for post in site.posts limit:5 %}
  <li>
    <time datetime="{{ post.date | date: '%Y-%m-%d' }}">{{ post.date | date: "%Y-%m-%d" }}</time>
    <a href="{{ post.url | relative_url }}">{{ post.title | downcase }}</a>
  </li>
  {% endfor %}
</ul>

<p><a href="{{ '/blog' | relative_url }}">all writing</a></p>
