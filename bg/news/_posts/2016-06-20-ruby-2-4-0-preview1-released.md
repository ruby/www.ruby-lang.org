---
layout: news_post
title: "Излезе Ruby 2.4.0-preview1"
author: "naruse"
translator: "Georgi Mitrev"
date: 2016-06-20 09:00:00 +0000
lang: bg
---

Радваме се да обявим излизането на Ruby 2.4.0-preview1.

Това е първият предварителен преглед на Ruby 2.4.0.
Излиза по-рано от обикновено, защото включва много новости и подобрения.
Не се колебайте да
[изпращате обратна връзка](https://github.com/ruby/ruby/wiki/How-To-Report),
тъй като все още имате възможност да повлияете на промените.

## [Обединяване на Fixnum и Bignum в Integer](https://bugs.ruby-lang.org/issues/12005)

Въпреки, че [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
не уточнява детайли относно `Integer`, CRuby има два `Integer` класа - `Fixnum` и `Bignum`.
Ruby 2.4. ги обединява в `Integer`.

## [String поддръжка за Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` сега поддържат Unicode
mappings вместо само ASCII такива.

## Подобрения на производителността

Ruby 2.4 съдържа следните промени, подобряващи производителността:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` и `[x, y].min` са оптимизирани да не създават временен масив
при определени условия.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Добавен е метода `Regexp#match?`, който изпълнява regexp match без
да създава back reference object и да сменя `$~`, за да се редуцира
броят на алокираните обекти.

### Други подобрения на производителността

* [по-бърз достъп до instance променливи](https://bugs.ruby-lang.org/issues/12274)

## Дебъгване

### [Thread#report_on_exception и Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby игнорира exception-и в нишки освен ако не се join-не друга нишка.
Чрез `report_on_exception = true` може да се следи ако нишка умре поради
необработен exception.

Споделете с нас каква според вас трябва да бъде стойността по подразбиране на
`report_on_exception`.

### [Показване на backtrace и зависимости при deadlock на нишки](https://bugs.ruby-lang.org/issues/8214)

Ruby засича deadlock-ове при чакащи нишки, но не показва достатъчно
информация за дебъгване.
Ruby 2.4 показва нишките заедно с техният backtrace, както и кои други нишки
зависят от тях.

Приятно ползване на Ruby 2.4.0-preview1!
[Свържете се с нас](https://github.com/ruby/ruby/wiki/How-To-Report)
с вашите коментари и преложения.

## Важни промени от 2.3

Вижте [Новини](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
и [Списък с промени](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
за повече информация.

## Сваляне

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

## Коментар

За повече информация и план за следващи версии:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
