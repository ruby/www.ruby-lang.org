---
layout: news_post
title: "Вийшов Ruby 3.4.6"
author: k0kubun
translator: "Andrii Furmanets"
date: 2025-09-16 00:00:00 +0000
lang: ua
---

Вийшов Ruby 3.4.6.

Це планове оновлення з виправленнями помилок.
Докладніше див. [примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_6).

## Графік релізів

Ми плануємо випускати найновішу стабільну версію Ruby (зараз Ruby 3.4) кожні два місяці після останнього релізу.
Ruby 3.4.7 заплановано на листопад, а 3.4.8 на січень.

Якщо з'явиться зміна, що істотно впливає на користувачів, реліз може відбутися раніше запланованого, а подальший графік відповідно зміститься.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.4.6" | first %}

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
