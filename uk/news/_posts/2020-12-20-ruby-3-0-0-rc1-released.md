---
layout: news_post
title: "Вийшов Ruby 3.0.0 RC1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2020-12-20 00:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 3.0.0-rc1.

Він вводить ряд нових функцій та покращень продуктивності.

## Статичний аналіз

### RBS

RBS - це мова для опису типів програм Ruby.

Перевірки типів, включаючи TypeProf та інші інструменти, що підтримують RBS, зрозуміють програми Ruby набагато краще з визначеннями RBS.

Ви можете записати визначення класів та модулів: методи, визначені в класі, змінні екземпляра та їх типи, та відносини наслідування/міксину.

Мета RBS - підтримувати загальні патерни в програмах Ruby, і він дозволяє писати розширені типи, включаючи об'єднані типи, перевантаження методів та дженерики. Він також підтримує duck typing з _типами інтерфейсів_.

Ruby 3.0 постачається з gem `rbs`, який дозволяє парсити та обробляти визначення типів, написані в RBS.
Наступний приклад - невеликий приклад RBS з визначеннями класу, модуля та константи.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` означає об'єднані типи, `User` або `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Підтримується перевантаження методів.
            | (File, from: User | Bot) -> Message
  end
end
```

Див. [README gem rbs](https://github.com/ruby/rbs) для більше деталей.

### TypeProf

TypeProf - це інструмент аналізу типів, включений в пакет Ruby.

Зараз TypeProf служить як вид виведення типів.

Він читає звичайний (без анотацій типів) код Ruby, аналізує, які методи визначені та як вони використовуються, та генерує прототип підпису типу в форматі RBS.

Ось простий демо TypeProf.

Приклад вводу:

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

Ви можете запустити TypeProf, зберегши ввід як "test.rb" та викликавши команду "typeprof test.rb".

Ви також можете [спробувати TypeProf онлайн](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (Він запускає TypeProf на стороні сервера, тому вибачте, якщо він недоступний!)

Див. [документацію](https://github.com/ruby/typeprof/blob/master/doc/doc.md) та [демо](https://github.com/ruby/typeprof/blob/master/doc/demo.md) для деталей.

TypeProf експериментальний і ще не так дозрілий; підтримується лише підмножина мови Ruby, і виявлення помилок типів обмежене. Але він все ще швидко розвивається для покращення покриття мовних функцій, продуктивності аналізу та зручності використання. Будь-який відгук дуже вітається.

## Ractor (експериментально)

Ractor - це абстракція конкурентності, подібна до Actor-моделі, розроблена для надання функції паралельного виконання без проблем з потокобезпекою.

Ви можете створити кілька ractor та запустити їх паралельно. Ractor дозволяє вам створювати потокобезпечні паралельні програми, оскільки ractor не можуть ділитися звичайними об'єктами. Комунікація між ractor підтримується передачею повідомлень.

Щоб обмежити обмін об'єктами, Ractor вводить кілька обмежень до синтаксису Ruby (без кількох Ractor немає обмежень).

Специфікація та реалізація не дозріли та можуть змінитися в майбутньому, тому ця функція позначена як експериментальна та показує попередження про "експериментальну функцію", коли створюється перший `Ractor.new`.

Наступна невелика програма обчислює `n.prime?` (`n` відносно велике ціле число) паралельно з двома ractor. Ви підтвердите, що виконання програми приблизно в 2 рази швидше порівняно з послідовною програмою на паралельному комп'ютері.

``` ruby
require 'prime'
# n.prime? з надісланими цілими числами в r1, r2 працюють паралельно
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.receive
    n.prime?
  end
end
# надіслати параметри
r1.send 2**61 - 1
r2.send 2**61 + 15
# чекати результати expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Див. [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) для більше деталей.

## Fiber Scheduler

`Fiber#scheduler` введено для перехоплення блокуючих операцій. Це дозволяє легку конкурентність без зміни існуючого коду. Перегляньте ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) для огляду того, як це працює.

Зараз підтримуються класи/методи:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` та пов'язані методи (наприклад, `#wait_readable`, `#gets`, `#puts` тощо).
- `IO#select` *не підтримується*.

(Пояснити Async gem з посиланнями). Ця прикладна програма виконає кілька HTTP запитів одночасно:

(Пояснити це:)
1. async - це зовнішній gem
2. async використовує цю нову функцію

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

## Інші помітні нові функції

* Однолінійний pattern matching перероблено.  (експериментально)

    * `=>` додано. Він може використовуватися як правостороннє присвоєння.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` змінено, щоб повертати `true` або `false`.

      ```ruby
      # версія 3.0
      0 in 1 #=> false

      # версія 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* Додано find pattern. (експериментально)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Додано нескінченне визначення методу.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` тепер вбудований.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory view додано як експериментальну функцію

    * Це новий набір C-API для обміну сирою областю пам'яті, такою як числовий масив та растрове зображення, між бібліотеками розширень.  Бібліотеки розширень можуть також ділитися метаданими області пам'яті, що складається з форми, формату елемента тощо.  Використовуючи такі метадані, бібліотеки розширень можуть навіть правильно ділитися багатовимірним масивом.  Ця функція розроблена з посиланням на buffer protocol Python.

## Покращення продуктивності

* Багато покращень було реалізовано в MJIT. Див. NEWS детально.
* Вставлення довгого коду в IRB у 53 рази швидше, ніж включено в Ruby 2.7.0. Наприклад, час, необхідний для вставлення [цього прикладу коду](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b), зменшується з 11.7 секунд до 0.22 секунди.

## Інші помітні зміни з 2.7

* Ключові аргументи розділені від інших аргументів.
  * В принципі, код, який виводить попередження на Ruby 2.7, не працюватиме.  Див. [документ](https://www.ruby-lang.org/uk/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) детально.
  * До речі, пересилання аргументів тепер підтримує початкові аргументи.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Pattern matching (`case`/`in`) більше не є експериментальним.
* Функція `$SAFE` була повністю видалена; тепер це звичайна глобальна змінна.
* Порядок backtrace був зворотний в Ruby 2.5, і відкочений назад.  Тепер він поводиться як Ruby 2.4; повідомлення про помилку та номер рядка, де виникає виняток, виводяться спочатку, а його викликачі виводяться пізніше.
* Деякі стандартні бібліотеки оновлено.
  * RubyGems 3.2.2
  * Bundler 2.2.2
  * IRB 1.2.6
  * Reline 0.1.5
  * Psych 3.2.1
  * JSON 2.4.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Digest 3.0.0
  * Fiddle 1.0.4
  * StringIO 3.0.0
  * StringScanner 3.0.0
* Наступні бібліотеки більше не є включеними gems.
  Встановіть відповідні gems для використання цих функцій.
  * net-telnet
  * xmlrpc
* Наступні default gems тепер є bundled gems.
  * rexml
  * rss
* Наступні файли stdlib тепер є default gems та опубліковані на rubygems.org.
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

Див. [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_rc1/NEWS.md)
або [логи комітів](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_rc1)
для більше деталей.

{% assign release = site.data.releases | where: "version", "3.0.0-rc1" | first %}

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)
з Ruby 2.7.0!

Будь ласка, спробуйте Ruby 3.0.0-rc1 та надішліть нам будь-який відгук!

## Завантаження

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
