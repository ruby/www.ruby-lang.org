---
layout: news_post
title: "Вышел Ruby 4.1.0-preview1"
author: "naruse"
translator: "ablzh"
date: 2026-10-12 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "4.1.0-preview1" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}.
Ruby 4.1 представляет локальный GC для Ractor, поддержку YJIT для Windows, autoload_relative,
а также содержит множество улучшений.

## Улучшения Ractor

Было проделано много работы, чтобы сделать Ractor более стабильными, производительными и удобными в использовании. Эти улучшения приближают реализацию Ractor к выходу из экспериментального статуса.

* Стандартный GC теперь работает **для каждого Ractor отдельно**: каждый Ractor выполняет сборку мусора в своей куче в собственном потоке, не останавливая остальные, а сборка «stop-the-world» запускается только тогда, когда это действительно необходимо (явный полный вызов `GC.start`, рост разделяемых объектов, освобождение куч завершившихся Ractor). Программы на Ractor с интенсивным выделением памяти теперь масштабируются аналогично форкнутым процессам.

* `GC.start(global: false)` можно использовать при работе нескольких Ractor для принудительного запуска локального для Ractor GC. По умолчанию `GC.start`, как и раньше, запускает глобальный GC (для всех Ractor). Этого также можно добиться с помощью `GC.start(global: true)`. Именованный аргумент `global` не оказывает эффекта, когда запущен только один Ractor.

  Заметные изменения в поведении:

  * `Ractor#value` возвращает значение только один раз; повторный вызов вызывает `Ractor::Error`.
  * `GC.disable`/`GC.enable` действуют как локальные для Ractor блокировки общепроцессного переключателя: вызов `GC.enable` в одном Ractor больше не переопределяет `GC.disable` в другом.
  * `ObjectSpace.each_object` перечисляет собственные объекты вызывающего Ractor, а также разделяемые объекты других Ractor (`ObjectSpace.dump_all` по-прежнему охватывает всё).
  * `ObjectSpace.define_finalizer` для объекта другого Ractor вызывает `Ractor::IsolationError`.

* `Ractor#monitor` теперь отправляет массив с указанием Ractor и того, что с ним произошло: `[ractor, :exited]` или `[ractor, :aborted]`, тогда как ранее отправлялся просто символ `:exited` или `:aborted`. Благодаря этому несколько Ractor могут отправлять сообщения в один порт, а получатель будет знать, какой именно из них завершил работу. Массив создаётся для принимающего Ractor, поэтому наблюдение за множеством Ractor не оставляет разделяемых объектов.

      r = Ractor.new { :ok }
      r.monitor(port = Ractor::Port.new)
      port.receive #=> [r, :exited]

  Таким образом, один порт может наблюдать за всей группой, что и требуется для супервизора:

      workers.each { |r| r.monitor port }

      until workers.empty?
        r, status = port.receive
        workers.delete(r)
        workers << restart(r) if status == :aborted
      end

## Изменения в языке

