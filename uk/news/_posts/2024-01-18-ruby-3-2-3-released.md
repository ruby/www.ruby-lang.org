---
layout: news_post
title: "Вийшов Ruby 3.2.3"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2024-01-18 09:00:00 +0000
lang: uk
---

Вийшов Ruby 3.2.3.

Цей реліз включає багато виправлень помилок.
Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_3) для подробиць.

Цей реліз також включає оновлення uri.gem до 0.12.2, який містить виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2023-36617: Вразливість ReDoS у URI]({%link uk/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

## Завантаження

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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

