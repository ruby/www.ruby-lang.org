---
layout: page
title: "Офіційний FAQ Ruby"
lang: uk

header: |
  <div class="multi-page">
    <a href="../" title="Зміст">Зміст</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Частина 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Частина 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Частина 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Частина 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Частина 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Частина 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Частина 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Частина 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Частина 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Частина 10">10</a>
    <span class="separator"> | </span>
    <strong>11</strong>
  </div>
  <h1>Офіційний FAQ Ruby</h1>

---

{% include faq-notice.md %}

## Інші можливості

### Що означає `a ? b : c`?

Це так званий «тернарний оператор» і це те саме, що
`if a then b else c end`.

### Як порахувати кількість рядків у файлі?

Наступний код може дати найшвидший результат.

~~~
File.readlines("example").size  # => 3
~~~

### Що повертають `MatchData#begin` і `MatchData#end`?

Вони працюють разом із `$~` і повертають індекс початку та індекс кінця
збігу в початковому рядку. Див. приклад у
[розгортанні табуляцій](../9/#tab-expansion).

### Як підсумувати елементи масиву?

{% include warnings/faq-out-of-date.html %}

Замість розв’язувати конкретну задачу, розв’яжімо загальну.
Перше, що ми зробимо — напишемо метод, який проходитиме по об’єкту
`Enumerable` і збиратиме один результат. У Smalltalk цей метод називають
inject, тож і ми його так назвемо:

~~~
module Enumerable

  # inject(n) {|n, i| ...}
  def inject(n)
    each {|i| n = yield(n, i) }

    n
  end
end
~~~

Зверніть увагу, що ми додали метод до `Enumerable`. Це означає, що все,
що включає `Enumerable`, тепер може використовувати `inject`. Але як ним
користуватися? Він приймає один аргумент `n` і блок. Для кожного елемента
в переліку він викликає блок, передаючи `n` і сам елемент. Результат
блоку присвоюється назад у `n`. Отже, щоб визначити `sum`, можна написати:

~~~
module Enumerable
  def sum
    inject(0) {|n, i| n + i }
  end
end

[1,3,5,7,9].sum  # => 25
(1..100).sum     # => 5050
~~~

### Як використовувати continuations?

{% include warnings/faq-out-of-date.html %}

Continuations у Ruby дозволяють створювати об’єкт, що представляє місце
в програмі Ruby, і повертатися до цього місця будь-коли (навіть якщо воно
нібито вийшло з області видимості). Continuations можна використовувати
для реалізації складних керувальних структур, але зазвичай вони корисніші
як спосіб заплутати людей.

У [\[ruby-talk:4482\]][ruby-talk:4482] Jim Weirich навів такі приклади
continuations:

~~~
# --------------------------------------------------------------------
# Simple Producer/Consumer
# --------------------------------------------------------------------
# Connect a simple counting task and a printing task together using
# continuations.
#
# Usage:  count(limit)

def count_task(count, consumer)
  (1..count).each do |i|
    callcc {|cc| consumer.call cc, i }
  end
  nil
end

def print_task()
  producer, i = callcc { |cc| return cc }
  print "#{i} "
  callcc { |cc| producer.call }
end

def count(limit)
  count_task(limit, print_task())
  print "\n"
end
~~~


~~~
# --------------------------------------------------------------------
# Filtering Out Multiples of a Given Number
# --------------------------------------------------------------------
# Create a filter that is both a consumer and producer. Insert it
# between the counting task and the printing task.
#
# Usage:  omit(2, limit)

def filter_task(factor, consumer)
  producer, i = callcc { |cc| return cc }
  if (i%factor) != 0 then
    callcc { |cc| consumer.call cc, i }
  end
  producer.call
end

def omit(factor, limit)
  printer = print_task()
  filter = filter_task(factor, printer)
  count_task(limit, filter)
  print "\n"
end
~~~


~~~
# --------------------------------------------------------------------
# Prime Number Generator
# --------------------------------------------------------------------
# Create a prime number generator. When a new prime number is
# discovered, dynamically add a new multiple filter to the chain of
# producers and consumers.
#
# Usage:  primes(limit)

def prime_task(consumer)
  producer, i = callcc { |cc| return cc }
  if i >= 2 then
    callcc { |cc| consumer.call cc, i }
    consumer = filter_task(i, consumer)
  end
  producer.call
end

def primes(limit)
  printer = print_task()
  primes = prime_task(printer)
  count_task(limit, primes)
  print "\n"
end
~~~

[ruby-talk:4482]: https://blade.ruby-lang.org/ruby-talk/4482
