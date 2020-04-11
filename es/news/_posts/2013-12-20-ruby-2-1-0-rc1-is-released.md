---
layout: news_post
title: "Liberado Ruby 2.1.0-rc1"
author: "nurse"
translator: "David Padilla"
date: 2013-12-20 16:53:05 +0000
lang: es
---

Nos complace anunciar la entrega de Ruby 2.1.0-rc1.
Por favor ayúdanos a probar las nuevas características de Ruby 2.1 antes
de la entrega final programada para el 2013-12-25.

## Cambios notables desde preview 2

* curses ha sido removido [#8584](https://bugs.ruby-lang.org/issues/8584)

Para otros cambios ver las [NOTICIAS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

## Descargas

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

## Cambios desde 2.0

Los cambios más notables son:

* VM (cache de métodos)
* RGenGC (Ver la [presentación en RubyKaigi](http://rubykaigi.org/2013/talk/S73) y [RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf) de ko1)
* Refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* Cambios en la sintáxis
  * Literales de Rational/Complex [#8430](https://bugs.ruby-lang.org/issues/8430)
  * el valor de retorno de def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * Uso de GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 y RubyGems 2.2.0
* "literal".freeze ha sido optimizado [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* Actualización de librerías como BigDecimal, JSON, NKF, Rake, RubyGems, and RDoc
* curses ha sido removido [#8584](https://bugs.ruby-lang.org/issues/8584)

Más detalles de los cambios: [NEWS en el repositorio de Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

ko1 habló acerca de las nuevas características de Ruby 2.1 en
toruby: [Todo acerca de Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) escribió un excelente resumen de los
cambios en su blog post: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Comentarios

Problemas conocidos:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Ver también la agenda de entregas y otra información:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
