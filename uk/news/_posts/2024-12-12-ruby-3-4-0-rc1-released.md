---
layout: news_post
title: "Вийшов Ruby 3.4.0 rc1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2024-12-12 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
Раді повідомити про вихід Ruby {{ release.version }}.

## Prism

Перемкнуто парсер за замовчуванням з parse.y на Prism. [[Feature #20564]]

## Модульний GC

* Альтернативні реалізації збирача сміття (GC) можуть завантажуватися динамічно
  через функцію модульного GC. Щоб увімкнути цю функцію,
  сконфігуруйте Ruby з `--with-modular-gc` під час збірки. Бібліотеки GC можна
  завантажувати під час виконання, використовуючи змінну середовища `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* Вбудований збирач сміття Ruby винесено в окремий файл
  `gc/default/default.c` і він взаємодіє з Ruby через API, визначений у
  `gc/gc_impl.h`. Вбудований збирач сміття тепер також можна зібрати як
  бібліотеку, використовуючи `make modular-gc MODULAR_GC=default`, і увімкнути
  через змінну середовища `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* Експериментальна бібліотека GC на основі [MMTk](https://www.mmtk.io/).
  Цю бібліотеку GC можна зібрати командою `make modular-gc MODULAR_GC=mmtk` і
  увімкнути через змінну середовища `RUBY_GC_LIBRARY=mmtk`. Для цього потрібен
  інструментарій Rust на машині збірки. [[Feature #20860]]


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

## YJIT

TL;DR:
* Краща продуктивність у більшості бенчмарків на платформах x86-64 та arm64.
* Зменшене використання пам'яті метаданих компіляції
* Кілька виправлень помилок. YJIT став ще надійнішим і краще протестованим.

Нові можливості:
* Додано єдину межу пам'яті через параметр командного рядка `--yjit-mem-size` (типово 128MiB)
  який відстежує загальне використання пам'яті YJIT і є більш інтуїтивним, ніж
  старий `--yjit-exec-mem-size`.
* Більше статистики тепер завжди доступно через `RubyVM::YJIT.runtime_stats`
* Додано журнал компіляції для відстеження того, що компілюється, через `--yjit-log`
  * Хвіст журналу також доступний під час виконання через `RubyVM::YJIT.log`
* Додано підтримку розділюваних констант у режимі multi-ractor
* Тепер можна відстежувати підраховані виходи з `--yjit-trace-exits=COUNTER`

Нові оптимізації:
* Стиснений контекст зменшує пам'ять, потрібну для зберігання метаданих YJIT
* Покращений алокатор з можливістю виділення регістрів для локальних змінних
* Коли YJIT увімкнено, більше базових примітивів реалізовано на Ruby:
  * `Array#each`, `Array#select`, `Array#map` переписано на Ruby для кращої продуктивності [[Feature #20182]].
* Можливість інлайнити невеликі або тривіальні методи, такі як:
  * Порожні методи
  * Методи, що повертають константу
  * Методи, що повертають `self`
  * Методи, що безпосередньо повертають аргумент
* Спеціалізована генерація коду для значно більшої кількості методів часу виконання
* Оптимізація `String#getbyte`, `String#setbyte` та інших рядкових методів
* Оптимізація бітових операцій для прискорення низькорівневих маніпуляцій з бітами/байтами
* Різні інші інкрементальні оптимізації

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

## Оновлення C API

* `rb_newobj` та `rb_newobj_of` (і відповідні макроси `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) вилучено. [[Feature #20265]]
* Вилучено застарілу функцію `rb_gc_force_recycle`. [[Feature #18290]]

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
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860

