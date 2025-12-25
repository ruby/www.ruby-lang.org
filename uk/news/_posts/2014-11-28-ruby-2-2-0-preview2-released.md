---
layout: news_post
title: "Вийшов Ruby 2.2.0-preview2"
author: "naruse"
translator: "Andrii Furmanets"
date: 2014-11-28 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.2.0-preview2.

Ruby 2.2.0-preview2 - це другий preview Ruby 2.2.0.
Багато нових функцій та покращень включено для все більш
різноманітних та розширюваних вимог до Ruby.

Наприклад, Symbol GC робить Symbols збираними збирачем сміття.
Це зменшує використання пам'яті Symbols; оскільки GC не міг збирати Symbols до
Ruby 2.2. Оскільки Rails 5.0 вимагатиме Symbol GC, він підтримуватиме лише Ruby 2.2
або пізніші. (Див. [пост у блозі Rails](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/) для деталей.)

Також, новий Incremental GC зменшує час паузи збирання сміття, що також корисно для запуску додатків Rails.

Ще одна функція, пов'язана з управлінням пам'яттю, - це додавання опції для configure.in для використання jemalloc
[Функція #9113](https://bugs.ruby-lang.org/issues/9113).
Це експериментальна функція, і вимкнена за замовчуванням.
Нам потрібно зібрати випадки використання та дані про продуктивність.
Коли ми переконаємося в перевагах, функція буде увімкнена за замовчуванням.

Ще одна тема - [використання vfork(2) в system() та spawn() (японською)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Очікується, що це принесе величезне прискорення, коли великий процес виконує зовнішні команди багато разів.
Але vfork(2) - це ризикований системний виклик.
Ми хочемо дізнатися, скільки користі це приносить через збір випадків використання та даних про продуктивність.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.2.0-preview2, та повідомте нам ваші знання!

## Помітні зміни з 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([презентація на RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Функція #9113](https://bugs.ruby-lang.org/issues/9113)
* основні бібліотеки:
  * Підтримка Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Нові методи:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* включені бібліотеки:
  * Оновлено Psych 2.0.6
  * Оновлено Rake 10.4.0
  * Оновлено RDoc 4.2.0.alpha (21b241a)
  * Оновлено RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * Оновлено test-unit 3.0.7 (видалено з репозиторію, але включено
в tarball)
  * Оновлено minitest 5.4.3 (видалено з репозиторію, але включено в tarball)
  * Застаріло mathn
* C API
  * Видалено застарілі API

Див. [NEWS в репозиторії Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) для деталей.

З цими змінами, 1239 файлів змінено, 98343 додано(+), 61858 видалено(-).

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * РОЗМІР:   12505279 байтів
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * РОЗМІР:   15505521 байтів
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * РОЗМІР:   9649216 байтів
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * РОЗМІР:   17239396 байтів
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## Коментар до випуску

* [Відомі проблеми 2.2.0](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)