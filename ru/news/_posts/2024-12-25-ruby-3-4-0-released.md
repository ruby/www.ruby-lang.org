---
layout: news_post
title: "Вышел Ruby 3.4.0"
author: "naruse"
translator: "ablzh"
date: 2024-12-25 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}. В Ruby 3.4 добавлена ссылка на параметр блока `it`,
Prism стал парсером по умолчанию, библиотека socket получила поддержку Happy Eyeballs Version 2, улучшен YJIT,
добавлен Modular GC и многое другое.

## Представлен `it`

Добавлен `it` для ссылки на параметр блока без имени переменной. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

Поведение `it` практически совпадает с `_1`. Если в блоке нужен только `_1`, возможность появления других нумерованных параметров, например `_2`, создаёт дополнительную нагрузку на читателя. Поэтому `it` введён как удобный псевдоним. Используйте `it` в простых случаях, где смысл `it` очевиден, например в однострочных блоках.

## Prism теперь парсер по умолчанию

Парсер по умолчанию изменён с parse.y на Prism. [[Feature #20564]]

Это внутреннее улучшение, которое почти не должно повлиять на пользователей. Если вы заметите проблемы совместимости, сообщите нам о них.

Чтобы использовать прежний парсер, укажите аргумент командной строки `--parser=parse.y`.

## Библиотека socket теперь поддерживает Happy Eyeballs Version 2 (RFC 8305)

Библиотека socket теперь поддерживает [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305) в `TCPSocket.new` (`TCPSocket.open`) и `Socket.tcp`. Это последняя стандартизированная версия подхода к улучшению подключения, широко используемого во многих языках программирования.
Это улучшение позволяет Ruby обеспечивать эффективные и надёжные сетевые соединения в современных условиях интернета.

До Ruby 3.3 эти методы выполняли разрешение имён (name resolution) и попытки подключения последовательно. Теперь алгоритм работает так:

1. Параллельно выполняет разрешение имён (name resolution) для IPv6 и IPv4
2. Пытается подключиться к найденным IP-адресам с приоритетом IPv6; параллельные попытки запускаются с интервалом 250ms
3. Возвращает первое успешное соединение, отменяя остальные попытки

Это сводит задержки подключения к минимуму, даже если определённый протокол или IP-адрес отвечает медленно или недоступен.
Возможность включена по умолчанию и не требует дополнительной настройки. Чтобы отключить её глобально, задайте переменную окружения `RUBY_TCP_NO_FAST_FALLBACK=1` или вызовите `Socket.tcp_fast_fallback=false`. Для отключения в отдельном вызове метода используйте именованный аргумент `fast_fallback: false`.

## YJIT

### Кратко

* Повышена производительность в большинстве бенчмарков на платформах x86-64 и arm64.
* Снижено потребление памяти благодаря сжатым метаданным и общему лимиту памяти.
* Различные исправления ошибок: YJIT стал надёжнее и тщательнее протестирован.

### Новые возможности

* Аргументы командной строки
    * `--yjit-mem-size` вводит общий лимит памяти (по умолчанию 128MiB) для отслеживания всего потребления памяти YJIT,
      предлагая более понятную альтернативу прежнему аргументу `--yjit-exec-mem-size`.
    * `--yjit-log` включает журнал компиляции для отслеживания компилируемого кода.
* Ruby API
    * `RubyVM::YJIT.log` предоставляет доступ к последним записям журнала компиляции во время выполнения.
* Статистика YJIT
    * `RubyVM::YJIT.runtime_stats` теперь всегда предоставляет дополнительную статистику
       инвалидации, встраивания (inlining) и кодирования метаданных.

### Новые оптимизации

* Сжатый контекст сокращает объём памяти для хранения метаданных YJIT
* Регистры выделяются для локальных переменных и аргументов методов Ruby
* При включённом YJIT используется больше основных примитивов (Core primitives), написанных на Ruby:
    * `Array#each`, `Array#select`, `Array#map` переписаны на Ruby для повышения производительности [[Feature #20182]].
* Возможность встраивать (inline) небольшие и простые методы, например:
    * Пустые методы
    * Методы, возвращающие константу
    * Методы, возвращающие `self`
    * Методы, напрямую возвращающие аргумент
* Специализированная генерация кода для большего числа методов среды выполнения (runtime methods)
* Оптимизированы `String#getbyte`, `String#setbyte` и другие методы строк
* Оптимизированы побитовые операции для ускорения низкоуровневой работы с битами и байтами
* Поддерживаются совместно используемые константы (shareable constants) в режиме нескольких ракторов
* Различные другие небольшие оптимизации

## Модульный сборщик мусора (Modular GC)

* Альтернативные реализации сборщика мусора (GC) можно загружать динамически
  благодаря модульному сборщику мусора. Чтобы включить эту возможность,
  при сборке Ruby укажите `--with-modular-gc`. Библиотеки GC можно загружать
  во время выполнения с помощью переменной окружения `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* Встроенный сборщик мусора Ruby выделен в отдельный файл
  `gc/default/default.c` и взаимодействует с Ruby через API, определённый в
  `gc/gc_impl.h`. Теперь его также можно собрать как библиотеку с помощью
  `make modular-gc MODULAR_GC=default` и включить переменной окружения
  `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* Предоставлена экспериментальная библиотека GC на основе [MMTk](https://www.mmtk.io/).
  Её можно собрать с помощью `make modular-gc MODULAR_GC=mmtk` и
  включить переменной окружения `RUBY_GC_LIBRARY=mmtk`. Для этого на машине сборки
  нужен набор инструментов Rust. [[Feature #20860]]

## Изменения языка

* При изменении строковых литералов в файлах без комментария `frozen_string_literal` теперь выводится
  предупреждение об устаревшем поведении (deprecation warning).
  Эти предупреждения можно включить с помощью `-W:deprecated` или `Warning[:deprecated] = true`.
  Чтобы отключить это изменение, запустите Ruby с аргументом командной строки
  `--disable-frozen-string-literal`. [[Feature #20205]]

* Теперь поддерживается распаковка `nil` в именованные аргументы (keyword splatting) при вызове методов.
  `**nil` обрабатывается аналогично `**{}`: именованные аргументы не передаются,
  а методы преобразования не вызываются.  [[Bug #20064]]

* Передача блока при индексировании больше не допускается.  [[Bug #19918]]

* Именованные аргументы при индексировании больше не допускаются.  [[Bug #20218]]

* Имя верхнего уровня `::Ruby` теперь зарезервировано; его определение вызывает предупреждение при включённом `Warning[:deprecated]`.  [[Feature #20884]]

## Обновления основных классов

Примечание: перечислены только значимые обновления основных классов.

* Exception

  * `Exception#set_backtrace` теперь принимает массив `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` и `Fiber#raise` также принимают этот новый формат. [[Feature #13557]]

* GC

    * Добавлен `GC.config` для настройки параметров сборщика
      мусора. [[Feature #20443]]

    * Введён параметр GC `rgengc_allow_full_mark`. При значении `false`
      GC помечает только молодые объекты. По умолчанию — `true`.  [[Feature #20443]]

* Ractor

    * Разрешён `require` внутри рактора. Загрузка выполняется
      в главном ракторе.
      Добавлен `Ractor._require(feature)` для выполнения загрузки
      в главном ракторе.
      [[Feature #20627]]

    * Добавлен `Ractor.main?`. [[Feature #20627]]

    * Добавлены `Ractor.[]` и `Ractor.[]=` для доступа к локальному хранилищу
      текущего рактора. [[Feature #20715]]

    * Добавлен `Ractor.store_if_absent(key){ init }` для потокобезопасной инициализации
      локальных переменных рактора. [[Feature #20875]]

* Range

  * `Range#size` теперь вызывает `TypeError`, если диапазон не поддерживает итерацию. [[Misc #18984]]


## Обновления стандартной библиотеки

Примечание: перечислены только значимые обновления стандартной библиотеки.

* RubyGems
    * В gem push добавлена опция `--attestation`, позволяющая сохранять подпись в [sigstore.dev]

* Bundler
    * Добавлена настройка `lockfile_checksums` для включения контрольных сумм в новые lockfile-файлы
    * В bundle lock добавлена опция `--add-checksums` для добавления контрольных сумм в существующий lockfile-файл

* JSON

    * Повышена производительность `JSON.parse`: он работает примерно в 1.5 раза быстрее, чем в json-2.7.x.

* Tempfile

    * Для Tempfile.create реализован именованный аргумент `anonymous: true`.
      `Tempfile.create(anonymous: true)` сразу удаляет созданный временный файл.
      Поэтому приложениям не нужно удалять его самостоятельно.
      [[Feature #20497]]

* win32/sspi.rb

    * Эта библиотека вынесена из репозитория Ruby в [ruby/net-http-sspi].
      [[Feature #20775]]

Следующие гемы переведены из default гемов (гемов по умолчанию) в bundled гемы (гемы, поставляемые с Ruby).

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## Проблемы совместимости

Примечание: исправления ошибок в функциональности не перечисляются.

* Изменён вид сообщений об ошибках и трассировок стека (backtraces).
  * Вместо обратной кавычки в качестве открывающей используется одинарная кавычка. [[Feature #16495]]
  * Перед именем метода выводится имя класса, если у класса есть постоянное имя. [[Feature #19117]]
  * Соответствующим образом изменены `Kernel#caller`, методы `Thread::Backtrace::Location` и другие.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* Изменён вывод Hash#inspect. [[Bug #20433]]

    * Ключи-символы отображаются с использованием современного синтаксиса: `"{user: 1}"`
    * Для других ключей вокруг `=>` теперь добавлены пробелы: `'{"user" => 1}'`, а раньше их не было: `'{"user"=>1}'`

* Kernel#Float() теперь принимает десятичные строки без дробной части. [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (previously, an ArgumentError was raised)
  Float("1.E-1") #=> 0.1 (previously, an ArgumentError was raised)
  ```

* String#to_f теперь принимает десятичные строки без дробной части. Обратите внимание, что при указании экспоненты результат меняется. [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (previously, 1.0 was returned)
  ```

* Удалён Refinement#refined_class. [[Feature #19714]]

## Проблемы совместимости стандартной библиотеки

* DidYouMean

    * Удалены `DidYouMean::SPELL_CHECKERS[]=` и `DidYouMean::SPELL_CHECKERS.merge!`.

* Net::HTTP

    * Удалены следующие устаревшие константы:
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      Эти константы были объявлены устаревшими в 2012 году.

* Timeout

    * Отрицательные значения для Timeout.timeout больше не принимаются. [[Bug #20795]]

* URI

    * Парсер по умолчанию изменён с соответствующего RFC 2396 на соответствующий RFC 3986.
      [[Bug #19266]]

## Обновления C API

* Удалены `rb_newobj` и `rb_newobj_of`, а также соответствующие макросы `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`. [[Feature #20265]]
* Удалена устаревшая функция `rb_gc_force_recycle`. [[Feature #18290]]

## Прочие изменения

* При передаче блока методу, который его не использует, теперь выводится
  предупреждение в подробном режиме (`-w`).
  [[Feature #15554]]

* Переопределение некоторых основных методов, специально оптимизированных интерпретатором
  и JIT, например `String.freeze` или `Integer#+`, теперь вызывает предупреждение
  категории производительности (`-W:performance` или `Warning[:performance] = true`).
  [[Feature #20429]]

Смотрите [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
или [историю коммитов](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
для получения подробностей.

С учётом этих изменений [изменено {{ release.stats.files_changed }} файлов, добавлено {{ release.stats.insertions }} строк(+), удалено {{ release.stats.deletions }} строк(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
с момента выхода Ruby 3.3.0!

С Рождеством, хороших праздников и приятного программирования на Ruby 3.4!

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

Разработка Ruby началась в 1993 году благодаря Matz (Yukihiro Matsumoto),
и сейчас язык развивается как open source проект. Он работает на многих платформах
и используется по всему миру, особенно для веб-разработки.

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
