---
layout: news_post
title: "Вышел Ruby 3.0.0"
author: "naruse"
translator: "nakilon"
date: 2020-12-25 00:00:00 +0000
lang: ru
---

Мы рады объявить о выходе Ruby 3.0.0. С 2015 мы упорно работали над Ruby 3, чья цель есть производительность, параллелизм и типизация. Matz особенно подчеркнул производительность: "Ruby3 будет в 3 раза быстрее Ruby2" a.k.a. [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

С помощью [бенчмарка Optcarrot](https://github.com/mame/optcarrot), который замеряет скорость одного потока на примере эмуляции NES игры, мы достигли трехкратного ускорения производительности по сравнению с Ruby 2.0! <details>Замеры производились в окружении, описанном в [github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark). [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) стал отметкой Ruby 3.0. В вашем окружении или бенчмарке результат может быть не трехкратным.</details>

Ruby 3.0.0 включает в себя следующие цели
* Производительность
  * MJIT
* Параллелизм
  * Рактор
  * Планировщик нитей
* Типизация (Статический анализ)
  * RBS
  * TypeProf

С вышеуказанными улучшениями производительности Ruby 3.0 также привносит несколько новых фич, которые будут описаны ниже.

## Производительность

> Когда я впервые объявил о "Ruby3x3" в слайдах на конференции, многие члены команды подумали: "что за бахвальство?". На самом деле мне тогда тоже так показалось. Но мы сделали это. Для меня честь видеть, что команда действительно смогла сделать Ruby3.0 в три раза быстрее Ruby2.0 (в некоторых бенчмарках). -- Matz

### MJIT

Многие улучшения были реализованы в MJIT. См. NEWS.

В Ruby версии 3.0 подразумевается, что JIT улучшит производительность в некоторых задачах, таких как игры ([Optcarrot](https://github.com/mame/optcarrot)), ИИ ([Rubykon](https://github.com/benchmark-driver)) или любое другое приложение, которое тратит большую часть времени вызывая одни и те же методы много раз.

Не смотря на то, что Ruby 3.0 [значительно уменьшил размер JIT кода](https://twitter.com/k0kubun/status/1256142302608650244), он все еще не готов к оптимизации таких задач, как Rails, где так много методов, что происходит промах в i-cache, особенно при JIT. Следите за новостями о дальнейших улучшениях в Ruby 3.1 на этот счет.

## Параллелизм

> Сегодня мы живем в мире многоядерности. Параллелизм очень важен. Ractor и Async Fiber сделают Ruby по-настоящему языком параллельного программирования. --- Matz

## Рактор (экспериментально)

Рактор -- это абстракция параллельных вычислений, подобная модели акторов, предназначенная обеспечить параллельное выполнение без лишних хлопот о потоковой безопасности.

Вы можете создать несколько ракторов и запустить их параллельно. Рактор обеспечивает потоковую безопасность параллельных вычислений тем, что не может иметь общих объектов с другими ракторами в обычном понимании. Коммуникация между ракторами обеспечивается передачей сообщений.

Рактор синтаксически ограничивает возможность совместного использования объектов (в случае одного Рактора разницы не будет).

Спецификация и реализация еще не окончательны и могут быть изменены в будущем, поэтому эта фича отмечена как экспериментальная и выдает предупреждение "experimental feature" при первом вызове `Ractor.new`.

Ниже небольшая программа, вычисляющая `n.prime?` (`n` -- относительно большое целое число) параллельно двумя ракторами. На компьютере, поддерживающем параллельные вычисления, вы убедитесь, что программа выполняется примерно в 2 раза быстрее, чем последовательная.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Результаты были получены на Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 физических ядра, 8 логических ядер). Это показывает, что параллелизированная версия в 3.87 раза быстрее, чем последовательная.

См. [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html).

### Планировщик нитей

`Fiber#scheduler` предназначен для перехвата блокирующих операций. Это обеспечивает легковесный параллелизм без необходимости менять существующий код. Обзор того, как это работает, смотрите в видео ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc).

Классы/методы, поддерживаемые на данный момент:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` и смежные (`#wait_readable`, `#gets`, `#puts` и пр.).
- `IO#select` *не поддерживается*.

Этот пример выполнит несколько запросов HTTP параллельно:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Он использует гем [async](https://github.com/socketry/async) который обеспечивает цикл событий. Этот цикл событий использует хуки `Fiber#scheduler` для того, чтобы сделать `Net::HTTP` неблокирующим. Другие гемы также могут использовать этот интерфейс для обеспечения неблокирующего выполнения кода на Ruby, и эти гемы могут быть совместимыми другими реализациями Ruby (например, JRuby, TruffleRuby), которые могут поддерживать такие же неблокирующие хуки.

## Статический анализ

> 2010-е были эпохой статически типизированных языков программирования. Ruby смотрит в будущее статической типизации не через объявление типов, а через абстрактную интерпретацию. RBS и TypeProf -- это первые шаги в будущее. Впереди еще много шагов. --- Matz

### RBS

RBS -- это язык описания типов в программах на Ruby.

Тайп-чекеры, включая TypeProf и другие инструменты, поддерживающие RBS, будут понимать программы на Ruby намного лучше с определениями RBS.

Вы можете написать определения классам и модулям: методам, определенным в классе, переменным экземпляра и их типам, а также отношениям наследования/примесей.

RBS преследует цель поддержать наиболее часто встречающиеся паттерны программирования на Ruby и позволяет описывать сложные типы, такие как объединения, перегрузка методов и дженерики. Также поддерживается утиная типизация с _интерфейсами_.

Ruby 3.0 поставляется с гемом `rbs`, который позволяет парсить и обрабатывать определения типов, написанные на языке RBS.
Ниже небольшой пример RBS с определениями класса, модуля и константы.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

См. [README гема rbs](https://github.com/ruby/rbs).

### TypeProf

TypeProf -- это инструмент статического анализа, поставляемый вместе с пакетом Ruby.

На данный момент TypeProf как бы выполняет вывод типов.

Он читает обычный (без аннотаций типов) код на Ruby, анализирует, как методы объявлены и используются, и генерирует прототип аннотаций типов в формате RBS.

Вот небольшая демонстрация TypeProf.

Пример ввода:

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Пример вывода:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Вы можете воспользоваться TypeProf сохранив ввод в файл `test.rb`, а затем выполнив команду `typeprof test.rb`.

Также вы можете [попробовать TypeProf онлайн](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (Там TypeProf запускается на сервере -- приносим свои извинения, если он лежит!)

См. [документацию по TypeProf](https://github.com/ruby/typeprof/blob/master/doc/doc.md) и [демо](https://github.com/ruby/typeprof/blob/master/doc/demo.md).

TypeProf -- это еще пока только экспериментальная разработка; поддерживается лишь подмножество языка Ruby, и определение типов ограничено. Однако она быстро растет и улучшает покрытие фич языка, скорость анализа и удобство использования. Любая обратная связь крайне приветствуется.

## Другие значимые новые фичи

* Однострочный поиск по образцу изменил свой вид.  (экспериментально)

    * добавлен `=>` для правостороннего присваивания.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` теперь возвращает `true` или `false`.

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* Поиск по образцу. (экспериментально)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Добавлена возможность объявления метода без end.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` теперь в stdlib.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Просмотр памяти добавлен как экспериментальная фича

    * Это новое C-API для прямого обмена участками памяти, такими как числовой массив или битмап, между библиотеками нативных расширений.  Библиотеки расширений также могут делиться метаданными об участках памяти, таких как форма, формат и пр.  С помощью этих метаданных библиотеки расширений могут делиться даже многомерными массивами.  Дизайн этой фичи был вдохновлен буферным протоколом Python.

## Улучшения производительности

* Вставка длинного кода в IRB в 53 раза быстрее, чем в IRB от Ruby 2.7.0. Например, время, необходимое для вставки [этого кода](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) уменьшилось с 11.7 секунды до 0.22 секунды.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* В IRB добавлена команда `measure`. Она позволяет легко замерять время выполнения.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Другие значимые отличия от 2.7

* Именованные параметры отделены от остальных.
  * Код, который выдавал предупреждения в Ruby 2.7, работать больше не будет.  См. [новость](https://www.ruby-lang.org/ru/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/).
  * Кстати, теперь можно брать только ведущие аргументы.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Поиск по образцу (`case`/`in`) -- больше не экспериментальная фича.
  * См. [документацию по поиску по образцу](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html).
* Фича `$SAFE` полностью выпилена; теперь это обычная глобальная переменная.
* В Ruby 2.5 бектрейс был развернут, но это изменение откатили.  Теперь он ведет себя как в Ruby 2.4; сначала идет сообщение об ошибке и номер строки, где возникло исключение, а затем следует стек вызовов.
* Обновлены некоторые стандартные библиотеки.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * etc.
* Следующие библиотеки более не поставляются с языком.
  Устанавливайте их соответствующими гемами.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* Следующие, поставляемые с языком, гемы больше не встроены в него.
  * rexml
  * rss
* Следующие файлы стандартной библиотеки переведены в разряд встроенных гемов и опубликованы на rubygems.org.
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

См. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [коммиты](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}).

В ходе этого со времен версии 2.7.0 было изменено [{{ release.stats.files_changed }} файлов, было сделано {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)!

> Ruby3.0 -- это веха. Язык эволюционировал, сохранив совместимость. Но это еще не все. Ruby будет развиваться и станет еще лучше. Следите за новостями! --- Matz

С Рождеством, с праздниками, и получайте удовольствие от программирования на Ruby 3.0!

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

Matz (Yukihiro Matsumoto) разработал первую версию Ruby в 1993,
и на сегодня язык разрабатывается как Open Source. Он работает
на множестве платформ и используется по всему миру, особенно в веб разработке.
