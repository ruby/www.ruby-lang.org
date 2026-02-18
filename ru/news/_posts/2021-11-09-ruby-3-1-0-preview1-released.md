---
layout: news_post
title: "Вышел Ruby 3.1.0 Preview 1"
author: "naruse"
translator: "nakilon"
date: 2021-11-09 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Мы рады анонсировать релиз Ruby {{ release.version }}.

## YJIT: Новый экспериментальный JIT компилятор.

Ruby 3.1 включил в себя YJIT -- новый JIT компилятор, разработанный в Shopify.

С тех пор, как [Ruby 2.6 представил MJIT в 2018](/ru/news/2018/12/25/ruby-2-6-0-released/) его производительность сильно улучшилась и, наконец, [мы достигли Ruby3x3 в прошлом году](/ru/news/2020/12/25/ruby-3-0-0-released/). Но не смотря на то, что Optcarrot показал впечатляющие результаты, JIT не имел достаточного успеха в настоящих бизнес приложениях.

В недавнее время Shopify внесла множество улучшений в Ruby, чтоб ускорить их Rails приложение. YJIT -- это важный вклад, который нацелен на улучшение производительности приложений Rails.

В то время как MJIT является JIT компилятором методов и использует внешний компилятор C, YJIT использует Basic Block Versioning и включает в себя JIT. Lazy Basic Block Versioning (LBBV) сначала компилирует начало метода, а затем постепенно компилирует остальное по мере того, как типы аргументов и переменных выясняются динамически. См. [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781).

С этой технологией YJIT достигает одновременно и быстрого прогрева, и улучшения производительности на большинстве реального ПО -- до 22% на railsbench и 39% на liquid-render.

YJIT -- по прежнему экспериментальная фича, поэтому она выключена по умолчанию. Если вы хотите ее использовать, то включить YJIT можно опцией `--yjit`. К тому же пока что она доступна только на x86-64 платформах macOS и Linux.

* https://bugs.ruby-lang.org/issues/18229
* https://shopify.engineering/yjit-just-in-time-compiler-cruby
* https://www.youtube.com/watch?v=PBVLf3yfMs8

## гем debug: Новый отладчик

В комплекте идет новый отладчик [debug.gem](https://github.com/ruby/debug). debug.gem -- это быстрая реализация отладчика, которая предоставляет множество функций, таких как удалённая отладка, разноцветный REPL, интеграция с IDE (VSCode) и многое другое. Он заменяет собой `lib/debug.rb` в стандартной библиотеке.

## error_highlight: Более детальное отображение ошибок в бектрейсе

Представлен новый встроенный гем error_highlight. Он более детально отображает сообщение об ошибке:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Этот гем включён по умолчанию. Вы можете его выключить опцией командной строки `--disable-error_highlight`. См. [репозиторий](https://github.com/ruby/error_highlight).

## Улучшения в irb

Будут описаны в следующем обзоре.

## Другие важные новшества

### Язык

* Значения в литералах Hash и keyword-аргументы могут быть опущены. [Feature #14579]
  * `{x:, y:}` -- сахар для `{x: x, y: y}`.
  * `foo(x:, y:)` -- сахар для `foo(x: x, y: y)`.

* Pin-оператор в сопоставлении с образцом теперь принимает выражение. [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```

### RBS

RBS -- язык описания структуры программы на Ruby. См. [репозиторий](https://github.com/ruby/rbs).

Отличия от Ruby 3.0.0:

* представлена команда `rbs collection` для управления RBS-ами гемов. [документация](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Добавлены/изменены многие встроенные и stdlib-ные сигнатуры.
* Включено множество исправлений и улучшений производительности.

См. [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md).

### TypeProf

TypeProf -- статический анализатор типов для Ruby. Он генерирует прототип RBS для неаннотированного Ruby кода. См. [документацию](https://github.com/ruby/typeprof/blob/master/doc/doc.md).

Отличия от Ruby 3.0.0:

* Реализована [экспериментальная поддержка IDE](https://github.com/ruby/typeprof/blob/master/doc/ide.md).
* Множество исправлений и улучшений производительности.

## Улучшения производительности

* MJIT
  * Для таких применений, как Rails, значение `--jit-max-cache` по умолчанию изменено с 100 на 10000.
    JIT компилятор более не пропускает компиляцию методов длиннее 1000 инструкций.
  * Для поддержки Zeitwerk в Rails JIT код более не отменяется, когда включён TracePoint для методов класса.

## Другие важные отличия от 3.0

* Однострочное сопоставление с образцом (например, `ary => [x, y, z]`) более не является экспериментальным.
* Немного изменён порядок операций присвоения. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` вычислялось в порядке `baz`, `qux`, `foo`, а затем `bar` в Ruby 3.0. В Ruby 3.1 порядок следующий: `foo`, `bar`, `baz`, а затем `qux`.
* Variable Width Allocation для строк ('экспериментально') [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### Обновления стандартных библиотек

* Некоторые стандартные библиотеки были обновлены.
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
* Следующие поставляемые с языком гемы были обновлены.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* Следующие встроенные гемы стали поставляемыми.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

См. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [коммиты](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}).

В ходе этого со времен версии Ruby 3.0.0 было изменено [{{ release.stats.files_changed }} файлов, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)

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

Matz (Yukihiro Matsumoto) разработал первую версию Ruby в 1993,
и на сегодня язык разрабатывается как Open Source. Он работает
на множестве платформ и используется по всему миру, особенно в веб разработке.
