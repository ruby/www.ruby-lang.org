---
layout: news_post
title: "Излезе Ruby 2.2.0"
author: "naruse"
translator: "Georgi Mitrev"
date: 2014-12-25 09:00:00 +0000
lang: bg
---

Имаме удоволствието да обявим излизането на Ruby 2.2.0.

Ruby 2.2 включва много нови функционалности и подобрения.

Например, подобреният Garbage Collector прави символите garbage collectable.
Това намалява използваната памет за символи, защото преди 2.2 те не се събираха от GC.
Rails 5.0 ще се възползва от Symbol GC и затова ще изисква минимална версия на Ruby 2.2.
(Виж [блог пост на Rails](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) за повече детайли.)

Освен това новият Incremental GC намалява паузата на garbage collection, което
допълнително подпомага работата на Rails приложения. По последни новини от
[блогът на Rails](http://weblog.rubyonrails.org/) се очаква, че Rails 5.0 ще се
възползва както от Incremental GC, така и от Symbol GC.

Новост, вързана с управлението на паметта, е добавянето на опция за
`configure.in` да използва jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Опцията е изключена по подразбиране поради експерименталната си природа.
Когато се убедим от ползите й, тя ще бъде включена по подразбиране.

Друга тема е [използването на vfork(2) в system() и spawn() (Японски)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Очаква се това да доведе до значителни забързвания в случаите, когато голям
процес многократно извиква външни команди.
Използването на vfork(2) обаче може да е потенциално опасно. Желаем да
експериментираме, за да разберем какви може да са ползите от използването му.

Приятно ползване на Ruby 2.2.0!

## Значителни промени от 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([презентация от RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([презентация от RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* основни библиотеки:
  * Поддръжка на Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Нови методи:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* включени библиотеки:
  * Актуализация на Psych 2.0.8
  * Актуализация на Rake 10.4.2
  * Актуализация на RDoc 4.2.0
  * Актуализация на RubyGems 2.4.5
  * Актуализация на test-unit 3.0.8 (премахнато от хранилището, но включено
    в tarball-a)
  * Актуализация нa minitest 5.4.3 (премахнато от хранилището, но включено в
    tarball-а)
  * Маркиране на mathn за премахване в бъдеще
* C API
  * Премахнати остарели API-та

Виж [NEWS в Ruby хранилището](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
за повече информация.

С тези промени, 1557 променени файла, 125039 добавени реда(+), 74376 премахнати
реда(-) от 2.1.0!

## Сваляне

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
