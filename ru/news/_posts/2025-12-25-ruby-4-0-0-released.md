---
layout: news_post
title: "Вышел Ruby 4.0.0"
author: "naruse"
translator: "ablzh"
date: 2025-12-25 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}.
Ruby 4.0 представляет «Ruby Box» и «ZJIT», а также добавляет множество улучшений.

## Ruby Box

Ruby Box — это новая (экспериментальная) возможность для обеспечения разделения определений. Ruby Box включается, когда задана переменная окружения `RUBY_BOX=1`. Класс — `Ruby::Box`.

Определения, загруженные в box (коробку), изолированы внутри неё. Ruby Box может изолировать/разделять monkey patches, изменения глобальных переменных и переменных класса, определения классов/модулей и загруженные нативные/ruby библиотеки от других boxes.

Ожидаемые сценарии использования:

* Запуск тест-кейсов в box для защиты других тестов, когда тест-кейс использует monkey patches для переопределения чего-либо
* Параллельный запуск boxes веб-приложения для выполнения blue-green развертывания на сервере приложений в процессе Ruby
* Параллельный запуск boxes веб-приложения для оценки обновлений зависимостей в течение определенного периода времени путем проверки разницы ответов с использованием кода Ruby
* Использование в качестве базового (низкоуровневого) API для реализации API типа «пакет» (высокоуровневого) (он пока не спроектирован)

