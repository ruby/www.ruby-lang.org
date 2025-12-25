---
layout: news_post
title: "Вийшов Ruby 3.1.0 Preview 1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2021-11-09 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Ми раді оголосити випуск Ruby {{ release.version }}.

## YJIT: Новий експериментальний in-process JIT компілятор

Ruby 3.1 об'єднує YJIT, новий in-process JIT компілятор, розроблений Shopify.

З того часу, як [Ruby 2.6 ввів MJIT у 2018](https://www.ruby-lang.org/uk/news/2018/12/25/ruby-2-6-0-released/), його продуктивність значно покращилася, і нарешті [ми досягли Ruby3x3 минулого року](https://www.ruby-lang.org/uk/news/2020/12/25/ruby-3-0-0-released/). Але навіть незважаючи на те, що Optcarrot показав вражаючі прискорення, JIT не приніс користі реальним бізнес-додаткам.

Недавно Shopify внесли багато покращень Ruby для прискорення їхнього Rails додатку. YJIT - це важливий внесок, і має на меті покращити продуктивність Rails додатків.

Хоча MJIT є метод-орієнтованим JIT компілятором і використовує зовнішній C компілятор, YJIT використовує Basic Block Versioning та включає JIT компілятор всередині себе. З Lazy Basic Block Versioning (LBBV) він спочатку компілює початок методу, та інкрементально компілює решту, коли тип аргументів та змінних динамічно визначається. Див. [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) для детального вступу.

З цією технологією YJIT досягає як швидкого часу прогріву, так і покращень продуктивності на більшості реального програмного забезпечення, до 22% на railsbench, 39% на liquid-render.

<!-- 試す人向けのお知らせ -->

YJIT все ще є експериментальною функцією, і як така, вона вимкнена за замовчуванням. Якщо ви хочете використати це, вкажіть опцію командного рядка `--yjit`, щоб увімкнути YJIT. Вона також обмежена macOS & Linux на платформах x86-64 зараз.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Новий дебагер

Новий дебагер [debug.gem](https://github.com/ruby/debug) включено. debug.gem - це швидка реалізація дебагера, і вона надає багато функцій, таких як віддалений дебагінг, кольоровий REPL, інтеграція IDE (VSCode) та інше. Він замінює стандартну бібліотеку `lib/debug.rb`.

## error_highlight: Детальне розташування помилки в backtrace

Вбудований gem, error_highlight, введено. Він включає детальне розташування помилки в backtrace:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Цей gem увімкнено за замовчуванням. Ви можете вимкнути його, використовуючи опцію командного рядка `--disable-error_highlight`. Див. [репозиторій](https://github.com/ruby/error_highlight) детально.

## Покращення Irb

Буде описано в наступному preview.

## Інші помітні нові функції

### Мова

* Значення в літералах Hash та ключових аргументах можуть бути пропущені. [Функція #14579]
  * `{x:, y:}` є синтаксичним цукром для `{x: x, y: y}`.
  * `foo(x:, y:)` є синтаксичним цукром для `foo(x: x, y: y)`.

* Оператор pin в pattern matching тепер приймає вираз. [Функція #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```


### RBS

RBS - це мова для опису структури програм Ruby. Див. [репозиторій](https://github.com/ruby/rbs) для деталей.

Оновлення з Ruby 3.0.0:

* `rbs collection` введено для управління RBS gems.  [doc](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Багато підписів для вбудованих та стандартних бібліотек було додано/оновлено.
* Він також включає багато виправлень помилок та покращень продуктивності.

Див. [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) для більше інформації.

### TypeProf

TypeProf - це статичний аналізатор типів для Ruby. Він генерує прототип RBS з коду Ruby без анотацій типів. Див. [документ](https://github.com/ruby/typeprof/blob/master/doc/doc.md) для деталей.

Оновлення з Ruby 3.0.0:

* [Експериментальна підтримка IDE](https://github.com/ruby/typeprof/blob/master/doc/ide.md) реалізовано.
* Багато виправлень помилок та покращень продуктивності.

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
* Variable Width Allocation: Strings (експериментально) [[Помилка #18239]](https://bugs.ruby-lang.org/issues/18239)

### Оновлення стандартних бібліотек

* Деякі стандартні бібліотеки оновлено.
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* Наступні включені gems оновлено.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* Наступні default gems тепер є bundled gems.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [логи комітів](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
для більше деталей.

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
з Ruby 3.0.0!

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