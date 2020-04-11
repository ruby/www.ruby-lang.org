---
layout: news_post
title: "Ruby 2.1.0-rc1 veröffentlicht"
author: "nurse"
translator: "Quintus"
date: 2013-12-20 16:53:05 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.1.0-rc1 ankündigen zu
können. Bitte testen Sie die neuen Features von Ruby 2.1 vor dem
finalen Release am 25.12.2013!

## Wesentliche Änderungen seit preview 2

* Curses wurde entfernt [#8584](https://bugs.ruby-lang.org/issues/8584)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS)
für weitere Änderungen.

## Download

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

## Änderungen seit 2.0

Die auffälligsten Änderungen sind:

* VM (Methodencache)
* RGenGC (Siehe ko1s
  [RubyKaigi-Präsentation](http://rubykaigi.org/2013/talk/S73) und
  [RubyConf-2013-Präsentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)
* Refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* Syntaxänderungen
  * Rational/Complex-Literal
    [#8430](https://bugs.ruby-lang.org/issues/8430)
  * Rückgabewert von `def` [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * Verwende GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 und RubyGems 2.2.0
* `"literal".freeze` wurde optimiert [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause hinzugefügt [#8257](https://bugs.ruby-lang.org/issues/8257)
* Bibliotheken wie BigDecimal, JSON, NKF, Rake, RubyGems und RDoc aktualisiert
* Curses entfernt [#8584](https://bugs.ruby-lang.org/issues/8584)

Für weitere Details, siehe [NEWS im Ruby-Repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

ko1 sprach auf der _toruby_ über die neuen Features von Ruby 2.1:
[Alles über Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf).

Konstantin Haase (@konstantinhaase) hat auf seinem Blog eine gute
Zusammenfassung veröffentlicht: [Was ist neu in Ruby 2.1?](http://rkh.im/ruby-2.1)

## Veröffentlichungskommentar

Bekannte Probleme sind:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

See also the release schedule and other information:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
