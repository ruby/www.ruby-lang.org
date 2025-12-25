---
layout: news_post
title: "Вийшов Ruby 3.3.4"
author: "k0kubun"
translator: "Andrii Furmanets"
date: 2024-07-09 00:30:00 +0000
lang: uk
---

Вийшов Ruby 3.3.4.

Цей реліз виправляє регресію в Ruby 3.3.3, коли залежності відсутні в gemspec
деяких bundled gems: `net-pop`, `net-ftp`, `net-imap` та `prime`
[[Bug #20581]](https://bugs.ruby-lang.org/issues/20581).
Виправлення дозволяє Bundler успішно встановлювати ці gems на платформах, таких як Heroku.
Якщо ваш `bundle install` працює правильно зараз, у вас може не бути цієї проблеми.

Інші зміни — це переважно невеликі виправлення помилок.
Будь ласка, дивіться [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_4) для подробиць.

## Графік релізів

Надалі ми маємо намір випускати останню стабільну версію Ruby (зараз Ruby 3.3) кожні 2 місяці після релізу `.1`.
Для Ruby 3.3, 3.3.5 має бути випущено 3 вересня, 3.3.6 — 5 листопада, а 3.3.7 — 7 січня.

Якщо є будь-які зміни, що впливають на значну кількість людей, наприклад, користувачі Ruby 3.3.3 на Heroku для цього релізу,
ми можемо випустити нову версію раніше очікуваного.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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