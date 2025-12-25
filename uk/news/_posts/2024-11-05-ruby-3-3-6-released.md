---
layout: news_post
title: "Вийшов Ruby 3.3.6"
author: k0kubun
translator: "Andrii Furmanets"
date: 2024-11-05 04:25:00 +0000
lang: uk
---

Вийшов Ruby 3.3.6.

Це рутинне оновлення, яке включає невеликі виправлення помилок.
Воно також припиняє попередження про відсутні залежності default gem, які стануть bundled gems у Ruby 3.5.
Для більш детальної інформації, будь ласка, зверніться до [приміток до релізу на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_6).

## Графік релізів

Як було [оголошено раніше](https://www.ruby-lang.org/en/news/2024/07/09/ruby-3-3-4-released/), ми маємо намір випускати останню стабільну версію Ruby (зараз Ruby 3.3) кожні 2 місяці після релізу `.1`.

Ми очікуємо випустити Ruby 3.3.7 7 січня. Якщо виникнуть значні зміни, що впливають на велику кількість користувачів, ми можемо випустити нову версію раніше запланованого.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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