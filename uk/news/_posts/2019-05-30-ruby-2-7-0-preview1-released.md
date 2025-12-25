---
layout: news_post
title: "Вийшов Ruby 2.7.0-preview1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2019-05-30 00:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.7.0-preview1.

Preview версія випущена для збору відгуків для фінального випуску, запланованого на грудень. Вона вводить ряд нових функцій та покращень продуктивності, найбільш помітні:

* Compaction GC
* Pattern Matching
* Покращення REPL

## Compaction GC

Цей випуск вводить Compaction GC, який може дефрагментувати фрагментований простір пам'яті.

Деякі багатопотокові програми Ruby можуть спричинити фрагментацію пам'яті, що призводить до високого використання пам'яті та погіршення швидкості.

Метод `GC.compact` введено для компактування купи. Ця функція компактує живі об'єкти в купі, щоб використовувалося менше сторінок, та купа може бути більш CoW дружньою. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Експериментально]

Pattern matching, широко використовувана функція в функціональних мовах програмування, введена як експериментальна функція. [#14912](https://bugs.ruby-lang.org/issues/14912)
Вона може обходити заданий об'єкт та призначати його значення, якщо воно відповідає шаблону.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Для більше деталей, будь ласка, див. [Pattern matching - Нова функція в Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Покращення REPL

`irb`, включене інтерактивне середовище (REPL; Read-Eval-Print-Loop), тепер підтримує багаторядкове редагування. Воно працює завдяки `reline`, сумісній з `readline` реалізації на чистому Ruby.
Воно також надає інтеграцію rdoc. В `irb` ви можете відобразити довідку для заданого класу, модуля або методу.  [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Крім того, рядки джерела, показані в `binding.irb`, та результати inspect для об'єктів core-класів тепер кольорові.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Інші помітні нові функції

* Оператор посилання на метод, <code>.:</code>, введено як експериментальну функцію.  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Нумерований параметр як параметр блоку за замовчуванням введено як експериментальну функцію.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Безпочатковий діапазон експериментально введено.  Він може бути не таким корисним
  як нескінченний діапазон, але буде хорошим для цілей DSL. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # ідентично до ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` додано.  Він підраховує появу кожного елемента.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Покращення продуктивності

* JIT [Експериментально]

  * JIT-компільований код перекомпілюється до менш оптимізованого коду, коли припущення оптимізації стає недійсним.

  * Інлайнінг методів виконується, коли метод вважається чистим. Ця оптимізація все ще експериментальна, і багато методів ще НЕ вважаються чистими.

  * Значення за замовчуванням `--jit-min-calls` змінено з 5 на 10,000

  * Значення за замовчуванням `--jit-max-cache` змінено з 1,000 на 100

## Інші помітні зміни з 2.6

* `Proc.new` та `proc` без блоку в методі, викликаному з блоком, тепер попереджають.

* `lambda` без блоку в методі, викликаному з блоком, помиляється.

* Оновлено версію Unicode та Emoji з 11.0.0 до 12.0.0.  [[Функція #15321]](https://bugs.ruby-lang.org/issues/15321)

* Оновлено версію Unicode до 12.1.0, додаючи підтримку для U+32FF SQUARE ERA NAME REIWA.  [[Функція #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, та `Date.parse` тимчасово підтримують нову японську еру як неформальне розширення, до випуску нового JIS X 0301.  [[Функція #15742]](https://bugs.ruby-lang.org/issues/15742)

* Вимагаємо підтримки C99 компіляторами [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Деталі нашого діалекту: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) або [логи комітів](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) для більше деталей.

З цими змінами, [1727 файлів змінено, 76022 додано(+), 60286 видалено(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) з Ruby 2.6.0!

Насолоджуйтеся програмуванням з Ruby 2.7!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      РОЗМІР:   16021286 байтів
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      РОЗМІР:   20283343 байтів
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      РОЗМІР:   14038296 байтів
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      РОЗМІР:   11442988 байтів
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Що таке Ruby

Ruby вперше розроблено Matz (Yukihiro Matsumoto) у 1993 році, і зараз розробляється як Open Source. Він працює на кількох платформах та використовується по всьому світу, особливо для веб-розробки.

