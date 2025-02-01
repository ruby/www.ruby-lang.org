---
layout: news_post
title: "Выпуск Ruby 3.1.0"
author: "naruse"
translator: "suban05"
date: 2021-12-25 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Мы рады объявить о выпуске Ruby {{ release.version }}. Ruby 3.1 сохраняет совместимость с Ruby 3.0 и также добавляет множество новых функций.

## YJIT: Новый экспериментальный встроенный JIT-компилятор

Ruby 3.1 включает YJIT, новый встроенный JIT-компилятор, разработанный Shopify.

С тех пор как [Ruby 2.6 представил MJIT в 2018 году](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/), его производительность значительно улучшилась, и, наконец, [в прошлом году мы достигли Ruby3x3](https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/). Но несмотря на впечатляющее ускорение в бенчмарке Optcarrot, JIT не принес пользы реальным бизнес-приложениям.

Недавно Shopify внесла много улучшений в Ruby, чтобы ускорить их Rails-приложение. YJIT — важный вклад, направленный на повышение производительности Rails-приложений.

В то время как MJIT является метод-ориентированным JIT-компилятором и использует внешний C-компилятор, YJIT использует версионирование базовых блоков (Basic Block Versioning) и включает JIT-компилятор внутри себя. С Lazy Basic Block Versioning (LBBV) он сначала компилирует начало метода, а затем постепенно компилирует остальное, когда типы аргументов и переменных определяются динамически. Подробнее см. [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781).

С этой технологией, YJIT достигает как быстрого времени разогрева, так и улучшения производительности для большинства реального программного обеспечения, до 22% на railsbench, 39% на liquid-render.

YJIT пока является экспериментальной функцией и по умолчанию отключен. Если вы хотите его использовать, укажите командную опцию `--yjit` для включения YJIT. Он также ограничен платформами Unix-подобных систем на x86-64.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug.gem: Новый отладчик

Полностью переписанный отладчик [debug.gem](https://github.com/ruby/debug) теперь включен. debug.gem имеет следующие функции:

* Улучшение производительности отладки (не замедляет приложение даже с отладчиком).
* Поддержка удаленной отладки.
* Поддержка богатого интерфейса отладки (поддерживаются VS Code и браузер Chrome).
* Поддержка многопроцессной/многопоточной отладки.
* Цветной REPL.
* И другие полезные функции, такие как запись и воспроизведение, трассировка и т.д.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ранее Ruby включал lib/debug.rb, но он плохо поддерживался и имел проблемы с производительностью и функциональностью. debug.gem полностью заменяет lib/debug.rb.

## error_highlight: Точное указание местоположения ошибок в трассировке

Встроенный gem error_highlight был введен. Он включает точное указание местоположения ошибок в трассировках:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

На данный момент поддерживается только `NameError`.

Этот gem включен по умолчанию. Вы можете отключить его, используя командную опцию `--disable-error_highlight`. Подробнее см. [репозиторий error_highlight](https://github.com/ruby/error_highlight).

## Автодополнение и отображение документации в IRB

Теперь в IRB есть функция автодополнения, где вы можете просто ввести код, и появится диалог с кандидатами на завершение. Вы можете использовать Tab и Shift+Tab для перемещения вверх и вниз.

Если документация установлена, при выборе кандидата на завершение рядом с диалогом кандидатов на завершение появится диалог с документацией, показывающий часть содержимого. Вы можете прочитать полную документацию, нажав Alt+d.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## Другие примечательные новые функции

### Язык

* Значения в литералах Hash и именованных аргументах могут быть опущены. [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}` является синтаксическим сахаром для `{x: x, y: y}`.
  * `foo(x:, y:)` является синтаксическим сахаром для `foo(x: x, y: y)`.

* Оператор привязки (`^`) в сопоставлении с образцом теперь принимает выражение. [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

  ```ruby
  Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
  #=> [[3, 5], [5, 7], [11, 13]]
  ```

* Скобки могут быть опущены в однострочном сопоставлении с образцом. [[Feature #16182]](https://bugs.ruby-lang.org/issues/16182)

  ```ruby
  [0, 1] => _, x
  {y: 2} => y:
  x #=> 1
  y #=> 2
  ```

### RBS

RBS - это язык для описания структуры программ на Ruby. Подробнее см. [репозиторий RBS](https://github.com/ruby/rbs).

Обновления с момента Ruby 3.0.0:

* Параметры обобщенного типа могут быть ограничены. ([PR](https://github.com/ruby/rbs/pull/844))
* Поддерживаются обобщенные типовые псевдонимы. ([PR](https://github.com/ruby/rbs/pull/823))
* Введена команда `rbs collection` для управления RBSs гемов.  ([документация](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* Добавлено/обновлено множество сигнатур для встроенных и стандартных библиотек.
* Включены многочисленные исправления ошибок и улучшения производительности.

Подробнее см. [changelog RBS](https://github.com/ruby/rbs/blob/master/CHANGELOG.md).

### TypeProf

TypeProf - это статический анализатор типов для Ruby. Он генерирует прототип RBS из кода Ruby без аннотаций типов. Подробнее см. [документацию](https://github.com/ruby/typeprof/blob/master/doc/doc.md).

Основное обновление с момента Ruby 3.0.0 - это экспериментальная поддержка IDE под названием "TypeProf для IDE".

![Демонстрация TypeProf для IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

Расширение для VS Code показывает предполагаемую (или явно указанную в файле RBS) сигнатуру метода над каждым определением метода, подчеркивает красной линией код, который может вызвать ошибку имени или типовую ошибку, и завершает имена методов (т.е. показывает кандидатов на методы). Подробнее см. [документацию](https://github.com/ruby/typeprof/blob/master/doc/ide.md).

Также релиз включает многочисленные исправления ошибок и улучшения производительности.

## Улучшения производительности

* MJIT
  * Для рабочих нагрузок, таких как Rails, значение по умолчанию для `--jit-max-cache` изменено с 100 до 10000.
    JIT-компилятор больше не пропускает компиляцию методов длиной более 1000 инструкций.
  * Для поддержки Zeitwerk в Rails, скомпилированный код больше не отменяется,
    когда TracePoint для ```yaml
  событий классов включен.

## Другие заметные изменения с версии 3.0

* Однострочное сопоставление с образцом, например, `ary => [x, y, z]`, больше не является экспериментальным.
* Порядок выполнения при множественном присваивании изменился. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` выполнялось в порядке `baz`, `qux`, `foo`, а затем `bar` в Ruby 3.0. В Ruby 3.1 оно выполняется в порядке `foo`, `bar`, `baz`, а затем `qux`.
* Выделение переменной ширины: строки (экспериментально). [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0 изменяет `Psych.load`, чтобы использовать `safe_load` по умолчанию.
  Вам может потребоваться использовать Psych 3.3.2 для перехода на это поведение. [[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

### Обновления стандартных библиотек

* Следующие стандартные гемы обновлены:
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
* Следующие встроенные гемы обновлены:
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
* Следующие стандартные гемы теперь встроенные. Вам нужно добавить следующие библиотеки в `Gemfile` при использовании bundler:
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0

См. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [историю коммитов](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}) для более подробной информации.

С этими изменениями, [{{ release.stats.files_changed }} файлов изменены, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket) с момента Ruby 3.0.0!

Счастливого Рождества, счастливых праздников и наслаждайтесь программированием с Ruby 3.1!

## Загрузка

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

Ruby был впервые разработан Мацумото (Yukihiro Matsumoto) в 1993 году и теперь разрабатывается как Open Source. Он работает на множестве платформ и используется по всему миру, особенно для веб-разработки.
