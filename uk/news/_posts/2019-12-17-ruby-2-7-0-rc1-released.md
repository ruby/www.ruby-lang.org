---
layout: news_post
title: "Вийшов Ruby 2.7.0-rc1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2019-12-17 12:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "2.7.0-rc1" | first %}

Ми раді оголосити випуск Ruby 2.7.0-rc1.

Release candidate випущено для збору відгуків для фінального випуску,
запланованого на грудень.
Цей rc1 в основному випущено для підтвердження сумісності
ключових аргументів.

Він також вводить ряд нових функцій та покращень продуктивності,
найбільш помітні:

* Compaction GC
* Pattern Matching
* Покращення REPL
* Розділення позиційних та ключових аргументів

## Compaction GC

Цей випуск вводить Compaction GC, який може дефрагментувати
фрагментований простір пам'яті.

Деякі багатопотокові програми Ruby можуть спричинити фрагментацію пам'яті,
що призводить до високого використання пам'яті та погіршення швидкості.

Метод `GC.compact` введено для компактування купи.
Ця функція компактує живі об'єкти в купі, щоб використовувалося менше сторінок,
та купа може бути більш CoW дружньою.
[[Функція #15626]](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Експериментально]

Pattern matching, широко використовувана функція в функціональних мовах програмування,
введена як експериментальна функція.
[[Функція #14912]](https://bugs.ruby-lang.org/issues/14912)

Вона може обходити заданий об'єкт та призначати його значення, якщо воно відповідає шаблону.

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

Для більше деталей, будь ласка, див.
[Pattern matching - Нова функція в Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Покращення REPL

`irb`, включене інтерактивне середовище (REPL; Read-Eval-Print-Loop),
тепер підтримує багаторядкове редагування. Воно працює завдяки `reline`,
сумісній з `readline` реалізації на чистому Ruby.
Воно також надає інтеграцію rdoc. В `irb` ви можете відобразити довідку
для заданого класу, модуля або методу.
[[Функція #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Функція #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Функція #14918]](https://bugs.ruby-lang.org/issues/14918)

Крім того, рядки джерела, показані в `binding.irb`, та результати inspect
для об'єктів core-класів тепер кольорові.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Розділення позиційних та ключових аргументів

Автоматичне перетворення ключових аргументів та позиційних аргументів
застаріло, і перетворення буде видалено в Ruby 3.
[[Функція #14183]](https://bugs.ruby-lang.org/issues/14183)

* Коли виклик методу передає Hash як останній аргумент, і коли він
  не передає ключові слова, і коли викликаний метод приймає ключові слова, випускається
  попередження.  Щоб продовжити обробляти hash як ключові слова,
  додайте подвійний оператор splat, щоб уникнути попередження та забезпечити
  правильну поведінку в Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # попереджено
  def foo(**kw);    end; foo({key: 42})   # попереджено
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Коли виклик методу передає ключові слова до методу, який приймає ключові слова,
  але він не передає достатньо обов'язкових позиційних аргументів,
  ключові слова обробляються як останній обов'язковий позиційний аргумент, і
  випускається попередження.  Передайте аргумент як hash замість ключових слів,
  щоб уникнути попередження та забезпечити правильну поведінку в Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # попереджено
  def foo(h, key: 42); end; foo(key: 42)   # попереджено
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Коли метод приймає специфічні ключові слова, але не приймає splat ключових слів, і
  hash або splat ключових слів передається до методу, який включає як
  Symbol, так і не-Symbol ключі, hash продовжує бути розділеним, і
  випускається попередження.  Вам потрібно буде оновити код виклику,
  щоб передати окремі hash, щоб забезпечити правильну поведінку в Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # попереджено
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # попереджено
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* Якщо метод не приймає ключові слова, і викликається з ключовими словами,
  ключові слова все ще обробляються як позиційний hash, без попередження.
  Ця поведінка продовжуватиме працювати в Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* Не-символи дозволені як ключі ключових аргументів, якщо метод приймає
  довільні ключові слова.
  [[Функція #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* `**nil` дозволено у визначеннях методів, щоб явно позначити,
  що метод не приймає ключові слова. Виклик такого методу з ключовими словами
  призведе до ArgumentError.
  [[Функція #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Передача порожнього splat ключових слів до методу, який не приймає ключові слова,
  більше не передає порожній hash, якщо порожній hash не потрібен для
  обов'язкового параметра, в такому випадку випускається попередження.
  Видаліть подвійний splat, щоб продовжити передавати позиційний hash.
  [[Функція #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} та попередження
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

ПРИМІТКА: Занадто багато попереджень про застарілість про несумісність ключових аргументів
було вказано як занадто багатослівні.  Зараз обговорюються два можливі рішення;
вимкнення попереджень про застарілість за замовчуванням
([#16345](https://bugs.ruby-lang.org/issues/16345))
або придушення дубльованих попереджень
([#16289](https://bugs.ruby-lang.org/issues/16289)).
Фінальне рішення не прийнято, але буде виправлено офіційним випуском.

## Інші помітні нові функції

* Оператор посилання на метод, `.:`, був введений
  як експериментальна функція в попередніх preview, але був відкочений назад.
  [[Функція #12125]](https://bugs.ruby-lang.org/issues/12125),
  [[Функція #13581]]( https://bugs.ruby-lang.org/issues/13581),
  [[Функція #16275]](https://bugs.ruby-lang.org/issues/16275)

* Нумерований параметр як параметр блоку за замовчуванням введено
  як експериментальну функцію.
  [[Функція #4475]](https://bugs.ruby-lang.org/issues/4475)

* Безпочатковий діапазон експериментально введено.  Він може бути не таким
  корисним як нескінченний діапазон, але буде хорошим для цілей DSL.
  [[Функція #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # ідентично до ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` додано.  Він підраховує появу кожного елемента.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Виклик приватного методу на `self` тепер дозволено.
  [[Функція #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Функція #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` додано.
  Він генерує не-lazy enumerator з lazy enumerator.
  [[Функція #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Покращення продуктивності

* JIT [Експериментально]

  * JIT-компільований код перекомпілюється до менш оптимізованого коду, коли
    припущення оптимізації стає недійсним.

  * Інлайнінг методів виконується, коли метод вважається чистим.
    Ця оптимізація все ще експериментальна, і багато методів
    ще НЕ вважаються чистими.

  * Значення за замовчуванням `--jit-min-calls` змінено з 5 на 10,000.

  * Значення за замовчуванням `--jit-max-cache` змінено з 1,000 на 100.

* ~~`Symbol#to_s`,~~ `Module#name`, `true.to_s`, `false.to_s`,
  та `nil.to_s` тепер завжди повертають заморожений String.
  Повернутий String завжди той самий для заданого об'єкта.
  [Експериментально]
  [[Функція #16150]](https://bugs.ruby-lang.org/issues/16150)

* Продуктивність `CGI.escapeHTML` покращено.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Продуктивність Monitor та MonitorMixin покращено.
  [[Функція #16255]](https://bugs.ruby-lang.org/issues/16255)

## Інші помітні зміни з 2.6

* Деякі стандартні бібліотеки оновлено.
  * Bundler 2.1.0.pre.3
    ([Історія](https://github.com/bundler/bundler/blob/2-1-stable/CHANGELOG.md#210pre3-november-8-2019))
  * RubyGems 3.1.0.pre.3
    ([Історія](https://github.com/rubygems/rubygems/blob/3.1/History.txt))
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Деякі інші бібліотеки, які не мають оригінальної версії, також оновлено.

* Підвищено stdlib до default gems
  * Наступні default gems були опубліковані на rubygems.org
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * Наступні default gems були лише підвищені в ruby-core,
    але ще не опубліковані на rubygems.org.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* `Proc.new` та `proc` без блоку в методі, викликаному з блоком,
   тепер попереджають.

* `lambda` без блоку в методі, викликаному з блоком, помиляється.

* Оновлено версію Unicode та Emoji з 11.0.0 до 12.0.0.
  [[Функція #15321]](https://bugs.ruby-lang.org/issues/15321)

* Оновлено версію Unicode до 12.1.0,
  додаючи підтримку для U+32FF SQUARE ERA NAME REIWA.
  [[Функція #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, та `Date.parse` підтримують
  нову японську еру.
  [[Функція #15742]](https://bugs.ruby-lang.org/issues/15742)

* Вимагаємо підтримки C99 компіляторами
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Деталі нашого діалекту:
    <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

* ~~`Regexp#match{?}` з `nil` піднімає TypeError як String, Symbol.
  [[Функція #13083]](https://bugs.ruby-lang.org/issues/13083)~~ відкочено назад

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_rc1/NEWS)
або [логи комітів](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_rc1)
для більше деталей.

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_rc1)
з Ruby 2.6.0!
Насолоджуйтеся програмуванням з Ruby 2.7!

## Завантаження

* <{{ release.url.bz2 }}>

      РОЗМІР: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      РОЗМІР: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      РОЗМІР: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      РОЗМІР: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Що таке Ruby

Ruby вперше розроблено Matz (Yukihiro Matsumoto) у 1993 році,
і зараз розробляється як Open Source. Він працює на кількох платформах
та використовується по всьому світу, особливо для веб-розробки.