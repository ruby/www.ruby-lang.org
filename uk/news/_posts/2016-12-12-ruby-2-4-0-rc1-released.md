---
layout: news_post
title: "Вийшов Ruby 2.4.0-rc1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2016-12-12 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.4.0-rc1.

Ruby 2.4.0-rc1 - це перший release candidate Ruby 2.4.0.
Цей rc1 випущено, щоб отримати відгуки від спільноти.
Не соромтеся
[надсилати відгуки](https://github.com/ruby/ruby/wiki/How-To-Report)
, оскільки ви все ще можете виправити функції.

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

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.4.0-rc1, та
[надішліть нам відгук](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Інші помітні зміни з 2.3

* Підтримка OpenSSL 1.1.0 (припинення підтримки 0.9.7 або раніше)
* ext/tk тепер видалено з stdlib [Функція #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC тепер видалено з stdlib [Функція #12160](https://bugs.ruby-lang.org/issues/12160)

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
або логи комітів для деталей.

З цими змінами,
[2519 файлів змінено, 288606 додано(+), 83896 видалено(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
з Ruby 2.3.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      РОЗМІР:   12512729 байтів
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      РОЗМІР:   14098505 байтів
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      РОЗМІР:   9930088 байтів
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      РОЗМІР:   15785968 байтів
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Коментар до випуску

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)

