---
layout: news_post
title: "Излезе Ruby 2.2.0-rc1"
author: "naruse"
translator: "Georgi Mitrev"
date: 2014-12-18 09:00:00 +0000
lang: bg
---

Имаме удоволствието да обявим излизането на Ruby 2.2.0-rc1.
След RC1, всички промени ще са само бъгфиксове.
Официалното излизане на Ruby 2.2.0 е насрочено за 25 Декември 2014.

Ruby 2.2 включва много нови функционалности и подобрения.

Например, подобреният Garbage Collector прави символите garbage collectable.
Това намалява използваната памет за символи, защото преди 2.2 те не се събираха от GC.
Rails 5.0 ще се възползва от Symbol GC и затова ще изисква минимална версия на
Ruby 2.2.
(Виж [блог пост на Rails](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) за повече детайли.)

Освен това новият Incremental GC намалява паузата на garbage collection, което
допълнително подпомага работата на Rails приложения. По последни новини от
[блогът на Rails](http://weblog.rubyonrails.org/)
се очаква, че Rails 5.0 ще се възползва както от Incremental GC, така и от
Symbol GC.

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

Приятно ползване на Ruby 2.2.0-rc1!

## Значителни промени от 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
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
  * Актуализация на Rake 10.4.0
  * Актуализация на RDoc 4.2.0.alpha (21b241a)
  * Актуализация на RubyGems 2.4.5
  * Актуализация на test-unit 3.0.8 (премахнато от хранилището, но включено
    в tarball-a)
  * Актуализация нa minitest 5.4.3 (премахнато от хранилището, но включено в
    tarball-а)
  * Маркиране на mathn за премахване в бъдеще
* C API
  * Премахнати остарели API-та

Виж [NEWS в Ruby хранилището](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) за повече информация.

С тези промени, 1548 променени файла, 123658 добавени реда(+), 74306
премахнати(-) от 2.1.0!

## Сваляне

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Допълнително

* [2.2.0 Известни проблеми](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

За повече информация:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
