---
layout: news_post
title: "Выпуск Ruby 3.2.0 Preview 3"
author: "naruse"
translator: "suban05"
date: 2022-11-11 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}

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

## Улучшения в регулярных выражениях против ReDoS

Известно, что поиск по регулярным выражениям может занимать неожиданно долгое время. Если ваш код пытается выполнить неэффективное регулярное выражение для не доверенного ввода, злоумышленник может использовать это для эффективного отказа в обслуживании (так называемый Regular expression DoS, или ReDoS).

Мы внесли два улучшения, которые значительно снижают возможность ReDoS.

### Улучшенный алгоритм сопоставления Regexp

Начиная с Ruby 3.2, алгоритм сопоставления Regexp значительно улучшен за счет использования техники мемоизации.

```ruby
# Это сопоставление занимает 10 секунд в Ruby 3.1 и 0.003 секунды в Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

Улучшенный алгоритм сопоставления позволяет выполнять большинство сопоставлений Regexp (приблизительно 90% в наших экспериментах) за линейное время.

(Для пользователей предварительной версии: эта оптимизация может потреблять память, пропорциональную длине ввода для каждого сопоставления. Мы не ожидаем практических проблем, так как выделение памяти обычно происходит отложенно, и обычное сопоставление Regexp должно потреблять не более 10 раз больше памяти, чем длина ввода. Если у вас возникают проблемы с памятью при сопоставлении Regexp в реальном приложении, пожалуйста, сообщите об этом.)

Оригинальное предложение доступно по ссылке: <https://bugs.ruby-lang.org/issues/19104>

### Таймаут для Regexp

Вышеуказанная оптимизация не может быть применена ко всем видам регулярных выражений, например, к выражениям с использованием продвинутых функций (например, обратные ссылки или look-around), или с большим фиксированным количеством повторений. В качестве резервного варианта введена функция таймаута для сопоставления Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Возникает ошибка Regexp::TimeoutError через одну секунду
```

Обратите внимание, что `Regexp.timeout` - это глобальная конфигурация. Если вам нужно использовать разные настройки таймаута для некоторых специальных Regexp, вы можете использовать ключевое слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Это Regexp без таймаута
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # никогда не прерывается
```

Оригинальное предложение доступно по ссылке: <https://bugs.ruby-lang.org/issues/17837>

## Другие значимые новые функции

### Не включение сторонних исходников

* Мы больше не включаем сторонние исходники, такие как `libyaml`, `libffi`.

    * Исходный код libyaml удален из psych. Вам может потребоваться установить `libyaml-dev` для платформ Ubuntu/Debian. Имя пакета отличается на разных платформах.

    * Исходный код bundled libffi также удален из `fiddle`.

### Язык

* Анонимные остаточные и ключевые остаточные аргументы теперь могут быть переданы в качестве
  аргументов, а не только использоваться в параметрах метода.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Proc, принимающий один позиционный аргумент и ключевые аргументы, больше не автоматически разворачивается. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 и ранее
  # => 1
  # Ruby 3.2 и позднее
  # => [1, 2]
  ```

