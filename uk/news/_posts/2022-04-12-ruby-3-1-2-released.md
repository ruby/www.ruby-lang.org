---
layout: news_post
title: "Вийшов Ruby 3.1.2"
author: "naruse and mame"
translator: "Andrii Furmanets"
date: 2022-04-12 12:00:00 +0000
lang: uk
---

Ruby 3.1.2 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2022-28738: Double free в компіляції Regexp]({%link uk/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: Buffer overrun в перетворенні String-to-Float]({%link uk/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v3_1_1...v3_1_2) для подальших деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.1.2" | first %}

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
