---
layout: news_post
title: "Вийшов Ruby 3.1.7"
author: hsbt
translator: "Andrii Furmanets"
date: 2025-03-26 04:44:27 +0000
lang: uk
---

Вийшов Ruby 3.1.7. Цей реліз містить [виправлення CVE-2025-27219, CVE-2025-27220 та CVE-2025-27221](/uk/news/2025/02/26/security-advisories/) і оновлює вбудовані gems REXML та RSS.

Докладніше див. [релізи на GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_7).

Ця версія є фінальним релізом лінійки Ruby 3.1. Ми більше не надаватимемо оновлень, зокрема виправлень безпеки, для лінійки Ruby 3.1.

Рекомендуємо оновитися до Ruby 3.3 або 3.4.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.1.7" | first %}

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
