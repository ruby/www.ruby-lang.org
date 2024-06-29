---
layout: news_post
title: "Выпуск Ruby 3.3.2"
author: "k0kubun"
translator: "suban05"
date: 2024-05-30 03:50:00 +0000
lang: ru
---

Вышел Ruby 3.3.2.

Этот выпуск включает множество исправлений ошибок.
См. подробности на [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_2).

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.2" | first %}

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

## Комментарий к выпуску

Многие коммитеры, разработчики и пользователи, которые предоставляли отчеты об ошибках, помогли нам в создании этого выпуска.
Благодарим их за вклад.
