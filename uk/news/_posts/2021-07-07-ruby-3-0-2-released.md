---
layout: news_post
title: "Вийшов Ruby 3.0.2"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2021-07-07 09:00:00 +0000
lang: uk
---

Ruby 3.0.2 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-31810: Вразливість довіри до FTP PASV відповідей в Net::FTP]({%link uk/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Вразливість StartTLS stripping в Net::IMAP]({%link uk/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Вразливість ін'єкції команди в RDoc]({%link uk/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v3_0_1...v3_0_2) для деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.0.2" | first %}

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
