---
layout: news_post
title: "Вышел Ruby 3.4.0-preview1"
author: "naruse"
translator: "ablzh"
date: 2024-05-16 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview1" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}.

## Изменения языка

* Строковые литералы в файлах без комментария `frozen_string_literal` теперь ведут себя
  как замороженные. При их изменении выводится предупреждение об устаревшем поведении (deprecation warning).
  Эти предупреждения можно включить с помощью `-W:deprecated` или `Warning[:deprecated] = true`.
  Чтобы отключить это изменение, запустите Ruby с аргументом командной строки
  `--disable-frozen-string-literal`. [[Feature #20205]]

* Добавлен `it` для ссылки на параметр блока. [[Feature #18980]]

* Теперь поддерживается распаковка `nil` в именованные аргументы (keyword splatting) при вызове методов.
  `**nil` обрабатывается аналогично `**{}`: именованные аргументы не передаются,
  а методы преобразования не вызываются.  [[Bug #20064]]

* Передача блока при индексировании больше не допускается.  [[Bug #19918]]

* Именованные аргументы при индексировании больше не допускаются.  [[Bug #20218]]

## Обновления основных классов

Примечание: перечислены только наиболее значимые обновления классов.

* Exception

  * Exception#set_backtrace теперь принимает массивы `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` и `Fiber#raise` также принимают этот новый формат. [[Feature #13557]]

* Range

  * Range#size теперь вызывает TypeError, если диапазон не поддерживает итерацию. [[Misc #18984]]



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


## Обновления C API

* Удалены `rb_newobj` и `rb_newobj_of`, а также соответствующие макросы `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`. [[Feature #20265]]
* Удалена устаревшая функция `rb_gc_force_recycle`. [[Feature #18290]]

## Улучшения реализации

* `Array#each` переписан на Ruby для повышения производительности [[Feature #20182]].

## Прочие изменения

* При передаче блока методу, который его не использует, теперь выводится
  предупреждение в подробном режиме (`-w`).
  [[Feature #15554]]

* Переопределение некоторых основных методов, специально оптимизированных интерпретатором
  и JIT, например `String.freeze` или `Integer#+`, теперь вызывает предупреждение
  категории производительности (`-W:performance` или `Warning[:performance] = true`).
  [[Feature #20429]]

Подробности об изменениях гемов по умолчанию (default gems) и гемов, поставляемых с Ruby (bundled gems), смотрите
в заметках о релизах на GitHub, например для [Logger](https://github.com/ruby/logger/releases), или в заметках об изменениях.

Смотрите [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [историю коммитов](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
для получения подробностей.

С учётом этих изменений [изменено {{ release.stats.files_changed }} файлов, добавлено {{ release.stats.insertions }} строк(+), удалено {{ release.stats.deletions }} строк(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
с момента выхода Ruby 3.3.0!


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
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
