---
layout: news_post
title: "Вийшов Ruby 2.7.6"
author: "usa and mame"
translator: "Andrii Furmanets"
date: 2022-04-12 12:00:00 +0000
lang: uk
---

Ruby 2.7.6 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2022-28739: Buffer overrun в перетворенні String-to-Float]({%link uk/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Цей випуск також включає деякі виправлення помилок.
Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6) для подальших деталей.

Після цього випуску ми завершуємо фазу звичайної підтримки Ruby 2.7, та Ruby 2.7 входить у фазу підтримки безпеки.
Це означає, що ми більше не переносимо жодні виправлення помилок назад до Ruby 2.7, окрім виправлень безпеки.

Термін фази підтримки безпеки заплановано на рік.
Ruby 2.7 досягає EOL і його офіційна підтримка завершується до кінця фази підтримки безпеки.
Тому ми рекомендуємо вам почати планувати оновлення до Ruby 3.0 або 3.1.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

* <{{ release.url.bz2 }}>

      РОЗМІР: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      РОЗМІР: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      РОЗМІР: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      РОЗМІР: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Коментар до випуску

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли нам зробити цей випуск.
Дякую за їхній внесок.

Підтримка Ruby 2.7, включаючи цей випуск, базується на "Угоді для стабільної версії Ruby" Ruby Association.
