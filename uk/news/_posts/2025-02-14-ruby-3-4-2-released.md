---
layout: news_post
title: "Вийшов Ruby 3.4.2"
author: k0kubun
translator: "Andrii Furmanets"
date: 2025-02-14 21:55:17 +0000
lang: uk
---

Вийшов Ruby 3.4.2.

Це планове оновлення з виправленнями помилок. Докладніше див.
[примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_2).

## Графік релізів

Ми плануємо випускати найновішу стабільну версію Ruby (зараз Ruby 3.4) кожні 2 місяці.
Ruby 3.4.3 буде випущено в квітні, 3.4.4 у червні, 3.4.5 у серпні, 3.4.6 у жовтні, а 3.4.7 у грудні.

Якщо з'явиться зміна, що вплине на значну кількість користувачів, ці версії можуть вийти раніше, ніж очікувалося.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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