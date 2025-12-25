---
layout: news_post
title: "Вийшов Ruby 2.4.0-preview3"
author: "naruse"
translator: "Andrii Furmanets"
date: 2016-11-09 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.4.0-preview3.

Ruby 2.4.0-preview3 - це третій preview Ruby 2.4.0.
Цей preview3 випущено, щоб отримати відгуки від спільноти.
Не соромтеся
[надсилати відгуки](https://github.com/ruby/ruby/wiki/How-To-Report)
, оскільки ви все ще можете впливати на функції.

## [Впровадження покращення хеш-таблиці (від Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Покращено внутрішню структуру хеш-таблиці (st_table) шляхом впровадження відкритої адресації
та масиву порядку включення.
Це покращення обговорювалося з багатьма людьми, особливо з Yura Sokolov.

## Binding#irb: Запуск сесії REPL, подібної до `binding.pry`

Під час налагодження ви часто можете використовувати `p` для перегляду значення змінних.
З [pry](https://github.com/pry/pry) ви можете використовувати `binding.pry` у вашому додатку
для запуску REPL та виконання будь-якого коду Ruby.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
вводить `binding.irb`, який поводиться так само з irb.

## [Об'єднання Fixnum та Bignum в Integer](https://bugs.ruby-lang.org/issues/12005)

Хоча [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
не визначає деталей класу Integer,
Ruby мав два видимі класи Integer: Fixnum та Bignum.
Ruby 2.4 об'єднує їх в Integer.
Всі C розширення, які торкаються класу Fixnum або Bignum, потребують виправлення.

Див. також [тікет](https://bugs.ruby-lang.org/issues/12005) та [слайди akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String підтримує відображення регістру Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` тепер обробляють
відображення регістру Unicode замість лише відображення регістру ASCII.

## Покращення продуктивності

Ruby 2.4 також містить наступні покращення продуктивності, включаючи
зміни мови:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` та `[x, y].min` оптимізовано, щоб не створювати тимчасовий масив
за певних умов.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Додано `Regexp#match?`, який виконує відповідність regexp без створення
об'єкта зворотного посилання та зміни `$~` для зменшення виділення об'єктів.

### Інші покращення продуктивності

* [прискорення доступу до змінної екземпляра](https://bugs.ruby-lang.org/issues/12274)

## Налагодження

### [Thread#report_on_exception та Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ігнорує винятки в потоках, якщо інший потік явно не приєднується до них.
З `report_on_exception = true`,
ви можете помітити, якщо потік помер через необроблений виняток.

Надішліть нам відгук, що має бути за замовчуванням для `report_on_exception`
та про report-on-GC, який показує звіт, коли потік
збирається збирачем сміття без join.

### [Виявлення deadlock потоків тепер показує потоки з їхнім backtrace та залежністю](https://bugs.ruby-lang.org/issues/8214)

Ruby має виявлення deadlock навколо потоків очікування, але його звіт не
включає достатньо інформації для налагодження.
Виявлення deadlock Ruby 2.4 показує потоки з їхнім backtrace та
залежними потоками.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.4.0-preview3, та
[надішліть нам відгук](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Інші помітні зміни з 2.3

* Підтримка OpenSSL 1.1.0
* ext/tk тепер видалено з stdlib [Функція #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC тепер видалено з stdlib [Функція #12160](https://bugs.ruby-lang.org/issues/12160)

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
та [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
для деталей.

З цими змінами,
[2470 файлів змінено, 283051 додано(+), 64902 видалено(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)
з Ruby 2.3.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      РОЗМІР:   12615328 байтів
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      РОЗМІР:   15758023 байтів
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      РОЗМІР:   9957596 байтів
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      РОЗМІР:   17579012 байтів
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Коментар до випуску

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)