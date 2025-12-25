---
layout: news_post
title: "Вийшов Ruby 2.5.8"
author: "usa"
translator: "Andrii Furmanets"
date: 2020-03-31 12:00:00 +0000
lang: uk
---

Ruby 2.5.8 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2020-10663: Вразливість небезпечного створення об'єктів у JSON (Додаткове виправлення)]({% link uk/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: Вразливість витоку купи в бібліотеці socket]({% link uk/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_5_7...v2_5_8) для деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.5.8" | first %}

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

Дякую всім, хто допоміг з цим випуском, особливо, репортерам вразливості.