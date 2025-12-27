---
layout: news_post
title: "Вийшов Ruby 4.0.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2025-12-25 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Ми раді повідомити про випуск Ruby {{ release.version }}.
Ruby 4.0 представляє "Ruby Box" та "ZJIT", а також додає багато покращень.

## Ruby Box

Ruby Box — це нова (експериментальна) функція для забезпечення розділення визначень. Ruby Box вмикається, коли встановлена змінна середовища `RUBY_BOX=1`. Клас — `Ruby::Box`.

Визначення, завантажені в box (коробку), ізольовані в ній. Ruby Box може ізолювати/розділяти monkey patches, зміни глобальних/класових змінних, визначення класів/модулів та завантажені нативні/ruby бібліотеки від інших boxes.

Очікувані варіанти використання:

* Запуск тестових випадків у box для захисту інших тестів, коли тестовий випадок використовує monkey patches для перевизначення чогось
* Запуск boxes веб-додатків паралельно для виконання blue-green розгортання на сервері додатків у процесі Ruby
* Запуск boxes веб-додатків паралельно для оцінки оновлень залежностей протягом певного періоду часу шляхом перевірки відмінностей у відповідях за допомогою коду Ruby
* Використовується як базовий (низькорівневий) API для реалізації свого роду API "пакунків" (високорівневого) (він ще не спроектований)

