---
layout: news_post
title: "Выпуск Ruby 3.2.0 RC 1"
author: "naruse"
translator: "suban05"
date: 2022-12-06 00:00:00 +0000
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

## Улучшения Regexp против ReDoS

Известно, что сопоставление регулярных выражений (Regexp) может занимать неожиданно долгое время. Если ваш код пытается выполнить сопоставление с возможно неэффективным регулярным выражением по ненадежному вводу, злоумышленник может использовать это для проведения эффективной атаки отказа в обслуживании (DoS, Denial of Service), так называемой атаки ReDoS (Regular expression DoS).

Мы внедрили два улучшения, которые значительно снижают уязвимость к ReDoS.

### Улучшенный алгоритм сопоставления Regexp

С момента Ruby 3.2 алгоритм сопоставления регулярных выражений был существенно улучшен благодаря использованию техники мемоизации.

```
# Это сопоставление занимает 10 сек. в Ruby 3.1 и 0.003 сек. в Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

Улучшенный алгоритм сопоставления позволяет выполнить большинство операций сопоставления регулярных выражений (примерно 90% в наших экспериментах) за линейное время.

(Для пользователей предварительной версии: эта оптимизация может потреблять память, пропорциональную длине ввода для каждого сопоставления. Мы не ожидаем практических проблем, потому что выделение этой памяти обычно задерживается, и обычное сопоставление регулярных выражений должно потреблять в памяти максимум в 10 раз больше, чем длина ввода. Если у вас возникли проблемы с памятью при выполнении сопоставления регулярных выражений в реальном приложении, пожалуйста, сообщите об этом.)

Оригинальное предложение доступно по ссылке: https://bugs.ruby-lang.org/issues/19104

### Тайм-аут для регулярных выражений

Вышеуказанная оптимизация не может быть применена к некоторым видам регулярных выражений, таким как те, которые включают сложные функции (например, обратные ссылки или look-around) или с огромным фиксированным числом повторений. В качестве запасного варианта введена функция тайм-аута для сопоставления регулярных выражений.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> В течение одной секунды будет вызвано исключение Regexp::TimeoutError
```

Обратите внимание, что `Regexp.timeout` является глобальной настройкой. Если вам нужно использовать различные настройки тайм-аута для некоторых специальных регулярных выражений, вы можете использовать ключевое слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Это регулярное выражение не имеет тайм-аута
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # не прерывается
```

Оригинальное предложение доступно по ссылке: https://bugs.ruby-lang.org/issues/17837

## Язык

* Анонимные и ключевые остаточные аргументы теперь могут передаваться как аргументы, а не только использоваться в параметрах метода.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Процедура, принимающая один позиционный аргумент и ключевые аргументы, теперь больше не распаковывает автоматически. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 и ранее
  # => 1
  # Ruby 3.2 и позже
  # => [1, 2]
  ```

