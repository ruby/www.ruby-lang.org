---
layout: news_post
title: "Вийшов Ruby 3.2.8"
author: hsbt
translator: "Andrii Furmanets"
date: 2025-03-26 04:45:01 +0000
lang: uk
---

Вийшов Ruby 3.2.8. Цей реліз містить [виправлення CVE-2025-27219, CVE-2025-27220 та CVE-2025-27221](/uk/news/2025/02/26/security-advisories/).

Докладніше див. [релізи на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_8).

Ця версія є останньою в режимі звичайної підтримки для лінійки Ruby 3.2. Ми виправлятимемо лише проблеми безпеки для Ruby 3.2 до кінця березня 2026 року.

Рекомендуємо оновитися до Ruby 3.3 або 3.4.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.2.8" | first %}

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