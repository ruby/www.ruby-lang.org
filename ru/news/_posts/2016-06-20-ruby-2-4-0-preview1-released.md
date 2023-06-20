---
layout: news_post
title: "Вышел Ruby 2.4.0-preview1"
author: "naruse"
translator: "gazay"
date: 2016-06-20 09:00:00 +0000
lang: ru
---

Мы рады сообщить о выходе релиза 2.4.0-preview1.

Ruby 2.4.0-preview1 – это первое превью Ruby 2.4.0.
Этот preview1 вышел раньше, чем обычно, так как он содержит очень много
нововведений и улучшений.
Пожалуйста, присылайте
[отзывы](https://github.com/ruby/ruby/wiki/How-To-Report),
так как вы все еще можете повлиять на нововведения.

## [Объединение Fixnum и Bignum в Integer](https://bugs.ruby-lang.org/issues/12005)

Так как [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
не описывает детали класса Integer,
в CRuby есть два видимых класса Integer: Fixnum и Bignum.
Ruby 2.4 объединяет их в Integer.

## [String поддерживает работу с прописными и строчными буквами в Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` теперь работают и с Unicode,
а не только с ASCII.

## Улучшения производительности

Ruby 2.4 также содержит следующие улучшения производительности,
включая изменения в языке:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` и `[x, y].min` оптимизированы и не создают временный массив
в некоторых случаях.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Добавлен метод `Regexp#match?`, который выполняет сравнение без создания
объекта с обратной ссылкой и изменения `$~`.
Это полезно для уменьшения количества порожденных объектов.

### Другие улучшения в производительности

* [ускорен доступ к переменным объекта](https://bugs.ruby-lang.org/issues/12274)

## Отладка

### [Thread#report_on_exception и Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby игнорирует ошибки в тредах, если другой тред специально не присоединится к треду с ошибкой.
С `report_on_exception = true`, вы можете узнать, если тред умер из-за непойманой ошибки.

Присылайте нам фидбек, что должно быть выставлено по умолчанию для `report_on_exception`, и
про report-on-GC.

### [Отслеживание блокировки в треде теперь показывает треды с их бектрейсами и зависимостями](https://bugs.ruby-lang.org/issues/8214)

В Ruby есть отслеживание блокировки для ожидающих тредов, но его отчеты включают в себя
недостаточно информации для дебага. Отслеживание блокировок в Ruby 2.4 показывает треды с их
бектрейсами и зависимыми потоками.

Пробуйте и наслаждайтесь программированием на Ruby 2.4.0-preview1, и присылайте,
пожалуйста, нам [отзывы](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Значительные изменения от версии 2.3

Смотрите [новости](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
и [лог изменений](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
за подробностями.

Со времени выхода версии 2.3.0
[изменено 1140 файлов, добавлено 33126 новых строк(+), удалено 50993 строк(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Комментарий к релизу

Также вы можете посмотреть план выхода новых версий и получить другую информацию по
[ссылке](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24).
