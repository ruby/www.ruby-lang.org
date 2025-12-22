---
layout: news_post
title: "Вийшов Ruby 3.2.7"
author: nagachika
translator: "Andrii Furmanets"
date: 2025-02-04 12:00:00 +0000
lang: ua
---

Вийшов Ruby 3.2.7.

Докладніше див. [релізи на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_7).

## Завантаження

{% assign release = site.data.releases | where: "version", "3.2.7" | first %}

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

## Коментар до релізу

Багато комітерів, розробників і користувачів, які надсилали звіти про помилки, допомогли нам зробити цей реліз.
Дякуємо за їхній внесок.
