---
layout: news_post
title: "Вийшов Ruby 3.2.5"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2024-07-26 10:00:00 +0000
lang: uk
---

Вийшов Ruby 3.2.5.

Цей реліз включає багато виправлень помилок.
І ми оновили версію bundled gem `rexml`, щоб включити наступне виправлення безпеки.
[CVE-2024-39908 : DoS у REXML]({%link uk/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}).

Будь ласка, дивіться [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_5) для подробиць.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

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