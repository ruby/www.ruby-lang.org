---
layout: news_post
title: "Выпуск Ruby 3.1.1"
author: "naruse"
translator: "suban05"
date: 2022-02-18 12:00:00 +0000
lang: ru
---

Вышел Ruby 3.1.1.

Это первый TEENY-релиз стабильной серии 3.1.

* [error_highlight не работает с опцией -e](https://bugs.ruby-lang.org/issues/18434)
* [Исправление YJIT, передающего аргументы метода в неправильном порядке, когда смешаны именованные аргументы и аргументы по умолчанию. Ломает кеширование коллекций Rails](https://bugs.ruby-lang.org/issues/18453)
* [Ошибка сегментации при отсутствии метода Warning#warn](https://bugs.ruby-lang.org/issues/18458)
* [Исправление глобинга каталога точек в Pathname](https://bugs.ruby-lang.org/issues/18436)
* [Исправление значения по умолчанию --jit-max-cache в ruby --help](https://bugs.ruby-lang.org/issues/18469)
* [3.1.0-dev `include` приводит к тому, что Module отмечается как инициализированный](https://bugs.ruby-lang.org/issues/18292)
* [Ссылка на учебник для Optionparser сломана](https://bugs.ruby-lang.org/issues/18468)
* [Выдача элемента для Enumerator в другом потоке приводит к аварийному завершению](https://bugs.ruby-lang.org/issues/18475)
* [Ошибка сегментации с ruby 3.1.0 в `active_decorator`](https://bugs.ruby-lang.org/issues/18489)
* [Ошибка сегментации при использовании Process.daemon в Fiber](https://bugs.ruby-lang.org/issues/18497)
* [0 << (2\*\*40) вызывает NoMemoryError, но 0 << (2\*\*80) возвращает 0](https://bugs.ruby-lang.org/issues/18517)
* [Исправления ошибок чтения/записи/ожидания IO.](https://bugs.ruby-lang.org/issues/18443)
* [Утечка памяти при создании алиаса метода самому себе](https://bugs.ruby-lang.org/issues/18516)
* [ошибка: использование не объявленного идентификатора 'MAP_ANONYMOUS'](https://bugs.ruby-lang.org/issues/18556)
* [\[BUG\] попытка пометить объект T_NONE в RubyVM::InstructionSequence.load_from_binary](https://bugs.ruby-lang.org/issues/18501)
* [throw_data передается в rescue через require](https://bugs.ruby-lang.org/issues/18562)
* [Исправление `IpAddr#to_range` для замороженных экземпляров `IpAddr`](https://bugs.ruby-lang.org/issues/18570)
* [Исправлен путь для ipaddr.rb](https://github.com/ruby/ruby/pull/5533)
* [Объединение RubyGems-3.3.7 и Bundler-2.3.7](https://github.com/ruby/ruby/pull/5543)
* [Зависание при повторении Hash#shift против пустого Hash](https://bugs.ruby-lang.org/issues/18578)

См. [историю коммитов](https://github.com/ruby/ruby/compare/v3_1_0...v3_1_1) для получения дополнительной информации.

## Загрузка

{% assign release = site.data.releases | where: "version", "3.1.1" | first %}

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

Многие коммитеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам сделать этот релиз.
Спасибо за их вклад.
