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

Ruby Box — это новая (экспериментальная) возможность для разделения определений. Ruby Box включается при указании переменной окружения `RUBY_BOX=1`. Используется класс `Ruby::Box`.

Определения, загруженные в box, изолированы внутри него. Ruby Box позволяет изолировать/отделять monkey patches, изменения глобальных переменных и переменных класса, определения классов/модулей, а также загруженные нативные и ruby-библиотеки от других box.

Ожидаемые сценарии использования:

* Запуск тестовых сценариев в box для защиты других тестов, если тест использует monkey patches для переопределения чего-либо.
* Параллельный запуск веб-приложений в разных box для выполнения blue-green deployment на сервере приложений в рамках одного процесса Ruby.
* Параллельный запуск веб-приложений в box для оценки обновлений зависимостей в течение определенного периода времени путем проверки разницы (diff) ответов с помощью Ruby-кода.
* Использование в качестве базового (низкоуровневого) API для реализации своего рода API «пакетов» (высокоуровневого) (дизайн еще не разработан).

Для получения подробной информации о «Ruby Box» смотрите [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT — это новый just-in-time (JIT) компилятор, который разрабатывается как следующее поколение YJIT. Для сборки Ruby с поддержкой ZJIT требуется Rust 1.85.0 или новее, а сам ZJIT включается при указании флага `--zjit`.

Мы создаем новый компилятор для Ruby, так как хотим поднять потолок производительности (за счет большего размера единицы компиляции и SSA IR) и привлечь больше внешних контрибьюторов (став более традиционным компилятором методов). Подробности читайте в [нашем блоге](https://railsatscale.com/2025-12-24-launch-zjit/).
<!-- the blog post will be auto-published on 2025-12-24 9:00am UTC. -->

ZJIT быстрее интерпретатора, но пока не так быстр, как YJIT. Мы рекомендуем вам поэкспериментировать с ZJIT, но, возможно, стоит повременить с его внедрением в production. Следите за обновлениями ZJIT в Ruby 4.1.

## Улучшения Ractor

Ractor, механизм параллельного выполнения в Ruby, получил несколько улучшений. Был введен новый класс `Ractor::Port` для решения проблем, связанных с отправкой и получением сообщений (см. [наш пост в блоге](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98)). Кроме того, `Ractor.shareable_proc` упрощает совместное использование объектов `Proc` между Ractor.

Что касается производительности, многие внутренние структуры данных были улучшены, чтобы значительно снизить конкуренцию (contention) за глобальную блокировку, обеспечивая лучший параллелизм. Ractor теперь также разделяют меньше внутренних данных, что приводит к меньшей конкуренции за кэш процессора при параллельной работе.

Ractor был впервые представлен в Ruby 3.0 как экспериментальная возможность. Мы планируем снять статус «экспериментальный» в следующем году.

## Изменения языка

* `*nil` больше не вызывает `nil.to_a`, по аналогии с тем, как `**nil`
не вызывает `nil.to_hash`. [[Feature #21047]]

* Логические бинарные операторы (`||`, `&&`, `and` и `or`) в начале строки продолжают предыдущую строку,
  подобно «fluent dot».
  Следующие примеры кода эквивалентны:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

  Ранее:

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

## Обновления встроенных классов

Примечание: перечислены только наиболее значимые обновления.

* Array
    * Добавлен `Array#rfind` как более эффективная альтернатива `array.reverse_each.find`. [[Feature #21678]]
    * Добавлен `Array#find` как более эффективное переопределение `Enumerable#find`. [[Feature #21678]]
* Binding
    * `Binding#local_variables` больше не включает нумерованные параметры.
      Также `Binding#local_variable_get`, `Binding#local_variable_set` и
      `Binding#local_variable_defined?` отказываются обрабатывать нумерованные параметры.
      [[Bug #21049]]
    * Добавлены `Binding#implicit_parameters`, `Binding#implicit_parameter_get` и
      `Binding#implicit_parameter_defined?` для доступа к нумерованным параметрам и параметру «it». [[Bug #21049]]

* Enumerator

      * `Enumerator.produce` теперь принимает необязательный именованный аргумент `size`
      для указания размера энумератора. Это может быть целое число,
      `Float::INFINITY`, вызываемый объект (например, lambda) или `nil` для
      обозначения неизвестного размера. Если размер не указан, по умолчанию используется
      `Float::INFINITY`.

        ```ruby
        # Бесконечный энумератор
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # Конечный энумератор с известным/вычисляемым размером
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]


* ErrorHighlight

* При возникновении ArgumentError теперь отображаются фрагменты кода как для
вызова метода (caller), так и для определения метода (callee).
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
* Введена поддержка аргумента `Fiber#raise(cause:)`, аналогично `Kernel#raise`. [[Feature #21360]]


* Fiber::Scheduler
* Введен `Fiber::Scheduler#fiber_interrupt` для прерывания fiber с заданным исключением. Основной сценарий использования — прерывание fiber, ожидающего блокирующую операцию ввода-вывода, когда эта операция закрывается.
[[Feature #21166]]
* Введен `Fiber::Scheduler#yield`, позволяющий планировщику fiber продолжать обработку, когда сигнальные исключения отключены.
[[Bug #21633]]
* Повторно введен хук `Fiber::Scheduler#io_close` для асинхронного `IO#close`.
* Вызов `Fiber::Scheduler#io_write` при сбросе буфера записи ввода-вывода.
[[Bug #21789]]


* File
* `File::Stat#birthtime` теперь доступен в Linux через системный вызов statx, если это поддерживается ядром и файловой системой.
[[Feature #21205]]


* IO
* `IO.select` принимает `Float::INFINITY` в качестве аргумента таймаута.
[[Feature #20610]]
* Удалено устаревшее поведение создания процесса методами класса `IO` с ведущим символом `|`. [[Feature #19630]]


* Kernel
* `Kernel#inspect` теперь проверяет наличие метода `#instance_variables_to_inspect`, позволяя контролировать, какие переменные экземпляра отображаются в строке `#inspect`:
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
* Удалено устаревшее поведение создания процесса методом `Kernel#open` с ведущим символом `|`. [[Feature #19630]]


* Math
* Добавлены `Math.log1p` и `Math.expm1`. [[Feature #21527]]


* Pathname
* Pathname был переведен из разряда default gems во встроенные (core) классы Ruby.
[[Feature #17473]]


* Proc
* `Proc#parameters` теперь показывает анонимные необязательные параметры как `[:opt]` вместо `[:opt, nil]`, что делает вывод согласованным с ситуацией, когда анонимный параметр является обязательным. [[Bug #20974]]


* Ractor
* Добавлен класс `Ractor::Port` для нового механизма синхронизации при взаимодействии между Ractor. [[Feature #21262]]
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
* Добавлены `Ractor#join` и `Ractor#value` для ожидания завершения Ractor. Они аналогичны `Thread#join` и `Thread#value`.
* Добавлены `Ractor#monitor` и `Ractor#unmonitor` в качестве низкоуровневых интерфейсов, используемых внутренне для реализации `Ractor#join`.
* `Ractor.select` теперь принимает только Ractors и Ports. Если переданы Ractors, метод возвращает управление, когда Ractor завершается.
* Добавлен `Ractor#default_port`. У каждого `Ractor` есть порт по умолчанию, который используется методами `Ractor.send` и `Ractor.receive`.
* `Ractor#close_incoming` и `Ractor#close_outgoing` были удалены.
* Введены `Ractor.shareable_proc` и `Ractor.shareable_lambda` для создания разделяемых Proc или lambda.
[[Feature #21550]], [[Feature #21557]]


* Range
* `Range#to_set` теперь выполняет проверку размера, чтобы предотвратить проблемы с бесконечными диапазонами. [[Bug #21654]]
* `Range#overlap?` теперь корректно обрабатывает бесконечные (unbounded) диапазоны.
[[Bug #21185]]
* Исправлено поведение `Range#max` для целочисленных диапазонов без начала (beginless).
[[Bug #21174]] [[Bug #21175]]


* Ruby
* Определен новый модуль верхнего уровня `Ruby`, содержащий константы, связанные с Ruby. Этот модуль был зарезервирован в Ruby 3.4 и теперь официально определен. [[Feature #20884]]


* Ruby::Box
* Новая (экспериментальная) возможность для разделения определений. Подробности о «Ruby Box» см. в [doc/language/box.md](https://www.google.com/search?q=doc/language/box.md).
[[Feature #21311]] [[Misc #21385]]


* Set
* `Set` теперь является встроенным (core) классом, а не классом стандартной библиотеки с автозагрузкой.
[[Feature #21216]]
* `Set#inspect` теперь использует более простое отображение, подобное литералам массивов.
(напр., `Set[1, 2, 3]` вместо `#<Set: {1, 2, 3}>`). [[Feature #21389]]
* Передача аргументов в `Set#to_set` и `Enumerable#to_set` теперь является устаревшей (deprecated).
[[Feature #21390]]


* Socket
* `Socket.tcp` и `TCPSocket.new` принимают именованный аргумент `open_timeout` для указания таймаута начального соединения. [[Feature #21347]]
* Когда в `TCPSocket.new` происходил таймаут, указанный пользователем, ранее могло возникать либо `Errno::ETIMEDOUT`, либо `IO::TimeoutError` в зависимости от ситуации. Это поведение было унифицировано, и теперь всегда выбрасывается `IO::TimeoutError`. (Обратите внимание, что в `Socket.tcp` все еще бывают случаи возникновения `Errno::ETIMEDOUT` в похожих ситуациях, и в обоих случаях `Errno::ETIMEDOUT` может возникнуть, если таймаут произошел на уровне ОС.)


* String
* Обновление Unicode до версии 17.0.0 и Emoji до версии 17.0.
[[Feature #19908]][[Feature #20724]][[Feature #21275]] (также относится к Regexp)
* Методы `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip` и `rstrip!` расширены для приема аргументов `*selectors`. [[Feature #21552]]


* Thread
* Введена поддержка аргумента `Thread#raise(cause:)`, аналогично `Kernel#raise`. [[Feature #21360]]



## Обновления стандартной библиотеки

Мы перечисляем только значимые изменения функционала в стандартной библиотеке.

Следующие bundled gems были переведены из разряда default gems.

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 7.0.2
* win32ole 1.9.2
* irb 1.16.0
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

Добавлен следующий default gem:

* win32-registry 0.1.2

Следующие default gems были обновлены:

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
* delegate 0.6.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.1
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.2
* io-nonblock 0.3.2
* io-wait 0.4.0
* ipaddr 1.2.8
* json 2.18.0
* net-http 0.9.1
* openssl 4.0.0
* optparse 0.8.1
* pp 0.6.3
* prism 1.7.0
* psych 5.3.1
* resolv 0.7.0
* stringio 3.2.0
* strscan 3.1.6
* time 0.4.2
* timeout 0.6.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

Следующие bundled gems были обновлены:

* minitest 6.0.0
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.5
* rexml 3.4.4
* rss 0.3.2
* net-ftp 0.3.9
* net-imap 0.6.2
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.10.0
* typeprof 0.31.1
* debug 1.11.1
* base64 0.3.0
* bigdecimal 4.0.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

### RubyGems и Bundler

В Ruby 4.0 включены RubyGems и Bundler версии 4. Подробности по ссылкам:

* [Обновление до RubyGems/Bundler 4 - Блог RubyGems](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [Вышел 4.0.0 - Блог RubyGems](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [Вышел 4.0.1 - Блог RubyGems](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [Вышел 4.0.2 - Блог RubyGems](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [Вышел 4.0.3 - Блог RubyGems](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## Поддерживаемые платформы

* Windows
* Прекращена поддержка версий MSVC старше 14.0 (_MSC_VER 1900).
Это означает, что теперь требуется Visual Studio 2015 или новее.



## Проблемы совместимости

* Следующие методы были удалены из Ractor в связи с добавлением `Ractor::Port`:
* `Ractor.yield`
* `Ractor#take`
* `Ractor#close_incoming`
* `Ractor#close_outgoing`


[[Feature #21262]]
* `ObjectSpace._id2ref` объявлен устаревшим. [[Feature #15408]]
* `Process::Status#&` и `Process::Status#>>` были удалены.
Они стали устаревшими в Ruby 3.3. [[Bug #19868]]
* `rb_path_check` был удален. Эта функция использовалась для проверки путей `$SAFE`, которая была удалена в Ruby 2.7, и уже была устаревшей.
[[Feature #20971]]
* Backtrace для `ArgumentError` о «неверном количестве аргументов» теперь включает имя класса или модуля получателя (например, `in 'Foo#bar'` вместо `in 'bar'`). [[Bug #21698]]
* Backtrace больше не отображает `internal` фреймы.
Эти методы теперь отображаются так, будто они находятся в исходном файле Ruby, что согласуется с другими методами, реализованными на C. [[Bug #20968]]
Раньше:
```
ruby -e '[1].fetch_values(42)'
<internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
        from <internal:array>:211:in 'block in Array#fetch_values'
        from <internal:array>:211:in 'Array#map!'
        from <internal:array>:211:in 'Array#fetch_values'
        from -e:1:in '<main>'

```


Сейчас:
```
$ ruby -e '[1].fetch_values(42)'
-e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
        from -e:1:in '<main>'

```



## Вопросы совместимости стандартной библиотеки

* Библиотека CGI удалена из состава default gems. Теперь предоставляется только `cgi/escape` для следующих методов:
* `CGI.escape` и `CGI.unescape`
* `CGI.escapeHTML` и `CGI.unescapeHTML`
* `CGI.escapeURIComponent` и `CGI.unescapeURIComponent`
* `CGI.escapeElement` и `CGI.unescapeElement`


[[Feature #21258]]
* В связи с переносом `Set` из стандартной библиотеки во встроенные классы, файл `set/sorted_set.rb` был удален, и `SortedSet` больше не является константой с автозагрузкой. Пожалуйста, установите гем `sorted_set` и используйте `require 'sorted_set'`, чтобы использовать `SortedSet`.
[[Feature #21287]]
* Net::HTTP
* Поведение по умолчанию, автоматически устанавливающее заголовок `Content-Type` в `application/x-www-form-urlencoded` для запросов с телом (например, `POST`, `PUT`), когда заголовок не был задан явно, было удалено. Если ваше приложение полагалось на это поведение, запросы теперь будут отправляться без заголовка Content-Type, что может нарушить совместимость с некоторыми серверами.
[[GH-net-http #205]]



## Обновления C API

* IO
* `rb_thread_fd_close` объявлен устаревшим и теперь ничего не делает (no-op). Если вам нужно предоставлять файловые дескрипторы из C-расширений в Ruby-код, создайте экземпляр `IO`, используя `RUBY_IO_MODE_EXTERNAL`, и используйте `rb_io_close(io)` для его закрытия (это также прерывает и ожидает завершения всех ожидающих операций на этом экземпляре `IO`). Прямое закрытие файловых дескрипторов не прерывает ожидающие операции и может привести к неопределенному поведению. Другими словами, если два объекта `IO` разделяют один и тот же файловый дескриптор, закрытие одного не влияет на другой. [[Feature #18455]]


* GVL
* `rb_thread_call_with_gvl` теперь работает как с GVL, так и без него. Это позволяет гемам избегать проверки `ruby_thread_has_gvl_p`. Пожалуйста, по-прежнему будьте внимательны при работе с GVL. [[Feature #20750]]


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

* `Class#new` (например, `Object.new`) стал быстрее во всех случаях, особенно при передаче именованных аргументов. Это изменение также интегрировано в YJIT и ZJIT. [[Feature #21254]]
* Пулы кучи GC разного размера теперь растут независимо, что снижает потребление памяти, когда только некоторые пулы содержат долгоживущие объекты.
* Очистка (sweeping) GC стала быстрее на страницах с крупными объектами.
* Объекты с «Generic ivar» (String, Array, `TypedData` и т. д.) теперь используют новый внутренний объект «fields» для ускорения доступа к переменным экземпляра.
* GC избегает поддержки внутренней таблицы `id2ref` до ее первого использования, что ускоряет аллокацию `object_id` и очистку GC.
* `object_id` и `hash` работают быстрее для объектов Class и Module.
* Более крупные целые числа (Bignum) могут оставаться встроенными (embedded) благодаря аллокации переменной ширины.
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`, `StringScanner` и некоторые внутренние объекты теперь защищены барьером записи (write-barrier protected), что снижает накладные расходы на GC.

### Ractor

Была проведена большая работа по стабилизации Ractor, повышению их производительности и удобства использования. Эти улучшения приближают реализацию Ractor к выходу из статуса экспериментальной возможности.

* Улучшения производительности
* Замороженные строки и таблица символов внутри используют lock-free хэш-сет [[Feature #21268]]
* Поиск в кэше методов в большинстве случаев обходится без блокировок
* Доступ к переменным экземпляра классов (и generic ivar) стал быстрее и не требует блокировок
* Конкуренция за кэш процессора при аллокации объектов исключена за счет использования счетчика на каждый Ractor
* Конкуренция за кэш процессора в xmalloc/xfree исключена благодаря использованию локального счетчика потока
* `object_id` в большинстве случаев обходится без блокировок


* Исправление ошибок и стабильность
* Исправлены возможные взаимные блокировки (deadlocks) при совместном использовании Ractors и Threads
* Исправлены проблемы с require и autoload внутри Ractor
* Исправлены проблемы с кодировками/транскодированием между Ractor
* Исправлены состояния гонки (race conditions) в операциях GC и инвалидации методов
* Исправлены проблемы с ветвлением процессов (forking) после запуска Ractor
* Счетчики аллокаций GC теперь точны при работе с Ractor
* Исправлена работа TracePoints после GC [[Bug #19112]]



## JIT

* ZJIT
* Представлен [экспериментальный JIT-компилятор на основе методов](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
Где это возможно, ZJIT можно включить во время выполнения с помощью опции `--zjit` или вызвав `RubyVM::ZJIT.enable`.
Для сборки Ruby с поддержкой ZJIT требуется Rust 1.85.0 или новее.
* По состоянию на Ruby 4.0.0, ZJIT быстрее интерпретатора, но пока не так быстр, как YJIT. Мы рекомендуем экспериментировать с ZJIT, но советуем воздержаться от его использования в production.
* Наша цель — сделать ZJIT быстрее YJIT и готовым к промышленной эксплуатации в Ruby 4.1.


* YJIT
* `RubyVM::YJIT.runtime_stats`
* `ratio_in_yjit` больше не работает в сборке по умолчанию. Используйте `--enable-yjit=stats` при конфигурации, чтобы включить его через `--yjit-stats`.
* В статистику по умолчанию добавлен параметр `invalidate_everything`, который увеличивается при полной инвалидации кода через TracePoint.


* В `RubyVM::YJIT.enable` добавлены опции `mem_size:` и `call_threshold:`.


* RJIT
* Флаг `--rjit` удален. Мы перенесем реализацию стороннего JIT API в репозиторий [ruby/rjit](https://github.com/ruby/rjit).


Смотрите [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html) или [логи коммитов](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}) для получения подробностей.

С момента выхода Ruby 3.4.0 было [изменено {{ release.stats.files_changed }} файлов, добавлено {{ release.stats.insertions }} строк(+), удалено {{ release.stats.deletions }} строк(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)!

Счастливого Рождества, счастливого Нового года и удачного хакинга с Ruby 4.0!

## Скачать

- <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Что такое Ruby

Ruby был изначально разработан Matz (Yukihiro Matsumoto) в 1993 году, и сейчас развивается как Open Source. Он работает на множестве платформ и используется по всему миру, особенно для веб-разработки.

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]: https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]: https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]: https://bugs.ruby-lang.org/issues/20968
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]: https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]: https://bugs.ruby-lang.org/issues/21174
[Bug #21175]: https://bugs.ruby-lang.org/issues/21175
[Bug #21185]: https://bugs.ruby-lang.org/issues/21185
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
[Misc #21385]: https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]: https://bugs.ruby-lang.org/issues/21633
[Bug #21654]: https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]: https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]: https://bugs.ruby-lang.org/issues/21789
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
