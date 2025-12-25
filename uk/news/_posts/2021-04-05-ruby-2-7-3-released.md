---
layout: news_post
title: "Вийшов Ruby 2.7.3"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2021-04-05 12:00:00 +0000
lang: uk
---

Ruby 2.7.3 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-28965: Вразливість XML round-trip в REXML]({% link uk/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Path traversal в Tempfile на Windows]({% link uk/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_7_2...v2_7_3) для деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.7.3" | first %}

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