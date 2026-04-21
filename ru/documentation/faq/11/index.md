---
layout: page
title: "Официальный FAQ по Ruby"
lang: ru

header: |
  <div class="multi-page">
    <a href="../" title="Оглавление">Оглавление</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Часть 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Часть 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Часть 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Часть 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Часть 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Часть 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Часть 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Часть 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Часть 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Часть 10">10</a>
    <span class="separator"> | </span>
    <strong>11</strong>
  </div>
  <h1>Официальный FAQ по Ruby</h1>

---

{% include faq-notice.md %}

## Другие возможности

### Что означает `a ? b : c`?

Это так называемый «тернарный оператор», и он эквивалентен записи `if a then b else c end`.

### Как я могу подсчитать количество строк в файле?

Следующий код может дать самый быстрый результат.

~~~
File.readlines("example").size  # => 3
~~~

### Что возвращают `MatchData#begin` и `MatchData#end`?

Они работают с `$~` и возвращают начальный и конечный индексы совпавших данных в исходной строке. Смотрите пример в разделе [развертывание табуляции](../9/#tab-expansion).

### Как я могу просуммировать элементы массива?

{% include warnings/faq-out-of-date.html %}

Вместо решения конкретной задачи, давайте решим её в общем виде. Первое, что мы сделаем — создадим метод, который будет итерироваться по объекту `Enumerable` и собирать единый результат. В Smalltalk этот метод называется inject, так же назовем его и мы:

~~~
module Enumerable

  # inject(n) {|n, i| ...}
  def inject(n)
    each {|i| n = yield(n, i) }

    n
  end
end
~~~

Обратите внимание, как мы добавили метод в `Enumerable`. Это означает, что все, что включает в себя Enumerable, теперь может использовать `inject`. Но как нам его использовать? Он принимает один аргумент `n` и блок. Для каждого перечисляемого элемента он вызывает блок, передавая `n` и сам элемент. Результат выполнения блока присваивается обратно в `n`. Таким образом, чтобы определить `sum`, мы могли бы написать:

~~~
module Enumerable
  def sum
    inject(0) {|n, i| n + i }
  end
end

[1,3,5,7,9].sum  # => 25
(1..100).sum     # => 5050
~~~

### Как я могу использовать продолжения (continuations)?

{% include warnings/faq-out-of-date.html %}

Продолжения (continuations) в Ruby позволяют создать объект, представляющий определенное место в программе на Ruby, а затем вернуться в это место в любое время (даже если оно, казалось бы, вышло за пределы области видимости). Продолжения можно использовать для реализации сложных структур управления, но обычно они более полезны как способ запутать людей.

В [\[ruby-talk:4482\]][ruby-talk:4482], Jim Weirich опубликовал следующие примеры использования продолжений:

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
