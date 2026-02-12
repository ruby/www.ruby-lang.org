---
layout: news_post
title: "Wydano Ruby 2.1.0-preview2"
author: "nurse"
translator: "crabonature"
date: 2013-11-22 22:00:00 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.1.0-preview2.
Proszę sprawdźcie nowe funkcjonalności w Rubim 2.1 przed finalnym wydaniem!

## Zauważalne zmiany w stosunku do preview 1

* poprawione [Przepełnienie stosu podczas parsowania zmiennoprzecinkowego (CVE-2013-4164)](https://www.ruby-lang.org/pl/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* optymalizacja "literal".freeze [#9042](https://bugs.ruby-lang.org/issues/9042)
* przyrostek f dla literałów napisów został usunięty [#9042](https://bugs.ruby-lang.org/issues/9042)
* poprawiono problem zużycia pamięci w RGenGC ([r43532](https://git.ruby-lang.org/ruby.git) and [r43755](https://git.ruby-lang.org/ruby.git))
* dodano Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* zaktualizowano biblioteki json, nkf, rake, RubyGems, i RDoc.

## Pobieranie

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      SIZE:   11432454 bytes
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      SIZE:   14416029 bytes
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      SIZE:   16110720 bytes
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## Zmiany w stosunku do 2.0

Znaczące zmiany to:

* VM (cache metod)
* RGenGC (Zobacz prezentację ko1 z [RubyKaigi](http://rubykaigi.org/2013/talk/S73) i [RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* składnia
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def zwraca wartość [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * użycie 128 bitowych liczb całkowitych [#8509](https://bugs.ruby-lang.org/issues/8509)
  * użycie GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 i RubyGems 2.2.0.preview.2

Zobacz więcej szczegółów zmian: [NEWS w repozytorium Rubiego (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

Prezentacja wygłoszona przez ko1 na toruby o nowych elementach w Rubim 2.1: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) napisał dobre podsumowanie na swoim blogu: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Komentarz do wydania

Znane problemy to:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Zobacz także plan wydań oraz inne informacje:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
