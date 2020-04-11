---
layout: news_post
title: "È stato rilasciato Ruby 2.1.0-rc1"
author: "nurse"
translator: "Alessandro Lepore"
date: 2013-12-20 16:53:05 +0000
lang: it
---

Siamo lieti di annunciare il rilascio di Ruby 2.1.0-rc1.
Per favore provate le nuove feature in Ruby 2.1 prima del rilascio finale previsto per il 25 dicembre!

## Modifiche rilevanti dalla preview 2

* rimosse curses. [#8584](https://bugs.ruby-lang.org/issues/8584)

per le altre modifiche vedere [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

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

Guarda più dettagli sulle modifiche: [NEWS su repository Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

ko1 ha parlato a proposito delle nuove features di Ruby 2.1 al toruby:
[All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) ha scritto un buon riassunto nel suo blog
post: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Commenti alla release

Problemi noti sono:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Vedere inoltre il release schedule e altre informazioni:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
