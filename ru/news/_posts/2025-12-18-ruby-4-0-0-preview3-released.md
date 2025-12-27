---
layout: news_post
title: "Вышел Ruby 4.0.0 preview3"
author: "naruse"
translator: "ablzh"
date: 2025-12-18 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}.
Ruby 4.0 представляет Ruby::Box и «ZJIT», а также содержит множество улучшений.

## Ruby::Box

Новая (экспериментальная) функция, обеспечивающая разделение определений.
Подробности о «Ruby Box» смотрите в [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
[[Feature #21311]] [[Misc #21385]]

## Изменения в языке

* `*nil` больше не вызывает `nil.to_a`, аналогично тому, как `**nil` не вызывает `nil.to_hash`. [[Feature #21047]]

* Логические бинарные операторы (`||`, `&&`, `and` и `or`) в начале строки продолжают предыдущую строку, подобно «fluent dot» (цепочке вызовов через точку). Следующие два фрагмента кода эквивалентны:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    [[Feature #20925]]

## Обновления основных классов

Примечание: перечислены только наиболее значимые обновления классов.

* Kernel

    * `Kernel#inspect` теперь проверяет наличие метода `#instance_variables_to_inspect`, что позволяет контролировать, какие переменные экземпляра будут отображаться в строке `#inspect`:

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

    * Удалено устаревшее поведение: создание процесса через `Kernel#open` с
    ведущим символом `|`. [[Feature #19630]]

* Binding

    * `Binding#local_variables` больше не включает нумерованные параметры. Также `Binding#local_variable_get` и `Binding#local_variable_set` отклоняют обработку нумерованных параметров.  [[Bug #21049]]

* File

    * `File::Stat#birthtime` теперь доступен в Linux через системный вызов statx, если это поддерживается ядром и файловой системой.
      [[Feature #21205]]

* IO

    * `IO.select` принимает `Float::INFINITY` в качестве аргумента таймаута.
      [[Feature #20610]]

    * Удалено устаревшее поведение: создание процесса методами класса `IO` с ведущим символом `|`.  [[Feature #19630]]

* Math

    * Добавлены методы `Math.log1p` и `Math.expm1`. [[Feature #21527]]

* Method

    * `Method#source_location`, `Proc#source_location`, и
      `UnboundMethod#source_location` теперь возвращают расширенную информацию о местоположении из 5 элементов: `[path, start_line, start_column,
      end_line, end_column]`. Прежний формат из 2 элементов `[path,
      line]` всё ещё можно получить, вызвав `.take(2)` для результата.
      [[Feature #6012]]

* Proc

    * `Proc#parameters` теперь отображает анонимные необязательные параметры как `[:opt]`
      вместо `[:opt, nil]`, что делает вывод консистентным с ситуацией, когда анонимный параметр является обязательным. [[Bug #20974]]

* Ractor

    * Добавлен класс `Ractor::Port` для нового механизма синхронизации при взаимодействии между ракторами. [[Feature #21262]]

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

    * Добавлены `Ractor#join` и `Ractor#value` для ожидания завершения рактора. Они аналогичны`Thread#join`
      и `Thread#value`.

    * Добавлены `Ractor#monitor` и `Ractor#unmonitor`в качестве низкоуровневых интерфейсов, используемых внутри для реализации `Ractor#join`.

    * `Ractor.select` теперь принимает только объекты Ractors и Ports. Если переданы ракторы, возврат происходит, когда рактор завершается.

    * Был добавлен `Ractor#default_port`. Каждый `Ractor` имеет порт по умолчанию, который используется в `Ractor.send`, `Ractor.receive`.

    * Методы `Ractor#close_incoming` и `Ractor#close_outgoing` были удалены.

    * Введены `Ractor.shareable_proc` и `Ractor.shareable_lambda` для создания разделяемых (shareable) объектов Proc или lambda.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` и `Enumerator#to_set` теперь выполняют проверку размера, чтобы предотвратить проблемы с бесконечными диапазонами. [[Bug #21654]]

    * `Range#overlap?` теперь корректно обрабатывает бесконечные (неограниченные) диапазоны.
      [[Bug #21185]]

    * Исправлено поведение `Range#max` для бесконечных слева целочисленных диапазонов (beginless).
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Определен новый модуль верхнего уровня `Ruby`, содержащий константы, связанные с Ruby. Это имя было зарезервировано в Ruby 3.4 и теперь официально определено. [[Feature #20884]]

* Ruby::Box

    * Новая (экспериментальная) функция для разделения определений. Подробности о "Ruby Box" смотрите в[doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` теперь является основным (core) классом, а не классом стандартной библиотеки с автозагрузкой.
      [[Feature #21216]]

    * `Set#inspect` теперь возвращает строку, пригодную для использования в `eval`, используя синтаксис
      `Set[]` (например, `Set[1, 2, 3]` вместо
      `#<Set: {1, 2, 3}>`). Это делает его поведение согласованным с другими основными классами коллекций, такими как Array и Hash. [[Feature #21389]]

    * Передача аргументов в `Set#to_set` и `Enumerable#to_set` теперь считается устаревшей.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` и `TCPSocket.new` принимают именованный аргумент `open_timeout` для указания таймаута начального соединения. [[Feature #21347]]

* String

    * Обновлен Unicode до версии 17.0.0 и Emoji до версии 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (также относится к Regexp)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, и `rstrip!`
       расширены для приема аргументов `*selectors`. [[Feature #21552]]

* Thread

    * Введена поддержка аргумента `Thread#raise(cause:)`, аналогично
      `Kernel#raise`. [[Feature #21360]]

* Fiber

    * Введена поддержка аргумента `Fiber#raise(cause:)`, аналогично
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Введен метод `Fiber::Scheduler#fiber_interrupt` для прерывания файбера с заданным исключением. Основной сценарий использования — прерывание файбера,
    ожидающего блокирующую операцию ввода-вывода, когда эта операция закрывается.
      [[Feature #21166]]

* Pathname

    * Pathname переведен из статуса дефолтного гема (default gem) в основной класс Ruby (core class).
      [[Feature #17473]]

## Обновления Stdlib

Следующие bundled гемы были переведены из статуса default гемов.

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 6.17.0
* win32ole 1.9.2
* irb 1.15.3
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

Мы перечисляем только изменения в стандартной библиотеке, являющиеся значимыми изменениями функциональности.

Другие изменения перечислены в следующих разделах. Мы также приводим историю релизов с
момента предыдущей версии bundled гема в Ruby 3.3.0, если для него есть релизы на GitHub.

Добавлен следующий default гем.

* win32-registry 0.1.2

Обновлены следующие default гемы.

* RubyGems 4.0.1
* bundler 4.0.1
* date 3.5.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.0
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.1
* io-nonblock 0.3.2
* io-wait 0.4.0.dev
* ipaddr 1.2.8
* json 2.17.1
* net-http 0.8.0
* openssl 4.0.0.pre
* optparse 0.8.1
* pp 0.6.3
* prism 1.6.0
* psych 5.3.0
* resolv 0.7.0
* stringio 3.1.9.dev
* strscan 3.1.6.dev
* timeout 0.5.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

Обновлены следующие bundled гемы.

* minitest 5.26.2
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.3
* rexml 3.4.4
* net-ftp 0.3.9
* net-imap 0.5.12
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.9.5
* typeprof 0.31.0
* debug 1.11.0
* base64 0.3.0
* bigdecimal 3.3.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

## Поддерживаемые платформы

* Windows

    * Прекращена поддержка версий MSVC старше 14.0 (_MSC_VER 1900).
      Это означает, что теперь требуется Visual Studio 2015 или новее.

## Проблемы совместимости

* Из Ractor были удалены следующие методы в связи с добавлением `Ractor::Port`:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* `ObjectSpace._id2ref` объявлен устаревшим. [[Feature #15408]]

* `Process::Status#&` и `Process::Status#>>` были удалены.
  Они были объявлены устаревшими в Ruby 3.3. [[Bug #19868]]

* `rb_path_check` был удален. Эта функция использовалась для проверки путей
  `$SAFE` которая была удалена в Ruby 2.7
  и уже считалась устаревшей.
  [[Feature #20971]]

## Проблемы совместимости стандартной библиотеки

* Библиотека CGI удалена из default гемов. Теперь мы предоставляем только `cgi/escape` для следующих методов:

    * `CGI.escape` и `CGI.unescape`
    * `CGI.escapeHTML` и `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` и `CGI.unescapeURIComponent`
    * `CGI.escapeElement` и `CGI.unescapeElement`

    [[Feature #21258]]

* В связи с переносом `Set` из стандартной библиотеки (stdlib) в основной (core) класс, `set/sorted_set.rb` был удален, и `SortedSet` больше не является константой с автозагрузкой. Пожалуйста, установите гем `sorted_set` и используйте `require 'sorted_set'`, чтобы использовать `SortedSet`.
  [[Feature #21287]]

## Обновления C API

* IO

    * `rb_thread_fd_close` объявлен устаревшим и теперь ничего не делает (no-op). Если вам нужно предоставить файловые дескрипторы из C-расширений коду на Ruby, создайте экземпляр `IO`, используя `RUBY_IO_MODE_EXTERNAL`, и используйте `rb_io_close(io)` для его закрытия (это также прерывает и ожидает все незавершенные операции с этим экземпляром `IO`). Прямое закрытие файловых дескрипторов не прерывает незавершенные операции и может привести к неопределенному поведению. Другими словами, если два объекта `IO` разделяют один и тот же файловый дескриптор, закрытие одного не повлияет на другой.  [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` теперь работает независимо от наличия GVL.
      Это позволяет гемам избегать проверки `ruby_thread_has_gvl_p`.
      Тем не менее, пожалуйста, продолжайте внимательно относиться к GVL. [[Feature #20750]]

* Set

    * Добавлен C API для `Set`. Поддерживаются следующие методы:
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

### Ractor

Проделана большая работа, чтобы сделать ракторы более стабильными, производительными и удобными для использования. Эти улучшения приближают реализацию Ractor к выходу из экспериментального статуса.

* Улучшения производительности
    * Замороженные строки и таблица символов внутри используют lock-free хэш-сет.
    * Поиск в кэше методов в большинстве случаев обходится без блокировок.
    * Доступ к переменным экземпляра классов (и geniv) стал быстрее и избегает блокировок.
    * При аллокации объектов исключена конкуренция за кэш.
    * `object_id` в большинстве случаев обходится без блокировок

* Исправления ошибок и стабильность
    * Исправлены возможные взаимоблокировки (deadlocks) при совместном использовании ракторов и потоков (Threads).
    * Исправлены проблемы с require и autoload внутри рактора.
    * Исправлены проблемы с encoding/transcoding между ракторами.
    * Исправлены состояния гонки (race conditions) в операциях GC и инвалидации методов.
    * Исправлены проблемы с ветвлением процессов (forking) после запуска рактора.

## JIT

* ZJIT
    * Представлен [экспериментальный JIT-компилятор, работающий на уровне методов](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
     Для включения поддержки `--zjit`, соберите Ruby с использованием Rust 1.85.0 или новее.
    * На момент Ruby 4.0.0 ZJIT работает быстрее интерпретатора, но пока не так быстро, как YJIT. Мы приветствуем эксперименты с ZJIT, но советуем пока не использовать его в продакшене.
    * Наша цель сделать ZJIT быстрее YJIT и готовым к промышленному использованию в Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit`больше не работает в сборке по умолчанию.
          Используйте `--enable-yjit=stats` при выполнении `configure`, чтобы включить этот показатель в `--yjit-stats`.
        * В статистику по умолчанию добавлен `invalidate_everything`, который увеличивается при каждой инвалидации кода через TracePoint.
    * добавлены опции `mem_size:` и `call_threshold:` в `RubyVM::YJIT.enable`.
* RJIT
    * `--rjit` удалена. Мы перенесем реализацию стороннего JIT API в репозиторий [ruby/rjit](https://github.com/ruby/rjit).

## Разное

Дополнительную информацию можно найти в [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})


С учетом этих изменений, [{{ release.stats.files_changed }} файлов было изменено, {{ release.stats.insertions }} добавлено(+), {{ release.stats.deletions }} удалено(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
с момента выхода Ruby 3.4.0!

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

Ruby был впервые разработан Matz (Yukihiro Matsumoto) в 1993 году и сейчас развивается как Open Source. Он работает на различных платформах и используется во всем мире, особенно для веб-разработки.

[Feature #6012]: https://bugs.ruby-lang.org/issues/6012
[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
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
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
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
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
