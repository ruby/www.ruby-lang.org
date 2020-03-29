---
layout: news_post
title: "Вышел Ruby 2.7.0-preview3"
author: "naruse"
translator: "shprotru"
date: 2019-11-23 12:00:00 +0000
lang: ru
---

Мы рады сообщить о выпуске Ruby 2.7.0-preview3.

Предварительная версия выпущена, чтобы собрать обратную связь для окончательного выпуска
запланировано на декабрь.
Этот preview3 в основном выпущен для подтверждения совместимости
ключевых аргументов.

В нём вводится ряд новшеств и улучшений производительности,
наиболее значимые:

* Уплотнение GC
* Сопоставление с образцом
* Улучшение REPL
* Разделение позиционных и ключевых аргументов

## Уплотнение GC

Этот выпуск содержит новшество - уплотнение GC, который позволяет
дефрагментировать фрагментированную память.

В некоторых многопоточных Ruby-программах может возникать фрагментация
памяти, что приводит к чрезмерному потреблению памяти и снижению производительности.

Метод `GC.compact` вводится для уплотнения хипа. Эта функция сжимает живые
объекты в хипе, чтобы уменьшить количество использованных страниц памяти,
и хип может оказаться более подходящим для CoW.
[[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Сопоставление с образцом [Экспериментальное]

Сопоставление с образцом, широко используемое в функциональных языках
программирования, представлено в качестве экспериментального нововведения.
[[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)

Оно позволяет пересекать с указанным объектом и присваивать ему значение,
если оно соответствует шаблону.

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

Подробнее, смотрите
[Сопоставление с образцом - новая особенность Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Улучшение REPL

`irb`, включаемая интерактивная оболочка (REPL; Read-Eval-Print-Loop),
теперь поддерживает многострочное редактирование. Оно работает на `reline`,
совместимой с `readline` но реализованной на Ruby.
Обеспечена интеграция rdoc. Теперь в `irb` можно отобразить ссылку
на указанный класс, модуль или метод.
[[Feature #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Feature #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)

Кроме того, строки исходников в `binding.irb` и результаты инспектирования
для базовых классов теперь подсвечиваются.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Разделение позиционных и ключевых аргументов

Автоматическая конверсия ключевых аргументов и позиционных аргументов
устарели, и эти преобразования будут удалены в Ruby 3.
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

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
  если метод принимает произвольные ключевые слова.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* `**nil` допускается в определениях методов явно отмечать
  что метод не принимает никаких ключевых слов. Вызов такого метода
  с ключевыми словами приведет к возникновнию ArgumentError.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

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
  позиционного хэша.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

ПРИМЕЧАНИЕ: Выводилось слишком много устаревших предупреждений
о несовместимости аргументов ключевых слов, слишком многословны.
В настоящее время обсуждаются два решения; отключение устаревших
предупреждений по умолчанию
([#16345](https://bugs.ruby-lang.org/issues/16345))
или подавление задублированных предупреждений
([#16289](https://bugs.ruby-lang.org/issues/16289)).
Окончательное решение пока не принято, но будет зафиксировано
в официальным релизе.

## Другие Значимые Новые Функции

* Оператор ссылки на метод, `.:`, вводился в качестве
  экспериментальной функции в ранних выпусках, но был отклонён
  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125),
  [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581),
  [[Feature #16275]](https://bugs.ruby-lang.org/issues/16275)

* Нумерованный параметр в качестве параметра блока по умолчанию
  представлен в качестве экспериментальной функции.
  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* Вводится экспериментальный безначальный диапазон. Это может
  не так полезно, как бесконечный диапазон, но может пригодиться
  для DSL.
  [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` добавлен.  Подсчитывает вхождение каждого элемента.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Вызов приватного метода по `self` теперь возможен.
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` добавлен.
  Генерирует не ленивый перечислитель из ленивого перечислителя.
  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Улучшения производительности

* JIT [Экспериментальный]

  * JITed-код пересобирается с меньшей оптимизацией, когда
    предположение об оптимизации становится недействительным.

  * Встраиваемые методы выполняются, когда метод считается чистым.
    Эта оптимизация все еще экспериментальна, и многие методы еще
    НЕ считаются чистыми.

  * Значение по умолчанию для `--jit-min-calls` изменено с 5 до 10,000

  * Значение по умолчанию для `--jit-max-cache` изменено 1,000 до 100.

* ~~`Symbol#to_s`~~ (отменено), `Module#name`, `true.to_s`, `false.to_s`,
  и `nil.to_s` теперь всегда возвращают морозную строку.
  Возвращенная строка всегда одинакова для данного объекта.
  [Экспериментальный]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Производительность `CGI.escapeHTML` улучшена.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Производительность Monitor и MonitorMixin улучшена.
  [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

## Другие заметные изменения с 2.6

* Обновлены некоторые стандартные библиотеки.
  * Bundler 2.1.0.pre.3
    ([История](https://github.com/bundler/bundler/blob/2-1-stable/CHANGELOG.md#210pre3-november-8-2019))
  * RubyGems 3.1.0.pre.3
    ([История](https://github.com/rubygems/rubygems/blob/3.1/History.txt))
  * CSV 3.1.2
    ([НОВОСТИ](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3
    ([НОВОСТИ](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([НОВОСТИ](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Некоторые другие библиотеки, не имеющие маркера версии, также обновлены.

* stdlib переместили в default gems
  * Следующие default gems были опубликованы на rubygems.org
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * Следующие default gems были только объявлены в ruby-core,
    но не были опубликованы на rubygems.org.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* Если `Proc.new` и `proc` без блока в методе, вызванным с блоком,
  выведется предупреждение.

* `lambda` без блока в методе вызывается с ошибками блока.

* Обновлены версии Unicode и Emoji с 11.0.0 до 12.0.0.
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Обновлена версия Unicode до 12.1.0,
  с поддержкой нового глифа U+32FF SQUARE ERA NAME REIWA.
  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, и `Date.parse` поддерживают
  новую Японскую эру.
  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Требование к компиляторам поддерживать C99
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Подробнее о нашем диалекте:
    <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

* ~~`Regexp#match{?}` с `nil` приводит к TypeError as String, Symbol.
  [[Feature #13083]](https://bugs.ruby-lang.org/issues/13083)~~ отменено

3895 файлов изменено, 213426 вставок(+), 96934 удалений(-)

Смотрите [НОВОСТИ](https://github.com/ruby/ruby/blob/v2_7_0_preview3/NEWS)
или [историю коммитов](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview3)
для подробностей об изменениях.

В этих изменениях,
[статистика](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview3)
с Ruby 2.6.0!

Получайте удовольствие от программирования с Ruby 2.7!

## Скачать

{% assign release = site.data.releases | where: "version", "2.7.0-preview3" | first %}

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

## Что такое Ruby

Изначально Ruby был разработан Matz (Yukihiro Matsumoto) в 1993 году,
и в настоящее время разрабатывается как Open Source. Он работает на
множестве платформ и используется во всем мире, особенно для веб-разработки.
