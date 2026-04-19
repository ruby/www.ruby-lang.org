---
layout: news_post
title: "Вийшов Ruby 3.4.7"
author: k0kubun
translator: "Andrii Furmanets"
date: 2025-10-07 17:14:11 +0000
lang: uk
---

Вийшов Ruby 3.4.7.

Цей реліз містить [оновлення gem uri, яке усуває CVE-2025-61594](/uk/news/2025/10/07/uri-cve-2025-61594/),
разом з іншими виправленнями помилок. Докладніше див. [примітки до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_7).

Рекомендуємо оновити вашу версію gem uri. Цей реліз зроблено для зручності тих, хто хоче й надалі використовувати його як gem за замовчуванням.

## Графік релізів

Ми плануємо випускати найновішу стабільну версію Ruby (зараз Ruby 3.4) кожні два місяці після останнього релізу.
Ruby 3.4.8 заплановано на грудень, а 3.4.9 на лютий.

Якщо з'явиться зміна, що істотно впливає на користувачів, реліз може відбутися раніше запланованого, а подальший графік відповідно зміститься.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.4.7" | first %}

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
