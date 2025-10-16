---
layout: page
title: Slack wisdom
permalink: /slack-wisdom/
---

{% for post in site.categories.slack-wisdom %}
  <article class="post-preview">
    <h2>{{ post.title }}</h2>
    <p><small>By {{ post.author }} on {{ post.date | date: "%Y-%m-%d" }}</small></p>
    <div class="post-content">
      {{ post.content }}
    </div>
    <hr>
  </article>
{% endfor %}