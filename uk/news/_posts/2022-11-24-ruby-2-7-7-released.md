---
layout: news_post
title: "Вийшов Ruby 2.7.7"
author: "usa"
translator: "Andrii Furmanets"
date: 2022-11-24 12:00:00 +0000
lang: uk
---

Ruby 2.7.7 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-33621: HTTP response splitting в CGI]({%link uk/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Цей випуск також включає деякі виправлення проблем збірки. Вони не вважаються такими, що впливають на сумісність з попередніми версіями.
Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_7) для подальших деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

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

