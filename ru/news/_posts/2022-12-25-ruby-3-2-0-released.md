---
layout: news_post
title: "Выпуск Ruby 3.2.0"
author: "naruse"
translator: "suban05"
date: 2022-12-25 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.2.0-rc1" | first %}

Мы рады объявить о выпуске Ruby {{ release.version }}. Ruby 3.2 добавляет множество новых функций и улучшений производительности.

## Поддержка WebAssembly на основе WASI

Это начальная версия поддержки WebAssembly на основе WASI. Это позволяет бинарному файлу CRuby быть доступным в веб-браузере, серверной среде Serverless Edge и других средах WebAssembly/WASI. В настоящее время этот порт проходит основные и начальные тестовые наборы, не используя API потоков.

![](https://i.imgur.com/opCgKy2.png)

### Предыстория

[WebAssembly (Wasm)](https://webassembly.org/) изначально был представлен для безопасного и быстрого выполнения программ в веб-браузерах. Но его цель - эффективное выполнение программ с безопасностью в различных средах - давно желанна не только для веба, но и для общих приложений.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) разработан для таких случаев использования. Хотя таким приложениям необходимо взаимодействовать с операционными системами, WebAssembly работает на виртуальной машине, которая не имела системного интерфейса. WASI стандартизирует его.

Поддержка WebAssembly/WASI в Ruby направлена на использование этих проектов. Это позволяет разработчикам Ruby писать приложения, которые работают на такой обещанной платформе.

### Пример использования

Эта поддержка позволяет разработчикам использовать CRuby в среде WebAssembly. Пример использования - поддержка CRuby в [песочнице TryRuby](https://try.ruby-lang.org/playground/). Теперь вы можете попробовать оригинальный CRuby в своем веб-браузере.

### Технические аспекты

Сегодняшние WASI и WebAssembly сами по себе имеют некоторые недостающие функции для реализации Fiber, исключений и GC, поскольку они все еще развиваются, а также по соображениям безопасности. Поэтому CRuby заполняет этот пробел, используя Asyncify, что является техникой бинарной трансформации для управления выполнением в пользовательской области.

Кроме того, мы создали [виртуальную файловую систему поверх WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby), чтобы мы могли легко упаковать Ruby-приложения в один .wasm файл. Это немного упрощает распространение Ruby-приложений.

### Связанные ссылки

* [Добавление поддержки WebAssembly на основе WASI #5407](https://github.com/ruby/ruby/pull/5407)
* [Обновление о поддержке WebAssembly/WASI в Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Готовность к использованию в продакшене YJIT

![](https://i.imgur.com/X9ulfac.png)

* YJIT больше не является экспериментальным
    * Был протестирован на продакшен нагрузках более года и показал себя достаточно стабильным.
* YJIT теперь поддерживает процессоры x86-64 и arm64/aarch64 на Linux, MacOS, BSD и других UNIX платформах.
    * В этом выпуске добавлена поддержка для Apple M1/M2, AWS Graviton, Raspberry Pi 4 и других.
* Для сборки YJIT теперь требуется Rust 1.58.0+. [[Feature #18481]]
    * Чтобы убедиться, что CRuby собирается с YJIT, установите `rustc` >= 1.58.0
      перед запуском скрипта `./configure`.
    * Если у вас возникнут проблемы, обратитесь к команде YJIT.
* Версия YJIT 3.2 работает быстрее, чем 3.1, и имеет примерно треть от того же объема памяти.
    * В целом YJIT на 41% быстрее (геометрическое среднее) интерпретатора Ruby на [yjit-bench](https://github.com/Shopify/yjit-bench).
    * Физическая память для JIT-кода выделяется лениво. В отличие от Ruby 3.1,
      RSS процесса Ruby минимизирован, потому что виртуальные страницы памяти,
      выделенные параметром `--yjit-exec-mem-size`, не будут сопоставлены с физическими страницами памяти,
      пока они не будут использованы JIT-кодом.
    * Введена Code GC, которая освобождает все страницы кода, когда потребление памяти JIT-кодом достигает `--yjit-exec-mem-size`.
    * `RubyVM::YJIT.runtime_stats` возвращает метрики Code GC, в дополнение к существующим ключам `inline_code_size` и `outlined_code_size`:
      `code_gc_count`, `live_page_count`, `freed_page_count` и `freed_code_size`.
* Большинство статистических данных, создаваемых `RubyVM::YJIT.runtime_stats`, теперь доступны в релизных сборках.
    * Просто запустите ruby с флагом `--yjit-stats` для вычисления и вывода статистики (сопровождается некоторыми накладными расходами во время выполнения).
* YJIT теперь оптимизирован для использования форм объектов. [[Feature #18776]]
* Используйте более мелкозернистую инвалидацию констант для инвалидации меньшего количества кода при определении новых констант. [[Feature #18589]]
* По умолчанию `--yjit-exec-mem-size` изменен на 64 (MiB).
* По умолчанию `--yjit-call-threshold` изменен на 30.

## Улучшения Regexp против атак ReDoS

Известно, что сопоставление Regexp может занимать неожиданно много времени. Если ваш код пытается выполнить сопоставление возможно неэффективного Regexp с ненадежным вводом, злоумышленник может использовать это для эффективного отказа в обслуживании (так называемая регулярная эксплуатация DoS, или ReDoS).

Мы внесли два улучшения, которые значительно снижают угрозу ReDoS.

### Улучшенный алгоритм сопоставления Regexp

С момента Ruby 3.2 алгоритм сопоставления Regexp значительно улучшен за счет использования техники мемоизации.

```
# Это сопоставление занимает 10 сек. в Ruby 3.1 и 0.003 сек. в Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

Улучшенный алгоритм сопоставления позволяет выполнять большинство сопоставлений Regexp (примерно 90% в наших экспериментах) за линейное время.

Эта оптимизация может потреблять память, пропорциональную длине ввода для каждого сопоставления. Мы ожидаем, что практических проблем не возникнет, потому что выделение этой памяти обычно задерживается, и обычное сопоставление Regexp не должно потреблять более чем в 10 раз больше памяти, чем длина ввода. Если у вас возникают проблемы с памятью при сопоставлении Regexp в реальном приложении, пожалуйста, сообщите об этом.

Оригинальное предложение находится по адресу <https://bugs.ruby-lang.org/issues/19104>

### Таймаут Regexp

Оптимизация выше не может быть применена к некоторым типам регулярных выражений, таким как те, которые включают сложные функции (например, обратные ссылки или просмотр вперед), или с огромным фиксированным количеством повторений. В качестве запасной меры введена функция тайм-аута для сопоставления Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Возникнет исключение Regexp::TimeoutError через одну секунду
```

Обратите внимание, что `Regexp.timeout` является глобальной конфигурацией. Если вам нужно использовать разные настройки таймаута для некоторых специальных Regexp, вы можете использовать ключевое слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Это Regexp без таймаута
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # никогда не прерывается
```

Оригинальное предложение находится по адресу <https://bugs.ruby-lang.org/issues/17837>.

## Другие значимые нововведения

### SyntaxSuggest

* Функция `syntax_suggest` (ранее `dead_end`) теперь интегрирована в Ruby. Это помогает вам быстрее находить ошибки, такие как отсутствующие или лишние `end`, как в следующем примере:

  ```
  Не совпадает `end', отсутствует ключевое слово (`do`, `def`, `if` и т. д.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]

### ErrorHighlight

* Теперь указываются соответствующие аргументы для TypeError и ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### Язык

* Теперь анонимные остаточные и ключевые остаточные аргументы могут передаваться как аргументы, а не только использоваться в параметрах метода.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Процедура, принимающая один позиционный аргумент и ключи, больше не будет автоматически распаковывать. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 и ранее
  # => 1
  # Ruby 3.2 и позже
  # => [1, 2]
  ```

* Порядок вычисления присваивания констант для констант, установленных на явных объектах, теперь согласован с порядком вычисления присваивания одиночного атрибута. В этом коде:

    ```ruby
    foo::BAR = baz
    ```

  `foo` вызывается перед `baz`. Аналогично, для множественных присваиваний констант используется порядок вычисления слева направо. В этом коде:

    ```ruby
    foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Используется следующий порядок вычисления:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Поиск шаблона больше не является экспериментальным. [[Feature #18585]]

* Методы, принимающие параметр остаточные параметры (например, `*args`) и желающие делегировать ключевые аргументы через `foo(*args)`, теперь должны быть отмечены `ruby2_keywords` (если это еще не сделано). Другими словами, все методы, желающие делегировать ключевые аргументы через `*args`, теперь должны быть отмечены `ruby2_keywords`, без исключений. Это упростит переход к другим способам делегирования после того, как библиотека сможет требовать Ruby 3+. Ранее флаг `ruby2_keywords` оставался, если метод, принимающий `*args`, делегировал ключевые аргументы, но это была ошибка и несогласованность. Хорошей техникой для обнаружения потенциально отсутствующих `ruby2_keywords` является запуск набора тестов, поиск последнего метода, который должен принимать ключевые аргументы для каждого места, где тестовый набор не проходит, и использование `puts nil, caller, nil` здесь. Затем проверьте, что каждый метод/блок в цепочке вызовов правильно помечен `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Неожиданно работало без ruby2_keywords в Ruby 2.7-3.1, требуется ruby2_keywords
    # в 3.2+. Точно так же, как (*args, **kwargs) или (...) потребуется как на #foo, так и на #bar
    # при миграции от ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Улучшения производительности

### MJIT

* Компилятор MJIT теперь переопределен на Ruby как `ruby_vm/mjit/compiler`.
* Компилятор MJIT выполняется в процессе, созданном с помощью fork, вместо того чтобы выполняться в нативном потоке, называемом MJIT worker. [[Feature #18968]]
  * В результате, Microsoft Visual Studio (MSWIN) больше не поддерживается.
* MinGW больше не поддерживается. [[Feature #18824]]
* Переименовано `--mjit-min-calls` в `--mjit-call-threshold`.
* Изменено значение по умолчанию `--mjit-max-cache` с 10000 на 100.

### PubGrub

* Bundler 2.4 теперь использует решатель [PubGrub](https://github.com/jhawthorn/pub_grub) вместо [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub - это алгоритм следующего поколения, используемый менеджером пакетов `pub` для языка программирования Dart.
  * После этого изменения вы можете получить различный результат разрешения. Пожалуйста, сообщайте о таких случаях в [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues).

* В Ruby 3.2 RubyGems по-прежнему использует решатель Molinillo. Мы планируем заменить его на PubGrub в будущем.

## Другие значимые изменения с момента версии 3.1

* Data
    * Новый встроенный класс для представления простых неизменяемых значений. Класс похож на Struct и частично использует его реализацию, но имеет более лаконичный и строгий API. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` теперь всегда возвращает nil, если хэш пуст, вместо того чтобы возвращать значение по умолчанию или вызывать блок по умолчанию. [[Bug #16908]]

* MatchData
    * Добавлен метод `MatchData#byteoffset`. [[Feature #13110]]

* Module
    * Добавлен метод `Module.used_refinements`. [[Feature #14332]]
    * Добавлен метод `Module#refinements`. [[Feature #12737]]
    * Добавлен метод `Module#const_added`. [[Feature #17881]]

* Proc
    * `Proc#dup` теперь возвращает экземпляр подкласса. [[Bug #17545]]
    * `Proc#parameters` теперь принимает ключевое слово lambda. [[Feature #15357]]

* Refinement
    * Добавлен метод `Refinement#refined_class`. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Добавлена опция `error_tolerant` для методов `parse`, `parse_file` и `of`. [[Feature #19013]]
      С этой опцией:
        1. SyntaxError подавляется.
        2. Для недопустимого ввода возвращается AST.
        3. `end` дополняется, когда парсер достигает конца ввода, но `end` недостаточно.
        4. `end` рассматривается как ключевое слово на основе отступа.

        ```ruby
        # Без опции error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # С опцией error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` рассматривается как ключевое слово на основе отступа
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Добавлена опция `keep_tokens` для методов `parse`, `parse_file` и `of`. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set теперь доступен как встроенный класс без необходимости `require "set"`. [[Feature #16989]]
      В настоящее время он автоматически загружается через константу `Set` или вызов `Enumerable#to_set`.

* String
    * Добавлены методы `String#byteindex` и `String#byterindex`. [[Feature #13110]]
    * Обновление Unicode до версии 15.0.0 и Emoji до версии 15.0. [[Feature #18639]]
      (также применяется к Regexp)
    * Добавлен метод `String#bytesplice`. [[Feature #18598]]

* Struct
    * Класс Struct теперь может быть инициализирован также с ключевыми аргументами без `keyword_init: true` при `Struct.new`. [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # С Ruby 3.2, следующий код также работает без keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## Проблемы совместимости

Примечание: Исключены исправления ошибок функциональности.

### Удаленные константы

Следующие устаревшие константы были удалены.

* `Fixnum` и `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Удаленные методы

Следующие устаревшие методы были удалены.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Проблемы совместимости в стандартной библиотеке

### Больше не включаем сторонние исходники

* Мы больше не включаем сторонние исходники, такие как `libyaml`, `libffi`.

    * Исходный код libyaml был удален из psych. Вам может потребоваться установить `libyaml-dev` на платформе Ubuntu/Debian. Название пакета отличается для каждой платформы.

    * Исходный код bundled libffi также удален из `fiddle`.

* Psych и fiddle поддерживают статические сборки с определенными версиями исходников libyaml и libffi. Вы можете собрать psych с libyaml-0.2.5 следующим образом:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    И вы можете собрать fiddle с libffi-3.4.4 так:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Обновления C API

### Обновленные C API

Следующие API были обновлены.

* Обновление PRNG
  * Обновлен и версионирован `rb_random_interface_t`.
    Расширения библиотек, использующие этот интерфейс и собранные для старых версий, также требуют определения функции `init_int32`.

### Удаленные C API

Следующие устаревшие API были удалены.

* Переменная `rb_cData`.
* Функции "taintedness" и "trustedness". [[Feature #16131]]

### Обновления стандартной библиотеки

* Bundler

    * Добавлена поддержка --ext=rust для команды bundle gem для создания простых гемов с расширениями Rust.
      [[GH-rubygems-6149]]
    * Ускорена клонирование git-репозиториев. [[GH-rubygems-4475]]

* RubyGems

    * Добавлена поддержка mswin для сборщика cargo. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` теперь работает быстрее, чем `CGI.escapeHTML`.
        * Больше не выделяет объект String, когда символы не требуют экранирования.
        * Пропускает вызов метода `#to_s`, если аргумент уже является строкой.
        * Добавлен псевдоним `ERB::Escape.html_escape` для `ERB::Util.html_escape`, который не подвергается monkey-patching'у от Rails.

* IRB

    * Добавлены интеграционные команды для debug.gem: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * Они работают даже без `gem "debug"` в Gemfile.
        * См. также: [Что нового в IRB Ruby 3.2?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * Добавлены команды и функции, похожие на Pry.
        * Добавлены `edit` и `show_cmds` (аналог `help` в Pry).
        * Опция `-g` или `-G` добавлена к `ls` для фильтрации вывода.
        * `show_source` алиас для `$` и принимает неэкранированный ввод.
        * `whereami` алиас для `@`.

* Обновлены следующие гемы по умолчанию.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   The following bundled gems are updated.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

Смотрите релизы на GitHub, например [GitHub Releases of logger](https://github.com/ruby/logger/releases) или changelog для подробностей по гемам по умолчанию или включенным гемам.

Для дополнительной информации ознакомьтесь с [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [логами коммитов](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
для более подробной информации.

С учетом этих изменений [изменено {{ release.stats.files_changed }} файлов, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
с момента Ruby 3.1.0!

С наступающим Рождеством, с праздниками и наслаждайтесь программированием с Ruby 3.2!

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

Ruby был разработан Мацумото (Юкихиро Мацумото) в 1993 году,
и сейчас развивается как Open Source. Он работает на множестве платформ
и используется по всему миру, особенно в веб-разработке.

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
