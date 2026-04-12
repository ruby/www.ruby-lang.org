---
layout: news_post
title: "Вийшов Ruby 4.0.2"
author: k0kubun
translator: "Andrii Furmanets"
date: 2026-03-16 23:18:29 +0000
lang: uk
---

Вийшов Ruby 4.0.2.

Це планове оновлення, яке містить виправлення помилки в YJIT для [NoMethodError у Puma](https://github.com/puma/puma/issues/3620).
Докладніше див. [примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.2).

## Розклад релізів

Ми плануємо випускати найновішу стабільну версію Ruby (наразі Ruby 4.0) кожні два місяці після останнього релізу.
Ruby 4.0.3 вийде у травні, 4.0.4 — у липні, 4.0.5 — у вересні та 4.0.6 — у листопаді.

Якщо з’являться зміни, які суттєво впливають на користувачів, реліз може відбутися раніше запланованого терміну, а наступний графік може відповідно зміститися.

## Завантаження

{% assign release = site.data.releases | where: "version", "4.0.2" | first %}

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
