---
layout: news_post
title: "Выпуск Ruby 3.4.0 preview1"
author: "naruse"
translator: "suban05"
date: 2024-05-16 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview1" | first %}
Мы рады объявить о выпуске Ruby {{ release.version }}.

## Изменения в языке

* Строковые литералы в файлах без комментария `frozen_string_literal` теперь ведут себя как замороженные.
  Если они изменены, выдается предупреждение об устаревании.
  Эти предупреждения можно включить с помощью `-W:deprecated` или установив `Warning[:deprecated] = true`.
  Чтобы отключить это изменение, можно запустить Ruby с аргументом командной строки `--disable-frozen-string-literal`. [[Feature #20205]]

* Добавлен `it` для ссылки на параметр блока. [[Feature #18980]]

* Поддерживается распаковка ключевых слов `nil` при вызове методов.
  `**nil` трактуется аналогично `**{}`, не передавая никаких ключевых слов и не вызывая методы преобразования. [[Bug #20064]]

* Передача блока более не допускается в индексе. [[Bug #19918]]

* Ключевые аргументы больше не допускаются в индексе. [[Bug #20218]]

## Обновления основных классов

Примечание: За исключением исправления ошибок.

* Exception

  * Exception#set_backtrace теперь принимает массивы `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` и `Fiber#raise` также принимают этот новый формат. [[Feature #13557]]

* Range

  * Range#size теперь вызывает TypeError, если диапазон не итерируемый. [[Misc #18984]]

## Проблемы совместимости

Примечание: исключены исправления ошибок функций.

* Сообщения об ошибках и отображение трассировок изменены.
  * Используется одинарная кавычка вместо обратной для открытия кавычек. [[Feature #16495]]
  * Отображение имени класса перед именем метода (только если у класса есть постоянное имя). [[Feature #19117]]
  * Методы `Kernel#caller`, `Thread::Backtrace::Location` и другие изменены соответственно.

  ```
  Старый вариант:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  Новый вариант:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in `<main>'
  ```

## Обновления C API

* `rb_newobj` и `rb_newobj_of` (и соответствующие макросы `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) удалены. [[Feature #20265]]
* Удалена устаревшая функция `rb_gc_force_recycle`. [[Feature #18290]]

## Улучшения реализации

* `Array#each` переписан на Ruby для повышения производительности [[Feature #20182]].

## Прочие изменения

* Передача блока методу, который не использует переданный блок, будет показывать предупреждение в режиме verbose (`-w`).
  [[Feature #15554]]

* Повторное определение некоторых основных методов, специально оптимизированных интерпретатором
  и JIT, таких как `String.freeze` или `Integer#+`, теперь вызывает предупреждение о производительности
  (`-W:performance` или `Warning[:performance] = true`).
  [[Feature #20429]]

Для получения дополнительной информации о стандартных и пакетных гемах обратитесь к GitHub-релизам, таким как [Logger](https://github.com/ruby/logger/releases) или к изменениям в журнале изменений.

Подробности о новостях смотрите в [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [логах коммитов](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
для получения дополнительной информации.

С учетом этих изменений, [{{ release.stats.files_changed }} файлов изменено, {{ release.stats.insertions }} добавлено(+), {{ release.stats.deletions }} удалено(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
с момента Ruby 3.3.0!

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

Ruby был разработан Мацем (Юкихиро Мацумото) в 1993 году и сейчас развивается как открытое программное обеспечение. Он работает на множестве платформ и широко используется по всему миру, особенно в веб-разработке.

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