Подробнее о «Ruby Box» смотрите [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT — это новый just-in-time (JIT) компилятор, который разрабатывается как следующее поколение YJIT. Вам нужен Rust 1.85.0 или новее для сборки Ruby с поддержкой ZJIT, и ZJIT включается, когда указан `--zjit`.

Мы создаем новый компилятор для Ruby, потому что хотим одновременно поднять потолок производительности (больший размер единицы компиляции и SSA IR) и поощрить больший вклад извне (став более традиционным компилятором методов). Смотрите [наш пост в блоге](https://railsatscale.com/2025-12-24-launch-zjit/) для подробностей.
<!-- the blog post will be auto-published on 2025-12-24 9:00am UTC. -->

ZJIT быстрее интерпретатора, но пока не так быстр, как YJIT. Мы призываем вас экспериментировать с ZJIT, но, возможно, воздержаться от развертывания его в продакшене на данный момент. Следите за новостями о ZJIT в Ruby 4.1.

## Улучшения Ractor

Ractor, механизм параллельного выполнения Ruby, получил несколько улучшений. Был представлен новый класс `Ractor::Port` для решения проблем, связанных с отправкой и получением сообщений (смотрите [наш пост в блоге](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98)). Кроме того, `Ractor.shareable_proc` упрощает совместное использование объектов `Proc` между Ractor-ами.

Что касается производительности, многие внутренние структуры данных были улучшены для значительного снижения конкуренции за глобальную блокировку, открывая лучшую параллельность. Ractor-ы теперь также разделяют меньше внутренних данных, что приводит к меньшей конкуренции за кэш CPU при параллельном запуске.

Ractor был впервые представлен в Ruby 3.0 как экспериментальная возможность. Мы стремимся снять с него статус «экспериментальный» в следующем году.

## Изменения языка

* `*nil` больше не вызывает `nil.to_a`, подобно тому, как `**nil`
  не вызывает `nil.to_hash`.  [[Feature #21047]]

* Логические бинарные операторы (`||`, `&&`, `and` и `or`) в
  начале строки продолжают предыдущую строку, как fluent dot.
  Следующие примеры кода эквивалентны:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    Раньше:

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## Обновления основных классов

Примечание: Мы перечисляем только значимые обновления классов.

* Array

    * `Array#rfind` был добавлен как более эффективная альтернатива `array.reverse_each.find` [[Feature #21678]]
    * `Array#find` был добавлен как более эффективное переопределение `Enumerable#find` [[Feature #21678]]
* Binding

    * `Binding#local_variables` больше не включает нумерованные параметры.
      Также `Binding#local_variable_get`, `Binding#local_variable_set` и
      `Binding#local_variable_defined?` отказываются обрабатывать нумерованные параметры.
      [[Bug #21049]]

    * `Binding#implicit_parameters`, `Binding#implicit_parameter_get` и
      `Binding#implicit_parameter_defined?` были добавлены для доступа к
      нумерованным параметрам и параметру "it". [[Bug #21049]]

* Enumerator

    * `Enumerator.produce` теперь принимает опциональный именованный аргумент `size`
      для указания размера энумератора. Это может быть целое число,
      `Float::INFINITY`, вызываемый объект (например, лямбда) или `nil` для
      обозначения неизвестного размера. Если не указано, размер по умолчанию
      `Float::INFINITY`.

        ```ruby
        # Infinite enumerator
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # Finite enumerator with known/computable size
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * Когда вызывается ArgumentError, теперь отображаются фрагменты кода для
      вызова метода (caller) и определения метода (callee).
      [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * Представлена поддержка аргумента `Fiber#raise(cause:)` аналогично
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Представлен `Fiber::Scheduler#fiber_interrupt` для прерывания файбера
      заданным исключением. Первоначальный сценарий использования — прерывание файбера, который
      ожидает блокирующей операции ввода-вывода, когда операция ввода-вывода закрывается.
      [[Feature #21166]]

    * Представлен `Fiber::Scheduler#yield`, чтобы позволить планировщику файберов
      продолжать обработку, когда исключения сигналов отключены.
      [[Bug #21633]]

    * Вновь представлен хук `Fiber::Scheduler#io_close` для асинхронного `IO#close`.

    * Вызов `Fiber::Scheduler#io_write` при сбросе буфера записи IO.
      [[Bug #21789]]

* File

    * `File::Stat#birthtime` теперь доступен в Linux через системный вызов statx,
      когда поддерживается ядром и файловой системой.
      [[Feature #21205]]

* IO

    * `IO.select` принимает `Float::INFINITY` в качестве аргумента таймаута.
      [[Feature #20610]]

    * Устаревшее поведение, создание процесса методами класса `IO`
      с ведущим `|`, было удалено.  [[Feature #19630]]

* Kernel

    * `Kernel#inspect` теперь проверяет наличие метода `#instance_variables_to_inspect`,
      позволяя контролировать, какие переменные экземпляра отображаются в строке `#inspect`:

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * Устаревшее поведение, создание процесса с помощью `Kernel#open` с
      ведущим `|`, было удалено.  [[Feature #19630]]

* Math

    * Добавлены `Math.log1p` и `Math.expm1`. [[Feature #21527]]

* Pathname

    * Pathname был повышен с стандартного гема до основного класса Ruby.
      [[Feature #17473]]

* Proc

    * `Proc#parameters` теперь показывает анонимные опциональные параметры как `[:opt]`
      вместо `[:opt, nil]`, делая вывод согласованным с тем, когда
      анонимный параметр является обязательным. [[Bug #20974]]

* Ractor

    * Был добавлен класс `Ractor::Port` для нового механизма синхронизации
      для общения между Ractor-ами. [[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` предоставляет следующие методы:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (или `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        В результате `Ractor.yield` и `Ractor#take` были удалены.

    * `Ractor#join` и `Ractor#value` были добавлены для ожидания
      завершения Ractor. Они аналогичны `Thread#join`
      и `Thread#value`.

    * `Ractor#monitor` и `Ractor#unmonitor` были добавлены как низкоуровневые
      интерфейсы, используемые внутри для реализации `Ractor#join`.

    * `Ractor.select` теперь принимает только Ractor-ы и Port-ы. Если переданы Ractor-ы,
      он возвращает, когда Ractor завершается.

    * Был добавлен `Ractor#default_port`. Каждый `Ractor` имеет порт по умолчанию,
      который используется `Ractor.send`, `Ractor.receive`.

    * `Ractor#close_incoming` и `Ractor#close_outgoing` были удалены.

    * Представлены `Ractor.shareable_proc` и `Ractor.shareable_lambda`
      для создания shareable Proc или lambda.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` теперь выполняет проверки размера для предотвращения проблем с
      бесконечными диапазонами. [[Bug #21654]]

    * `Range#overlap?` теперь корректно обрабатывает бесконечные (неограниченные) диапазоны.
      [[Bug #21185]]

    * Поведение `Range#max` на целочисленных диапазонах без начала (beginless) было исправлено.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Был определен новый модуль верхнего уровня `Ruby`, который содержит
      константы, связанные с Ruby. Этот модуль был зарезервирован в Ruby 3.4
      и теперь официально определен. [[Feature #20884]]

* Ruby::Box

    * Новая (экспериментальная) возможность для обеспечения разделения определений.
      Подробнее о «Ruby Box» смотрите [doc/language/box.md](doc/language/box.md).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` теперь основной класс, вместо автозагружаемого класса стандартной библиотеки.
      [[Feature #21216]]

    * `Set#inspect` теперь использует более простое отображение, подобно литеральным массивам.
      (например, `Set[1, 2, 3]` вместо `#<Set: {1, 2, 3}>`). [[Feature #21389]]

    * Передача аргументов в `Set#to_set` и `Enumerable#to_set` теперь устарела.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` и `TCPSocket.new` принимают именованный аргумент `open_timeout` для указания
      таймаута для начального соединения. [[Feature #21347]]
    * Когда в `TCPSocket.new` происходил заданный пользователем таймаут, ранее могло вызываться либо `Errno::ETIMEDOUT`,
      либо `IO::TimeoutError` в зависимости от ситуации.
      Это поведение было унифицировано, так что теперь последовательно вызывается `IO::TimeoutError`.
      (Пожалуйста, обратите внимание, что в `Socket.tcp` все еще есть случаи, когда `Errno::ETIMEDOUT`
      может быть вызван в подобных ситуациях, и что в обоих случаях `Errno::ETIMEDOUT` может быть
      вызван, когда таймаут происходит на уровне ОС.)

* String

    * Обновление Unicode до версии 17.0.0 и Emoji версии 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (также применяется к Regexp)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip` и `rstrip!`
       расширены для принятия аргументов `*selectors`. [[Feature #21552]]

* Thread

    * Представлена поддержка аргумента `Thread#raise(cause:)` аналогично
      `Kernel#raise`. [[Feature #21360]]

## Обновления стандартной библиотеки (Stdlib)

Мы перечисляем только изменения stdlib, которые являются заметными изменениями функциональности.

Другие изменения перечислены в следующих разделах. Мы также перечислили историю релизов с предыдущей поставляемой версии, которой является Ruby 3.4.0, если у нее есть релизы на GitHub.

Следующие поставляемые (bundled) гемы повышены с дефолтных (default) гемов.

* ostruct 0.6.3
  * 0.6.1 to [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 to [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 to [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 to [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 to [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 to [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 to [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 to [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 to [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

Следующий дефолтный гем добавлен.

* win32-registry 0.1.2

Следующие дефолтные гемы обновлены.

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 to [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 to [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 to [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 to [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 to [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 to [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 to [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 to [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 to [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 to [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 to [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 to [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 to [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 to [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 to [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 to [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 to [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 to [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 to [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 to [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 to [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 to [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 to [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 to [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 to [v3.2.2][zlib-v3.2.2]

Следующие поставляемые (bundled) гемы обновлены.

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 to [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 to [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.5
  * 3.6.7 to [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 to [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 to [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 to [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 to [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 to [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 to [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 to [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 to [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 to [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 to [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 to [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 to [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 to [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12

### RubyGems и Bundler

Ruby 4.0 включает RubyGems и Bundler версии 4. Смотрите следующие ссылки для подробностей.

* [Upgrading to RubyGems/Bundler 4 - RubyGems Blog](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## Поддерживаемые платформы

* Windows

    * Прекращена поддержка версий MSVC старее 14.0 (_MSC_VER 1900).
      Это означает, что Visual Studio 2015 или новее теперь требуется.

## Проблемы совместимости

* Следующие методы были удалены из Ractor из-за добавления `Ractor::Port`:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` объявлен устаревшим. [[Feature #15408]]

* `Process::Status#&` и `Process::Status#>>` были удалены.
  Они были объявлены устаревшими в Ruby 3.3. [[Bug #19868]]

* `rb_path_check` был удален. Эта функция использовалась для
  проверки пути `$SAFE`, которая была удалена в Ruby 2.7,
  и уже была устаревшей.
  [[Feature #20971]]

* Трассировка стека для `ArgumentError` о "неправильном количестве аргументов" теперь
  включает имя класса или модуля получателя (например, в `Foo#bar`
  вместо в `bar`). [[Bug #21698]]

* Трассировки стека больше не отображают `internal` фреймы.
  Эти методы теперь отображаются так, как будто они находятся в исходном файле Ruby,
  согласованно с другими методами, реализованными на C. [[Bug #20968]]

  Раньше:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  После:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

## Проблемы совместимости стандартной библиотеки (Stdlib)

* Библиотека CGI удалена из дефолтных гемов. Теперь мы предоставляем только `cgi/escape` для
  следующих методов:

    * `CGI.escape` и `CGI.unescape`
    * `CGI.escapeHTML` и `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` и `CGI.unescapeURIComponent`
    * `CGI.escapeElement` и `CGI.unescapeElement`

    [[Feature #21258]]

* С переносом `Set` из stdlib в основной класс, `set/sorted_set.rb` был
  удален, и `SortedSet` больше не является автозагружаемой константой. Пожалуйста,
  установите гем `sorted_set` и `require 'sorted_set'`, чтобы использовать `SortedSet`.
  [[Feature #21287]]


* Net::HTTP

    * Поведение по умолчанию автоматической установки заголовка `Content-Type`
      в `application/x-www-form-urlencoded` для запросов с телом
      (например, `POST`, `PUT`), когда заголовок не был явно установлен, было
      удалено. Если ваше приложение полагалось на это автоматическое поведение по умолчанию, ваши
      запросы теперь будут отправляться без заголовка Content-Type, что потенциально
      нарушает совместимость с некоторыми серверами.
      [[GH-net-http #205]]

## Обновления C API

* IO

    * `rb_thread_fd_close` устарел и теперь является no-op (ничего не делает). Если вам нужно открыть
      файловые дескрипторы из расширений C для кода Ruby, создайте экземпляр `IO`,
      используя `RUBY_IO_MODE_EXTERNAL`, и используйте `rb_io_close(io)` для его закрытия (это
      также прерывает и ожидает все ожидающие операции на экземпляре `IO`).
      Прямое закрытие файловых дескрипторов не прерывает ожидающие
      операции и может привести к неопределенному поведению. Другими словами, если два
      объекта `IO` разделяют один и тот же файловый дескриптор, закрытие одного не влияет
      на другой. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` теперь работает с или без GVL.
      Это позволяет гемам избегать проверки `ruby_thread_has_gvl_p`.
      Пожалуйста, по-прежнему будьте внимательны с GVL. [[Feature #20750]]

* Set

    * C API для `Set` был добавлен. Следующие методы поддерживаются:
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## Улучшения реализации

* `Class#new` (напр. `Object.new`) быстрее во всех случаях, но особенно при передаче именованных аргументов. Это также было интегрировано в YJIT и ZJIT. [[Feature #21254]]
* Кучи GC разных размеров (pools) теперь растут независимо, уменьшая использование памяти, когда только некоторые пулы содержат долгоживущие объекты
* GC sweeping (очистка) быстрее на страницах больших объектов
* Объекты "Generic ivar" (String, Array, `TypedData` и т.д.) теперь используют новый внутренний объект "fields" для более быстрого доступа к переменным экземпляра
* GC избегает поддержки внутренней таблицы `id2ref` до тех пор, пока она не будет впервые использована, делая выделение `object_id` и очистку GC быстрее
* `object_id` и `hash` быстрее на объектах Class и Module
* Большие bignum целые числа могут оставаться встроенными (embedded), используя allocation переменной ширины
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`,
  `StringScanner` и некоторые внутренние объекты теперь защищены write-barrier,
  что уменьшает накладные расходы GC.

### Ractor

Много работы было проделано, чтобы сделать Ractor-ы более стабильными, производительными и пригодными к использованию. Эти улучшения приближают реализацию Ractor к выходу из статуса экспериментальной.

* Улучшения производительности
    * Замороженные строки и таблица символов внутренне используют hash set без блокировок [[Feature #21268]]
    * Поиски в кэше методов избегают блокировок в большинстве случаев
    * Доступ к переменным экземпляра класса (и generic ivar) быстрее и избегает блокировок
    * Конкуренция за кэш CPU избегается при выделении объектов за счет использования счетчика на каждый ractor
    * Конкуренция за кэш CPU избегается в xmalloc/xfree за счет использования локального для потока счетчика
    * `object_id` избегает блокировок в большинстве случаев
* Исправления ошибок и стабильность
    * Исправлены возможные взаимные блокировки (deadlocks) при объединении Ractor-ов и потоков (Threads)
    * Исправлены проблемы с require и autoload в Ractor
    * Исправлены проблемы кодирования/перекодирования между Ractor-ами
    * Исправлены состояния гонки (race conditions) в операциях GC и инвалидации методов
    * Исправлены проблемы с форкингом процессов после запуска Ractor
    * Подсчеты выделения GC теперь точны под Ractor-ами
    * Исправлено: TracePoints не работали после GC [[Bug #19112]]

## JIT

* ZJIT
    * Представлен [экспериментальный JIT компилятор на основе методов](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
       Где доступно, ZJIT может быть включен во время выполнения с опцией `--zjit` или вызовом `RubyVM::ZJIT.enable`.
      При сборке Ruby требуется Rust 1.85.0 или новее для включения поддержки ZJIT.
    * По состоянию на Ruby 4.0.0, ZJIT быстрее интерпретатора, но пока не так быстр, как YJIT.
      Мы поощряем эксперименты с ZJIT, но советуем воздержаться от развертывания его в продакшене на данный момент.
    * Наша цель — сделать ZJIT быстрее YJIT и готовым к продакшену в Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` больше не работает в сборке по умолчанию.
          Используйте `--enable-yjit=stats` при `configure`, чтобы включить его в `--yjit-stats`.
        * Добавлен `invalidate_everything` в статистику по умолчанию, который
          увеличивается, когда весь код инвалидируется TracePoint-ом.
    * Добавлены опции `mem_size:` и `call_threshold:` в `RubyVM::YJIT.enable`.
* RJIT
    * `--rjit` удален. Мы перенесем реализацию стороннего JIT API
      в репозиторий [ruby/rjit](https://github.com/ruby/rjit).

Смотрите [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
или [логи коммитов](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
для подробностей.

С этими изменениями, [{{ release.stats.files_changed }} файлов изменено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
с момента выхода Ruby 3.4.0!

Счастливого Рождества, С Новым Годом, и приятного кодинга с Ruby 4.0!

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

Ruby был впервые разработан Matz (Yukihiro Matsumoto) в 1993 году,
и сейчас разрабатывается как Open Source. Он работает на множестве платформ
и используется по всему миру, особенно для веб-разработки.

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
