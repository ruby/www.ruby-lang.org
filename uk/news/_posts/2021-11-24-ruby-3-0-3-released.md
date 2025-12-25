---
layout: news_post
title: "Вийшов Ruby 3.0.3"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2021-11-24 12:00:00 +0000
lang: uk
---

Ruby 3.0.3 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-41817: Вразливість Regular Expression Denial of Service методів парсингу Date]({%link uk/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41816: Buffer Overrun в CGI.escape_html]({%link uk/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})
* [CVE-2021-41819: Cookie Prefix Spoofing в CGI::Cookie.parse]({%link uk/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v3_0_2...v3_0_3) для деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.0.3" | first %}

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