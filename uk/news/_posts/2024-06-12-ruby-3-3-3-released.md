---
layout: news_post
title: "Вийшов Ruby 3.3.3"
author: "k0kubun"
translator: "Andrii Furmanets"
date: 2024-06-12 00:30:00 +0000
lang: uk
---

Вийшов Ruby 3.3.3.

Цей реліз включає:

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree` замінено на `--parser=prism --dump=parsetree`
* Недійсні символи кодування викликають `SyntaxError` замість `EncodingError`
* Виправлення витоку пам'яті в парсингу Ripper
* Виправлення помилок для YJIT, `**{}`, `Ripper.tokenize`, `RubyVM::InstructionSequence#to_binary`, `--with-gmp` та деяких середовищ збірки

Будь ласка, дивіться [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_3) для подробиць.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

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