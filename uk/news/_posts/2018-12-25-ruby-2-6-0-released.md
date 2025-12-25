---
layout: news_post
title: "Вийшов Ruby 2.6.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2018-12-25 00:00:00 +0000
lang: uk
---

Ми раді повідомити про реліз Ruby 2.6.0.

Він вводить низку нових функцій і покращень продуктивності, зокрема:

 * Новий JIT-компілятор.
 * Модуль `RubyVM::AbstractSyntaxTree`.

## JIT [Експериментально]

Ruby 2.6 вводить початкову реалізацію JIT (Just-In-Time) компілятора.

JIT-компілятор націлений на покращення продуктивності програм Ruby. На відміну від традиційних JIT-компіляторів, що працюють у процесі, JIT Ruby записує C-код на диск і запускає звичайний C-компілятор для генерації нативного коду. Докладніше див. [організацію MJIT від Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization).

Щоб увімкнути JIT-компілятор, вкажіть `--jit` у командному рядку або в змінній середовища `$RUBYOPT`. Вказавши `--jit-verbose=1`, JIT-компілятор виводитиме додаткову інформацію. Прочитайте вивід `ruby --help` або [документацію](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage) для інших опцій.

JIT-компілятор підтримується, коли Ruby зібрано за допомогою GCC, Clang або Microsoft VC++, які мають бути доступні під час виконання.

Станом на Ruby 2.6.0 ми досягли [швидкості в 1.7 раза](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208) порівняно з Ruby 2.5 на бенчмарку [Optcarrot](https://github.com/mame/optcarrot), що інтенсивно використовує CPU. Однак це ще експериментально, і багато інших навантажень, що інтенсивно використовують пам'ять, як-от Rails-застосунки, наразі можуть не отримати переваг. Докладніше див. [Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Слідкуйте за новою ерою продуктивності Ruby.

## `RubyVM::AbstractSyntaxTree` [Експериментально]

Ruby 2.6 вводить модуль `RubyVM::AbstractSyntaxTree`. **Сумісність цього модуля у майбутньому не гарантується.**

Цей модуль має метод `parse`, який аналізує переданий рядок як код Ruby і повертає вузли AST (Abstract Syntax Tree) коду. Метод `parse_file` відкриває та аналізує переданий файл як код Ruby і повертає вузли AST.

Також введено клас `RubyVM::AbstractSyntaxTree::Node`. Ви можете отримати місце у вихідному коді та дочірні вузли від об'єктів `Node`. Ця функція експериментальна.

## Інші важливі нові функції

* Додано псевдонім `#then` для `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* Імена констант тепер можуть починатися з великої літери не-ASCII. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Введено безкінечні діапазони. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Безкінечний діапазон, `(1..)`, працює так, ніби не має кінця. Ось типові випадки використання:

      ary[1..]                          # ідентично ary[1..-1] без магічного -1
      (1..).each {|index| ... }         # перелічує значення починаючи з індексу 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Додано `Enumerable#chain` і `Enumerator#+`. [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Додано оператори композиції функцій `<<` і `>>` до `Proc` і `Method`. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; ідентично f(g(3))
      (f >> g).call(3) # -> 15; ідентично g(f(3))

* Додано `Binding#source_location`. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

* Додано опцію `exception:` до `Kernel#system`, яка викликає виняток при невдачі замість повернення `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Додано режим oneshot до `Coverage`. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

* Додано `FileUtils#cp_lr`. Працює як `cp_r`, але створює посилання замість копіювання. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Покращення продуктивності

* Пришвидшено `Proc#call` шляхом видалення тимчасового виділення для `$SAFE`.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Ми спостерігали покращення продуктивності в 1.4 рази на бенчмарку `lc_fizzbuzz`, який викликає `Proc#call` багато разів. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* Пришвидшено `block.call`, коли `block` передається як параметр блоку. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  У поєднанні з покращеннями обробки блоків, введеними в Ruby 2.5, виконання блоків тепер у 2.6 рази швидше на мікробенчмарку в Ruby 2.6. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

* Введено Transient Heap (`theap`). [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap` — це керована купа для короткоживучих об'єктів пам'яті. Створення малих і короткоживучих об'єктів Hash у 2 рази швидше. На бенчмарку rdoc ми спостерігали покращення продуктивності на 6-7%.

* Нативні реалізації (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) корутин для значного покращення продуктивності перемикання контексту Fiber. [[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` і `Fiber#resume` приблизно в 5 разів швидше на 64-bit Linux.

## Інші важливі зміни порівняно з 2.5

* `$SAFE` тепер є глобальним станом процесу і може бути встановлено назад в `0`. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Передача `safe_level` до `ERB.new` застаріла. Аргументи `trim_mode` і `eoutvar` змінено на ключові аргументи. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Підтримку Unicode оновлено до версії 11.

* Об'єднано RubyGems 3.0.1. Опції `--ri` і `--rdoc` видалено. Використовуйте замість них `--document` і `--no-document`.

* [Bundler](https://github.com/bundler/bundler) тепер встановлюється як default gem.

* У блоках обробки винятків `else` без `rescue` тепер викликає синтаксичну помилку. [ЕКСПЕРИМЕНТАЛЬНО] [[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

Докладніше див. [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) або [історію комітів](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0).

З цими змінами [6437 файлів змінено, 231471 вставок(+), 98498 видалень(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) від Ruby 2.5.0!

Веселого Різдва, гарних свят і насолоджуйтесь програмуванням з Ruby 2.6!

## Відома проблема

_(Цей розділ додано 28 січня 2019.)_

* [Net::Protocol::BufferedIO#write викликає NoMethodError при відправці великого багатобайтового рядка](https://github.com/ruby/ruby/pull/2058)

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8