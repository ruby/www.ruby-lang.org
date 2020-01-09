---
layout: news_post
title: "Wydano Ruby 2.1.0-preview1"
author: "nurse"
translator: "crabonature"
date: 2013-09-23 07:00:00 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.1.0-preview1.
Proszę sprawdźcie nowe funkcjonalności w Rubim 2.1 przed finalnym wydaniem!

## Pobieranie

Zalecamy używać
[https://cache.ruby-lang.org/pub/ruby/2.1/](https://cache.ruby-lang.org/pub/ruby/2.1/)
poprzez Fastly.

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      SIZE:   11475553 bytes
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      SIZE:   14449544 bytes
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      SIZE:   16124069 bytes
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## Zmiany

Znaczące zmiany to:

* VM (cache metod)
* RGenGC (Zobacz prezentację ko1 z [RubyKaigi](http://rubykaigi.org/2013/talk/S73) i [EuRuKo](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* składnia
* Decimal Literal
* Frozen String Literal
* def zwraca wartość
* Bignum
* 128bit
* GMP
* String#scrub
* Socket.getifaddrs
* nowe RubyGems

Zobacz więcej szczegółów zmian:
[NEWS w repozytorium Rubiego (WIP)](https://github.com/ruby/ruby/blob/trunk/NEWS).

Prezentacja toruby wygłoszona przez ko1:
[Summary of Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) napisał dobre podsumowanie na swoim blogu:
[What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Komentarz do wydania

Znane problemy to:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Zobacz także plan wydań oraz inne informacje:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
