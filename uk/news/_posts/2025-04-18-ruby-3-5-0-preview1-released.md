---
layout: news_post
title: "Вийшов Ruby 3.5.0 preview1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2025-04-18 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
Раді повідомити про вихід Ruby {{ release.version }}. Ruby 3.5 оновлює версію Unicode до 15.1.0 тощо.

## Зміни мови

* `*nil` більше не викликає `nil.to_a`, подібно до того, як `**nil` не викликає `nil.to_hash`. [[Feature #21047]]

## Оновлення основних класів

Примітка: наведено лише помітні оновлення основних класів.

* Binding

    * `Binding#local_variables` більше не містить нумерованих параметрів.
      Також `Binding#local_variable_get` і `Binding#local_variable_set` відмовляються працювати з нумерованими параметрами.
      [[Bug #21049]]

* IO

    * `IO.select` приймає +Float::INFINITY+ як аргумент тайм-ауту.
      [[Feature #20610]]

* String

    * Оновлено Unicode до версії 15.1.0 та Emoji до 15.1. [[Feature #19908]]
        (також стосується Regexp)


## Оновлення стандартної бібліотеки

Примітка: наведено лише помітні оновлення стандартних бібліотек.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## Проблеми сумісності

Примітка: без урахування виправлень помилок у функціях.



## Проблеми сумісності стандартної бібліотеки


## Оновлення C API



## Інші зміни



Детальніше див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.4.0!

## Завантаження

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

## Що таке Ruby

Ruby уперше розробив Matz (Yukihiro Matsumoto) у 1993 році,
і зараз вона розвивається як Open Source. Вона працює на багатьох платформах
і використовується по всьому світу, особливо для веброзробки.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908