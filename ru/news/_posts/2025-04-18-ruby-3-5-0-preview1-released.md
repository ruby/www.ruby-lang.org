---
layout: news_post
title: "Вышел Ruby 3.5.0-preview1"
author: "naruse"
translator: "ablzh"
date: 2025-04-18 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}. Ruby 3.5 обновляет версию Unicode до 15.1.0, и так далее.

## Изменения языка

* `*nil` больше не вызывает `nil.to_a`, аналогично тому, как `**nil` не
  вызывает `nil.to_hash`.  [[Feature #21047]]

## Обновления основных классов

Примечание: Мы перечисляем только заметные обновления основных классов.

* Binding

    * `Binding#local_variables` больше не включает номерные параметры.
      Также, `Binding#local_variable_get` и `Binding#local_variable_set` отказываются обрабатывать номерные параметры.
      [[Bug #21049]]

* IO

    * `IO.select` принимает +Float::INFINITY+ в качестве аргумента таймаута..
      [[Feature #20610]]

* String

    * Обновление Unicode до версии 15.1.0 и Emoji до версии 15.1. [[Feature #19908]]
        (также применяется к Regexp)


## Обновления стандартной библиотеки

Примечание: Мы перечисляем только заметные обновления стандартной библиотеки.

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

## Проблемы совместимости

Примечание: Исключая исправления ошибок в фичах.


## Проблемы совместимости стандартной библиотеки


## Обновления C API



## Разные изменения



Смотрите [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [логи коммитов](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
для получения более подробной информации.

С этими изменениями, [{{ release.stats.files_changed }} файлов изменено, {{ release.stats.insertions }} добавлений(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
со времени выхода Ruby 3.4.0!

## Скачать

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

## Что такое Ruby

Ruby был впервые разработан Matz (Yukihiro Matsumoto) в 1993,
и сейчас разрабатывается как Open Source. Он работает на множестве платформ
и используется по всему миру, особенно для веб-разработки.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
