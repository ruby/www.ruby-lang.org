---
layout: news_post
title: "Вийшов Ruby 2.6.9"
author: "usa"
translator: "Andrii Furmanets"
date: 2021-11-24 12:00:00 +0000
lang: uk
---

Ruby 2.6.9 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-41817: Вразливість Regular Expression Denial of Service методів парсингу Date]({%link uk/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41819: Cookie Prefix Spoofing в CGI::Cookie.parse]({%link uk/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_6_8...v2_6_9) для деталей.

Ruby 2.6 зараз у стані фази підтримки безпеки, до кінця березня 2022 року.
Після цієї дати підтримка Ruby 2.6 буде завершена.
Ми рекомендуємо вам почати планувати міграцію до новіших версій Ruby, таких як 3.0 або 2.7.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.6.9" | first %}

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
