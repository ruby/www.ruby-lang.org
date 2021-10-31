---
layout: news_post
title: "Вышел Ruby 2.1.0-rc1"
author: "nurse"
translator: "Vlad Bokov"
date: 2013-12-20 16:53:05 +0000
lang: ru
---

Рады сообщить, что вышел Ruby 2.1.0-rc1.
Попробуйте все новинки до выхода официального релиза Ruby 2.1, намеченного на 25 декабря 2013 г!

## Значительные изменения со второго превью:

* удалена библиотека curses. [#8584](https://bugs.ruby-lang.org/issues/8584)

О других новостях можно узнать [тут](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

## Скачать

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

## Изменения с 2.0

Значительные изменения:

* VM (кеш методов)
* RGenGC (Смотри презентацию ko1 [на RubyKaigi](http://rubykaigi.org/2013/talk/S73) и [на RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* изменения в синтаксисе
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def возвращает значение [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * использует GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 и RubyGems 2.2.0
* "literal".freeze теперь оптимизирован [#9042](https://bugs.ruby-lang.org/issues/9042)
* добавлен Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* обновлены библиотеки, такие как json, nkf, rake, RubyGems, и RDoc.
* удалена библиотека curses. [#8584](https://bugs.ruby-lang.org/issues/8584)

Смотри больше подробностей об изменениях: [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 рассказывает про новые фичи Ruby 2.1 at toruby: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) написал хороший пост в своем блоге: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Комментарии к релизу

Известные баги:

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

О плане релизов и другую информацию можно получить тут:

<https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210>