* Порядок вычисления присвоения констант для констант, установленных на явных объектах, теперь сделан согласованным с порядком вычисления присвоения одиночных атрибутов. С этим кодом:

    ```ruby
    foo::BAR = baz
    ```

  `foo` теперь вызывается перед `baz`. Аналогично, для множественных присваиваний констант, используется порядок вычисления слева направо. С этим кодом:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Теперь используется следующий порядок вычисления:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Поиск шаблонов больше не является экспериментальным.
  [[Feature #18585]]

* Методы, принимающие остаточный параметр (например, `*args`) и желающие делегировать ключевые
  аргументы через `foo(*args)`, теперь должны быть помечены `ruby2_keywords`
  (если это еще не сделано). Другими словами, все методы, желающие делегировать
  ключевые аргументы через `*args`, теперь должны быть помечены `ruby2_keywords`,
  без исключения. Это упростит переход к другим способам делегирования, как только библиотека сможет требовать Ruby 3+. Ранее флаг `ruby2_keywords`
  сохранялся, если принимающий метод брал `*args`, но это была ошибка и несогласованность. Хорошей техникой для поиска потенциально отсутствующего `ruby2_keywords`
  является запуск тестового набора, где он не проходит, находя последний метод, который должен
  получить ключевые аргументы, использовать `puts nil, caller, nil` там и проверить каждый метод/блок
  в цепочке вызовов, который должен правильно помечаться как `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Непреднамеренно работало без ruby2_keywords в Ruby 2.7-3.1, ruby2_keywords
    # требуется в 3.2+. Точно так же, как (*args, **kwargs) или (...) будет требоваться
    # на обоих #foo и #bar при миграции от ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Улучшение производительности

### YJIT

* Поддержка arm64 / aarch64 на UNIX-платформах.
* Для сборки YJIT требуется Rust 1.58.1+. [[Feature #18481]]

## Другие значимые изменения с версии 3.1

* Hash
    * Hash#shift теперь всегда возвращает nil, если хэш пуст, вместо возвращения значения по умолчанию или вызова дефолтного прок. [[Bug #16908]]

* MatchData
    * Добавлен метод MatchData#byteoffset. [[Feature #13110]]

* Module
    * Добавлен метод Module.used_refinements. [[Feature #14332]]
    * Добавлен метод Module#refinements. [[Feature #12737]]
    * Добавлен метод Module#const_added. [[Feature #17881]]

* Proc
    * Метод Proc#dup теперь возвращает экземпляр подкласса. [[Bug #17545]]
    * Метод Proc#parameters теперь принимает ключевое слово lambda. [[Feature #15357]]

* Refinement
    * Добавлен метод Refinement#refined_class. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Добавлена опция `error_tolerant` для методов `parse`, `parse_file` и `of`. [[Feature #19013]]

* Set
    * Теперь класс Set доступен как встроенный класс без необходимости `require "set"`. [[Feature #16989]]
      В настоящее время он автоматически загружается через константу `Set` или вызов `Enumerable#to_set`.

* String
    * Добавлены методы String#byteindex и String#byterindex. [[Feature #13110]]
    * Обновление Unicode до версии 14.0.0 и Emoji до версии 14.0. [[Feature #18037]]
      (также относится к Regexp)
    * Добавлен метод String#bytesplice. [[Feature #18598]]

* Struct
    * Класс Struct теперь можно инициализировать также с ключевыми аргументами без `keyword_init: true` в `Struct.new`. [[Feature #16806]]

## Проблемы совместимости

Примечание: Исключены исправления ошибок функций.

### Удаленные константы

Были удалены следующие устаревшие константы.

* `Fixnum` и `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Удаленные методы

Были удалены следующие устаревшие методы.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Проблемы совместимости стандартной библиотеки

* `Psych` больше не включает исходные коды libyaml.
  Пользователи должны установить библиотеку libyaml сами через систему управления пакетами. [[Feature #18571]]

## Обновления C API

### Обновленные C API

Были обновлены следующие API.

* Обновление ГПСЧ
  Обновлен и версионирован интерфейс `rb_random_interface_t`.
  Расширения библиотек, использующие этот интерфейс и созданные для более старых версий,
  также требуют определения функции `init_int32`.

### Удаленные C API

Были удалены следующие устаревшие API.

* Переменная `rb_cData`.
* Функции для "taintedness" и "trustedness". [[Feature #16131]]

### Обновления стандартных библиотек

* SyntaxSuggest

  * Функция `syntax_suggest`, ранее `dead_end`, теперь интегрирована в Ruby.
    [[Feature #18159]]

* ErrorHighlight
  * Теперь указывает на аргумент(ы) TypeError и ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

*   Следующие библиотеки по умолчанию были обновлены.
    * RubyGems 3.4.0.dev
    * bigdecimal 3.1.2
    * bundler 2.4.0.dev
    * cgi 0.3.2
    * date 3.2.3
    * error_highlight 0.4.0
    * etc 1.4.0
    * io-console 0.5.11
    * io-nonblock 0.1.1
    * io-wait 0.3.0.pre
    * ipaddr 1.2.4
    * json 2.6.2
    * logger 1.5.1
    * net-http 0.2.2
    * net-protocol 0.1.3
    * ostruct 0.5.5
    * psych 5.0.0.dev
    * reline 0.3.1
    * securerandom 0.2.0
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 0.0.1
    * timeout 0.3.0
*   Следующие встроенные библиотеки были обновлены.
    * minitest 5.16.3
    * net-imap 0.2.3
    * rbs 2.6.0
    * typeprof 0.21.3
    * debug 1.6.2
*   Следующие библиотеки по умолчанию теперь являются встроенными библиотеками.

Смотрите [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [журналы коммитов](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
для получения более подробной информации.

С этими изменениями [изменено {{ release.stats.files_changed }} файлов, добавлено {{ release.stats.insertions }} строк(+), удалено {{ release.stats.deletions }} строк(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
с момента Ruby 3.1.0!

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

Ruby был разработан Мацумото (Юкихиро Мацумото) в 1993 году,
и сейчас развивается как Open Source. Он работает на множестве платформ
и используется по всему миру, особенно для веб-разработки.


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
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Feature #19013]: https://bugs.ruby-lang.org/issues/19013
