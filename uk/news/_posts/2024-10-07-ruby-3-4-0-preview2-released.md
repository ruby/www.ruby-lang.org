---
layout: news_post
title: "Вийшов Ruby 3.4.0 preview2"
author: "naruse"
translator: "Andrii Furmanets"
date: 2024-10-07 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview2" | first %}
Раді повідомити про вихід Ruby {{ release.version }}.

## Prism

Перемкнуто парсер за замовчуванням з parse.y на Prism. [[Feature #20564]]

## Зміни мови

* Рядкові літерали у файлах без коментаря `frozen_string_literal` тепер видають попередження про застаріле використання
  при їх зміні.
  Ці попередження можна увімкнути за допомогою `-W:deprecated` або встановивши `Warning[:deprecated] = true`.
  Щоб вимкнути цю зміну, можна запустити Ruby з параметром командного рядка `--disable-frozen-string-literal`.
  [[Feature #20205]]

* Додано `it` для посилання на параметр блоку. [[Feature #18980]]

* Тепер підтримується розпаковування ключових аргументів з `nil` під час виклику методів.
  `**nil` обробляється подібно до `**{}`, не передаючи ключових аргументів
  і не викликаючи жодних методів перетворення. [[Bug #20064]]

* Передавання блоку більше не дозволено в операції індексації. [[Bug #19918]]

* Ключові аргументи більше не дозволені в операції індексації. [[Bug #20218]]

## Оновлення основних класів

Примітка: наведено лише помітні оновлення класів.

* Exception

  * `Exception#set_backtrace` тепер приймає масив `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` та `Fiber#raise` також приймають цей новий формат. [[Feature #13557]]

* Range

  * `Range#size` тепер викликає `TypeError`, якщо діапазон не є ітерованим. [[Misc #18984]]



## Проблеми сумісності

Примітка: Виключаючи виправлення помилок функцій.

* Змінено повідомлення про помилки та відображення стеків викликів.
  * Як початкову лапку використовують одинарну лапку замість зворотної. [[Feature #16495]]
  * Перед назвою методу відображають назву класу (лише коли клас має постійну назву). [[Feature #19117]]
  * Методи `Kernel#caller`, `Thread::Backtrace::Location` тощо також змінено відповідно.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* Змінено формат виводу `Hash#inspect`. [[Bug #20433]]
  * Ключі-символи відображаються з використанням сучасного синтаксису ключів символів: `"{user: 1}"`
  * Інші ключі тепер мають пробіли навколо `=>`: `'{"user" => 1}'`, тоді як раніше їх не було: `'{"user"=>1}'`

## Оновлення C API

* `rb_newobj` та `rb_newobj_of` (і відповідні макроси `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) вилучено. [[Feature #20265]]
* Вилучено застарілу функцію `rb_gc_force_recycle`. [[Feature #18290]]

## Покращення реалізації

* `Array#each` переписано на Ruby для кращої продуктивності [[Feature #20182]].

## Інші зміни

* Передавання блоку в метод, який не використовує переданий блок, показуватиме
  попередження в режимі verbose (`-w`).
  [[Feature #15554]]

* Перевизначення деяких базових методів, які спеціально оптимізовані інтерпретатором
  та JIT, таких як `String.freeze` або `Integer#+`, тепер видає попередження про
  клас продуктивності (`-W:performance` або `Warning[:performance] = true`).
  [[Feature #20429]]

Див. GitHub releases, такі як [Logger](https://github.com/ruby/logger/releases), або
changelog для деталей default gems або bundled gems.

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.3.0!


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
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20433]:     https://bugs.ruby-lang.org/issues/20433
