---
layout: news_post
title: "Вышел Ruby 4.0.8"
author: k0kubun
translator: "ablzh"
date: 2026-10-22 06:54:51 +0000
lang: ru
---

Вышел Ruby 4.0.8.

Это плановое обновление, которое включает исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.8).

## Скачать

{% assign release = site.data.releases | where: "version", "4.0.8" | first %}

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

Многие коммиттеры, разработчики и пользователи, предоставившие отчёты об ошибках, помогли нам сделать этот релиз.
Благодарим за их вклад.
