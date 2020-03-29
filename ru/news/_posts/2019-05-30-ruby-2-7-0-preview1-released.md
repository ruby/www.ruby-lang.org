---
layout: news_post
title: "Вышел Ruby 2.7.0-preview1"
author: "naruse"
translator: "shprotru"
date: 2019-05-30 00:00:00 +0000
lang: ru
---

Мы рады сообщить о выпуске Ruby 2.7.0-preview1.

Выпущена предварительная версия, чтобы получить обратную связь для окончательного выпуска, запланированного на декабрь. В новой версии добавляется ряд новых функций и улучшение производительности, в первую очередь:

* Уплотнение GC
* Сопоставление с образцом
* Улучшение REPL

## Уплотнение GC

Этот выпуск содержит новшество - уплотнение GC, который позволяет дефрагментировать фрагментированную память.

В некоторых многопоточных Ruby-программах может возникать фрагментация памяти, что приводит к чрезмерному потреблению памяти и снижению производительности.

Метод `GC.compact` вводится для уплотнения хипа. Эта функция сжимает живые объекты в хипе, чтобы уменьшать количество использованных страниц памяти, и хип может оказаться более подходящим для CoW. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Сопоставление с образцом [Экспериментальное]

Сопоставление с образцом, широко используемое в функциональных языках программирования, представлено в качестве экспериментального нововведения. [#14912](https://bugs.ruby-lang.org/issues/14912)
Оно позволяет пересекать с указанным объектом и присваивать ему значение, если оно соответствует шаблону.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Подробнее, смотрите [Сопоставление с образцом - новая особенность Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Улучшение REPL

`irb`, включаемая интерактивная оболочка (REPL; Read-Eval-Print-Loop), теперь поддерживает многострочное редактирование. Оно работает на `reline`, совместимой с `readline` но реализованной на Ruby.
Обеспечена интеграция rdoc. Теперь в `irb` можно отобразить ссылку на указанный класс, модуль или метод.  [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Кроме того, строки исходников в `binding.irb` и результаты инспектирования для базовых классов теперь подсвечиваются.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Другие Примечательные Нововведения

* Оператор ссылки на метод, <code>.:</code>, вводится в качестве экспериментальной функции.  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Нумерованный параметр в качестве параметра блока по умолчанию вводится в качестве экспериментальной функции.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Вводится экспериментальный безначальный диапазон.  Это может быть не так полезно,
  как бесконечный диапазон, но может пригодиться для DSL. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` добавлен.  Подсчитывает вхождение каждого элемента.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Улучшения производительности

* JIT [Экспериментальный]

  * JITed-код пересобирается с меньшей оптимизацией, когда предположение об оптимизации становится недействительным.

  * Встраиваемые методы выполняются, когда метод считается чистым. Эта оптимизация все еще экспериментальна, и многие методы еще НЕ считаются чистыми.

  * Значение по умолчанию для `--jit-min-calls` изменено с 5 до 10 000

  * Значение по умолчанию для `--jit-max-cache` изменено 1,000 до 100

## Другие заметные изменения с 2.6

* Если `Proc.new` и `proc` без блока в методе, вызванным с блоком, выведется предупреждение.

* `lambda` без блока в методе вызывается с ошибками блока.

* Обновлены версии Unicode и Emoji с 11.0.0 до 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Обновлена версия Unicode до 12.1.0, с поддержкой нового глифа U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, и `Date.parse` предварительно поддерживают новую Японскую эру в качестве неофициального расширения, пока не будет выпущен новый JIS X 0301.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Требование к компиляторам поддерживать C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Подробнее: <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

Смотрите [НОВОСТИ](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) или [историю коммитов](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) для подробностей об изменениях.

В этих изменениях, [изменено 1727 файлов, 76022 вставок (+), 60286 удалений(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) с Ruby 2.6.0!

Получайте удовольствие от программирования с Ruby 2.7!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Что такое Ruby

Изначально Ruby был разработан Matz (Yukihiro Matsumoto) в 1993 году, и в настоящее время разрабатывается как Open Source. Он работает на множестве платформ и используется во всем мире, особенно для веб-разработки.
