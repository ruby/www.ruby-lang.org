---
layout: news_post
title: "Выпуск Ruby 3.1.6"
author: "hsbt"
translator: "suban05"
date: 2024-05-29 9:00:00 +0000
lang: ru
---

Вышел Ruby 3.1.6.

Серия Ruby 3.1 теперь находится в фазе поддержки безопасности. В общем, на этом этапе мы будем исправлять только проблемы с безопасностью. Однако после выпуска Ruby 3.1.5 возникли несколько проблем со сборкой. Мы решили выпустить Ruby 3.1.6, чтобы исправить эти проблемы.

Пожалуйста, ознакомьтесь с деталями ниже.

* [Ошибка #20151: Невозможно собрать Ruby 3.1 на FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Ошибка #20451: Плохой backport Ruby 3.1.5 вызывает сбой сборки fiddle](https://bugs.ruby-lang.org/issues/20451)
* [Ошибка #20431: Сбой сборки Ruby 3.3.0 с make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

Подробности смотрите в [релизах на GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_6).

## Скачать

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

## Комментарий к выпуску

Многие коммитеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам выпустить эту версию. Спасибо за их вклад.
