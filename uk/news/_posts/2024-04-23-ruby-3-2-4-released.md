---
layout: news_post
title: "Вийшов Ruby 3.2.4"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2024-04-23 10:00:00 +0000
lang: uk
---

Вийшов Ruby 3.2.4.

Цей реліз включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2024-27282: Вразливість читання довільної адреси пам'яті з пошуком Regex]({%link uk/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: Вразливість RCE з .rdoc_options у RDoc]({%link uk/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})

Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_4) для подробиць.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.2.4" | first %}

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

