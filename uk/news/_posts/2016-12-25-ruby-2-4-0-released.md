---
layout: news_post
title: "Вийшов Ruby 2.4.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2016-12-25 00:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.4.0.

Ruby 2.4.0 - це перший стабільний випуск серії Ruby 2.4.
Він вводить багато нових функцій, наприклад:

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

## Інші помітні зміни з 2.3

* Підтримка OpenSSL 1.1.0 (припинення підтримки 0.9.7 або раніше)
* ext/tk тепер видалено з stdlib [Функція #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC тепер видалено з stdlib [Функція #12160](https://bugs.ruby-lang.org/issues/12160)

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
або логи комітів для деталей.

З цими змінами,
[2523 файли змінено, 289129 додано(+), 84670 видалено(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
з Ruby 2.3.0!

Веселого Різдва, щасливих свят, та насолоджуйтеся програмуванням з Ruby 2.4!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      РОЗМІР:   12572424 байтів
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      РОЗМІР:   14104044 байтів
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      РОЗМІР:   9906880 байтів
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      РОЗМІР:   15758757 байтів
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23