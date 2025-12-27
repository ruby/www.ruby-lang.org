---
layout: news_post
title: "Вийшов Ruby 2.5.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2017-12-25 00:00:00 +0000
lang: uk
---

Ми раді повідомити про реліз Ruby 2.5.0.

Ruby 2.5.0 — перший стабільний реліз серії Ruby 2.5.
Він вводить багато нових функцій і покращень продуктивності.
Найважливіші зміни:

## Нові функції

* `rescue`/`else`/`ensure` тепер можна використовувати безпосередньо з
  блоками `do`/`end`.
  [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
* Додано `yield_self` для виклику переданого блоку в його контексті.
  На відміну від `tap`, він повертає результат блоку.
  [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
* Підтримка вимірювання покриття гілок (branch coverage) і покриття методів (method coverage).
  Покриття гілок показує, які гілки виконано, а які ні.
  Покриття методів показує, які методи викликано, а які ні.
  Запустивши набір тестів з цими новими функціями, ви дізнаєтесь, які
  гілки та методи виконуються, і зможете точніше оцінити загальне покриття тестів.
  [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)
  і Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new може створювати класи, що приймають ключові аргументи.
  [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none? та one? приймають аргумент-шаблон.
  [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
* Пошук констант верхнього рівня більше недоступний.
  [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
* Одну з найулюбленіших бібліотек, pp.rb, тепер завантажується автоматично.
  Вам більше не потрібно писати `require "pp"`.
  [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
* Backtrace та повідомлення про помилку тепер друкуються у зворотному порядку
  (спочатку найстаріший виклик, останнім — найновіший). Коли довгий backtrace
  з'являється у терміналі (TTY), ви можете легко знайти рядок причини внизу.
  Зверніть увагу, що порядок змінюється, тільки коли backtrace виводиться
  безпосередньо в термінал.
  [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [експериментально]

## Покращення продуктивності

* Близько 5-10% покращення продуктивності завдяки видаленню всіх інструкцій `trace`
  з загального байткоду (послідовностей інструкцій).
  Інструкція `trace` була додана для підтримки `TracePoint`.
  Однак у більшості випадків `TracePoint` не використовується, і інструкції `trace`
  є чистими накладними витратами. Тепер ми використовуємо техніку динамічної інструментації.
  Докладніше див. [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104).
* Передача блоку через параметр блоку (напр., `def foo(&b); bar(&b); end`)
  приблизно в 3 рази швидша, ніж у Ruby 2.4, завдяки техніці «Lazy Proc allocation».
  [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
* Mutex переписано для меншого розміру та більшої швидкості.
  [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB тепер генерує код з шаблону вдвічі швидше, ніж у Ruby 2.4.
* Покращено продуктивність деяких вбудованих методів, включаючи `Array#concat`,
  `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+` та інших.
* IO.copy_stream використовує copy_file_range(2) для розвантаження копіювання.
  [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## Інші важливі зміни порівняно з 2.4

* SecureRandom тепер віддає перевагу джерелам, наданим ОС, над OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* Підвищено cmath, csv, date, dbm тощо, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib зі стандартних бібліотек
  до default gems.
* Оновлено до [Onigmo](https://github.com/k-takata/Onigmo/) 6.1.3.
  * Додано [оператор відсутності](https://github.com/k-takata/Onigmo/issues/87).
* Оновлено до Psych 3.0.2.
* Оновлено до RubyGems 2.7.3.
* Оновлено до RDoc 6.0.1.
  * [Змінено лексер з базованого на IRB на Ripper](https://github.com/ruby/rdoc/pull/512).
    Це драматично покращує продуктивність генерації документації.
* Оновлено підтримувану версію Unicode до 10.0.0.
* `Thread.report_on_exception` тепер за замовчуванням встановлено в true.
  Ця зміна допомагає налагодженню багатопотокових програм.
  [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write тепер приймає кілька аргументів.
  [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

Докладніше див. [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
або [історію комітів](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0).

З цими змінами
[6158 файлів змінено, 348484 вставок(+), 82747 видалень(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
від Ruby 2.4.0!

Веселого Різдва, гарних свят і насолоджуйтесь програмуванням з Ruby 2.5!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
