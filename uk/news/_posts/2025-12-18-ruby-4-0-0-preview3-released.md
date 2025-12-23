---
layout: news_post
title: "Вийшов Ruby 4.0.0 preview3"
author: "naruse"
translator: "Andrii Furmanets"
date: 2025-12-18 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
Раді повідомити про вихід Ruby {{ release.version }}.
Ruby 4.0 вводить Ruby::Box і "ZJIT" та додає багато покращень.

## Ruby::Box

Нова (експериментальна) функція для розділення визначень.
Докладніше про "Ruby Box" див. [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
[[Feature #21311]] [[Misc #21385]]

## Зміни мови

* `*nil` більше не викликає `nil.to_a`, подібно до того, як `**nil` не викликає `nil.to_hash`. [[Feature #21047]]

* Логічні бінарні оператори (`||`, `&&`, `and` та `or`) на початку рядка
  продовжують попередній рядок, як у fluent dot.
  Наступні два фрагменти коду рівнозначні:

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

## Оновлення основних класів

Примітка: наведено лише помітні оновлення класів.

* Kernel

    * `Kernel#inspect` тепер перевіряє наявність методу `#instance_variables_to_inspect`,
      що дозволяє керувати тим, які змінні екземпляра відображаються в рядку `#inspect`:

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

    * Застарілу поведінку створення процесу через `Kernel#open` із
      початковим `|` вилучено. [[Feature #19630]]

* Binding

    * `Binding#local_variables` більше не містить нумерованих параметрів.
      Також `Binding#local_variable_get` і `Binding#local_variable_set` відмовляються
      працювати з нумерованими параметрами. [[Bug #21049]]

* File

    * `File::Stat#birthtime` тепер доступний на Linux через системний виклик statx,
      коли його підтримують ядро та файлова система.
      [[Feature #21205]]

* IO

    * `IO.select` приймає `Float::INFINITY` як аргумент тайм-ауту.
      [[Feature #20610]]

    * Застарілу поведінку створення процесу методами класу `IO` з
      початковим `|` вилучено. [[Feature #19630]]

* Math

    * Додано `Math.log1p` та `Math.expm1`. [[Feature #21527]]

* Method

    * `Method#source_location`, `Proc#source_location` та
      `UnboundMethod#source_location` тепер повертають розширену інформацію про розташування
      з 5 елементів: `[path, start_line, start_column, end_line, end_column]`. Попередній
      формат з 2 елементів `[path, line]` все ще можна отримати, викликавши `.take(2)` у результаті.
      [[Feature #6012]]

* Proc

    * `Proc#parameters` тепер показує анонімні необов'язкові параметри як `[:opt]`
      замість `[:opt, nil]`, роблячи вивід узгодженим із випадком, коли
      анонімний параметр є обов'язковим. [[Bug #20974]]

* Ractor

    * Додано клас `Ractor::Port` як новий механізм синхронізації
      для обміну між Ractor. [[Feature #21262]]

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

        `Ractor::Port` надає такі методи:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (або `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        У результаті `Ractor.yield` і `Ractor#take` були вилучені.

    * Додано `Ractor#join` і `Ractor#value` для очікування
      завершення Ractor. Це аналогічно `Thread#join`
      та `Thread#value`.

    * Додано `Ractor#monitor` і `Ractor#unmonitor` як низькорівневі
      інтерфейси, що використовуються всередині для реалізації `Ractor#join`.

    * `Ractor.select` тепер приймає лише Ractor і Port. Якщо передано Ractor,
      він повертається, коли Ractor завершується.

    * Додано `Ractor#default_port`. Кожен `Ractor` має порт за замовчуванням,
      який використовується `Ractor.send` і `Ractor.receive`.

    * `Ractor#close_incoming` і `Ractor#close_outgoing` були вилучені.

    * Запроваджено `Ractor.shareable_proc` і `Ractor.shareable_lambda`
      для створення розділюваних Proc або lambda.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` та `Enumerator#to_set` тепер виконують перевірки розміру, щоб запобігти
      проблемам з нескінченними діапазонами. [[Bug #21654]]

    * `Range#overlap?` тепер коректно обробляє нескінченні (безмежні) діапазони.
      [[Bug #21185]]

    * Виправлено поведінку `Range#max` для безпочаткових цілих діапазонів.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Визначено новий глобальний модуль `Ruby`, який містить
      константи, пов'язані з Ruby. Цей модуль був зарезервований у Ruby 3.4
      і тепер офіційно визначений. [[Feature #20884]]

* Ruby::Box

    * Нова (експериментальна) функція для розділення визначень.
      Докладніше про "Ruby Box" див. [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` тепер є основним класом, а не stdlib класом, що автозавантажується.
      [[Feature #21216]]

    * `Set#inspect` тепер повертає рядок, придатний для `eval`, використовуючи
      синтаксис `Set[]` (наприклад, `Set[1, 2, 3]` замість
      `#<Set: {1, 2, 3}>`). Це робить його узгодженим з іншими основними
      колекційними класами, такими як Array і Hash. [[Feature #21389]]

    * Передавання аргументів до `Set#to_set` і `Enumerable#to_set` тепер застаріле.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` і `TCPSocket.new` приймають ключовий аргумент `open_timeout` для задання
      тайм-ауту початкового з'єднання. [[Feature #21347]]

* String

    * Оновлено Unicode до версії 17.0.0 та Emoji до 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (також стосується Regexp)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip` і `rstrip!`
       розширено, щоб приймати аргументи `*selectors`. [[Feature #21552]]

* Thread

    * Додано підтримку аргументу `Thread#raise(cause:)`, подібно до
      `Kernel#raise`. [[Feature #21360]]

* Fiber

    * Додано підтримку аргументу `Fiber#raise(cause:)`, подібно до
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Додано `Fiber::Scheduler#fiber_interrupt` для переривання fiber заданим
      виключенням. Початковий сценарій використання - перервати fiber, що
      очікує блокувальну операцію IO, коли цю операцію IO закрито.
      [[Feature #21166]]

* Pathname

    * Pathname переведено зі статусу default gem до основного класу Ruby.
      [[Feature #17473]]

## Оновлення stdlib

Наступні bundled gems підвищено зі статусу default gems.

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

Ми наводимо лише помітні зміни stdlib, що є змінами функціональності.

Інші зміни наведено в наступних розділах. Також ми навели історію релізів
від попередньої bundled версії, якою є Ruby 3.3.0, якщо вона має релізи на GitHub.

Додано наступний default gem.

* win32-registry 0.1.2

Оновлено такі default gems.

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

Оновлено такі bundled gems.

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

## Підтримувані платформи

* Windows

    * Припинено підтримку версій MSVC, старших за 14.0 (_MSC_VER 1900).
      Це означає, що тепер потрібен Visual Studio 2015 або новіший.

## Проблеми сумісності

* Через додавання `Ractor::Port` вилучено такі методи Ractor:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* `ObjectSpace._id2ref` є застарілим. [[Feature #15408]]

* `Process::Status#&` і `Process::Status#>>` було вилучено.
  Вони були застарілими в Ruby 3.3. [[Bug #19868]]

* `rb_path_check` було вилучено. Цю функцію використовували для
  перевірки шляхів `$SAFE`, яку прибрали в Ruby 2.7,
  і вона вже була застарілою.
  [[Feature #20971]]

## Проблеми сумісності stdlib

* Бібліотеку CGI вилучено з default gems. Тепер ми надаємо лише `cgi/escape` для
  таких методів:

    * `CGI.escape` і `CGI.unescape`
    * `CGI.escapeHTML` і `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` і `CGI.unescapeURIComponent`
    * `CGI.escapeElement` і `CGI.unescapeElement`

    [[Feature #21258]]

* Після перенесення `Set` зі stdlib до основного класу, `set/sorted_set.rb` було
  вилучено, а `SortedSet` більше не є автозавантажуваною константою. Будь ласка,
  встановіть gem `sorted_set` і `require 'sorted_set'`, щоб використовувати `SortedSet`.
  [[Feature #21287]]

## Оновлення C API

* IO

    * `rb_thread_fd_close` є застарілим і тепер не виконує дій. Якщо вам потрібно надати
      дескриптори файлів із C-розширень у код Ruby, створіть екземпляр `IO`,
      використовуючи `RUBY_IO_MODE_EXTERNAL`, і використайте `rb_io_close(io)`, щоб закрити його (це
      також перериває та очікує завершення всіх операцій, що очікують, для екземпляра `IO`).
      Безпосереднє закриття дескрипторів файлів не перериває операції, що очікують,
      і може призвести до невизначеної поведінки. Іншими словами, якщо два об'єкти
      `IO` спільно використовують один і той самий дескриптор файлу, закриття одного
      не впливає на інший. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` тепер працює з GVL або без нього.
      Це дозволяє gem уникати перевірки `ruby_thread_has_gvl_p`.
      Будь ласка, все одно уважно ставтеся до GVL. [[Feature #20750]]

* Set

    * Додано C API для `Set`. Підтримуються такі методи:
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## Покращення реалізації

### Ractor

Проведено багато роботи, щоб зробити Ractor стабільнішими, продуктивнішими та зручнішими. Ці покращення наближають реалізацію Ractor до виходу з експериментального статусу.

* Покращення продуктивності
    * Заморожені рядки та таблиця символів всередині використовують lock-free hash set
    * Пошуки в кеші методів у більшості випадків обходяться без блокування
    * Доступ до змінних екземпляра класів (та geniv) швидший і уникає блокувань
    * Уникається конкуренція за кеш під час виділення об'єктів
    * `object_id` у більшості випадків обходиться без блокування
* Виправлення помилок і стабільність
    * Виправлено можливі дедлоки при поєднанні Ractor і Thread
    * Виправлено проблеми з require та autoload у Ractor
    * Виправлено проблеми з кодуванням/транскодуванням між Ractor
    * Виправлено умови гонки в операціях GC та інвалідизації методів
    * Виправлено проблеми з форком процесів після запуску Ractor

## JIT

* ZJIT
    * Запроваджено [експериментальний JIT-компілятор на основі методів](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
      Щоб увімкнути підтримку `--zjit`, зберіть Ruby з Rust 1.85.0 або новішою.
    * Станом на Ruby 4.0.0, ZJIT швидший за інтерпретатор, але ще не такий швидкий, як YJIT.
      Ми заохочуємо експерименти з ZJIT, але радимо поки що не розгортати його в продакшені.
    * Наша мета - зробити ZJIT швидшим за YJIT і готовим до продакшена в Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` більше не працює у збірці за замовчуванням.
          Використайте `--enable-yjit=stats` у `configure`, щоб увімкнути її для `--yjit-stats`.
        * Додано `invalidate_everything` до стандартної статистики; лічильник збільшується,
          коли весь код інвалідовується через TracePoint.
    * Додано параметри `mem_size:` та `call_threshold:` до `RubyVM::YJIT.enable`.
* RJIT
    * `--rjit` вилучено. Ми перенесемо реалізацію стороннього JIT API
      до репозиторію [ruby/rjit](https://github.com/ruby/rjit).

## Інші зміни

Детальніше див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.4.0!

## Завантаження

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

## Що таке Ruby

Ruby уперше розробив Matz (Yukihiro Matsumoto) у 1993 році,
і зараз вона розвивається як Open Source. Вона працює на багатьох платформах
і використовується по всьому світу, особливо для веброзробки.

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
