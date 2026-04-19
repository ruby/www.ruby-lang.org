---
layout: news_post
title: "Вийшов Ruby 3.4.9"
author: nagachika
translator: "Andrii Furmanets"
date: 2026-03-11 11:00:00 +0000
lang: uk
---

Вийшов Ruby 3.4.9.

Цей реліз містить [оновлення gem zlib, яке усуває CVE-2026-27820](/uk/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/),
разом з іншими виправленнями помилок.
Докладніше див. [примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_9).

Рекомендуємо оновити вашу версію gem zlib. Цей реліз зроблено для зручності тих, хто хоче й надалі використовувати його як gem за замовчуванням.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
