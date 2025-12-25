---
layout: news_post
title: "Вийшов Ruby 2.4.0-preview1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2016-06-20 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.4.0-preview1.

Ruby 2.4.0-preview1 - це перший preview Ruby 2.4.0.
Цей preview1 випущено раніше, ніж зазвичай, тому що він включає так
багато нових функцій та покращень.
Не соромтеся
[надсилати відгуки](https://github.com/ruby/ruby/wiki/How-To-Report)
, оскільки ви все ще можете змінити функції.

## [Об'єднання Fixnum та Bignum в Integer](https://bugs.ruby-lang.org/issues/12005)

Хоча [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
не визначає деталей класу Integer,
CRuby має два видимі класи Integer: Fixnum та Bignum.
Ruby 2.4 об'єднує їх в Integer.

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
та про report-on-GC.

### [Виявлення deadlock потоків тепер показує потоки з їхнім backtrace та залежністю](https://bugs.ruby-lang.org/issues/8214)

Ruby має виявлення deadlock навколо потоків очікування, але його звіт не
включає достатньо інформації для налагодження.
Виявлення deadlock Ruby 2.4 показує потоки з їхнім backtrace та
залежними потоками.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.4.0-preview1, та
[надішліть нам відгук](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Помітні зміни з 2.3

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
та [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
для деталей.

З цими змінами,
[1140 файлів змінено, 33126 додано(+), 50993 видалено(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)
з Ruby 2.3.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * РОЗМІР:   14108114 байтів
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * РОЗМІР:   17605452 байтів
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * РОЗМІР:   11155800 байтів
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * РОЗМІР:   19904781 байтів
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Коментар до випуску

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)

