---
layout: news_post
title: "Wydano Ruby 2.1.0-rc1"
author: "nurse"
translator: "crabonature"
date: 2013-12-20 16:53:05 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.1.0-rc1.
Proszę sprawdźcie nowe funkcjonalności w Rubim 2.1 przed finalnym wydaniem
zaplanowanym na 2013-12-25!

## Zauważalne zmiany w stosunku do preview 2

* usunięto curses [#8584](https://bugs.ruby-lang.org/issues/8584)

inne zmiany, zobacz [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

## Pobieranie

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2)
  * SIZE:   11394226 bytes
  * MD5:    cae095b90349b5b0f7026060cc3dd2c5
  * SHA256: af828bc0fe6aee5ffad0f8f10b48ee25964f54d5118570937ac7cf1c1df0edd3
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz)
  * SIZE:   14450990 bytes
  * MD5:    a16561f64d78a902fab08693a300df98
  * SHA256: 1b467f13be6d3b3648a4de76b34b748781fe4f504a19c08ffa348c75dd62635e
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip)
  * SIZE:   16107702 bytes
  * MD5:    b6cdc0e63185b4aeb268bdf6ebd4de9f
  * SHA256: 4d6a256b73b79f5b64182e1f55db3e61042bbe0166a45917e69c1b4e47247276

## Zmiany w stosunku do 2.0

Znaczące zmiany to:

* VM (cache metod)
* RGenGC (Zobacz prezentację ko1 z [RubyKaigi](http://rubykaigi.org/2013/talk/S73) i [RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* składnia
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def zwraca wartość [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * użycie GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 i RubyGems 2.2.0
* "literal".freeze zostało zoptymalizowane [#9042](https://bugs.ruby-lang.org/issues/9042)
* dodano Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* zaktualizowano biblioteki BigDecimal, JSON, NKF, Rake, RubyGems oraz RDoc
* usunięto curses [#8584](https://bugs.ruby-lang.org/issues/8584)

Zobacz więcej szczegółów zmian: [NEWS w repozytorium Rubiego (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

Prezentacja wygłoszona przez ko1 na toruby o nowych elementach w Rubim 2.1: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) napisał dobre podsumowanie na swoim blogu: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Komentarz do wydania

Znane problemy to:

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

Zobacz także plan wydań oraz inne informacje:

<https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210>
