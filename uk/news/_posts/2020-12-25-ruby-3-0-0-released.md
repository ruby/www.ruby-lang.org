---
layout: news_post
title: "Вийшов Ruby 3.0.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2020-12-25 00:00:00 +0000
lang: uk
---

Ми раді повідомити про реліз Ruby 3.0.0. Починаючи з 2015 року, ми наполегливо працювали над Ruby 3, метою якого є продуктивність, паралелізм і типізація. Особливо щодо продуктивності, Matz заявив: «Ruby3 буде в 3 рази швидшим за Ruby2» — так звана ініціатива [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

З [бенчмарком Optcarrot](https://github.com/mame/optcarrot), який вимірює однопотокову продуктивність на основі емуляції ігор NES, він досяг у 3 рази кращої продуктивності, ніж Ruby 2.0! <details>Ці результати отримані в середовищі, описаному на [benchmark-driver.github.io/hardware.html](https://benchmark-driver.github.io/hardware.html). Використано [коміт 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) як Ruby 3.0. Залежно від вашого середовища або бенчмарку результат може відрізнятися.</details>

Ruby 3.0.0 досягає цих цілей завдяки:
* Продуктивність
  * MJIT
* Паралелізм
  * Ractor
  * Fiber Scheduler
* Типізація (Статичний аналіз)
  * RBS
  * TypeProf

З наведеним вище покращенням продуктивності Ruby 3.0 вводить кілька нових функцій, описаних нижче.

## Продуктивність

> Коли я вперше оголосив «Ruby3x3» на конференції, багато хто, включаючи членів основної команди, вважав: «Матц хвалько». Насправді я й сам так думав. Але ми це зробили. Я радий бачити, що основна команда справді змогла зробити Ruby 3.0 утричі швидшим за Ruby 2.0 (в деяких бенчмарках). — Matz

### MJIT

Було впроваджено багато покращень у MJIT. Докладніше див. у NEWS.

Станом на Ruby 3.0, JIT має покращувати продуктивність в обмежених сценаріях, таких як ігри ([Optcarrot](https://benchmark-driver.github.io/benchmarks/optcarrot/commits.html#chart-1)), ШІ ([Rubykon](https://benchmark-driver.github.io/benchmarks/rubykon/commits.html)) або будь-який застосунок, який витрачає більшість часу на виклик кількох методів багато разів.

Хоча Ruby 3.0 [значно зменшив розмір JIT-коду](https://twitter.com/k0kubun/status/1256142302608650244), він ще не готовий для оптимізації таких навантажень, як Rails, які часто витрачають час на багато методів і тому страждають від промахів i-cache, погіршених JIT. Очікуйте подальших покращень у Ruby 3.1.

## Паралелізм

> Сьогодні ера багатоядерних процесорів. Паралелізм дуже важливий. З Ractor разом з асинхронним Fiber Ruby стане справжньою паралельною мовою. — Matz

### Ractor (експериментальний)

Ractor — це абстракція паралелізму на зразок моделі акторів, розроблена для забезпечення можливості паралельного виконання без проблем із безпекою потоків.

Ви можете створювати кілька ракторів і запускати їх паралельно. Ractor дозволяє створювати потокобезпечні паралельні програми, оскільки рактори не можуть ділитися звичайними об'єктами. Комунікація між ракторами здійснюється через обмін повідомленнями.

Щоб обмежити спільне використання об'єктів, Ractor вводить кілька обмежень до синтаксису Ruby (без кількох ракторів обмежень немає).

Специфікація та реалізація ще не дозріли і можуть змінитися в майбутньому, тому цю функцію позначено як експериментальну, і при першому `Ractor.new` з'являється попередження «experimental feature».

Наступна невелика програма вимірює час виконання відомої функції бенчмарку tak ([Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))), виконуючи її 4 рази послідовно або 4 рази паралельно з ракторами.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # послідовна версія
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # паралельна версія
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Результат бенчмарку:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Результат отримано на Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 ядра, 8 апаратних потоків). Паралельна версія в 3.87 разів швидша за послідовну.

Докладніше див. [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html).

### Fiber Scheduler

`Fiber#scheduler` введено для перехоплення блокувальних операцій. Це дозволяє реалізувати легку конкурентність без зміни існуючого коду. Перегляньте [«Don't Wait For Me, Scalable Concurrency for Ruby 3»](https://www.youtube.com/watch?v=Y29SSOS4UOc) для огляду того, як це працює.

Підтримувані класи/методи:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` та пов'язані методи (напр., `#wait_readable`, `#gets`, `#puts` тощо).
- `IO#select` *не підтримується*.

Ця приклад-програма виконує кілька HTTP-запитів паралельно:

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

Вона використовує [async](https://github.com/socketry/async), що надає цикл подій. Цей цикл подій використовує хуки `Fiber#scheduler`, щоб зробити `Net::HTTP` неблокувальним. Інші геми можуть використовувати цей інтерфейс для неблокувального виконання в Ruby.

## Статичний аналіз

> 2010-і були ерою статично типізованих мов програмування. Ruby шукає майбутнє зі статичною перевіркою типів без оголошення типів, використовуючи абстрактну інтерпретацію. RBS і TypeProf — перші кроки до цього майбутнього. Більше кроків попереду. — Matz

### RBS

RBS — це мова для опису типів програм Ruby.

Перевірники типів, включаючи TypeProf та інші інструменти з підтримкою RBS, краще розумітимуть програми Ruby з визначеннями RBS.

Ви можете записати визначення класів і модулів: методи, визначені в класі, змінні екземпляра та їхні типи, а також відносини наслідування/міксинів.

Мета RBS — підтримувати типові патерни в програмах Ruby та дозволяти записувати розширені типи, включаючи типи-об'єднання, перевантаження методів і генерики. Він також підтримує duck typing за допомогою _інтерфейсних типів_.

Ruby 3.0 поставляється з гемом `rbs`, який дозволяє парсити та обробляти визначення типів, записані в RBS.
Ось невеликий приклад RBS з визначеннями класу, модуля та константи.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` означає типи-об'єднання, `User` або `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Підтримується перевантаження методів.
            | (File, from: User | Bot) -> Message
  end
end
```

Докладніше див. [README гема rbs](https://github.com/ruby/rbs).

### TypeProf

TypeProf — інструмент аналізу типів, що входить до пакету Ruby.

Наразі TypeProf працює як виведення типів.

Він читає звичайний (без анотацій типів) код Ruby, аналізує, які методи визначено та як вони використовуються, і генерує прототип сигнатури типу у форматі RBS.

Ось коротка демонстрація TypeProf.

Приклад вхідних даних:

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

Приклад виводу:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Ви можете запустити TypeProf, зберігши вхідні дані як «test.rb» і виконавши команду «typeprof test.rb».

Ви також можете [спробувати TypeProf онлайн](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=). (Він виконує TypeProf на сервері, тож вибачте, якщо не працює!)

Докладніше див. [документацію TypeProf](https://github.com/ruby/typeprof/blob/master/doc/doc.md) та [демо](https://github.com/ruby/typeprof/blob/master/doc/demo.md).

TypeProf експериментальний і ще не дозрілий; підтримується лише підмножина мови Ruby, а виявлення помилок типів обмежене. Проте він швидко розвивається. Будь-який зворотний зв'язок вітається.

## Інші важливі нові функції

* Однорядкове зіставлення шаблонів перероблено. (експериментально)

    * Додано `=>`. Можна використовувати як присвоєння справа наліво.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` тепер повертає `true` або `false`.

      ```ruby
      # версія 3.0
      0 in 1 #=> false

      # версія 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* Додано Find-патерн. (експериментально)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Додано безкінечне визначення методу.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` тепер вбудовано.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory view додано як експериментальну функцію.

## Покращення продуктивності

* Вставка довгого коду в IRB стала в 53 рази швидшою, ніж у версії з Ruby 2.7.0.

## Інші важливі зміни порівняно з 2.7

* Ключові аргументи відокремлено від інших аргументів.
  * Код, що виводить попередження в Ruby 2.7, не працюватиме. Докладніше див. [цей документ](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/).
  * До речі, передача аргументів тепер підтримує початкові аргументи.

* Зіставлення шаблонів (`case`/`in`) більше не експериментальне.
* Функцію `$SAFE` повністю видалено; тепер це звичайна глобальна змінна.
* Деякі стандартні бібліотеки оновлено.
* Наступні бібліотеки більше не є bundled gems або стандартними бібліотеками: sdbm, webrick, net-telnet, xmlrpc.

Докладніше див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [історію комітів](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}).

> Ruby3.0 — це віха. Мова еволюціонувала, зберігаючи сумісність. Але це не кінець. Ruby продовжить розвиватися і ставатиме ще кращим. Слідкуйте за новинами! — Matz

Веселого Різдва, гарних свят і насолоджуйтесь програмуванням з Ruby 3.0!

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

Ruby вперше розробив Matz (Yukihiro Matsumoto) у 1993 році,
і зараз розвивається як Open Source. Він працює на багатьох платформах
і використовується по всьому світу, особливо для веброзробки.