---
layout: news_post
title: "Вийшов Ruby 3.0.0 Preview 1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2020-09-25 00:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 3.0.0-preview1.

Він вводить ряд нових функцій та покращень продуктивності.

## RBS

RBS - це мова для опису типів програм Ruby.
Перевірки типів, включаючи type-profiler та інші інструменти, що підтримують RBS, зрозуміють програми Ruby набагато краще з визначеннями RBS.

Ви можете записати визначення класів та модулів: методи, визначені в класі, змінні екземпляра та їх типи, та відносини наслідування/міксину.
Мета RBS - підтримувати загальні патерни в програмах Ruby, і він дозволяє писати розширені типи, включаючи об'єднані типи, перевантаження методів та дженерики. Він також підтримує duck typing з _типами інтерфейсів_.

Ruby 3.0 постачається з gem `rbs`, який дозволяє парсити та обробляти визначення типів, написані в RBS.

Наступний приклад - невеликий приклад RBS.

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

## Ractor (експериментально)

Ractor - це абстракція конкурентності, подібна до Actor-моделі, розроблена для надання функції паралельного виконання без проблем з потокобезпекою.

Ви можете створити кілька ractor та запустити їх паралельно. Ractor дозволяє створювати потокобезпечні паралельні програми, оскільки ractor не можуть ділитися звичайними об'єктами. Комунікація між ractor підтримується передачею повідомлень.

Щоб обмежити обмін об'єктами, Ractor вводить кілька обмежень до синтаксису Ruby (без кількох Ractor немає змін).

Специфікація та реалізація не дозріли та зміняться в майбутньому, тому ця функція позначена як експериментальна та показує попередження про експериментальну функцію, якщо Ractor створено.

Наступна невелика програма обчислює `prime?` паралельно з двома ractor та приблизно в 2 рази швидше з двома або більше ядрами, ніж послідовна програма.

``` ruby
require 'prime'

# n.prime? з надісланими цілими числами в r1, r2 працюють паралельно
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
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

див. [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) для більше деталей.

## Scheduler (Експериментально)

`Thread#scheduler` введено для перехоплення блокуючих операцій. Це дозволяє легку конкурентність без зміни існуючого коду.

Зараз підтримуються класи/методи:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` та пов'язані методи (наприклад, `#wait_readable`, `#gets`, `#puts` тощо).
- `IO#select` *не підтримується*.

Поточна точка входу для конкурентності - `Fiber.schedule{...}`, однак це може змінитися до випуску Ruby 3.

Зараз доступний тестовий scheduler в [`Async::Scheduler`](https://github.com/socketry/async/pull/56). Див. [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md) для більше деталей. [Функція #16786]

**ОБЕРЕЖНО**: Ця функція сильно експериментальна. Як ім'я, так і функція зміняться в наступному preview випуску.

## Інші помітні нові функції

* Додано оператор правостороннього присвоєння.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Додано нескінченне визначення методу.

  ``` ruby
  def square(x) = x * x
  ```

* Додано find pattern.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
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

## Інші помітні зміни з 2.7

* Ключові аргументи розділені від інших аргументів.
  * В принципі, код, який виводить попередження на Ruby 2.7, не працюватиме.  Див. [документ](https://www.ruby-lang.org/uk/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) детально.
  * До речі, пересилання аргументів тепер підтримує початкові аргументи.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Функція `$SAFE` була повністю видалена; тепер це звичайна глобальна змінна.

* Порядок backtrace був зворотний в Ruby 2.5, але це було скасовано.  Тепер він поводиться як Ruby 2.4; повідомлення про помилку та номер рядка, де виникає виняток, виводяться спочатку, а його викликачі виводяться пізніше.

* Деякі стандартні бібліотеки оновлено.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Наступні бібліотеки більше не є включеними gems.
  Встановіть відповідні gems для використання цих функцій.
  * net-telnet
  * xmlrpc

* Підвищено default gems до bundled gems.
  * rexml
  * rss

* Підвищено stdlib до default gems. Наступні default gems були опубліковані на rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Див. [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
або [логи комітів](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
для більше деталей.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
з Ruby 2.7.0!

Будь ласка, спробуйте Ruby 3.0.0-preview1 та надішліть нам будь-який відгук!

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

## 3.0.0-preview2 трейлер

Ми плануємо включити ["type-profiler"](https://github.com/mame/ruby-type-profiler), який є функцією статичного аналізу типів.  Слідкуйте за оновленнями!

## Що таке Ruby

Ruby вперше розроблено Matz (Yukihiro Matsumoto) у 1993 році,
і зараз розробляється як Open Source. Він працює на кількох платформах
та використовується по всьому світу, особливо для веб-розробки.

