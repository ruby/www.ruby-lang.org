---
layout: news_post
title: "Вийшов Ruby 3.1.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2021-12-25 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Ми раді оголосити випуск Ruby {{ release.version }}. Ruby 3.1 зберігає сумісність з Ruby 3.0 та також додає багато функцій.


## YJIT: Новий експериментальний in-process JIT компілятор

Ruby 3.1 об'єднує YJIT, новий in-process JIT компілятор, розроблений Shopify.

З того часу, як [Ruby 2.6 ввів MJIT у 2018](https://www.ruby-lang.org/uk/news/2018/12/25/ruby-2-6-0-released/), його продуктивність значно покращилася, і нарешті [ми досягли Ruby3x3 минулого року](https://www.ruby-lang.org/uk/news/2020/12/25/ruby-3-0-0-released/). Але навіть незважаючи на те, що бенчмарк Optcarrot показав вражаючі прискорення, JIT не приніс користі реальним бізнес-додаткам.

Недавно Shopify внесли багато покращень Ruby для прискорення їхнього Rails додатку. YJIT - це важливий внесок, і має на меті покращити продуктивність Rails додатків.

Поки MJIT є метод-орієнтованим JIT компілятором і використовує зовнішній C компілятор, YJIT використовує Basic Block Versioning та включає JIT компілятор всередині себе. З Lazy Basic Block Versioning (LBBV) він спочатку компілює початок методу, та інкрементально компілює решту, коли тип аргументів та змінних динамічно визначається. Див. [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) для детального вступу.

З цією технологією YJIT досягає як швидкого часу прогріву, так і покращень продуктивності на більшості реального програмного забезпечення, до 22% на railsbench, 39% на liquid-render.

YJIT все ще є експериментальною функцією, і як така, вона вимкнена за замовчуванням. Якщо ви хочете використати це, вкажіть опцію командного рядка `--yjit`, щоб увімкнути YJIT. Вона також обмежена Unix-подібними платформами x86-64 зараз.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Новий дебагер

Повністю переписаний дебагер [debug.gem](https://github.com/ruby/debug) включено. debug.gem має наступні функції:

* Покращити продуктивність дебагінгу (він не сповільнює додаток навіть з дебагером).
* Підтримка віддаленого дебагінгу.
* Підтримка багатого фронтенду дебагінгу (VS Code та Chrome браузер підтримуються зараз).
* Підтримка багатопроцесного/багатопотокового дебагінгу.
* Кольоровий REPL.
* Та інші корисні функції, такі як функція запису та відтворення, функція трасування тощо.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby мав включений lib/debug.rb, але він не був добре підтриманий і мав проблеми з продуктивністю та функціями. debug.gem повністю замінює lib/debug.rb.

## error_highlight: Детальне розташування помилки в backtrace

Вбудований gem, error_highlight, введено. Він включає детальне розташування помилки в backtraces:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Зараз підтримується лише `NameError`.

Цей gem увімкнено за замовчуванням. Ви можете вимкнути його, використовуючи опцію командного рядка `--disable-error_highlight`. Див. [репозиторій error_highlight](https://github.com/ruby/error_highlight) для деталей.

## IRB Автодоповнення та Відображення Документації

IRB тепер має функцію автодоповнення, де ви можете просто ввести код, і діалог кандидатів доповнення з'явиться. Ви можете використовувати Tab та Shift+Tab для переміщення вгору та вниз.

Якщо документація встановлена, коли ви вибираєте кандидата доповнення, діалог документації з'явиться поруч з діалогом кандидатів доповнення, показуючи частину вмісту. Ви можете прочитати повну документацію, натиснувши Alt+d.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## Інші помітні нові функції

### Мова

* Значення в літералах Hash та ключових аргументах можуть бути пропущені. [[Функція #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}` є синтаксичним цукром для `{x: x, y: y}`.
  * `foo(x:, y:)` є синтаксичним цукром для `foo(x: x, y: y)`.

* Оператор pin (`^`) в pattern matching тепер приймає вираз. [[Функція #17411]](https://bugs.ruby-lang.org/issues/17411)

  ```ruby
  Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
  #=> [[3, 5], [5, 7], [11, 13]]
  ```

* Дужки можуть бути пропущені в однолінійному pattern matching. [[Функція #16182]](https://bugs.ruby-lang.org/issues/16182)

  ```ruby
  [0, 1] => _, x
  {y: 2} => y:
  x #=> 1
  y #=> 2
  ```

### RBS

RBS - це мова для опису структури програм Ruby. Див. [репозиторій RBS](https://github.com/ruby/rbs) для деталей.

Оновлення з Ruby 3.0.0:

* Параметри дженеричних типів можуть бути обмежені. ([PR](https://github.com/ruby/rbs/pull/844))
* Дженеричні псевдоніми типів підтримуються. ([PR](https://github.com/ruby/rbs/pull/823))
* `rbs collection` введено для управління RBS gems.  ([doc](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* Багато підписів для вбудованих та стандартних бібліотек було додано/оновлено.
* Він також включає багато виправлень помилок та покращень продуктивності.

Див. [RBS changelog](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) для більше інформації.

### TypeProf

TypeProf - це статичний аналізатор типів для Ruby. Він генерує прототип RBS з коду Ruby без анотацій типів. Див. [документацію](https://github.com/ruby/typeprof/blob/master/doc/doc.md) для деталей.

Головне оновлення з Ruby 3.0.0 - це експериментальна підтримка IDE, звана "TypeProf for IDE".

![Demo of TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

Розширення VS Code показує вгаданий (або явно написаний у файлі RBS) підпис методу над кожним визначенням методу, малює червоне підкреслення під кодом, який може спричинити помилку імені або типу, та доповнює імена методів (тобто показує кандидатів методів). Див. [документацію](https://github.com/ruby/typeprof/blob/master/doc/ide.md) для деталей.

Також випуск включає багато виправлень помилок та покращень продуктивності.

## Покращення продуктивності

* MJIT
  * Для навантажень, таких як Rails, значення за замовчуванням `--jit-max-cache` змінено з 100 на 10000.
    JIT компілятор більше не пропускає компіляцію методів довших за 1000 інструкцій.
  * Для підтримки Zeitwerk з Rails, JIT-компільований код більше не скасовується
    коли TracePoint для подій класу увімкнено.

## Інші помітні зміни з 3.0

* Однолінійний pattern matching, наприклад, `ary => [x, y, z]`, більше не є експериментальним.
* Порядок оцінки множинного присвоєння змінено трохи. [[Помилка #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` оцінювався в порядку `baz`, `qux`, `foo`, а потім `bar` в Ruby 3.0. В Ruby 3.1, він оцінюється в порядку `foo`, `bar`, `baz`, а потім `qux`.
* Variable Width Allocation: Strings (експериментально). [[Помилка #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0 змінює `Psych.load` використовувати `safe_load` за замовчуванням.
  Вам може знадобитися використати Psych 3.3.2 для міграції до цієї поведінки.
  [[Помилка #17866]](https://bugs.ruby-lang.org/issues/17866)

### Оновлення стандартних бібліотек

*   Наступні default gems оновлено.
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
*   Наступні включені gems оновлено.
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
*   Наступні default gems тепер є bundled gems. Вам потрібно додати наступні бібліотеки до `Gemfile` в середовищі bundler.
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [логи комітів](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
для більше деталей.

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
з Ruby 3.0.0!

Веселих свят, щасливих святкових днів, та насолоджуйтеся програмуванням з Ruby 3.1!

## Завантаження

* <{{ release.url.gz }}>

      РОЗМІР: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      РОЗМІР: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      РОЗМІР: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Що таке Ruby

Ruby вперше розроблено Matz (Yukihiro Matsumoto) у 1993 році,
і зараз розробляється як Open Source. Він працює на кількох платформах
та використовується по всьому світу, особливо для веб-розробки.

