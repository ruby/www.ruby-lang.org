---
layout: news_post
title: "Выпуск Ruby 3.2.0 Preview 2"
author: "naruse"
translator: "suban05"
date: 2022-09-09 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview2" | first %}

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

## Таймаут для Regexp

Введена функция таймаута для сопоставления Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError возникнет через одну секунду
```

Известно, что сопоставление Regexp может занять неожиданно много времени. Если ваш код пытается сопоставить потенциально неэффективный Regexp с ненадежным входом, злоумышленник может использовать это для эффективного отказа в обслуживании (так называемый Regular expression DoS или ReDoS).

Риск DoS можно предотвратить или значительно смягчить, настроив `Regexp.timeout` в соответствии с требованиями вашего Ruby приложения. Пожалуйста, попробуйте это в своем приложении и предоставьте обратную связь.

Обратите внимание, что `Regexp.timeout` является глобальной конфигурацией. Если вы хотите использовать разные настройки таймаута для некоторых специальных Regexp, вы можете использовать ключевое слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Этот regexp не имеет таймаута
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # никогда не прерывается
```

Оригинальное предложение: https://bugs.ruby-lang.org/issues/17837

## Другие заметные новые функции

### Больше не комплектуем сторонние источники

* Мы больше не комплектуем сторонние источники, такие как `libyaml`, `libffi`.

    * Исходный код libyaml был удален из psych. Возможно, вам потребуется установить `libyaml-dev` на платформе Ubuntu/Debian. Название пакета различается в зависимости от платформы.

    * libffi будет удален из `fiddle` в preview2.

### Язык

* Анонимные остаточные и ключевые аргументы теперь могут быть переданы как
  аргументы, а не только использоваться в параметрах метода.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Proc, принимающий один позиционный аргумент и ключевые слова, больше не будет автоматически разворачиваться. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 и раньше
  # => 1
  # Ruby 3.2 и позже
  # => [1, 2]
  ```

* Порядок оценки присваивания констант для констант, установленных на явных
  объектах, стал согласован с порядком оценки присваивания одного атрибута. С этим кодом:

    ```ruby
    foo::BAR = baz
    ```

  `foo` теперь вызывается перед `baz`. Аналогично, для множественных присваиваний
  константам используется порядок оценки слева направо. С этим кодом:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Теперь используется следующий порядок оценки:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Шаблон поиска больше не является экспериментальным.
  [[Feature #18585]]

* Методы, принимающие остаточный параметр (например, `*args`) и желающие передавать ключевые
  аргументы через `foo(*args)`, теперь должны быть помечены как `ruby2_keywords`
  (если это еще не сделано). Другими словами, все методы, желающие передавать
  ключевые аргументы через `*args`, теперь должны быть помечены как `ruby2_keywords`,
  без исключений. Это облегчит переход к другим способам передачи, когда библиотека сможет
  требовать Ruby 3+. Ранее флаг `ruby2_keywords` сохранялся, если принимающий метод принимал `*args`,
  но это была ошибка и несоответствие. Хорошая техника для нахождения потенциально отсутствующих `ruby2_keywords`
  - запуск тестового набора, и если он не проходит, найти последний метод, который должен
  принимать ключевые аргументы, использовать `puts nil, caller, nil` там, и проверить каждый
  метод/блок в цепочке вызовов, который должен передавать ключевые слова, правильно ли он помечен
  как `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Работало без ruby2_keywords в Ruby 2.7-3.1, ruby2_keywords
    # нужно в 3.2+. Как (*args, **kwargs) или (...) нужно будет на обоих #foo и #bar при переходе от ruby2_keywords.
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

* Поддержка arm64 / aarch64 на UNIX-платформах.
* Для сборки YJIT требуется Rust 1.58.1+. [[Feature #18481]]

## Другие заметные изменения с версии 3.1

* Hash
    * Hash#shift теперь всегда возвращает nil, если хэш
      пуст, вместо возврата значения по умолчанию или
      вызова функции по умолчанию. [[Bug #16908]]

* MatchData
    * Добавлен метод MatchData#byteoffset. [[Feature #13110]]

* Module
    * Добавлен метод Module.used_refinements. [[Feature #14332]]
    * Добавлен метод Module#refinements. [[Feature #12737]]
    * Добавлен метод Module#const_added. [[Feature #17881]]

* Proc
    * Proc#dup возвращает экземпляр подкласса. [[Bug #17545]]
    * Proc#parameters теперь принимает ключевое слово lambda. [[Feature #15357]]

* Refinement
    * Добавлен метод Refinement#refined_class. [[Feature

 #12737]]

* Set
    * Set теперь доступен как встроенный класс без необходимости `require "set"`. [[Feature #16989]]
      Он автоматически загружается через константу `Set` или вызов `Enumerable#to_set`.

* String
    * Добавлены методы String#byteindex и String#byterindex. [[Feature #13110]]
    * Обновление Unicode до версии 14.0.0 и Emoji до версии 14.0. [[Feature #18037]]
      (также относится к Regexp)
    * Добавлен метод String#bytesplice.  [[Feature #18598]]

* Struct
    * Класс Struct теперь можно инициализировать с ключевыми аргументами
      без `keyword_init: true` на `Struct.new`. [[Feature #16806]]

## Вопросы совместимости

Примечание: исключены исправления ошибок.

### Удаленные константы

Следующие устаревшие константы удалены.

* `Fixnum` и `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Удаленные методы

Следующие устаревшие методы удалены.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Обновления совместимости со стандартной библиотекой

* `Psych` больше не комплектует исходные коды libyaml.
  Пользователям необходимо установить библиотеку libyaml самостоятельно через систему
  пакетов. [[Feature #18571]]

## Обновления C API

### Удаленные C API

Следующие устаревшие API удалены.

* Переменная `rb_cData`.
* Функции "taintedness" и "trustedness". [[Feature #16131]]

### Обновления стандартных библиотек

* Следующие стандартные библиотеки обновлены.

    * TBD

* Следующие комплектуемые библиотеки обновлены.

    * TBD

* Следующие стандартные библиотеки теперь являются комплектуемыми библиотеками. Вам нужно добавить следующие библиотеки в `Gemfile` в окружении bundler.

    * TBD

См. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [коммиты](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
для получения более подробной информации.

С этими изменениями, [{{ release.stats.files_changed }} измененных файлов, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
с момента выпуска Ruby 3.1.0!

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

Ruby был впервые разработан Мацумото (Юкихиро Мацумото) в 1993 году,
и теперь разрабатывается как Open Source. Он работает на множестве платформ
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
