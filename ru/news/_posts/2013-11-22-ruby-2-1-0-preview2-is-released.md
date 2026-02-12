---
layout: news_post
title: "Вышел Ruby 2.1.0-preview2"
author: "nurse"
translator: "gazay"
date: 2013-11-22 22:00:00 +0000
lang: ru
---

Рады сообщить, что вышел Ruby 2.1.0-preview2.
Попробуйте все новинки до выхода официального релиза 2.1!

## Значительные изменения с первого превью:

* фикс [Переполнение кучи при парсинге плавающей запятой (CVE-2013-4164)](/ru/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* "literal".freeze теперь оптимизирован [#9042](https://bugs.ruby-lang.org/issues/9042)
* f суффикс у String Literal убран [#9042](https://bugs.ruby-lang.org/issues/9042)
* фикс проблемы потребления памяти на RGenGC ([r43532](https://git.ruby-lang.org/ruby.git) and [r43755](https://git.ruby-lang.org/ruby.git))
* добавлен Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* обновлены библиотеки, такие как json, nkf, rake, RubyGems, и RDoc.

## Скачать

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

## Изменения с 2.0

Значительные изменения:

* VM (кеш методов)
* RGenGC (Смотри презентацию ko1 [на RubyKaigi](http://rubykaigi.org/2013/talk/S73) и [на RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* изменения в синтаксисе
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def возвращает значение [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * использует 128-битные целые [#8509](https://bugs.ruby-lang.org/issues/8509)
  * использует GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 и RubyGems 2.2.0.preview.2

Смотри больше подробностей об изменениях: [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 рассказывает про новые фичи Ruby 2.1 at toruby: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) написал хороший пост в своем блоге: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Комментарии к релизу

Известные баги:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

О плане релизов и другую информацию можно получить тут:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
