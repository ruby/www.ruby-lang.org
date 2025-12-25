---
layout: news_post
title: "Вийшов Ruby 2.7.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2019-12-25 00:00:00 +0000
lang: uk
---

Ми раді повідомити про реліз Ruby 2.7.0.

Він вводить низку нових функцій і покращень продуктивності, зокрема:

* Зіставлення шаблонів
* Покращення REPL
* Компактизуючий GC
* Розділення позиційних і ключових аргументів

## Зіставлення шаблонів [Експериментально]

Зіставлення шаблонів (Pattern Matching), широко використовувана функція у функціональних мовах програмування, введено як експериментальну функцію.
[[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)

Воно може обходити переданий об'єкт і присвоювати його значення, якщо воно відповідає шаблону.

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

Докладніше див. [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Покращення REPL

`irb`, вбудоване інтерактивне середовище (REPL; Read-Eval-Print-Loop), тепер підтримує багаторядкове редагування. Його забезпечує `reline`, бібліотека, сумісна з `readline`, реалізована на чистому Ruby. Також додано інтеграцію з rdoc. В `irb` можна відображати документацію для класів, модулів і методів.
[[Feature #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Feature #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)

Крім того, рядки коду, показані через `Binding#irb`, та результати інспекції об'єктів базових класів тепер підсвічуються кольором.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259" poster="https://cache.ruby-lang.org/pub/media/irb-reline-screenshot.png">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take3.mp4" type="video/mp4">
</video>

## Компактизуючий GC

Цей реліз вводить компактизуючий GC, який може дефрагментувати фрагментовану пам'ять.

Деякі багатопотокові програми Ruby можуть викликати фрагментацію пам'яті, що призводить до високого використання пам'яті та зниження швидкості.

Метод `GC.compact` введено для компактизації купи. Ця функція ущільнює живі об'єкти в купі, щоб використовувати менше сторінок, і купа може бути більш дружньою до CoW (copy-on-write).
[[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Розділення позиційних і ключових аргументів

Автоматичне перетворення ключових аргументів і позиційних аргументів застаріло і буде видалено в Ruby 3.
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

Докладніше див. статтю «[Separation of positional and keyword arguments in Ruby 3.0](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)».

## Інші важливі нові функції

* Нумеровані параметри як параметри блоків за замовчуванням.
  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* Експериментально введено діапазон без початку.
  [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # ідентично ary[0..3]
  rel.where(sales: ..100)
  ```

* Додано `Enumerable#tally`. Він підраховує кількість кожного елемента.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Виклик приватного методу з літералом `self` як одержувачем тепер дозволено.
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* Додано `Enumerator::Lazy#eager`. Він створює не-лінивий перелічувач з лінивого.
  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Покращення продуктивності

* JIT [Експериментально]

  * JIT-код перекомпільовується на менш оптимізований код, коли припущення оптимізації стає недійсним.
  * Виконується inline методів, коли метод вважається чистим.
  * Значення за замовчуванням `--jit-min-calls` змінено з 5 на 10 000.
  * Значення за замовчуванням `--jit-max-cache` змінено з 1 000 на 100.

* Стратегію кешування Fiber змінено, і створення fiber пришвидшено.
  [GH-2224](https://github.com/ruby/ruby/pull/2224)

* `Module#name`, `true.to_s`, `false.to_s` і `nil.to_s` тепер завжди повертають заморожений String.
  [Експериментально]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Покращено продуктивність `CGI.escapeHTML`.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Покращено продуктивність Monitor і MonitorMixin.
  [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

## Інші важливі зміни порівняно з 2.6

* Деякі стандартні бібліотеки оновлено.
  * Bundler 2.1.2
  * RubyGems 3.1.2
  * Racc 1.4.15
  * CSV 3.1.2
  * REXML 3.2.3
  * RSS 0.2.8
  * StringScanner 1.0.3

* Наступні бібліотеки більше не bundled gems. Встановіть відповідні геми, щоб використовувати ці функції.
  * CMath (cmath gem)
  * Scanf (scanf gem)
  * Shell (shell gem)
  * Synchronizer (sync gem)
  * ThreadsWait (thwait gem)
  * E2MM (e2mmap gem)

* `profile.rb` видалено зі стандартної бібліотеки.

* Оновлено версію Unicode та Emoji з 11.0.0 до 12.0.0.
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Оновлено версію Unicode до 12.1.0, додано підтримку U+32FF SQUARE ERA NAME REIWA.
  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* Потрібна підтримка C99 від компіляторів.
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)

Докладніше див. [NEWS](https://github.com/ruby/ruby/blob/v2_7_0/NEWS)
або [історію комітів](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0).

{% assign release = site.data.releases | where: "version", "2.7.0" | first %}

З цими змінами [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0) від Ruby 2.6.0!

Веселого Різдва, гарних свят і насолоджуйтесь програмуванням з Ruby 2.7!

## Завантаження

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

Ruby вперше розробив Matz (Yukihiro Matsumoto) у 1993 році,
і зараз розвивається як Open Source. Він працює на багатьох платформах
і використовується по всьому світу, особливо для веброзробки.