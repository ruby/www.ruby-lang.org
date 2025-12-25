---
layout: news_post
title: "Вийшов Ruby 3.2.1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2023-02-08 12:00:00 +0000
lang: uk
---

Вийшов Ruby 3.2.1.

Це перший реліз TEENY версії стабільної серії 3.2.

Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_1) для подробиць.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.2.1" | first %}

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

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли нам зробити цей реліз.
Дякуємо за їхній внесок.