* Порядок вычисления присвоения констант теперь сделан согласованным для констант, установленных на явных объектах, с порядком вычисления присвоения одиночного атрибута. В данном коде:

    ```ruby
    foo::BAR = baz
    ```

  `foo` теперь вызывается до `baz`. Аналогично, для множественных присваиваний констант, используется порядок вычисления слева направо. Вот как это выглядит:

    ```ruby
    foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Теперь используется следующий порядок вычисления:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Шаблон поиска больше не является экспериментальным. [[Feature #18585]]

* Методы, принимающие остаточный параметр (например, `*args`) и желающие делегировать ключевые аргументы через `foo(*args)`, теперь должны быть отмечены как `ruby2_keywords` (если это еще не сделано). Другими словами, все методы, желающие делегировать ключевые аргументы через `*args`, теперь должны быть отмечены как `ruby2_keywords`, без исключений. Это упростит переход к другим методам делегирования, которые могут потребовать Ruby 3+. Ранее флаг `ruby2_keywords` сохранялся, если метод-получатель принимал `*args`, но это была ошибка и несогласованность. Хорошей техникой для обнаружения потенциально отсутствующих `ruby2_keywords` является запуск тестового набора, поиск последнего метода, который должен принимать ключевые аргументы для каждого места, где тестовый набор не проходит, и использование `puts nil, caller, nil` там. Затем проверьте, правильно ли помечены все методы/блоки на цепочке вызовов, которые должны делегировать ключевые аргументы, как `ruby2_keywords`.
  [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Непреднамеренно работал без ruby2_keywords в Ruby 2.7-3.1, ruby2_keywords
    # требуется в 3.2+. Точно так же, как (*args, **kwargs) или (...) потребуется на
    # обоих #foo и #bar при миграции с ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Улучшения производительности

### YJIT

* YJIT теперь поддерживает процессоры x86-64 и arm64/aarch64 на Linux, MacOS, BSD и других UNIX-платформах.
    * Этот релиз включает поддержку процессоров Mac M1/M2, AWS Graviton и Raspberry Pi 4 ARM64.
* Для сборки YJIT требуется Rust 1.58.0+. [[Feature #18481]]
    * Чтобы убедиться, что CRuby собран с YJIT, установите rustc >= 1.58.0 и
      запустите `./configure` с `--enable-yjit`.
    * Если у вас возникли проблемы, обратитесь к команде YJIT.
* Физическая память для JIT-кода выделяется лениво. В отличие от Ruby 3.1,
  RSS процесса Ruby минимизирован, потому что виртуальные страницы памяти, выделенные параметром `--yjit-exec-mem-size`, не будут отображены в физические страницы памяти, пока они действительно не будут использованы JIT-кодом.
* Введена очистка кода, которая освобождает все страницы кода, когда потребление памяти JIT-кодом достигает `--yjit-exec-mem-size`.
    * `RubyVM::YJIT.runtime_stats` возвращает метрики очистки кода в дополнение к существующим ключам `inline_code_size` и `outlined_code_size`:
      `code_gc_count`, `live_page_count`, `freed_page_count` и `freed_code_size`.
* Большинство статистических данных, производимых `RubyVM::YJIT.runtime_stats`, теперь доступны в выпускаемых сборках.
    * Просто запустите Ruby с `--yjit-stats`, чтобы вычислить статистику (это вызывает некоторые накладные расходы во время выполнения).
* YJIT теперь оптимизирован для использования форм объектов. [[Feature #18776]]
* Используется более тонкая инвалидация констант для инвалидации меньшего количества кода при определении новых констант. [[Feature #18589]]

### MJIT

* Компилятор MJIT реализован заново в Ruby в виде стандартной библиотеки `mjit`.
* Компилятор MJIT выполняется в процессе Ruby после форка вместо выполнения в нативном потоке, названном MJIT worker. [[Feature #18968]]
    * В результате Microsoft Visual Studio (MSWIN) больше не поддерживается.
* MinGW больше не поддерживается. [[Feature #18824]]
* Переименован параметр `--mjit-min-calls` в `--mjit-call-threshold`.
* Изменено значение по умолчанию для `--mjit-max-cache` с 10000 на 100.

### PubGrub

* Версия Bundler 2.4 теперь использует [PubGrub](https://github.com/jhawthorn/pub_grub) вместо [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub - алгоритм следующего поколения, используемый менеджером пакетов `pub` для языка Dart.
  * После этого изменения возможно изменение результатов разрешения зависимостей. Пожалуйста, сообщайте о таких случаях в [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues).

* В Ruby 3.2 RubyGems по-прежнему использует Molinillo в качестве резольвера. Мы планируем заменить его на PubGrub в будущем.

## Другие значимые изменения с версии 3.1

* Hash
    * Hash#shift теперь всегда возвращает nil, если хеш пуст, вместо возврата значения по умолчанию или вызова default proc. [[Bug #16908]]

* MatchData
    * Добавлен метод MatchData#byteoffset. [[Feature #13110]]

* Module
    * Добавлен метод Module.used_refinements. [[Feature #14332]]
    * Добавлен метод Module#refinements. [[Feature #12737]]
    * Добавлен метод Module#const_added. [[Feature #17881]]

* Proc
    * Метод Proc#dup теперь возвращает экземпляр подкласса. [[Bug #17545]]
    * Теперь метод Proc#parameters поддерживает ключевое слово lambda. [[Feature #15357]]

* Refinement
    * Добавлен метод Refinement#refined_class. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Добавлена опция `error_tolerant` для методов `parse`, `parse_file` и `of`. [[Feature #19013]]

* Set
    * Set теперь доступен как встроенный класс без необходимости в `require "set"`. [[Feature #16989]]
      В настоящее время он автоматически загружается через константу `Set` или вызов `Enumerable#to_set`.

