---
layout: news_post
title: "Вышел Ruby 2.1.0-preview1"
author: "nurse"
translator: "Vlad Bokov"
date: 2013-09-23 07:00:00 +0000
lang: ru
---

Рады сообщить, что вышел Ruby 2.1.0-preview1.
Попробуйте все новинки до выхода официального релиза 2.1!

## Скачать

Рекомендуем скачать по ссылке
[https://cache.ruby-lang.org/pub/ruby/2.1/](https://cache.ruby-lang.org/pub/ruby/2.1/)
через Fastly.

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

## Что нового

Значительные изменения в:

* VM (кеш методов)
* RGenGC (См. презентацию ko1 [на RubyKaigi](http://rubykaigi.org/2013/talk/S73) и [на EuRuKo](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* синтаксис
* десятичные литералы (Decimal Literal)
* постоянные строковые литералы (Frozen String Literal)
* определение метода теперь возвращает значение
* Bignum
* 128bit
* GMP
* String#scrub
* Socket.getifaddrs
* новый RubyGems

See more details of changes
Больше подробностей в [новостях в репозитарии Ruby](https://github.com/ruby/ruby/blob/trunk/NEWS).

Презентация ko1: [Обзор Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) написал хороший обзор в своем блоге: [Что нового в Ruby 2.1?](http://rkh.im/ruby-2.1).

## Комментарии к релизу

Известные баги:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

О плане релизов и другую информацию можно получить тут:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
