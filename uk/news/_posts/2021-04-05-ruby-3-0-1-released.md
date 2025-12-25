---
layout: news_post
title: "Вийшов Ruby 3.0.1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2021-04-05 12:00:00 +0000
lang: uk
---

Ruby 3.0.1 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-28965: Вразливість XML round-trip в REXML]({% link uk/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Path traversal в Tempfile на Windows]({% link uk/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1) для деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.0.1" | first %}

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

