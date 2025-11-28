---
layout: news_post
title: "Вышел Ruby 3.3.7"
author: k0kubun
translator: "ablzh"
date: 2025-01-15 07:51:59 +0000
lang: ru
---

Вышел Ruby 3.3.7.

Это плановое обновление, которое включает незначительные исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_7).

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Комментарий к релизу

Многие коммиттеры, разработчики и пользователи, сообщившие об ошибках, помогли нам подготовить этот релиз.
Спасибо за их вклад.
