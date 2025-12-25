---
layout: news_post
title: "Вийшов Ruby 2.1.0-rc1"
author: "nurse"
translator: "Andrii Furmanets"
date: 2013-12-20 16:53:05 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.1.0-rc1.
Будь ласка, протестуйте нові функції в Ruby 2.1 перед фінальним випуском, запланованим на 2013-12-25!

## Помітні зміни з preview 2

* видалено curses [#8584](https://bugs.ruby-lang.org/issues/8584)

для інших змін, див. [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2)
  * РОЗМІР:   11394226 байтів
  * MD5:    cae095b90349b5b0f7026060cc3dd2c5
  * SHA256: af828bc0fe6aee5ffad0f8f10b48ee25964f54d5118570937ac7cf1c1df0edd3
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz)
  * РОЗМІР:   14450990 байтів
  * MD5:    a16561f64d78a902fab08693a300df98
  * SHA256: 1b467f13be6d3b3648a4de76b34b748781fe4f504a19c08ffa348c75dd62635e
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip)
  * РОЗМІР:   16107702 байтів
  * MD5:    b6cdc0e63185b4aeb268bdf6ebd4de9f
  * SHA256: 4d6a256b73b79f5b64182e1f55db3e61042bbe0166a45917e69c1b4e47247276

## Зміни з 2.0

Помітні зміни:

* VM (кеш методів)
* RGenGC (Див. презентацію ko1 на [RubyKaigi](http://rubykaigi.org/2013/talk/S73) та [RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* зміни синтаксису
  * Літерал Rational/Complex [#8430](https://bugs.ruby-lang.org/issues/8430)
  * значення повернення def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * використання GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 та RubyGems 2.2.0
* "literal".freeze тепер оптимізовано [#9042](https://bugs.ruby-lang.org/issues/9042)
* додано Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* оновлено бібліотеки, такі як BigDecimal, JSON, NKF, Rake, RubyGems, та RDoc
* видалено curses [#8584](https://bugs.ruby-lang.org/issues/8584)

Див. більше деталей змін: [NEWS в репозиторії Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

ko1 говорив про нові функції Ruby 2.1 на toruby: [Все про Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) написав хороше резюме у своєму блозі: [Що нового в Ruby 2.1?](http://rkh.im/ruby-2.1).

## Коментар до випуску

Відомі проблеми:

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

Див. також розклад випуску та іншу інформацію:

<https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210>