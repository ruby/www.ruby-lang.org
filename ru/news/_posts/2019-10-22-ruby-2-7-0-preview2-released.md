---
layout: news_post
title: "Вышел Ruby 2.7.0-preview2"
author: "naruse"
translator: "shprotru"
date: 2019-10-22 12:00:00 +0000
lang: ru
---

Мы рады сообщить о выпуске Ruby 2.7.0-preview 2.

Предварительная версия выходит, чтобы собрать обратную связь для окончательного релиза, запланированного на декабрь. В нём вводится ряд новшеств и улучшений производительности, в первую очередь:

* Уплотнение GC
* Сопоставление с образцом
* Улучшение REPL
* Разделение позиционных и ключевых аргументов

## Уплотнение GC

Этот выпуск содержит новшество - уплотнение GC, который позволяет дефрагментировать фрагментированную память.

В некоторых многопоточных Ruby-программах может возникать фрагментация памяти, что приводит к чрезмерному потреблению памяти и снижению производительности.

Метод `GC.compact` вводится для уплотнения хипа. Эта функция сжимает живые объекты в хипе, чтобы уменьшить количество использованных страниц памяти, и хип может оказаться более подходящим для CoW. [[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Сопоставление с образцом [Экспериментальное]

Сопоставление с образцом, широко используемое в функциональных языках программирования, представлено в качестве экспериментального нововведения. [[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)
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
Обеспечена интеграция rdoc. Теперь в `irb` можно отобразить ссылку на указанный класс, модуль или метод.  [[Feature #14683]](https://bugs.ruby-lang.org/issues/14683), [[Feature #14787]](https://bugs.ruby-lang.org/issues/14787), [[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)
Кроме того, строки исходников в `binding.irb` и результаты инспектирования для базовых классов теперь подсвечиваются.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Разделение позиционных и ключевых аргументов

Автоматическая конверсия ключевых аргументов и позиционных аргументов
устарели, и эти преобразования будут удалены в Ruby 3.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* Когда вызов метода передает Хэш в последнем аргументе, и когда он
  не передает ключевые слова, и когда вызываемый метод принимает
  ключевые слова, выдается предупреждение.  Чтобы продолжить обработку
  ключевых слов, добавьте оператор двойную звёздочку для избежания
  предупреждения и обеспечения правильного поведения в Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Когда вызов метода передает ключевые слова методу, который принимает
  ключевые слова, но он не передает достаточно необходимых позиционных
  аргументов, ключевые слова рассматриваются как конечный требуемый
  позиционный аргумент, и выдается предупреждение.  Передайте аргумент
  в качестве хэша вместо ключевого слова чтобы избежать предупреждения
  и обеспечить правильное поведение в Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Когда метод принимает определенные ключевые слова, но не ключевое
  слово звёздочку, и хэш или ключевые слова звёздочки передаются в
  метод, который включает в себя и Символьные и Несимвольные ключи,
  хэш продолжать разделяться, и будет предупреждение.  Нужно
  обновить вызывающий код чтобы передать отдельные хэши, для
  обеспечения правильного поведения в Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* Если метод не принимает ключевые слова и вызывается с ключевыми
  словами, ключевые слова по-прежнему обрабатываются как позиционный
  хэш, без предупреждений.  Такое поведение сохранится в Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* НеСимволы допускаются в качестве ключевых слов аргументов ключей,
  если метод принимает произвольные ключевые слова. [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> допускается в определениях методов явно отмечать
  что метод не принимает никаких ключевых слов. Вызов такого метода
  с ключевыми словами приведет к возникновнию ArgumentError.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Передача пустого ключевого слова звёздочки методу, который больше
  не принимает ключевые слова не передает пустой хэш, если пустой хэш не
  является необходимым для обязательного параметра, в этом случае будет
  выдано предупреждение.  Удалите двойную звёздочку для продолжения передачи
  позиционного хэша.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

## Другие Значимые Новые Функции

* Оператор ссылки на метод, <code>.:</code>, вводится в качестве экспериментальной функции.  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125), [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581)

* Нумерованный параметр в качестве параметра блока по умолчанию представлен в качестве экспериментальной функции.  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* Вводится экспериментальный безначальный диапазон.  Это может не так полезно,
  как бесконечный диапазон, но может пригодиться для DSL. [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` добавлен.  Подсчитывает вхождение каждого элемента.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Вызов приватного метода по `self` теперь возможен.  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297) [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` добавлен.  Генерирует не ленивый перечислитель
  из ленивого перечислителя.  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Улучшения производительности

* JIT [Экспериментальный]

  * JITed-код пересобирается с меньшей оптимизацией, когда предположение об оптимизации становится недействительным.

  * Встраиваемые методы выполняются, когда метод считается чистым. Эта оптимизация все еще экспериментальна, и многие методы еще НЕ считаются чистыми.

  * Значение по умолчанию для `--jit-min-calls` изменено с 5 до 10,000

  * Значение по умолчанию для `--jit-max-cache` изменено 1,000 до 100

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` и `nil.to_s` теперь всегда возвращают морозную строку. Возвращенная строка всегда одинакова для данного объекта. [Экспериментальный]  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Производительность `CGI.escapeHTML` улучшена. [GH-2226](https://github.com/ruby/ruby/pull/2226)

## Другие заметные изменения с 2.6

* Обновлены некоторые стандартные библиотеки.
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([НОВОСТИ](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([НОВОСТИ](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([НОВОСТИ](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Некоторые другие библиотеки, не имеющие маркера версии, также обновлены.

* Если `Proc.new` и `proc` без блока в методе, вызванным с блоком, выведется предупреждение.

* `lambda` без блока в методе вызывается с ошибками блока.

* Обновлены версии Unicode и Emoji с 11.0.0 до 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Обновлена версия Unicode до 12.1.0, с поддержкой нового глифа U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, и `Date.parse` предварительно поддерживают новую Японскую эру.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Требование к компиляторам поддерживать C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Подробнее о нашем диалекте: <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

Смотрите [НОВОСТИ](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS) или [историю коммитов](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) для подробностей об изменениях.

В этих изменениях, [3670 файлов изменено, 201242 вставок(+), 88066 удалений(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) с Ruby 2.6.0!

Получайте удовольствие от программирования с Ruby 2.7!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Что такое Ruby

Изначально Ruby был разработан Matz (Yukihiro Matsumoto) в 1993 году, и в настоящее время разрабатывается как Open Source. Он работает на множестве платформ и используется во всем мире, особенно для веб-разработки.
