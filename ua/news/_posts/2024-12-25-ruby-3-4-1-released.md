---
layout: news_post
title: "Вийшов Ruby 3.4.1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2024-12-25 00:00:00 +0000
lang: ua
---

Вийшов Ruby 3.4.1.

Це виправляє опис версії.

Докладніше див. [релізи на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_1).

## Завантаження

{% assign release = site.data.releases | where: "version", "3.4.1" | first %}

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
