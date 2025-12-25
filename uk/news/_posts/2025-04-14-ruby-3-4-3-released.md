---
layout: news_post
title: "Вийшов Ruby 3.4.3"
author: k0kubun
translator: "Andrii Furmanets"
date: 2025-04-14 08:06:57 +0000
lang: uk
---

Вийшов Ruby 3.4.3.

Це планове оновлення з виправленнями помилок. Докладніше див.
[примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_3).

## Графік релізів

Ми плануємо випускати найновішу стабільну версію Ruby (зараз Ruby 3.4) кожні 2 місяці.
Ruby 3.4.4 буде випущено в червні, 3.4.5 у серпні, 3.4.6 у жовтні, а 3.4.7 у грудні.

Якщо з'явиться зміна, що вплине на значну кількість користувачів, ці версії можуть вийти раніше, ніж очікувалося.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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