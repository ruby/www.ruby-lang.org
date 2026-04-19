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
    <strong>5</strong>
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
    <a href="../11/" title="Частина 11">11</a>
  </div>
  <h1>Офіційний FAQ Ruby</h1>

---

{% include faq-notice.md %}

## Ітератори

### Що таке ітератор?

Ітератор — це метод, який приймає блок або об’єкт `Proc`. У вихідному
файлі блок розташовується одразу після виклику методу. Ітератори
використовуються для створення користувацьких керувальних структур —
особливо циклів.

Розгляньмо приклад, щоб побачити, як це працює. Ітератори часто
використовуються для повторення тієї самої дії над кожним елементом
колекції, наприклад так:

~~~
data = [1, 2, 3]
data.each do |i|
  puts i
end
~~~

Виведе:

~~~
1
2
3
~~~

Методу `each` масиву `data` передається блок `do ... end`, і він
виконується багато разів. При кожному виклику блоку передається
черговий елемент масиву.

Ви можете визначати блоки за допомогою `{ ... }` замість `do ... end`.

~~~
data = [1, 2, 3]
data.each { |i|
  puts i
}
~~~

Виведе:

~~~
1
2
3
~~~

Цей код має те саме значення, що й попередній приклад. Однак у деяких
випадках питання пріоритетів робить `do ... end` і `{ ... }` різними.

~~~
foobar a, b do ... end  # foobar is the iterator.
foobar a, b { ... }     # b is the iterator.
~~~

Це тому, що `{ ... }` прив’язується до попереднього виразу сильніше,
ніж блок `do ... end`. Перший приклад еквівалентний
`foobar(a, b) do ... end`, тоді як другий — `foobar(a, b { ... })`.

### Як передати блок до ітератора?

Просто розмістіть блок після виклику ітератора. Ви також можете
передати об’єкт `Proc`, додавши `&` перед іменем змінної або константи,
що посилається на `Proc`.

### Як використовується блок в ітераторі?

{% include warnings/faq-out-of-date.html %}

Є три способи виконати блок з методу-ітератора:
(1) керувальна структура `yield`; (2) виклик аргументу `Proc`
(створеного з блоку) через `call`; (3) використання `Proc.new`,
після якого слідує виклик.

Оператор `yield` викликає блок, за потреби передаючи один або більше
аргументів.

~~~
def my_iterator
  yield 1, 2
end

my_iterator {|a, b| puts a, b }
~~~

Виведе:

~~~
1
2
~~~

Якщо визначення методу має аргумент блоку (останній формальний параметр
має префікс амперсанда `&`), він отримає приєднаний блок, перетворений
на об’єкт `Proc`. Його можна викликати через `prc.call(args)`.

~~~
def my_iterator(&b)
  b.call(1, 2)
end

my_iterator {|a, b| puts a, b }
~~~

Виведе:

~~~
1
2
~~~

`Proc.new` (або еквівалентні виклики `proc` чи `lambda`), коли
використовується у визначенні ітератора, бере блок, переданий у метод,
і створює з нього процедурний об’єкт.
(`proc` і `lambda` фактично є синонімами.)

_[Потрібне оновлення: `lambda` поводиться трохи інакше і
генерує попередження `tried to create Proc object without a block`.]_

~~~
def my_iterator
  Proc.new.call(3, 4)
  proc.call(5, 6)
  lambda.call(7, 8)
end

my_iterator {|a, b| puts a, b }
~~~

Виведе:

~~~
3
4
5
6
7
8
~~~

Можливо, несподівано, `Proc.new` і подібні методи жодним чином не
“споживають” блок, прикріплений до методу — кожен виклик `Proc.new`
створює новий процедурний об’єкт з того самого блоку.

Ви можете дізнатися, чи є блок, пов’язаний із методом, викликавши
`block_given?`.

### Що робить `Proc.new` без блоку?

`Proc.new` без блоку не може створити процедурний об’єкт і викликає помилку.
Проте у визначенні методу `Proc.new` без блоку припускає наявність блоку
на момент виклику методу, тож помилки не буде.

### Як запускати ітератори паралельно?

Ось адаптація рішення від Matz, із
[\[ruby-talk:5252\]][ruby-talk:5252], що використовує потоки:

~~~
require "thread"

def combine(*iterators)
  queues = []
  threads = []

  iterators.each do |it|
    queue = SizedQueue.new(1)
    th = Thread.new(it, queue) do |i, q|
           send(i) {|x| q << x }
         end
    queues  << queue
    threads << th
  end

  loop do
    ary = []
    queues.each {|q| ary << q.pop }
    yield ary

    iterators.size.times do |i|
      return if !threads[i].status && queues[i].empty?
    end
  end
end

def it1
  yield 1; yield 2; yield 3
end

def it2
  yield 4; yield 5; yield 6
end

combine(:it1, :it2) do |x|
  # x is [1, 4], then [2, 5], then [3, 6]
end
~~~

[ruby-talk:5252]: https://blade.ruby-lang.org/ruby-talk/5252
