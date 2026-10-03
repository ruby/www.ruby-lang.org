---
layout: news_post
title: "Вышел Ruby 3.1.6"
author: "hsbt"
translator: "ablzh"
date: 2024-05-29 9:00:00 +0000
lang: ru
---

Вышел Ruby 3.1.6.

Ветка Ruby 3.1 сейчас находится в фазе поддержки безопасности. Обычно в этой фазе мы исправляем только уязвимости. Однако после выхода Ruby 3.1.5 возникло несколько проблем со сборкой. Мы решили выпустить Ruby 3.1.6, чтобы их исправить.

Подробности приведены ниже.

* [Bug #20151: Не удаётся собрать Ruby 3.1 на FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Некорректный бэкпорт в Ruby 3.1.5 мешает сборке fiddle](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Сборка Ruby 3.3.0 завершается ошибкой make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_6).

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

## Комментарий к релизу

Многие коммиттеры, разработчики и пользователи, присылавшие отчёты об ошибках, помогли нам подготовить этот релиз.
Спасибо за их вклад.