* `super` в методе модуля, вызванном через `super` из метода рефайнмента, теперь работает корректно.
  [[Feature #22309]]

* `Module#clone` и `Module#dup` больше не переписывают лексическую область видимости скопированных методов. Константы и переменные класса разрешаются через исходный класс, аналогично наследованию и примесям.
  [[Feature #21981]]

* `alias` и `Module#alias_method` в модуле теперь выводят предупреждение об устаревании, если исходный метод не принадлежит модулю или его предкам и был найден только за счёт отката к `Object`. Этот откат будет удалён в Ruby 4.3, и подобный псевдоним будет вызывать ошибку `NameError`.
  [[Bug #22276]]

* `alias` и `Module#alias_method` выводят предупреждение об устаревании, если исходный метод определён в добавленном через prepend модуле. Это поведение будет удалено в Ruby 4.3, а поиск псевдонимов будет начинаться с исходного класса (после добавленных через prepend модулей).
  [[Bug #22273]]

## Обновления основных классов

Примечание: перечислены только наиболее значимые обновления классов.

* C API

    * Добавлен флаг `RB_NOGVL_PENDING_INTR_FAIL` для `rb_nogvl`. `rb_nogvl` не входит в блокирующую область (и не вызывает переданную функцию), возвращая `0`, если текущий поток имеет ожидающие прерывания, включая прерывания, замаскированные с помощью `Thread.handle_interrupt`. Как и в существующем пути пропуска, `errno` равно `0`, так как функция не вызывалась.
    * `RHASH_TBL` объявлен устаревшим.  [[Feature #22232]]

* Array

    * `Array#pack` поддерживает новые форматы `R` и `r` для беззнаковых и знаковых целых чисел в кодировке LEB128. [[Feature #21785]]
    * `Array#pack` поддерживает новые форматы `x!` и `@!` для выравнивания текущего смещения по границе байта или по выравниванию ABI другой директивы. [[Feature #22185]]

* Dir

    * `Dir.glob` поддерживает `***/` для рекурсивного сопоставления с переходом по символическим ссылкам каталогов, останавливаясь на ссылках на каталоги-предки.
      [[Feature #17548]]

* ENV

    * Добавлен метод `ENV.fetch_values`. Он возвращает массив значений для указанных имён, вызывая `KeyError` для отсутствующих имён, если не передан блок. [[Feature #21781]]

* Fiber::Scheduler

    * Хук `fiber_interrupt` теперь обязателен. Планировщики, которые его не реализуют, больше не могут быть установлены с помощью `Fiber.set_scheduler`.

* GC

    * `GC.stat` принимает `scope: :ractor` (по умолчанию), `scope: :local` (синоним для `:ractor`) и `scope: :global`. При стандартном сборщике глобальная область отчитывается о суммарном количестве сборок и измеренном времени ЦП на маркировку и очистку по всем Ractor, включая историю из удалённых пространств объектов, не требуя создания снимка stop-the-world. Вызовы `GC.stat`, `GC.count` и `GC.total_time` без указания области сохраняют поведение для текущего Ractor.
    * `GC.stat` сообщает о новом ключе `:global_gc_count`: количестве циклов глобальной сборки мусора stop-the-world, инициированных текущим Ractor. Каждая глобальная сборка относится ровно к одному Ractor, поэтому значения суммируются по всем Ractor. `GC.stat(:global_gc_count, scope: :global)` сообщает общее количество для процесса, включая счётчики завершённых Ractor.
    * Глобальная сборка мусора не учитывается в `:major_gc_count`. Значение `:count` равно `:minor_gc_count` плюс `:major_gc_count` плюс `:global_gc_count` в обеих областях видимости. Если существует пространство объектов другого Ractor (включая оставшееся от завершённого Ractor, которое ещё не поглощено, или поглощённое со времени последней глобальной сборки), `GC.start` по умолчанию запускает глобальную сборку, поэтому увеличивает `:global_gc_count`, а не `:major_gc_count`; передайте `global: false` для локальной основной сборки.
    * Глобальное уплотнение (compaction) больше не учитывает перекрывающиеся интервалы ЦП в скалярной статистике времени GC. Интервалы реального времени (wall-time) в профилировщике не изменились.

* Hash

    * Методы `Hash.ruby2_keywords_hash?` и `Hash.ruby2_keywords_hash` объявлены устаревшими и будут удалены в Ruby 4.5. [[Feature #22205]]

* Integer

    * Добавлен метод `Integer#bit_count`. Он возвращает количество единичных битов (`1`) в двоичном представлении неотрицательного целого числа (число единичных битов, population count).
      [[Feature #20163]]

* IO::Buffer

    * Методы `read`, `write`, `pread` и `pwrite` теперь выполняют одну операцию ввода-вывода с использованием `(offset, length)`, где `length` — максимальный размер передачи. Неполные передачи возвращаются напрямую.

    * Соответствующие хуки планировщика файберов больше не являются экспериментальными и теперь используют тот же порядок аргументов `(offset, length)` и семантику единичной операции.

* Kernel

    * Добавлены методы `Kernel#autoload_relative` и `Module#autoload_relative`. Эти методы работают аналогично `autoload`, но разрешают путь к файлу относительно того файла, где был вызван метод, подобно `require_relative`. Это упрощает автозагрузку констант из файлов в том же каталоге без необходимости жёстко прописывать абсолютные пути или манипулировать `$LOAD_PATH`.
      [[Feature #15330]]

* MatchData

    * Добавлен метод `MatchData#integer_at`. Он преобразует найденную подстроку в целое число и возвращает результат. [[Feature #21932]]

* Module

    * Добавлен метод `Module#descendants`. Он возвращает массив классов и модулей, у которых получатель находится среди предков. [[Feature #9779]]
    * Метод `Module#ruby2_keywords` и метод верхнего уровня `ruby2_keywords` объявлены устаревшими и будут удалены в Ruby 4.4. [[Feature #22205]]
    * `Module#method_defined?` теперь принимает третий необязательный аргумент для сопоставления также и с приватными методами. [[Feature #22297]]

* ObjectSpace

    * Метод `ObjectSpace._id2ref` был удалён.  [[Feature #22135]]

* Proc

    * Добавлен метод `Proc#refined`. Он возвращает новый объект `Proc`, который ведёт себя аналогично получателю, но с активированными внутри его тела рефайнментами указанных модулей, не затрагивая исходный `Proc`.
      [[Feature #22097]]
    * Метод `Proc#ruby2_keywords` объявлен устаревшим и будет удалён в Ruby 4.4.
      [[Feature #22205]]

* Range

    * Добавлен метод `Range#clamp`. Он возвращает новый экземпляр `Range`, начальное и конечное значения которого ограничены заданными пределами. [[Feature #22175]]

* Regexp

    * Все экземпляры `Regexp` теперь заморожены (frozen), а не только литералы. Подклассы `Regexp` не замораживаются для обратной совместимости.
      [[Feature #8948]]

* Set

    * Устаревшее поведение, при котором `Set#to_set`, `Range#to_set` и `Enumerable#to_set` принимали аргументы, было удалено. [[Feature #21390]]

* String

    * `String#unpack` и `String#unpack1` поддерживают новые форматы `R` и `r` для беззнаковых и знаковых целых чисел в кодировке LEB128. [[Feature #21785]]
    * `String#unpack` и `String#unpack1` поддерживают новый формат `^`, который возвращает текущее смещение. Полезно при использовании с форматами переменной длины, такими как LEB128. [[Feature #21796]]
    * `String#unpack` и `String#unpack1` поддерживают новые форматы `x!` и `@!` для выравнивания текущего смещения по границе байта или по выравниванию ABI другой директивы. [[Feature #22185]]
    * Добавлены базовые битовые операции. `String#bit_get`, `String#bit_set?`, `String#bit_set`, `String#bit_clear`, `String#bit_flip` и `String#bit_count` работают с отдельными битами, а `String#bitwise_not`, `String#bitwise_and`, `String#bitwise_or`, `String#bitwise_xor` (вместе с их вариантами с `!`) — со всей строкой. [[Feature #22118]]
    * `String#tr` теперь принимает `Hash` для замены из нескольких символов.
      [[Feature #22238]]

* Symbol

    * `Symbol#to_s` теперь возвращает замороженную строку. [[Feature #22137]]

* Thread

    * Присваивание `nil` с помощью `Thread#thread_variable_set` теперь удаляет локальную переменную потока. [[Feature #19333]]

* Thread::Backtrace::Location

    * Добавлен метод `Thread::Backtrace::Location#source_range`. Он возвращает `Ruby::SourceRange` для выражения Ruby, связанного с фреймом.

## Обновления стандартной библиотеки (Stdlib)

* Psych

    * Добавлен экспериментальный бэкенд libfyaml. Он включается только при сборке psych с флагом `--enable-libfyaml`, а стандартный бэкенд libyaml в остальных случаях остаётся без изменений. Не поддерживается в Windows. [[GH-psych #805]]

* Ruby::Prism

    * Добавлен `Ruby::Prism`. Это встроенный в интерпретатор парсер prism, то есть тот самый парсер, который выполнял синтаксический анализ запущенной программы, независимо от гема prism. Он загружается автоматически (autoloaded). `Method#syntax_tree` и другие методы возвращают его узлы. Его API может меняться между минорными версиями Ruby; используйте гем `prism`, если вам не нужен именно парсер текущего запущенного интерпретатора. [[Bug #22379]]

### Добавлены следующие bundled гемы.


Мы перечисляем только изменения stdlib, которые являются заметными изменениями функциональности.

Другие изменения перечислены в следующих разделах. Мы также перечислили историю релизов с предыдущей поставляемой версии, которой является Ruby 4.0.0, если у нее есть релизы на GitHub.

### Следующие bundled гемы переведены из статуса default гемов.

* prism 1.9.0
* tsort 0.2.0
* win32-registry 0.1.2

### Следующие bundled гемы удалены.

* net-ftp 0.3.9
* net-pop 0.1.2

Они по-прежнему доступны на rubygems.org и могут быть установлены с помощью `gem install`. [[Feature #21835]]

### Добавлены следующие default гемы.

### Следующие default гемы обновлены.

* RubyGems 4.1.0.beta2
  * 4.0.3 to [v4.0.4][RubyGems-v4.0.4], [v4.0.5][RubyGems-v4.0.5], [v4.0.6][RubyGems-v4.0.6], [v4.0.7][RubyGems-v4.0.7], [v4.0.8][RubyGems-v4.0.8], [v4.0.9][RubyGems-v4.0.9], [v4.0.10][RubyGems-v4.0.10], [v4.0.11][RubyGems-v4.0.11], [v4.0.12][RubyGems-v4.0.12], [v4.0.13][RubyGems-v4.0.13], [v4.0.14][RubyGems-v4.0.14], [v4.0.15][RubyGems-v4.0.15], [v4.0.16][RubyGems-v4.0.16], [v4.0.17][RubyGems-v4.0.17], [v4.0.18][RubyGems-v4.0.18], [v4.0.19][RubyGems-v4.0.19], [v4.0.20][RubyGems-v4.0.20], [v4.0.21][RubyGems-v4.0.21], [v4.0.22][RubyGems-v4.0.22], [v4.1.0.beta1][RubyGems-v4.1.0.beta1], [v4.1.0.beta2][RubyGems-v4.1.0.beta2]
* bundler 4.1.0.beta2
  * 4.0.3 to [v4.0.4][bundler-v4.0.4], [v4.0.5][bundler-v4.0.5], [v4.0.6][bundler-v4.0.6], [v4.0.7][bundler-v4.0.7], [v4.0.8][bundler-v4.0.8], [v4.0.9][bundler-v4.0.9], [v4.0.10][bundler-v4.0.10], [v4.0.11][bundler-v4.0.11], [v4.0.12][bundler-v4.0.12], [v4.0.13][bundler-v4.0.13], [v4.0.14][bundler-v4.0.14], [v4.0.15][bundler-v4.0.15], [v4.0.16][bundler-v4.0.16], [v4.0.17][bundler-v4.0.17]
* date 3.6.0
  * 3.5.1 to [v3.6.0][date-v3.6.0]
* delegate 0.7.0
  * 0.6.1 to [v0.7.0][delegate-v0.7.0]
* digest 3.3.0
  * 3.2.1 to [v3.3.0][digest-v3.3.0]
* erb 6.1.0
  * 6.0.1 to [v6.0.1.1][erb-v6.0.1.1], [v6.0.2][erb-v6.0.2], [v6.0.3][erb-v6.0.3], [v6.0.4][erb-v6.0.4], [v6.0.5][erb-v6.0.5], [v6.0.6][erb-v6.0.6], [v6.0.7][erb-v6.0.7]
* error_highlight 0.7.2
* etc 1.5.0
  * 1.4.6 to [v1.5.0][etc-v1.5.0]
* fileutils 1.8.1
  * 1.8.0 to [v1.8.1][fileutils-v1.8.1]
* io-console 0.9.4
  * 0.8.2 to [v0.9.0][io-console-v0.9.0], [v0.9.1][io-console-v0.9.1], [v0.9.2][io-console-v0.9.2], [v0.9.3][io-console-v0.9.3], [v0.9.4][io-console-v0.9.4]
* io-wait 999.999.999
* ipaddr 1.2.9
  * 1.2.8 to [v1.2.9][ipaddr-v1.2.9]
* json 3.0.2
  * 2.18.0 to [v2.18.1][json-v2.18.1], [v2.19.0][json-v2.19.0], [v2.19.1][json-v2.19.1], [v2.19.2][json-v2.19.2], [v2.19.3][json-v2.19.3], [v2.19.4][json-v2.19.4], [v2.19.5][json-v2.19.5], [v2.19.6][json-v2.19.6], [v2.19.7][json-v2.19.7], [v2.19.8][json-v2.19.8], [v2.19.9][json-v2.19.9], [v2.20.0][json-v2.20.0], [v2.21.0][json-v2.21.0], [v2.21.2][json-v2.21.2], [v3.0.0.rc1][json-v3.0.0.rc1], [v3.0.0][json-v3.0.0]
* net-http 0.10.0
  * 0.9.1 to [v0.10.0][net-http-v0.10.0]
* net-protocol 0.4.0
  * 0.2.2 to [v0.3.0][net-protocol-v0.3.0], [v0.4.0][net-protocol-v0.4.0]
* open3 0.3.0
  * 0.2.1 to [v0.3.0][open3-v0.3.0]
* openssl 4.0.2
  * 4.0.0 to [v4.0.1][openssl-v4.0.1], [v4.0.2][openssl-v4.0.2]
* pp 0.6.4
  * 0.6.3 to [v0.6.4][pp-v0.6.4]
* prettyprint 0.2.1
  * 0.2.0 to [v0.2.1][prettyprint-v0.2.1]
* psych 5.5.0
  * 5.3.1 to [v5.4.0][psych-v5.4.0], [v5.5.0][psych-v5.5.0]
* resolv 0.8.1
  * 0.7.0 to [v0.7.1][resolv-v0.7.1], [v0.7.2][resolv-v0.7.2], [v0.8.0][resolv-v0.8.0], [v0.8.1][resolv-v0.8.1]
* stringio 3.2.1.dev
* strscan 3.1.9.dev
  * 3.1.6 to [v3.1.7][strscan-v3.1.7], [v3.1.8][strscan-v3.1.8]
* syntax_suggest 3.0.0
* tempfile 0.3.2
  * 0.3.1 to [v0.3.2][tempfile-v0.3.2]
* time 0.5.0
  * 0.4.2 to [v0.5.0][time-v0.5.0]
* timeout 0.6.1
  * 0.6.0 to [v0.6.1][timeout-v0.6.1]
* tmpdir 0.3.2
  * 0.3.1 to [v0.3.2][tmpdir-v0.3.2]
* uri 1.1.2
  * 1.1.1 to [v1.1.2][uri-v1.1.2]
* zlib 3.2.4
  * 3.2.2 to [v3.2.3][zlib-v3.2.3], [v3.2.4][zlib-v3.2.4]

### Следующие bundled гемы обновлены.

* minitest 6.0.6
* power_assert 3.1.0
  * 3.0.1 to [v3.1.0][power_assert-v3.1.0]
* rake 13.4.2
  * 13.3.1 to [v13.4.0][rake-v13.4.0], [v13.4.1][rake-v13.4.1], [v13.4.2][rake-v13.4.2]
* test-unit 3.7.8
  * 3.7.5 to [3.7.6][test-unit-3.7.6], [3.7.7][test-unit-3.7.7], [3.7.8][test-unit-3.7.8]
* rss 0.3.3
  * 0.3.2 to [0.3.3][rss-0.3.3]
* net-imap 0.6.7
  * 0.6.2 to [v0.6.3][net-imap-v0.6.3], [v0.6.4][net-imap-v0.6.4], [v0.6.4.1][net-imap-v0.6.4.1], [v0.6.5][net-imap-v0.6.5], [v0.6.6][net-imap-v0.6.6], [v0.6.7][net-imap-v0.6.7]
* net-smtp 0.5.2
  * 0.5.1 to [v0.5.2][net-smtp-v0.5.2]
* rbs 4.2.0
  * 3.10.0 to [v3.10.1][rbs-v3.10.1], [v3.10.2][rbs-v3.10.2], [v3.10.3][rbs-v3.10.3], [v3.10.4][rbs-v3.10.4], [v4.0.0.dev.1][rbs-v4.0.0.dev.1], [v4.0.0.dev.2][rbs-v4.0.0.dev.2], [v4.0.0.dev.3][rbs-v4.0.0.dev.3], [v4.0.0.dev.4][rbs-v4.0.0.dev.4], [v4.0.0.dev.5][rbs-v4.0.0.dev.5], [v4.0.0][rbs-v4.0.0], [v4.0.1.dev.1][rbs-v4.0.1.dev.1], [v4.0.1.dev.2][rbs-v4.0.1.dev.2], [v4.0.1][rbs-v4.0.1], [v4.0.2][rbs-v4.0.2], [v4.0.3][rbs-v4.0.3], [v4.1.0.pre.1][rbs-v4.1.0.pre.1], [v4.1.0.pre.2][rbs-v4.1.0.pre.2], [v4.1.0][rbs-v4.1.0], [v4.1.1.pre.1][rbs-v4.1.1.pre.1], [v4.1.1][rbs-v4.1.1], [v4.1.2][rbs-v4.1.2], [v4.1.3][rbs-v4.1.3], [v4.2.0.pre.1][rbs-v4.2.0.pre.1], [v4.2.0][rbs-v4.2.0]
* typeprof 0.33.2
* mutex_m 0.3.0
* bigdecimal 4.1.3
  * 4.0.1 to [v4.1.0][bigdecimal-v4.1.0], [v4.1.1][bigdecimal-v4.1.1], [v4.1.2][bigdecimal-v4.1.2], [v4.1.3][bigdecimal-v4.1.3]
* resolv-replace 0.2.0
  * 0.1.1 to [v0.2.0][resolv-replace-v0.2.0]
* nkf 0.3.0
  * 0.2.0 to [v0.3.0][nkf-v0.3.0]
* syslog 0.4.0
  * 0.3.0 to [v0.4.0][syslog-v0.4.0]
* csv 3.3.6
  * 3.3.5 to [v3.3.6][csv-v3.3.6]
* repl_type_completor 0.1.16
  * 0.1.12 to [v0.1.13][repl_type_completor-v0.1.13], [v0.1.14][repl_type_completor-v0.1.14], [v0.1.15][repl_type_completor-v0.1.15], [v0.1.16][repl_type_completor-v0.1.16]
* pstore 0.2.1
  * 0.2.0 to [v0.2.1][pstore-v0.2.1]
* rdoc 8.1.0
  * 7.0.3 to [v7.0.4][rdoc-v7.0.4], [v7.1.0][rdoc-v7.1.0], [v7.2.0][rdoc-v7.2.0], [v8.0.0][rdoc-v8.0.0], [v8.1.0][rdoc-v8.1.0]
* win32ole 1.9.3
  * 1.9.2 to [v1.9.3][win32ole-v1.9.3]
* irb 1.18.0
  * 1.16.0 to [v1.17.0][irb-v1.17.0], [v1.18.0][irb-v1.18.0]
* reline 0.7.0
  * 0.6.3 to [v0.7.0][reline-v0.7.0]

### RubyGems и Bundler

В составе Ruby 4.1 поставляются RubyGems и Bundler версии 4. См. подробности по следующим ссылкам.

## Поддерживаемые платформы

* Был удалён код поддержки следующих платформ. Их поставщики или дистрибьюторы прекратили поддержку, отсутствует среда для тестирования Ruby на них, и ни у одной из них нет мейнтейнера платформы.

    * AmigaOS
    * AtheOS
    * BSD/OS (BSDi)
    * ESIX
    * EWS-UX (NEC EWS4800)
    * FreeBSD, NetBSD и OpenBSD с бинарными файлами a.out
    * GNU/kFreeBSD
    * GNU/kOpenSolaris
    * HI-UX/MPP
    * HP-UX на HP 9000 Series 300
    * Interix (Windows Services for UNIX)
    * IRIX
    * MirOS BSD
    * NeXTSTEP, OpenStep и Rhapsody
    * OSF/1 (Tru64 UNIX)
    * QNX Neutrino
    * SunOS 4 (Solaris, то есть SunOS 5, не затронута)
    * System V Release 4
    * UNICOS/mp (Cray X1)
    * UX/PDS

* Был удалён код поддержки для следующих устаревших версий.

    * Cygwin 1.3 и более ранние версии
    * Solaris 9 и более ранние версии
    * Linux 2.6.23 и более ранние версии (RHEL 5)

* В Windows 10 1703 или новее больше не требуется значение реестра `LongPathsEnabled` для использования путей длиннее 260 символов. Это применимо к любому процессу, запускающему интерпретатор, включая программы, встраивающие libruby. Каждый компонент пути по-прежнему ограничен 255 символами, а дочерний процесс по-прежнему запускается с текущим каталогом, ограниченным `MAX_PATH`. [[Bug #18947]]

* Для сборки Ruby с помощью MSVC теперь требуется Visual Studio 2017 версии 15.8 (`_MSC_VER` 1915) или новее.

* Ruby, собранный с помощью MSVC, теперь требует Windows 10 версии 1809 (сборка 17763) или Windows Server 2019 или новее. Более ранние выпуски Windows 10 и Windows Server 2016 больше не поддерживаются.

* Для Ruby на macOS теперь требуется Mac OS X 10.6 или новее. Mac OS X 10.5 и компьютеры Mac на базе PowerPC больше не поддерживаются.

## Проблемы совместимости

* Класс или модуль теперь может быть изменён только тем Ractor, который его создал — его *владельцем* (*owner*). Определение, удаление или отмена определения методов, `alias`, изменение видимости, `include`/`prepend`, `Module#refine`, определение или удаление констант, регистрация `autoload`, запись собственных переменных экземпляра и переменных класса, `Module#freeze` и `Module#set_temporary_name` вызывают `Ractor::IsolationError` в любом другом Ractor. Чтение остаётся без изменений. Всё, что определено при запуске или главным Ractor (включая подключённые через `require` библиотеки), принадлежит главному Ractor, поэтому неосновной Ractor больше не может модифицировать их (monkey-patch); а поскольку определение константы в чужом классе запрещено, он также не может определить имя класса или модуля верхнего уровня. Взамен Ractor получает возможность полноценно использовать классы, которые он создал сам, включая неразделяемые значения констант, переменных экземпляра и переменных класса, чего ранее не мог делать даже главный Ractor. См. doc/language/ractor.md. [[Feature #22226]]

* `Kernel#at_exit` и `END {}` теперь вызывают `Ractor::IsolationError` при вызове в неосновном Ractor. Ранее зарегистрированный обработчик выполнялся в главном Ractor при завершении процесса, что вызывало путаницу. [[Feature #22139]]

* `Ractor.make_shareable` теперь вызывает `Ractor::Error` для объекта `IO`, а `Ractor.shareable?` возвращает `false` для него. Ранее замороженный `IO` был разделяемым, но почти все его методы вызывают `FrozenError`, и он по-прежнему может ссылаться на неразделяемые объекты через члены структуры `rb_io_t`.

* `Random.urandom` теперь вызывает `RangeError` для любого размера, слишком большого для типа `long`, как и `Random#bytes`. Ранее размер, который помещался в `unsigned long`, вызывал `ArgumentError`. [[Feature #22400]]

* `Struct#[]` и `Struct#[]=` теперь вызывают `IndexError` для любого выходящего за пределы целочисленного индекса, который помещается в `long`. Индекс, выходящий за пределы диапазона `int`, ранее вызывал `RangeError`. [[Feature #22400]]

## Проблемы совместимости стандартной библиотеки

* prism теперь является bundled гемом. При использовании Bundler вызов `require "prism"` требует указания prism в Gemfile. Используйте `Ruby::Prism` для парсера текущего запущенного интерпретатора. [[Bug #22379]]

* `Etc.getlogin` в Windows теперь возвращает имя пользователя, определённое при запуске процесса (из переменной окружения `USER` или `USERNAME`, либо через `GetUserName()`). Ранее оно отслеживало последующие изменения в `ENV['USER']`.

* Socket

    * В Windows отклонённое или недоступное соединение теперь вызывает соответствующий класс `Errno`, как только о нём сообщает Winsock, вместо вызова `Errno::ETIMEDOUT` после истечения всего времени `connect_timeout`. Код, перехватывающий `Errno::ETIMEDOUT`, должен вместо этого перехватывать реальную ошибку.

    * В Windows `BasicSocket#getsockopt(:SOCKET, :ERROR)` теперь сообщает errno, как и на других платформах, вместо исходного кода ошибки WinSock. Код, сравнивающий его со значением `WSAE*`, должен вместо этого сравнивать его с соответствующим `Errno::*::Errno`.

    [[Bug #18661]]

## Обновления C API

### Встроенные TypedData (Embedded TypedData)

* Флаг `RUBY_TYPED_EMBEDDABLE` теперь общедоступен, задокументирован и может использоваться C-расширениями. Он позволяет выделять C-структуры непосредственно в слоты объектов Ruby, что сокращает переходы по указателям (pointer chasing) и в ряде случаев снижает использование памяти. Подробности см. в документации по C-расширениям. [[Feature #21853]]

* Добавлены новые функции аллокатора, вдохновлённые C23, которые принимают предыдущий размер памяти. Это позволяет сборщику мусора Ruby лучше отслеживать использование памяти и оптимизировать свои эвристики. Это также повышает производительность системных аллокаторов, поддерживающих `free_sized` из C23.

  Однако важно отметить, что передача некорректного размера в эти функции является неопределённым поведением (UB) и может привести к сбоям или утечкам памяти.

  - `ruby_xfree_sized(void *ptr, size_t size)`
  - `ruby_xrealloc_sized(void *ptr, size_t newsiz, size_t oldsiz)`
  - `ruby_xrealloc2_sized(void *ptr, size_t newelems, size_t newsiz, size_t oldelems)`

  [[Feature #21861]]

### Регистрация адресов GC в области видимости Ractor

* Функции `rb_gc_register_address` и `rb_global_variable` теперь регистрируют адрес в вызывающем Ractor, и только сборщик мусора этого Ractor помечает сохранённый объект.

  Любой Ractor может зарегистрировать адрес, однако сохраняемое по нему значение должно быть специальной константой, разделяемым объектом или неразделяемым объектом, владельцем которого является регистрирующий Ractor. Сохранение неразделяемого объекта другого Ractor может привести к освобождению объекта в то время, как адрес всё ещё ссылается на него (use-after-free).

  Если адрес существует в течение всего времени жизни процесса (статический `VALUE`), регистрируйте его из главного Ractor или сохраняйте разделяемые значения.

  Когда регистрирующий Ractor присоединяется через `Ractor#value`, оставшиеся регистрации перемещаются в присоединяющийся Ractor; в противном случае они перемещаются в главный Ractor после сборки мусора завершившегося Ractor.

  [[Feature #22277]]

### Тип для длин и индексов

* Добавлены типы `rb_len_t` и `rb_ulen_t` для указания длин и индексов объектов String, Array и MatchData, а также макросы `LEN2NUM`, `NUM2LEN`, `ULEN2NUM`, `rb_len2int`, спецификатор формата `PRIdLEN` и его аналоги, константы `RB_LEN_MAX`, `RB_LEN_MIN`, `RB_ULEN_MAX`, `SIZEOF_RB_LEN_T` и `HAVE_RB_LEN_T`. `RbConfig::SIZEOF["rb_len_t"]` предоставляет его размер в extconf.rb. На данный момент они представляют собой тип `long` на всех платформах, и C API, принимающий такие длины (например, `RSTRING_LEN` и `rb_range_beg_len`), использует их. В последующих версиях они станут 64-битными на mswin, поэтому расширениям следует хранить эти длины в `rb_len_t`. [[Feature #22400]]

* Добавлена функция `rb_len2long` для преобразования `rb_len_t` в `long`, вызывающая `RangeError` через новую функцию `rb_out_of_long`, если значение не помещается, для расширений, которые хранят длину в `long`. [[Feature #22400]]

### Удалённые API

Следующие API, которые были объявлены устаревшими много лет назад, удалены.
[[Feature #21768]]

* старые функции отложенных задач (postponed jobs),
* тип и функции для нетипизированных объектов данных (untyped data objects),
* старые API для выделения объектов данных,
* перечисления и макросы небезопасных/доверенных данных (taintedness/trustedness),
* функция `rb_gc_force_recycle`,
* функция `rb_iterate`,
* а также некоторые функции и константы для внутреннего использования.

## Улучшения реализации

- Стандартный сборщик мусора был переключён с аллокатора на основе свободных списков (freelist allocator) на bump pointer allocator. [[PR #17201]]

- Гемы error_highlight, did_you_mean и syntax_suggest теперь загружаются лениво при первом отображении ошибки, а не при запуске интерпретатора, что сокращает время старта. Метод `Process.warmup` загружает их сразу, чтобы pre-forking серверы сохраняли их код в разделяемой памяти copy-on-write. [[Feature #21951]]

### Планировщик потоков M:N

* Планировщик масштабируется с ростом числа ожидающих потоков и Ractor, тогда как ранее он обходил список или использовал одну общую блокировку для всех:

  * Ожидание с тайм-аутом теперь находится в иерархическом таймерном колесе (timer wheel), а не в списке, отсортированном по дедлайну, вставка в который выполнялась линейным поиском.
  * Файловый дескриптор (fd) остаётся активным в бэкенде между ожиданиями, вместо добавления перед каждым ожиданием и удаления после каждого пробуждения.
  * Учёт io-wait шардирован по fd, а не сериализован с единой блокировкой для всех fd.
  * Ожидание по тайм-ауту на fd обрабатывается планировщиком вместо перехода в блокирующую область, требовавшего переключения на нативный поток на каждое ожидание.
  * Переключение контекста, а также выход из общего пула или повторное присоединение к нему больше не захватывают глобальную блокировку планировщика.

* Переменная окружения `RUBY_MN_THREADS` теперь регулирует планирование M:N от полного его отключения до повсеместного включения. Значение `-1` является новым: потоки Ractor работали в режиме M:N с момента добавления планировщика без возможности отключения. Поведение для `0` и `1` не изменилось.

  | | главный поток | другие потоки главного Ractor | потоки Ractor |
  |---|---|---|---|
  | `-1` | 1:1 | 1:1 | 1:1 |
  | `0` или не задано | 1:1 | 1:1 | M:N |
  | `1` | 1:1 | M:N | M:N |
  | `2` | M:N | M:N | M:N |

* Значение `RUBY_MN_THREADS=2` является новым. Главный поток возобновляет работу как любой другой M:N-поток, вместо пробуждения на собственном нативном потоке, что обходится на порядок дороже. Это даёт выигрыш, когда главный поток выполняет основную работу, и нейтрально в случаях, когда он только запускает другие потоки и ожидает их завершения.

  В этом случае главный поток больше не привязан к одному потоку ОС, что планировщик M:N уже предполагал для всех остальных потоков:

  * C-расширения, хранящие состояние отдельно для каждого потока ОС, должны вызывать `rb_thread_lock_native_thread()`.
  * Код, который обязан выполняться на начальном потоке процесса, не будет работать вовсе, даже с фиксацией (pinning): macOS AppKit и CFRunLoop, а также хост-программы, которые встраивают Ruby и возвращаются в свой собственный главный цикл событий.

* Имя потока ОС больше не устанавливается из потока Ruby для M:N-потоков: один нативный поток выполняет множество потоков Ruby за время своей работы. Вызов `Thread#name=` уже пропускался по той же причине.

## JIT

### YJIT

* YJIT теперь поддерживает Windows (mswin) на процессорах x64. Конфигурация осуществляется с помощью `win32\configure.bat --enable-yjit`, для чего требуется `rustc` с таргетом `x86_64-pc-windows-msvc`. Поддерживается только релизная сборка; MinGW не поддерживается. [[Feature #18439]]

Подробности можно узнать в [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html) или [журнале коммитов](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }}).

С момента выпуска Ruby 4.0.0 [изменено {{ release.stats.files_changed }} файлов, добавлено {{ release.stats.insertions }} строк(+), удалено {{ release.stats.deletions }} строк(-)](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }}#file_bucket)!

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

Ruby был впервые разработан Matz (Yukihiro Matsumoto) в 1993 году и сейчас развивается как open source. Он работает на различных платформах и используется во всем мире, особенно для веб-разработки.

[Bug #18661]: https://bugs.ruby-lang.org/issues/18661
[Bug #18947]: https://bugs.ruby-lang.org/issues/18947
[Bug #22273]: https://bugs.ruby-lang.org/issues/22273
[Bug #22276]: https://bugs.ruby-lang.org/issues/22276
[Bug #22379]: https://bugs.ruby-lang.org/issues/22379
[Feature #8948]: https://bugs.ruby-lang.org/issues/8948
[Feature #9779]: https://bugs.ruby-lang.org/issues/9779
[Feature #15330]: https://bugs.ruby-lang.org/issues/15330
[Feature #17548]: https://bugs.ruby-lang.org/issues/17548
[Feature #18439]: https://bugs.ruby-lang.org/issues/18439
[Feature #20163]: https://bugs.ruby-lang.org/issues/20163
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21768]: https://bugs.ruby-lang.org/issues/21768
[Feature #21781]: https://bugs.ruby-lang.org/issues/21781
[Feature #21785]: https://bugs.ruby-lang.org/issues/21785
[Feature #21796]: https://bugs.ruby-lang.org/issues/21796
[Feature #21835]: https://bugs.ruby-lang.org/issues/21835
[Feature #21853]: https://bugs.ruby-lang.org/issues/21853
[Feature #21861]: https://bugs.ruby-lang.org/issues/21861
[Feature #21932]: https://bugs.ruby-lang.org/issues/21932
[Feature #21951]: https://bugs.ruby-lang.org/issues/21951
[Feature #21981]: https://bugs.ruby-lang.org/issues/21981
[Feature #22097]: https://bugs.ruby-lang.org/issues/22097
[Feature #22118]: https://bugs.ruby-lang.org/issues/22118
[Feature #22135]: https://bugs.ruby-lang.org/issues/22135
[Feature #22137]: https://bugs.ruby-lang.org/issues/22137
[Feature #22139]: https://bugs.ruby-lang.org/issues/22139
[Feature #22175]: https://bugs.ruby-lang.org/issues/22175
[Feature #22185]: https://bugs.ruby-lang.org/issues/22185
[Feature #22205]: https://bugs.ruby-lang.org/issues/22205
[Feature #22226]: https://bugs.ruby-lang.org/issues/22226
[Feature #22232]: https://bugs.ruby-lang.org/issues/22232
[Feature #22238]: https://bugs.ruby-lang.org/issues/22238
[Feature #22297]: https://bugs.ruby-lang.org/issues/22297
[Feature #22309]: https://bugs.ruby-lang.org/issues/22309
[Feature #22400]: https://bugs.ruby-lang.org/issues/22400
[PR #17201]: https://github.com/ruby/ruby/pull/17201
[GH-psych #805]: https://github.com/ruby/psych/pull/805
[RubyGems-v4.0.4]: https://github.com/rubygems/rubygems/releases/tag/v4.0.4
[RubyGems-v4.0.5]: https://github.com/rubygems/rubygems/releases/tag/v4.0.5
[RubyGems-v4.0.6]: https://github.com/rubygems/rubygems/releases/tag/v4.0.6
[RubyGems-v4.0.7]: https://github.com/rubygems/rubygems/releases/tag/v4.0.7
[RubyGems-v4.0.8]: https://github.com/rubygems/rubygems/releases/tag/v4.0.8
[RubyGems-v4.0.9]: https://github.com/rubygems/rubygems/releases/tag/v4.0.9
[RubyGems-v4.0.10]: https://github.com/rubygems/rubygems/releases/tag/v4.0.10
[RubyGems-v4.0.11]: https://github.com/rubygems/rubygems/releases/tag/v4.0.11
[RubyGems-v4.0.12]: https://github.com/rubygems/rubygems/releases/tag/v4.0.12
[RubyGems-v4.0.13]: https://github.com/rubygems/rubygems/releases/tag/v4.0.13
[RubyGems-v4.0.14]: https://github.com/rubygems/rubygems/releases/tag/v4.0.14
[RubyGems-v4.0.15]: https://github.com/rubygems/rubygems/releases/tag/v4.0.15
[RubyGems-v4.0.16]: https://github.com/rubygems/rubygems/releases/tag/v4.0.16
[RubyGems-v4.0.17]: https://github.com/rubygems/rubygems/releases/tag/v4.0.17
[RubyGems-v4.0.18]: https://github.com/rubygems/rubygems/releases/tag/v4.0.18
[RubyGems-v4.0.19]: https://github.com/rubygems/rubygems/releases/tag/v4.0.19
[RubyGems-v4.0.20]: https://github.com/rubygems/rubygems/releases/tag/v4.0.20
[RubyGems-v4.0.21]: https://github.com/rubygems/rubygems/releases/tag/v4.0.21
[RubyGems-v4.0.22]: https://github.com/rubygems/rubygems/releases/tag/v4.0.22
[RubyGems-v4.1.0.beta1]: https://github.com/rubygems/rubygems/releases/tag/v4.1.0.beta1
[RubyGems-v4.1.0.beta2]: https://github.com/rubygems/rubygems/releases/tag/v4.1.0.beta2
[bundler-v4.0.4]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.4
[bundler-v4.0.5]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.5
[bundler-v4.0.6]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.6
[bundler-v4.0.7]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.7
[bundler-v4.0.8]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.8
[bundler-v4.0.9]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.9
[bundler-v4.0.10]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.10
[bundler-v4.0.11]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.11
[bundler-v4.0.12]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.12
[bundler-v4.0.13]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.13
[bundler-v4.0.14]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.14
[bundler-v4.0.15]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.15
[bundler-v4.0.16]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.16
[bundler-v4.0.17]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.17
[date-v3.6.0]: https://github.com/ruby/date/releases/tag/v3.6.0
[delegate-v0.7.0]: https://github.com/ruby/delegate/releases/tag/v0.7.0
[digest-v3.3.0]: https://github.com/ruby/digest/releases/tag/v3.3.0
[erb-v6.0.1.1]: https://github.com/ruby/erb/releases/tag/v6.0.1.1
[erb-v6.0.2]: https://github.com/ruby/erb/releases/tag/v6.0.2
[erb-v6.0.3]: https://github.com/ruby/erb/releases/tag/v6.0.3
[erb-v6.0.4]: https://github.com/ruby/erb/releases/tag/v6.0.4
[erb-v6.0.5]: https://github.com/ruby/erb/releases/tag/v6.0.5
[erb-v6.0.6]: https://github.com/ruby/erb/releases/tag/v6.0.6
[erb-v6.0.7]: https://github.com/ruby/erb/releases/tag/v6.0.7
[etc-v1.5.0]: https://github.com/ruby/etc/releases/tag/v1.5.0
[fileutils-v1.8.1]: https://github.com/ruby/fileutils/releases/tag/v1.8.1
[io-console-v0.9.0]: https://github.com/ruby/io-console/releases/tag/v0.9.0
[io-console-v0.9.1]: https://github.com/ruby/io-console/releases/tag/v0.9.1
[io-console-v0.9.2]: https://github.com/ruby/io-console/releases/tag/v0.9.2
[io-console-v0.9.3]: https://github.com/ruby/io-console/releases/tag/v0.9.3
[io-console-v0.9.4]: https://github.com/ruby/io-console/releases/tag/v0.9.4
[ipaddr-v1.2.9]: https://github.com/ruby/ipaddr/releases/tag/v1.2.9
[json-v2.18.1]: https://github.com/ruby/json/releases/tag/v2.18.1
[json-v2.19.0]: https://github.com/ruby/json/releases/tag/v2.19.0
[json-v2.19.1]: https://github.com/ruby/json/releases/tag/v2.19.1
[json-v2.19.2]: https://github.com/ruby/json/releases/tag/v2.19.2
[json-v2.19.3]: https://github.com/ruby/json/releases/tag/v2.19.3
[json-v2.19.4]: https://github.com/ruby/json/releases/tag/v2.19.4
[json-v2.19.5]: https://github.com/ruby/json/releases/tag/v2.19.5
[json-v2.19.6]: https://github.com/ruby/json/releases/tag/v2.19.6
[json-v2.19.7]: https://github.com/ruby/json/releases/tag/v2.19.7
[json-v2.19.8]: https://github.com/ruby/json/releases/tag/v2.19.8
[json-v2.19.9]: https://github.com/ruby/json/releases/tag/v2.19.9
[json-v2.20.0]: https://github.com/ruby/json/releases/tag/v2.20.0
[json-v2.21.0]: https://github.com/ruby/json/releases/tag/v2.21.0
[json-v2.21.2]: https://github.com/ruby/json/releases/tag/v2.21.2
[json-v3.0.0.rc1]: https://github.com/ruby/json/releases/tag/v3.0.0.rc1
[json-v3.0.0]: https://github.com/ruby/json/releases/tag/v3.0.0
[net-http-v0.10.0]: https://github.com/ruby/net-http/releases/tag/v0.10.0
[net-protocol-v0.3.0]: https://github.com/ruby/net-protocol/releases/tag/v0.3.0
[net-protocol-v0.4.0]: https://github.com/ruby/net-protocol/releases/tag/v0.4.0
[open3-v0.3.0]: https://github.com/ruby/open3/releases/tag/v0.3.0
[openssl-v4.0.1]: https://github.com/ruby/openssl/releases/tag/v4.0.1
[openssl-v4.0.2]: https://github.com/ruby/openssl/releases/tag/v4.0.2
[pp-v0.6.4]: https://github.com/ruby/pp/releases/tag/v0.6.4
[prettyprint-v0.2.1]: https://github.com/ruby/prettyprint/releases/tag/v0.2.1
[psych-v5.4.0]: https://github.com/ruby/psych/releases/tag/v5.4.0
[psych-v5.5.0]: https://github.com/ruby/psych/releases/tag/v5.5.0
[resolv-v0.7.1]: https://github.com/ruby/resolv/releases/tag/v0.7.1
[resolv-v0.7.2]: https://github.com/ruby/resolv/releases/tag/v0.7.2
[resolv-v0.8.0]: https://github.com/ruby/resolv/releases/tag/v0.8.0
[resolv-v0.8.1]: https://github.com/ruby/resolv/releases/tag/v0.8.1
[strscan-v3.1.7]: https://github.com/ruby/strscan/releases/tag/v3.1.7
[strscan-v3.1.8]: https://github.com/ruby/strscan/releases/tag/v3.1.8
[tempfile-v0.3.2]: https://github.com/ruby/tempfile/releases/tag/v0.3.2
[time-v0.5.0]: https://github.com/ruby/time/releases/tag/v0.5.0
[timeout-v0.6.1]: https://github.com/ruby/timeout/releases/tag/v0.6.1
[tmpdir-v0.3.2]: https://github.com/ruby/tmpdir/releases/tag/v0.3.2
[uri-v1.1.2]: https://github.com/ruby/uri/releases/tag/v1.1.2
[zlib-v3.2.3]: https://github.com/ruby/zlib/releases/tag/v3.2.3
[zlib-v3.2.4]: https://github.com/ruby/zlib/releases/tag/v3.2.4
[power_assert-v3.1.0]: https://github.com/ruby/power_assert/releases/tag/v3.1.0
[rake-v13.4.0]: https://github.com/ruby/rake/releases/tag/v13.4.0
[rake-v13.4.1]: https://github.com/ruby/rake/releases/tag/v13.4.1
[rake-v13.4.2]: https://github.com/ruby/rake/releases/tag/v13.4.2
[test-unit-3.7.6]: https://github.com/test-unit/test-unit/releases/tag/3.7.6
[test-unit-3.7.7]: https://github.com/test-unit/test-unit/releases/tag/3.7.7
[test-unit-3.7.8]: https://github.com/test-unit/test-unit/releases/tag/3.7.8
[rss-0.3.3]: https://github.com/ruby/rss/releases/tag/0.3.3
[net-imap-v0.6.3]: https://github.com/ruby/net-imap/releases/tag/v0.6.3
[net-imap-v0.6.4]: https://github.com/ruby/net-imap/releases/tag/v0.6.4
[net-imap-v0.6.4.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.4.1
[net-imap-v0.6.5]: https://github.com/ruby/net-imap/releases/tag/v0.6.5
[net-imap-v0.6.6]: https://github.com/ruby/net-imap/releases/tag/v0.6.6
[net-imap-v0.6.7]: https://github.com/ruby/net-imap/releases/tag/v0.6.7
[net-smtp-v0.5.2]: https://github.com/ruby/net-smtp/releases/tag/v0.5.2
[rbs-v3.10.1]: https://github.com/ruby/rbs/releases/tag/v3.10.1
[rbs-v3.10.2]: https://github.com/ruby/rbs/releases/tag/v3.10.2
[rbs-v3.10.3]: https://github.com/ruby/rbs/releases/tag/v3.10.3
[rbs-v3.10.4]: https://github.com/ruby/rbs/releases/tag/v3.10.4
[rbs-v4.0.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.1
[rbs-v4.0.0.dev.2]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.2
[rbs-v4.0.0.dev.3]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.3
[rbs-v4.0.0.dev.4]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.4
[rbs-v4.0.0.dev.5]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.5
[rbs-v4.0.0]: https://github.com/ruby/rbs/releases/tag/v4.0.0
[rbs-v4.0.1.dev.1]: https://github.com/ruby/rbs/releases/tag/v4.0.1.dev.1
[rbs-v4.0.1.dev.2]: https://github.com/ruby/rbs/releases/tag/v4.0.1.dev.2
[rbs-v4.0.1]: https://github.com/ruby/rbs/releases/tag/v4.0.1
[rbs-v4.0.2]: https://github.com/ruby/rbs/releases/tag/v4.0.2
[rbs-v4.0.3]: https://github.com/ruby/rbs/releases/tag/v4.0.3
[rbs-v4.1.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.1.0.pre.1
[rbs-v4.1.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v4.1.0.pre.2
[rbs-v4.1.0]: https://github.com/ruby/rbs/releases/tag/v4.1.0
[rbs-v4.1.1.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.1.1.pre.1
[rbs-v4.1.1]: https://github.com/ruby/rbs/releases/tag/v4.1.1
[rbs-v4.1.2]: https://github.com/ruby/rbs/releases/tag/v4.1.2
[rbs-v4.1.3]: https://github.com/ruby/rbs/releases/tag/v4.1.3
[rbs-v4.2.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.2.0.pre.1
[rbs-v4.2.0]: https://github.com/ruby/rbs/releases/tag/v4.2.0
[bigdecimal-v4.1.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.0
[bigdecimal-v4.1.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.1
[bigdecimal-v4.1.2]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.2
[bigdecimal-v4.1.3]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.3
[resolv-replace-v0.2.0]: https://github.com/ruby/resolv-replace/releases/tag/v0.2.0
[nkf-v0.3.0]: https://github.com/ruby/nkf/releases/tag/v0.3.0
[syslog-v0.4.0]: https://github.com/ruby/syslog/releases/tag/v0.4.0
[csv-v3.3.6]: https://github.com/ruby/csv/releases/tag/v3.3.6
[repl_type_completor-v0.1.13]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.13
[repl_type_completor-v0.1.14]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.14
[repl_type_completor-v0.1.15]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.15
[repl_type_completor-v0.1.16]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.16
[pstore-v0.2.1]: https://github.com/ruby/pstore/releases/tag/v0.2.1
[rdoc-v7.0.4]: https://github.com/ruby/rdoc/releases/tag/v7.0.4
[rdoc-v7.1.0]: https://github.com/ruby/rdoc/releases/tag/v7.1.0
[rdoc-v7.2.0]: https://github.com/ruby/rdoc/releases/tag/v7.2.0
[rdoc-v8.0.0]: https://github.com/ruby/rdoc/releases/tag/v8.0.0
[rdoc-v8.1.0]: https://github.com/ruby/rdoc/releases/tag/v8.1.0
[win32ole-v1.9.3]: https://github.com/ruby/win32ole/releases/tag/v1.9.3
[irb-v1.17.0]: https://github.com/ruby/irb/releases/tag/v1.17.0
[irb-v1.18.0]: https://github.com/ruby/irb/releases/tag/v1.18.0
[reline-v0.7.0]: https://github.com/ruby/reline/releases/tag/v0.7.0
