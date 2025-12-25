---
layout: news_post
title: "Вийшов Ruby 3.1.6"
author: "hsbt"
translator: "Andrii Furmanets"
date: 2024-05-29 9:00:00 +0000
lang: uk
---

Вийшов Ruby 3.1.6.

Серія Ruby 3.1 тепер у фазі підтримки безпеки. Загалом, ми виправлятимемо лише проблеми безпеки в цій фазі. Але у нас є кілька проблем зі збіркою після випуску Ruby 3.1.5. Ми вирішили випустити Ruby 3.1.6, щоб виправити ці проблеми.

Будь ласка, перевірте теми нижче для деталей.

* [Bug #20151: Can't build Ruby 3.1 on FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Bad Ruby 3.1.5 backport causes fiddle to fail to build](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 build fail with make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_6) для подробиць.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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