---
layout: news_post
title: "Вийшов Ruby 2.7.8"
author: "usa"
translator: "Andrii Furmanets"
date: 2023-03-30 12:00:00 +0000
lang: uk
---

Вийшов Ruby 2.7.8.

Цей реліз включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2023-28755: Вразливість ReDoS у URI]({%link uk/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Вразливість ReDoS у Time]({%link uk/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Цей реліз також включає кілька виправлень проблем зі збіркою.
Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_8) для подробиць.

Після цього релізу Ruby 2.7 досягає EOL. Іншими словами, це очікується останній реліз серії Ruby 2.7.
Ми не випустимо Ruby 2.7.9, навіть якщо буде знайдено вразливість безпеки (але могли б випустити, якщо буде знайдено серйозну регресію).
Ми рекомендуємо всім користувачам Ruby 2.7 негайно почати міграцію на Ruby 3.2, 3.1 або 3.0.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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
