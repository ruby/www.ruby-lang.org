---
layout: news_post
title: "È stato rilasciato Ruby 2.1.0"
author: "nurse"
translator: "alepore"
date: 2013-12-25 16:00:00 +0000
lang: it
---

Siamo lieti di annunciare il rilascio di Ruby 2.1.0.

Ruby 2.1 contiene numerosi miglioramenti, anche di velocità, senza particolari
incompatibilità.

Provatelo!

## Download

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2)
  * SIZE:   12007442 bytes
  * MD5:    1546eeb763ac7754365664be763a1e8f
  * SHA256: 1d3f4ad5f619ec15229206b6667586dcec7cc986672c8fbb8558161ecf07e277
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz)
  * SIZE:   15076389 bytes
  * MD5:    9e6386d53f5200a3e7069107405b93f7
  * SHA256: 3538ec1f6af96ed9deb04e0965274528162726cc9ba3625dcf23648df872d09d
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip)
  * SIZE:   16603067 bytes
  * MD5:    2fc3a80b56da81b906a9bb6fc7ca8399
  * SHA256: d40d7bfb39ca2e462dea61dcbbcf33426b60e6e553335c3afb39b4d827a6891c

## Modifiche dalla 2.0

Le modifiche rilevanti sono:

* VM (method cache)
* RGenGC (Vedi [la presentazione al RubyKaigi](http://rubykaigi.org/2013/talk/S73) e [la presentazione alla RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf) di ko1)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* modifiche di sintassi
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * valore di ritorno dei def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * usa GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 e RubyGems 2.2.0
* "literal".freeze è ora ottimizzato [#9042](https://bugs.ruby-lang.org/issues/9042)
* aggiunto Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* aggiornate librerie come BigDecimal, JSON, NKF, Rake, RubyGems, e RDoc.
* rimosse curses. [#8584](https://bugs.ruby-lang.org/issues/8584)

Guarda più dettagli sulle modifiche: [NEWS su repository Ruby](https://github.com/ruby/ruby/blob/v2_1_0/NEWS).
