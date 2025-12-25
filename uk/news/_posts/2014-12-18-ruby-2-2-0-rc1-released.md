---
layout: news_post
title: "Вийшов Ruby 2.2.0-rc1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2014-12-18 09:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.2.0-rc1.
Після RC1, всі зміни будуть обмежені лише виправленням помилок.
Фінальний випуск Ruby 2.2.0 заплановано на 25 грудня 2014 року.

Ruby 2.2 включає багато нових функцій та покращень для все більш
різноманітних та розширюваних вимог до Ruby.

Наприклад, Збирач сміття Ruby тепер може збирати об'єкти типу Symbol.
Це зменшує використання пам'яті Symbols; оскільки GC раніше не міг збирати їх до 2.2.
Оскільки Rails 5.0 вимагатиме Symbol GC, він підтримуватиме лише Ruby 2.2 або пізніші.
(Див. [пост випуску Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) для деталей.)

Також, зменшений час паузи завдяки новому Incremental Garbage Collector буде корисним для запуску додатків Rails. Останні розробки, згадані в [блозі Rails](http://weblog.rubyonrails.org/), припускають, що Rails 5.0 скористається Incremental GC, а також Symbol GC.

Ще одна функція, пов'язана з управлінням пам'яттю, - це додаткова опція для `configure.in` для використання jemalloc
[Функція #9113](https://bugs.ruby-lang.org/issues/9113).
Ця функція все ще експериментальна та зараз вимкнена за замовчуванням, поки ми збираємо дані про продуктивність та більше випадків використання. Коли ми переконаємося в перевагах, ця функція буде увімкнена за замовчуванням.

Також додано експериментальну підтримку використання vfork(2) з system() та spawn(). Ви можете прочитати більше деталей на [блозі tanaka-san японською](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Це потенційно може принести величезне прискорення, коли великий процес виконує зовнішні команди багато разів.
Однак vfork(2) все ще не дуже зрозумілий та потенційно шкідливий системний виклик. Ми хотіли б експериментувати, щоб дізнатися, скільки користі можна отримати, збираючи дані про продуктивність та випадки використання.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.2.0-rc1, та повідомте нам ваші знахідки!

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
  * Оновлено Psych 2.0.8
  * Оновлено Rake 10.4.0
  * Оновлено RDoc 4.2.0.alpha (21b241a)
  * Оновлено RubyGems 2.4.5
  * Оновлено test-unit 3.0.8 (видалено з репозиторію, але включено
в tarball)
  * Оновлено minitest 5.4.3 (видалено з репозиторію, але включено в tarball)
  * Застаріло mathn
* C API
  * Видалено застарілі API

Див. [NEWS в репозиторії Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) для деталей.

З цими змінами, 1548 файлів змінено, 123658 додано(+), 74306 видалено(-) з v2.1.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * РОЗМІР:   12475612 байтів
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * РОЗМІР:   15531233 байтів
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * РОЗМІР:   9675108 байтів
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * РОЗМІР:   17219660 байтів
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Коментар до випуску

* [Відомі проблеми 2.2.0](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)

