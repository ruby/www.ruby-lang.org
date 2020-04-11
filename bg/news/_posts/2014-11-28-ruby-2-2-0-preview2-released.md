---
layout: news_post
title: "Излезе Ruby 2.2.0-preview2"
author: "naruse"
translator: "Georgi Mitrev"
date: 2014-11-28 09:00:00 +0000
lang: bg
---

Имаме удоволствието да обявим излизането на Ruby 2.2.0-preview2.

Ruby 2.2.0-preview2 е вторият предварителен преглед на Ruby 2.2.0.
Включени са много новости и подобрения.

Например, Symbol GC прави символите garbage collectable.
Това намалява използваната памет за символи, защото досега те не се събираха от GC.
Rails 5.0 ще се възползва от Symbol GC и затова ще изисква минимална версия на
Ruby 2.2. (Виж [блог пост на Rails](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/) за повече детайли.)

Освен това новият Incremental GC намалява паузата на garbage collection, което
допълнително подпомага работата на Rails приложения.

Новост, вързана с управлението на паметта, е добавянето на опция за
configure.in да използва jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Опцията е изключена по подразбиране поради експерименталната си природа.
Когато се убедим от ползите й, тя ще бъде включена по подразбиране.

Друга тема е [използването на vfork(2) в system() и spawn() (Японски)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Очаква се това да доведе до значителни забързвания в случаите, когато голям
процес многократно извиква външни команди.

Приятно ползване на Ruby 2.2.0-preview2!

## Значителни промени от 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* основни библиотеки:
  * Поддръжка на Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Нови методи:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* включени библиотеки:
  * Актуализация на Psych 2.0.6
  * Актуализация на Rake 10.4.0
  * Актуализация на RDoc 4.2.0.alpha (21b241a)
  * Актуализация на RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * Актуализация на test-unit 3.0.7 (премахнато от хранилището, но включено в
    tarball-а)
  * Актуализация нa minitest 5.4.3 (премахнато от хранилището, но включено в
    tarball-а)
  * Маркиране на mathn за премахване в бъдеще
* C API
  * Премахнати остарели API-та

Виж [NEWS в Ruby хранилището](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) за повече информация.

С тези промени, 1239 променени файла, 98343 добавени реда(+), 61858 премахнати
реда(-).

## Сваляне

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## Допълнително

* [2.2.0 Известни проблеми](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

За повече информация:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