* String
    * Добавлены методы String#byteindex и String#byterindex. [[Feature #13110]]
    * Обновлен Unicode до версии 15.0.0 и Emoji до версии 15.0. [[Feature #18639]]
      (также применяется к Regexp)
    * Добавлен метод String#bytesplice. [[Feature #18598]]

* Struct
    * Класс Struct теперь можно инициализировать с использованием ключевых аргументов без `keyword_init: true` в `Struct.new`. [[Feature #16806]]

## Проблемы совместимости

Примечание: исключая исправления ошибок функциональности.

### Удалённые константы

Следующие устаревшие константы удалены.

* `Fixnum` и `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Удалённые методы

Следующие устаревшие методы удалены.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Проблемы совместимости стандартной библиотеки

### Больше не включены сторонние источники

Мы больше не включаем сторонние исходники, такие как `libyaml`, `libffi`.

* Исходный код libyaml удалён из psych. Вам может потребоваться установить `libyaml-dev` на платформе Ubuntu/Debian. Наименование пакета может отличаться для каждой платформы.
* Исходный код libffi также удалён из fiddle.

Псих и фиддл поддерживают статические сборки с конкретными версиями исходников libyaml и libffi. Вы можете собрать psych с libyaml-0.2.5 следующим образом:

```bash
$ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
```

И вы можете собрать fiddle с libffi-3.4.4 таким образом:

```bash
$ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
```

  [[Feature #18571]]

## Обновления C API

### Обновлённые C API

Следующие API были обновлены.

* Обновление ГПСЧ
  `rb_random_interface_t` был обновлён и пронумерован.
  Расширения библиотек, использующих этот интерфейс и созданные для старых версий, должны быть обновлены.
  Также необходимо определить функцию `init_int32`.

### Удалённые C API

Следующие устаревшие API были удалены.

* Переменная `rb_cData`.
* Функции "тaintedness" и "trustedness". [[Feature #16131]]

### Обновления стандартной библиотеки

*   Были обновлены следующие встроенные гемы по умолчанию.
    * RubyGems 3.4.0.dev
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.0.dev
    * cgi 0.3.6
    * date 3.3.0
    * delegate 0.3.0
    * did_you_mean 1.6.2
    * digest 3.1.1
    * drb 2.1.1
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.1
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.5.11
    * io-nonblock 0.2.0
    * io-wait 0.3.0.pre
    * ipaddr 1.2.5
    * irb 1.5.1
    * json 2.6.2
    * logger 1.5.2
    * mutex_m 0.1.2
    * net-http 0.3.1
    * net-protocol 0.2.0
    * nkf 0.1.2
    * open-uri 0.3.0
    * openssl 3.1.0.pre
    * optparse 0.3.0
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.0
    * racc 1.6.1
    * rdoc 6.5.0
    * reline 0.3.1
    * resolv 0.2.2
    * securerandom 0.2.1
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 1.0.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * win32ole 1.8.9
    * zlib 3.0.0
*   Были обновлены следующие включённые гемы.
    * minitest 5.16.3
    * power_assert 2.0.2
    * test-unit 3.5.5
    * net-ftp 0.2.0
    * net-imap 0.3.1
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.1
    * typeprof 0.21.3
    * debug 1.7.0

Для получения дополнительной информации ознакомьтесь с [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [логами коммитов](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
с момента Ruby 3.1.0!

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



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18639]: https://bugs.ruby-lang.org/issues/18639
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18589]: https://bugs.ruby-lang.org/issues/18589
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Feature #18776]: https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Bug #19013]:     https://bugs.ruby-lang.org/issues/19013
