---
layout: news_post
title: "Вийшов Ruby 2.2.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2014-12-25 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.2.0.

Ruby 2.2 включає багато нових функцій та покращень для все більш
різноманітних та розширюваних вимог до Ruby.

Наприклад, Збирач сміття Ruby тепер може збирати об'єкти типу Symbol.
Це зменшує використання пам'яті Symbols; оскільки GC раніше не міг
збирати їх до 2.2.
Оскільки Rails 5.0 вимагатиме Symbol GC, він підтримуватиме лише Ruby 2.2 або пізніші.
(Див. [пост випуску Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) для деталей.)

Також, зменшений час паузи завдяки новому Incremental Garbage Collector буде
корисним для запуску додатків Rails. Останні розробки, згадані в
[блозі Rails](http://weblog.rubyonrails.org/)
припускають, що Rails 5.0 скористається Incremental GC, а також
Symbol GC.

Ще одна функція, пов'язана з управлінням пам'яттю, - це додаткова опція
для `configure.in` для використання jemalloc
[Функція #9113](https://bugs.ruby-lang.org/issues/9113).
Ця функція все ще експериментальна та зараз вимкнена за замовчуванням, поки ми
збираємо дані про продуктивність та більше випадків використання. Коли ми переконаємося в
перевагах, ця функція буде увімкнена за замовчуванням.

Також додано експериментальну підтримку використання vfork(2) з system() та spawn(). Ви можете прочитати більше деталей на
[блозі tanaka-san японською](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Це потенційно може принести величезне прискорення, коли великий процес виконує
зовнішні команди багато разів.
Однак vfork(2) все ще не дуже зрозумілий та потенційно шкідливий
системний виклик. Ми хотіли б експериментувати, щоб дізнатися, скільки користі можна
отримати, збираючи дані про продуктивність та випадки використання.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.2.0, та повідомте нам ваші знахідки!

## Помітні зміни з 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([презентація на RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([презентація на RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc
  [Функція #9113](https://bugs.ruby-lang.org/issues/9113)
* основні бібліотеки:
  * Підтримка Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Нові методи:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* включені бібліотеки:
  * Оновлено Psych 2.0.8
  * Оновлено Rake 10.4.2
  * Оновлено RDoc 4.2.0
  * Оновлено RubyGems 2.4.5
  * Оновлено test-unit 3.0.8 (видалено з репозиторію, але включено в tarball)
  * Оновлено minitest 5.4.3 (видалено з репозиторію, але включено в tarball)
  * Застаріло mathn
* C API
  * Видалено застарілі API

Див. [NEWS в репозиторії Ruby](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
для деталей.

З цими змінами, 1557 файлів змінено, 125039 додано(+), 74376 видалено(-)
з v2.1.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * РОЗМІР:   13304042 байтів
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * РОЗМІР:   16494584 байтів
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * РОЗМІР:   10304244 байтів
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * РОЗМІР:   18441027 байтів
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e

