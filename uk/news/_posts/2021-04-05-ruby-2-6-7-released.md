---
layout: news_post
title: "Вийшов Ruby 2.6.7"
author: "usa"
translator: "Andrii Furmanets"
date: 2021-04-05 12:00:00 +0000
lang: uk
---

Ruby 2.6.7 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2020-25613: Потенційна вразливість HTTP Request Smuggling в WEBrick]({%link uk/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Вразливість XML round-trip в REXML]({% link uk/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) для деталей.

Цим випуском ми завершуємо фазу звичайної підтримки Ruby 2.6,
та Ruby 2.6 входить у фазу підтримки безпеки.
Це означає, що ми більше не переносимо жодні виправлення помилок назад до Ruby 2.6, окрім виправлень безпеки.
Термін фази підтримки безпеки заплановано на рік.
Ruby 2.6 досягає EOL і його офіційна підтримка завершується до кінця фази підтримки безпеки.
Тому ми рекомендуємо вам почати планувати оновлення до Ruby 2.7 або 3.0.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

Підтримка Ruby 2.6, включаючи цей випуск, базується на "Угоді для стабільної версії Ruby" Ruby Association.