Для детальнішої інформації про "Ruby Box", дивіться [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT — це новий just-in-time (JIT) компілятор, який розробляється як наступне покоління YJIT. Вам потрібен Rust 1.85.0 або новіший, щоб зібрати Ruby з підтримкою ZJIT, і ZJIT вмикається, якщо вказано `--zjit`.

Ми створюємо новий компілятор для Ruby, тому що хочемо одночасно підняти стелю продуктивності (більший розмір одиниці компіляції та SSA IR) та заохотити більше внесків ззовні (стаючи більш традиційним компілятором методів). Дивіться [наш блог](https://railsatscale.com/2025-12-24-launch-zjit/) для деталей.
<!-- the blog post will be auto-published on 2025-12-24 9:00am UTC. -->

ZJIT швидший за інтерпретатор, але ще не такий швидкий, як YJIT. Ми заохочуємо вас експериментувати з ZJIT, але, можливо, утримайтеся від розгортання його у виробництві на даний момент. Слідкуйте за Ruby 4.1 ZJIT.

## Покращення Ractor

Ractor, механізм паралельного виконання Ruby, отримав кілька покращень. Новий клас, `Ractor::Port`, був представлений для вирішення проблем, пов'язаних з надсиланням та отриманням повідомлень (дивіться [наш блог](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98)). Крім того, `Ractor.shareable_proc` полегшує спільне використання об'єктів `Proc` між Ractors.

З боку продуктивності, багато внутрішніх структур даних було покращено для значного зменшення конкуренції за глобальне блокування, відкриваючи кращий паралелізм. Ractors тепер також поділяють менше внутрішніх даних, що призводить до меншої конкуренції кешу CPU при паралельному запуску.

Ractor був вперше представлений у Ruby 3.0 як експериментальна функція. Ми прагнемо зняти статус "експериментальний" наступного року.

## Зміни мови

* `*nil` більше не викликає `nil.to_a`, подібно до того, як `**nil`
  не викликає `nil.to_hash`. [[Feature #21047]]

* Логічні бінарні оператори (`||`, `&&`, `and` та `or`) на
  початку рядка продовжують попередній рядок, як fluent dot.
  Наступні приклади коду є еквівалентними:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    Раніше:

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

## Оновлення основних класів

Примітка: Ми перераховуємо лише видатні оновлення класів.

* Array

    * `Array#rfind` додано як більш ефективну альтернативу `array.reverse_each.find` [[Feature #21678]]
    * `Array#find` додано як більш ефективне перевизначення `Enumerable#find` [[Feature #21678]]
* Binding

    * `Binding#local_variables` більше не включає нумеровані параметри.
      Також, `Binding#local_variable_get`, `Binding#local_variable_set` та
      `Binding#local_variable_defined?` відхиляють обробку нумерованих параметрів.
      [[Bug #21049]]

    * `Binding#implicit_parameters`, `Binding#implicit_parameter_get` та
      `Binding#implicit_parameter_defined?` додано для доступу до
      нумерованих параметрів та параметра "it". [[Bug #21049]]

* Enumerator

    * `Enumerator.produce` тепер приймає необов'язковий іменований аргумент `size`
      для вказівки розміру перечислювача. Це може бути ціле число,
      `Float::INFINITY`, об'єкт, що викликається (наприклад, лямбда), або `nil`, щоб
      вказати невідомий розмір. Якщо не вказано, розмір за замовчуванням
      `Float::INFINITY`.

        ```ruby
        # Нескінченний перечислювач
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # Скінченний перечислювач з відомим/обчислюваним розміром
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * Коли викликається ArgumentError, тепер відображаються фрагменти коду для
      обидвох: виклику методу (caller) та визначення методу (callee).
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

    * Впроваджено підтримку аргументу `Fiber#raise(cause:)`, подібного до
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Впроваджено `Fiber::Scheduler#fiber_interrupt` для переривання файбера з
      заданим виключенням. Початковий варіант використання — перервати файбер, який
      чекає на блокуючу операцію введення-виведення, коли операція введення-виведення закрита.
      [[Feature #21166]]

    * Впроваджено `Fiber::Scheduler#yield`, щоб дозволити планувальнику файберів
      продовжувати обробку, коли сигнальні виключення вимкнені.
      [[Bug #21633]]

    * Повторно впроваджено хук `Fiber::Scheduler#io_close` для асинхронного `IO#close`.

    * Виклик `Fiber::Scheduler#io_write` при скиданні буфера запису IO.
      [[Bug #21789]]

* File

    * `File::Stat#birthtime` тепер доступний на Linux через системний виклик statx,
      коли це підтримується ядром та файловою системою.
      [[Feature #21205]]

* IO

    * `IO.select` приймає `Float::INFINITY` як аргумент тайм-ауту.
      [[Feature #20610]]

    * Застаріла поведінка, створення процесу методами класу `IO`
      з провідним `|`, була видалена. [[Feature #19630]]

* Kernel

    * `Kernel#inspect` тепер перевіряє наявність методу `#instance_variables_to_inspect`,
      дозволяючи контроль над тим, які змінні екземпляра відображаються в рядку `#inspect`:

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

    * Застаріла поведінка, створення процесу через `Kernel#open` з
      провідним `|`, була видалена. [[Feature #19630]]

* Math

    * `Math.log1p` та `Math.expm1` додані. [[Feature #21527]]

* Pathname

    * Pathname було підвищено з default gem до основного класу Ruby.
      [[Feature #17473]]

* Proc

    * `Proc#parameters` тепер показує анонімні необов'язкові параметри як `[:opt]`
      замість `[:opt, nil]`, роблячи вивід узгодженим з тим, коли
      анонімний параметр є обов'язковим. [[Bug #20974]]

* Ractor

    * Клас `Ractor::Port` був доданий для нового механізму синхронізації
      для зв'язку між Ractors. [[Feature #21262]]

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

        `Ractor::Port` надає наступні методи:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (або `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        В результаті, `Ractor.yield` та `Ractor#take` були видалені.

    * `Ractor#join` та `Ractor#value` були додані для очікування
      завершення Ractor. Вони схожі на `Thread#join`
      та `Thread#value`.

    * `Ractor#monitor` та `Ractor#unmonitor` були додані як низькорівневі
      інтерфейси, що використовуються внутрішньо для реалізації `Ractor#join`.

    * `Ractor.select` тепер приймає лише Ractors і Ports. Якщо передані Ractors,
      він повертає, коли Ractor завершує роботу.

    * `Ractor#default_port` був доданий. Кожен `Ractor` має порт за замовчуванням,
      який використовується `Ractor.send`, `Ractor.receive`.

    * `Ractor#close_incoming` та `Ractor#close_outgoing` були видалені.

    * `Ractor.shareable_proc` та `Ractor.shareable_lambda` впроваджені
      для створення shareable Proc або lambda.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` тепер виконує перевірку розміру для запобігання проблемам з
      нескінченними діапазонами. [[Bug #21654]]

    * `Range#overlap?` тепер коректно обробляє нескінченні (необмежені) діапазони.
      [[Bug #21185]]

    * Поведінка `Range#max` на безпочаткових цілочисельних діапазонах була виправлена.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Новий модуль верхнього рівня `Ruby` був визначений, він містить
      константи, пов'язані з Ruby. Цей модуль був зарезервований в Ruby 3.4
      і тепер офіційно визначений. [[Feature #20884]]

* Ruby::Box

    * Нова (експериментальна) функція для забезпечення розділення визначень.
      Для деталей про "Ruby Box", дивіться [doc/language/box.md](doc/language/box.md).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` тепер є основним класом, замість класу stdlib з автозавантаженням.
      [[Feature #21216]]

    * `Set#inspect` тепер використовує простіше відображення, подібне до літеральних масивів.
      (наприклад, `Set[1, 2, 3]` замість `#<Set: {1, 2, 3}>`). [[Feature #21389]]

    * Передача аргументів до `Set#to_set` та `Enumerable#to_set` тепер застаріла.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` та `TCPSocket.new` приймають іменований аргумент `open_timeout` для вказівки
      тайм-ауту для початкового з'єднання. [[Feature #21347]]
    * Коли користувацький тайм-аут виникав у `TCPSocket.new`, раніше могло бути викликано або `Errno::ETIMEDOUT`,
      або `IO::TimeoutError` залежно від ситуації.
      Цю поведінку було уніфіковано, так що `IO::TimeoutError` тепер викликається послідовно.
      (Зверніть увагу, що в `Socket.tcp` все ще є випадки, коли `Errno::ETIMEDOUT`
      може бути викликаний у подібних ситуаціях, і що в обох випадках `Errno::ETIMEDOUT` може бути
      викликаний, коли тайм-аут виникає на рівні ОС.)

* String

    * Оновлено Unicode до версії 17.0.0 та Emoji версії 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (також стосується Regexp)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, та `rstrip!`
       розширено для прийняття аргументів `*selectors`. [[Feature #21552]]

* Thread

    * Впроваджено підтримку аргументу `Thread#raise(cause:)`, подібного до
      `Kernel#raise`. [[Feature #21360]]

## Оновлення Stdlib

Ми перераховуємо лише зміни stdlib, які є помітними змінами функцій.

Інші зміни перераховані в наступних розділах. Ми також перерахували історію випусків з попередньої вбудованої версії, якою є Ruby 3.4.0, якщо вона має релізи на GitHub.

Наступні bundled gems підвищені з default gems.

* ostruct 0.6.3
  * 0.6.1 до [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 до [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 до [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 до [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 до [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 до [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 до [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 до [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 до [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

Наступний default gem додано.

* win32-registry 0.1.2

Наступні default gems оновлено.

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 до [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 до [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 до [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 до [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 до [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 до [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 до [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 до [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 до [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 до [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 до [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 до [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 до [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 до [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 до [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 до [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 до [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 до [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 до [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 до [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 до [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 до [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 до [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 до [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 до [v3.2.2][zlib-v3.2.2]

Наступні bundled gems оновлено.

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 до [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 до [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.5
  * 3.6.7 до [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 до [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 до [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 до [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 до [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 до [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 до [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 до [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 до [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 до [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 до [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 до [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 до [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 до [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12

### RubyGems та Bundler

Ruby 4.0 постачає RubyGems та Bundler версії 4. дивіться наступні посилання для деталей.

* [Оновлення до RubyGems/Bundler 4 - Блог RubyGems](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - Блог RubyGems](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - Блог RubyGems](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - Блог RubyGems](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - Блог RubyGems](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## Підтримувані платформи

* Windows

    * Припинено підтримку версій MSVC, старіших за 14.0 (_MSC_VER 1900).
      Це означає, що тепер потрібен Visual Studio 2015 або новіший.

## Проблеми сумісності

* Наступні методи були видалені з Ractor через додавання `Ractor::Port`:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` застарілий. [[Feature #15408]]

* `Process::Status#&` та `Process::Status#>>` були видалені.
  Вони були застарілими в Ruby 3.3. [[Bug #19868]]

* `rb_path_check` був видалений. Ця функція використовувалася для
  перевірки шляху `$SAFE`, яка була видалена в Ruby 2.7,
  і вже була застарілою.
  [[Feature #20971]]

* Backtrace для `ArgumentError` про "неправильну кількість аргументів" тепер
  включає ім'я класу або модуля отримувача (наприклад, у `Foo#bar`
  замість у `bar`). [[Bug #21698]]

* Backtraces більше не відображають `internal` кадри.
  Ці методи тепер виглядають так, ніби вони знаходяться у вихідному файлі Ruby,
  взгоджено з іншими методами, реалізованими на C. [[Bug #20968]]

  До:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  Після:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

## Проблеми сумісності Stdlib

* Бібліотека CGI видалена з default gems. Тепер ми надаємо лише `cgi/escape` для
  наступних методів:

    * `CGI.escape` та `CGI.unescape`
    * `CGI.escapeHTML` та `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` та `CGI.unescapeURIComponent`
    * `CGI.escapeElement` та `CGI.unescapeElement`

    [[Feature #21258]]

* З переміщенням `Set` зі stdlib до основного класу, `set/sorted_set.rb` був
  видалений, і `SortedSet` більше не є константою з автозавантаженням. Будь ласка,
  встановіть гем `sorted_set` і `require 'sorted_set'`, щоб використовувати `SortedSet`.
  [[Feature #21287]]


* Net::HTTP

    * Поведінка за замовчуванням, що автоматично встановлює заголовок `Content-Type`
      на `application/x-www-form-urlencoded` для запитів з тілом
      (наприклад, `POST`, `PUT`), коли заголовок не був явно встановлений, була
      видалена. Якщо ваш додаток покладався на це автоматичне значення за замовчуванням, ваші
      запити тепер будуть надсилатися без заголовка Content-Type, що потенційно
      порушить сумісність з певними серверами.
      [[GH-net-http #205]]

## Оновлення API C

* IO

    * `rb_thread_fd_close` застарілий і тепер нічого не робить (no-op). Якщо вам потрібно відкрити
      файлові дескриптори з розширень C для коду Ruby, створіть екземпляр `IO`,
      використовуючи `RUBY_IO_MODE_EXTERNAL`, і використовуйте `rb_io_close(io)` для його закриття (це
      також перериває та чекає на всі очікуючі операції на екземплярі
      `IO`). Пряме закриття файлових дескрипторів не перериває очікуючі
      операції і може призвести до невизначеної поведінки. Іншими словами, якщо два
      об'єкти `IO` спільно використовують один і той же файловий дескриптор, закриття одного не впливає на
      інший. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` тепер працює з або без GVL.
      Це дозволяє гемам уникати перевірки `ruby_thread_has_gvl_p`.
      Будь ласка, все ще будьте уважні щодо GVL. [[Feature #20750]]

* Set

    * API C для `Set` був доданий. Наступні методи підтримуються:
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

* `Class#new` (наприклад, `Object.new`) швидший у всіх випадках, але особливо при передачі іменованих аргументів. Це також було інтегровано в YJIT і ZJIT. [[Feature #21254]]
* Купи (heaps) GC з різними розмірами пулів тепер ростуть незалежно, зменшуючи використання пам'яті, коли тільки деякі пули містять довгоживучі об'єкти
* Очистка (sweeping) GC швидша на сторінках великих об'єктів
* "Generic ivar" об'єкти (String, Array, `TypedData`, тощо) тепер використовують новий внутрішній об'єкт "fields" для швидшого доступу до змінних екземпляра
* GC уникає підтримки внутрішньої таблиці `id2ref` поки вона не буде використана вперше, роблячи виділення `object_id` та очистку GC швидшими
* `object_id` та `hash` швидші на об'єктах Class та Module
* Більші bignum Integers можуть залишатися вбудованими, використовуючи виділення змінної ширини
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`,
  `StringScanner`, і деякі внутрішні об'єкти тепер захищені write-barrier,
  що зменшує накладні витрати GC.

### Ractor

Багато роботи було зроблено, щоб зробити Ractors більш стабільними, продуктивними та придатними до використання. Ці покращення наближають реалізацію Ractor до виходу зі статусу експериментальної.

* Покращення продуктивності
    * Заморожені рядки та таблиця символів внутрішньо використовують хеш-набір без блокування [[Feature #21268]]
    * Пошуки в кеші методів уникають блокування в більшості випадків
    * Доступ до змінних екземпляра класу (та generic ivar) швидший і уникає блокування
    * Конкуренція кешу CPU уникається при виділенні об'єктів шляхом використання лічильника per-ractor
    * Конкуренція кешу CPU уникається при xmalloc/xfree шляхом використання thread-local лічильника
    * `object_id` уникає блокування в більшості випадків
* Виправлення помилок та стабільність
    * Виправлені можливі взаємоблокування при поєднанні Ractors та Threads
    * Виправлені проблеми з require та autoload в Ractor
    * Виправлені проблеми кодування/перекодування між Ractors
    * Виправлені гонки (race conditions) в операціях GC та інвалідації методів
    * Виправлені проблеми з процесами, що розгалужуються (forking) після запуску Ractor
    * Кількість виділень GC тепер точна під Ractors
    * Виправлено TracePoints, які не працювали після GC [[Bug #19112]]

## JIT

* ZJIT
    * Впроваджено [експериментальний компілятор JIT на основі методів](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
       Там, де доступно, ZJIT можна ввімкнути під час виконання за допомогою опції `--zjit` або викликавши `RubyVM::ZJIT.enable`.
      Для збірки Ruby з підтримкою ZJIT потрібен Rust 1.85.0 або новіший.
    * Станом на Ruby 4.0.0, ZJIT швидший за інтерпретатор, але ще не такий швидкий, як YJIT.
      Ми заохочуємо експериментування з ZJIT, але радимо не розгортати його у виробництві на даний момент.
    * Наша мета — зробити ZJIT швидшим за YJIT і готовим до виробництва в Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` більше не працює в збірці за замовчуванням.
          Використовуйте `--enable-yjit=stats` при `configure` для ввімкнення його на `--yjit-stats`.
        * Додано `invalidate_everything` до статистики за замовчуванням, що
          інкрементується, коли весь код інвалідується через TracePoint.
    * Додано опції `mem_size:` та `call_threshold:` до `RubyVM::YJIT.enable`.
* RJIT
    * `--rjit` видалено. Ми перемістимо реалізацію API стороннього JIT
      до репозиторію [ruby/rjit](https://github.com/ruby/rjit).

Дивіться [НОВИНИ](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
для більш деталь.

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
з моменту Ruby 3.4.0!

Веселого Різдва, щасливого Нового року та приємного хакінгу з Ruby 4.0!

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

Ruby був вперше розроблений Matz'ом (Yukihiro Matsumoto) у 1993 році,
і зараз розробляється як Open Source. Він працює на багатьох платформах
і використовується по всьому світу, особливо для веб-розробки.

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
