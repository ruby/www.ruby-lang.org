---
layout: news_post
title: "Вышел Ruby 1.9.3-p429"
author: "usa"
translator: "gazay"
date: 2013-05-14 17:00:00 +0000
lang: ru
---

Вышел Ruby 1.9.3-p429.
Мы один раз уже опубликовали p426 несколько часов назад, но он имел
проблемы при сборке на некоторых платформах. Используйте пожалуйста
этот p429 вместо p426, пожалуйста.

Релиз содержит исправление безопасности для Ruby DL / Fiddle расширений.

* [Object taint bypassing in DL and Fiddle in Ruby (CVE-2013-2065)](/ru/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/)

Так же включены некоторые багфиксы.

Смотри [тикеты](https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5) и [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_429).

## Скачать

Вы можете скачать этот релиз:

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.tar.bz2)

      SIZE:   10042323 bytes
      MD5:    c2b2de5ef15ea9b1aaa3152f9112af1b
      SHA256: 9d8949c24cf6fe810b65fb466076708b842a3b0bac7799f79b7b6a8791dc2a70

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.tar.gz)

      SIZE:   12553234 bytes
      MD5:    993c72f7f805a9eb453f90b0b7fe0d2b
      SHA256: d192d1afc46a7ef27b9d0a3c7a67b509048984db2c38907aa82641bdf980acf4

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.zip)

      SIZE:   13869978 bytes
      MD5:    1986f3934e61b999873d21a79d69d88d
      SHA256: 8bd0ecc2dd8eec471aa44f88abdcd82f4b398e9110ca06f76eff066b653b8b90

## Комментарий к релизу

Многие коммитеры, тестеры и пользователи, приславшие баг репорты,
помогли мне сделать этот релиз. Спасибо за их участие.
