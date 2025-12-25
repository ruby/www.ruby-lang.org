---
layout: news_post
title: "Вийшов Ruby 2.4.0-preview2"
author: "naruse"
translator: "Andrii Furmanets"
date: 2016-09-08 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 - це другий preview Ruby 2.4.0.
Цей preview2 випущено, щоб отримати відгуки від спільноти.
Не соромтеся
[надсилати відгуки](https://github.com/ruby/ruby/wiki/How-To-Report)
, оскільки ви все ще можете впливати на функції.

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

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.4.0-preview2, та
[надішліть нам відгук](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Інші помітні зміни з 2.3

* Підтримка OpenSSL 1.1.0
* ext/tk тепер видалено з stdlib [Функція #8539](https://bugs.ruby-lang.org/issues/8539)

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
та [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
для деталей.

З цими змінами,
[2353 файли змінено, 289057 додано(+), 73847 видалено(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
з Ruby 2.3.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * РОЗМІР:   12463225 байтів
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * РОЗМІР:   15586514 байтів
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * РОЗМІР:   9886832 байтів
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * РОЗМІР:   17401564 байтів
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Коментар до випуску

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)

