---
layout: news_post
title: "Вийшов Ruby 3.3.9"
author: nagachika
translator: "Andrii Furmanets"
date: 2025-07-24 11:00:00 +0000
lang: uk
---

Вийшов Ruby 3.3.9.

Цей реліз містить таке виправлення безпеки для gem за замовчуванням:

* [CVE-2025-24294: Можлива відмова в обслуговуванні в gem resolv](/uk/news/2025/07/08/dos-resolv-cve-2025-24294/)

а також такі виправлення проблем зі збиранням:

* GCC 15.1
* Visual Studio 2022 Version 17.14

Докладніше див. [релізи на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_9).

## Завантаження

{% assign release = site.data.releases | where: "version", "3.3.9" | first %}

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

Багато комітерів, розробників і користувачів, які надсилали звіти про помилки, допомогли нам зробити цей реліз.
Дякуємо за їхній внесок.
