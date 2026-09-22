---
layout: news_post
title: "Вийшов Ruby 4.0.7"
author: k0kubun
translator: "Andrii Furmanets"
date: 2026-09-15 00:25:58 +0000
lang: uk
---

Вийшов Ruby 4.0.7.

Це звичайне оновлення, що містить виправлення помилок.
Докладніше див. [примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.7).

## Розклад релізів

Ми плануємо випускати найновішу стабільну версію Ruby (наразі Ruby 4.0) кожні два місяці після останнього релізу. Ruby 4.0.8 вийде у листопаді.

Якщо з’явиться зміна, яка суттєво впливає на користувачів, реліз може відбутися раніше запланованого терміну.

## Завантаження

{% assign release = site.data.releases | where: "version", "4.0.7" | first %}

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
