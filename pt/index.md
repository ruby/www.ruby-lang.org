---
layout: page
title: "Linguagem de Programação Ruby"
lang: pt

javascript:
 - examples

header: |
  <div id="intro">
    <h1>Ruby é...</h1>

    <p>
    Uma linguagem dinâmica, open source com foco na simplicidade e na
    produtividade. Tem uma sintaxe elegante de leitura natural e fácil escrita.
    </p>

    <a href="about/">Ler Mais...</a>
  </div>
  <div id="code"></div>

sidebar: |
  <a href="downloads/">
    <img src="/images/download.gif" alt="Download Ruby" title="" />
  </a>

---

{% for post in site.categories.en limit:2 %}
<div class="post">
  <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>

  {{ post.content | strip_html | truncatewords: 25 }}

  <p><a href="{{ post.url }}">Continuar Leitura...</a></p>

  <span class="post-info">Escrito por {{ post.author }} em {{ post.date | date_to_string }}</span>
</div>
{% endfor %}

<div id="news">
  <h3><a href="news/">Outras Notícias</a></h3>
  <ul>
    {% for post in site.categories.en offset:2 limit:3 %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
      <span class="post-info">Escrito por {{ post.author }} em {{ post.date | date_to_string }}</span>
    </li>
    {% endfor %}
  </ul>

  <ul>
    {% for post in site.categories.en offset:5 limit:3 %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
      <span class="post-info">Escrito por {{ post.author }} em {{ post.date | date_to_string }}</span>
    </li>
    {% endfor %}
  </ul>
</div>
