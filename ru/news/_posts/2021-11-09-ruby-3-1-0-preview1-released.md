---
layout: news_post
title: "Выпуск Ruby 3.1.0 Preview 1"
author: "naruse"
translator: "suban05"
date: 2021-11-09 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Мы рады объявить о выпуске Ruby {{ release.version }}.

## YJIT: Новый экспериментальный in-process JIT компилятор

Ruby 3.1 включает YJIT, новый in-process JIT компилятор, разработанный Shopify.

С тех пор как [Ruby 2.6 представил MJIT в 2018 году](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/), его производительность значительно улучшилась, и наконец [мы достигли Ruby3x3 в прошлом году](https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/). Но несмотря на впечатляющее ускорение в Optcarrot, JIT не принес пользы реальным бизнес-приложениям.

Недавно Shopify внес множество улучшений в Ruby для ускорения их Rails-приложения. YJIT является важным вкладом и направлен на улучшение производительности Rails-приложений.

Хотя MJIT является method-based JIT компилятором и использует внешний C компилятор, YJIT использует Basic Block Versioning и включает JIT компилятор внутри себя. С Lazy Basic Block Versioning (LBBV) он сначала компилирует начало метода и постепенно компилирует остальное, когда тип аргументов и переменных динамически определяется. См. [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) для подробного введения.

С этой технологией, YJIT достигает как быстрого времени разогрева, так и улучшения производительности для большинства реального программного обеспечения, до 22% на railsbench, 39% на liquid-render.

YJIT все еще является экспериментальной функцией и по умолчанию отключен. Если вы хотите использовать его, укажите командную опцию `--yjit` для включения YJIT. Он также ограничен для macOS и Linux на x86-64 платформах на данный момент.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Новый отладчик

Новый отладчик [debug.gem](https://github.com/ruby/debug) включен. debug.gem это быстрая реализация отладчика и он предоставляет множество функций, таких как удаленная отладка, цветной REPL, интеграция с IDE (VSCode) и многое другое. Он заменяет стандартную библиотеку `lib/debug.rb`.

## error_highlight: Точное указание места ошибки в backtrace

Встроенный gem, error_highlight, был введен. Он включает точное указание места ошибки в backtrace:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```


Этот gem включен по умолчанию. Вы можете отключить его, используя командную опцию `--disable-error_highlight`. Подробности смотрите в [репозитории](https://github.com/ruby/error_highlight).

## Улучшение Irb

Будет описано в следующем preview.

## Другие значимые новые функции

### Язык

* Значения в Hash литералах и именованных аргументах могут быть опущены. [Feature #14579]
  * `{x:, y:}` является синтаксическим сахаром для `{x: x, y: y}`.
  * `foo(x:, y:)` является синтаксическим сахаром для `foo(x: x, y: y)`.

* Оператор Pin в pattern matching теперь принимает выражение. [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```

### RBS

RBS — это язык для описания структуры программ на Ruby. Подробнее см. в [репозитории](https://github.com/ruby/rbs).

Обновления с версии Ruby 3.0.0:

* Введена команда `rbs collection` для управления RBS-ами гемов. [документация](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Добавлено/обновлено множество сигнатур для встроенных и стандартных библиотек.
* Также включены многочисленные исправления ошибок и улучшения производительности.

Подробнее см. в [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md).

### TypeProf

TypeProf — это статический анализатор типов для Ruby. Он генерирует прототип RBS из кода на Ruby без аннотаций типов. Подробнее см. в [документации](https://github.com/ruby/typeprof/blob/master/doc/doc.md).

Обновления с версии Ruby 3.0.0:

* Реализована [экспериментальная поддержка IDE](https://github.com/ruby/typeprof/blob/master/doc/ide.md).
* Многочисленные исправления ошибок и улучшения производительности.

## Улучшения производительности

* MJIT
  * Для рабочих нагрузок, таких как Rails, значение по умолчанию для `--jit-max-cache` изменено с 100 до 10000.
    JIT-компилятор больше не пропускает компиляцию методов длиной более 1000 инструкций.
  * Для поддержки Zeitwerk в Rails, скомпилированный код больше не отменяется, когда включен TracePoint для событий класса.

## Другие заметные изменения с версии 3.0

* Однострочное сопоставление с образцом, например, `ary => [x, y, z]`, больше не является экспериментальным.
* Порядок вычисления при множественном присваивании был немного изменен. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` вычислялось в порядке `baz`, `qux`, `foo`, а затем `bar` в Ruby 3.0. В Ruby 3.1 оно вычисляется в порядке `foo`, `bar`, `baz`, а затем `qux`.
* Выделение переменной ширины: Строки (экспериментально) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### Обновления стандартных библиотек

* Некоторые стандартные библиотеки обновлены.
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
* Обновлены следующие встроенные гемы.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* Следующие стандартные гемы теперь являются встроенными.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

См. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [журналы коммитов](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
для получения дополнительной информации.

С этими изменениями, [{{ release.stats.files_changed }} файлов изменено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
с версии Ruby 3.0.0!

## Скачать

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Что такое Ruby

Ruby был впервые разработан Мацумото (Юкихиро Мацумото) в 1993 году и теперь развивается как проект с открытым исходным кодом. Он работает на множестве платформ и используется по всему миру, особенно для веб-разработки.
