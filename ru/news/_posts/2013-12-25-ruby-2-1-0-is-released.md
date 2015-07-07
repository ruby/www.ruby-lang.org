---
layout: news_post
title: "Вышел Ruby 2.1.0"
author: "nurse"
translator: "gazay"
date: 2013-12-25 16:00:00 +0000
lang: ru
---

Рады сообщить, что вышел Ruby 2.1.0.

Ruby 2.1 содержит множество улучшений, включая ускорение, без каких-либо
несовместимостей.

Попробуйте!

## Скачать

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
* обновлены библиотеки, такие как BigDecimal, JSON, NKF, Rake, RubyGems и RDoc
* удалена библиотека curses [#8584](https://bugs.ruby-lang.org/issues/8584)

Смотри больше подробностей об изменениях: [NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_1_0/NEWS).
