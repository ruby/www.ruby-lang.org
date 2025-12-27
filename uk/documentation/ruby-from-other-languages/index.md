---
layout: page
title: "Ruby з інших мов"
lang: uk
---

Коли ви вперше дивитеся на код Ruby, він, ймовірно, нагадає вам інші
мови програмування, з якими ви працювали. Це зроблено навмисно. Значна
частина синтаксису знайома користувачам Perl, Python і Java (та інших
мов), тож якщо ви їх використовували, вивчити Ruby буде нескладно.
{: .summary}

Цей документ складається з двох основних розділів. Перший — це стислий
огляд того, чого очікувати, переходячи з мови *X* на Ruby. Другий розділ
розглядає ключові особливості мови та те, як вони співвідносяться з тим,
що вам уже знайомо.

## Чого очікувати: *мова X* → Ruby

* [Перехід на Ruby з C та C++](to-ruby-from-c-and-cpp/)
* [Перехід на Ruby з Java](to-ruby-from-java/)
* [Перехід на Ruby з Perl](to-ruby-from-perl/)
* [Перехід на Ruby з PHP](to-ruby-from-php/)
* [Перехід на Ruby з Python](to-ruby-from-python/)

## Важливі особливості мови та деякі підводні камені

Нижче наведено поради й підказки щодо ключових особливостей Ruby, які
ви побачите під час вивчення.

### Ітерація

Дві особливості Ruby, які трохи відрізняються від того, що ви могли
бачити раніше, і до яких потрібно звикнути, — це “блоки” та ітератори.
Замість проходу по індексу (як у C, C++ або Java до 1.5) або проходу по
списку (як Perl `for (@a) {...}` чи Python `for i in aList: ...`), у Ruby
ви дуже часто побачите таке:

{% highlight ruby %}
some_list.each do |this_item|
  # We're inside the block.
  # deal with this_item.
end
{% endhighlight %}

Детальніше про `each` (і його друзів `collect`, `find`, `inject`,
`sort` тощо) дивіться `ri Enumerable` (а потім `ri Enumerable#some_method`).

### Усе має значення

Немає різниці між виразом і оператором. Усе має значення, навіть якщо
це значення — `nil`. Можливо таке:

{% highlight ruby %}
x = 10
y = 11
z = if x < y
      true
    else
      false
    end
z # => true
{% endhighlight %}

### Символи — це не полегшені рядки

Багато новачків у Ruby мають труднощі з розумінням того, що таке символи
і для чого вони потрібні.

Символи найкраще описати як ідентичності. Символ — це про **хто** він,
а не **що** він. Запустіть `irb` і подивіться різницю:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Метод `object_id` повертає ідентичність об’єкта. Якщо два об’єкти мають
однаковий `object_id`, це один і той самий об’єкт (посилаються на той самий
об’єкт у пам’яті).

Як видно, після того як ви один раз використали символ, будь-який символ
з такими самими символами посилається на той самий об’єкт у пам’яті. Для
будь-яких двох символів, що представляють однакові символи, `object_id`
співпадають.

Тепер подивіться на рядок (“george”). `object_id` не співпадають. Це
означає, що вони посилаються на два різні об’єкти в пам’яті. Кожного разу,
коли ви створюєте новий рядок, Ruby виділяє для нього пам’ять.

Якщо ви сумніваєтеся, використовувати символ чи рядок, подумайте, що
важливіше: ідентичність об’єкта (наприклад, ключ у Hash), чи вміст
(у прикладі вище — “george”).

### Усе є об’єктом

“Усе є об’єктом” — не просто гіпербола. Навіть класи та цілі числа —
об’єкти, і з ними можна робити те саме, що й з будь-яким іншим об’єктом:

{% highlight ruby %}
# This is the same as
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Константи — не зовсім константи

Константи насправді не є константами. Якщо ви зміните вже ініціалізовану
константу, Ruby видасть попередження, але не зупинить програму. Це не
означає, що **слід** перевизначати константи.

### Конвенції іменування

Ruby дотримується певних конвенцій іменування. Якщо ідентифікатор
починається з великої літери — це константа. Якщо з символу долара (`$`)
— глобальна змінна. Якщо з `@` — змінна екземпляра. Якщо з `@@` — змінна класу.

Назви методів, однак, можуть починатися з великої літери. Це може
спричиняти плутанину, як показано нижче:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Тепер `Constant` дорівнює 10, але `Constant()` дорівнює 11.

### Іменовані аргументи

Як і в Python, починаючи з Ruby 2.0, методи можна визначати з
іменованими аргументами:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### Універсальна істина

У Ruby усе, окрім `nil` і `false`, вважається істинним. У C, Python та
багатьох інших мовах 0 і, можливо, інші значення, як-от порожні списки,
вважаються хибними. Подивіться на такий код Python (цей приклад
застосовний і до інших мов):

{% highlight python %}
# in Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

Це виведе “0 is false”. Еквівалент у Ruby:

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

Виводить “0 is true”.

### Модифікатори доступу діють до кінця області видимості

У наступному коді Ruby:

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

Ви можете очікувати, що `another_method` буде публічним. Але ні. Модифікатор
доступу `private` діє до кінця області видимості або до наступного
модифікатора доступу — що настане раніше. За замовчуванням методи публічні:

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method is private
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` і `protected` — це методи, тому вони можуть приймати
параметри. Якщо ви передасте символ, зміниться видимість відповідного методу.

### Доступ до методів

У Java `public` означає, що метод доступний будь-кому. `protected`
означає, що до нього можуть звертатися екземпляри класу, екземпляри
класів-нащадків і екземпляри класів у тому самому пакеті, але не інші.
`private` означає, що метод доступний лише екземплярам класу.

У Ruby все трохи інакше. `public` — публічний. `private` означає, що
метод(и) доступні лише тоді, коли їх можна викликати без явного
одержувача. Єдиним дозволеним одержувачем приватного виклику є `self`.

`protected` — це те, на що варто звернути увагу. Захищений метод можна
викликати з екземплярів класу або класів-нащадків, а також із іншим
екземпляром як одержувачем.
Ось приклад (адаптовано з [The Ruby Language FAQ][faq]):

{% highlight ruby %}
class Test
  # public by default
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# now make `identifier' protected; it still works
# because protected allows `other' as receiver

class Test
  protected :identifier
end

t1 == t2  # => true

# now make `identifier' private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Класи відкриті

Класи Ruby відкриті. Ви можете відкривати їх, додавати до них і змінювати
у будь-який момент. Навіть базові класи, як-от `Integer` або навіть `Object`,
предок усіх об’єктів. Ruby on Rails визначає низку методів для роботи з часом
у `Integer`. Дивіться:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # number of seconds in an hour
  end
  alias hour hours
end

# 14 hours from 00:00 January 1st
# (aka when you finally wake up ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Кумедні назви методів

У Ruby назви методів можуть закінчуватися на знак питання або знак
оклику. За домовленістю методи, що відповідають на питання, закінчуються
на знак питання (наприклад, `Array#empty?`, який повертає `true`, якщо
об’єкт порожній). Потенційно “небезпечні” методи за домовленістю
закінчуються на знак оклику (наприклад, методи, які змінюють `self` або
аргументи, `exit!` тощо). Водночас не всі методи, що змінюють аргументи,
закінчуються на знак оклику. `Array#replace` замінює вміст масиву на
вміст іншого масиву. Не дуже логічно мати такий метод, який **не** змінює
`self`.

### Синглтон-методи

Синглтон-методи — це методи для конкретного об’єкта. Вони доступні лише
для об’єкта, на якому визначені.

{% highlight ruby %}
class Car
  def inspect
    "Cheap car"
  end
end

porsche = Car.new
porsche.inspect # => Cheap car
def porsche.inspect
  "Expensive car"
end

porsche.inspect # => Expensive car

# Other objects are not affected
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Відсутні методи

Ruby не здається, якщо не може знайти метод, що відповідає певному
повідомленню. Він викликає метод `method_missing` з ім’ям методу, якого
не знайшов, і аргументами. За замовчуванням `method_missing` піднімає
виняток NameError, але ви можете перевизначити його під потреби
вашого застосунку, і багато бібліотек так роблять. Ось приклад:

{% highlight ruby %}
# id is the name of the method called, the * syntax collects
# all the arguments in an array named 'arguments'
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

Код вище лише друкує деталі виклику, але ви можете обробляти повідомлення
будь-яким способом, який вам підходить.

### Передача повідомлень, а не виклики функцій

Виклик методу — це насправді **повідомлення** іншому об’єкту:

{% highlight ruby %}
# This
1 + 2
# Is the same as this ...
1.+(2)
# Which is the same as this:
1.send "+", 2
{% endhighlight %}

### Блоки — це об’єкти, просто вони ще цього не знають

Блоки (насправді замикання) активно використовуються в стандартній
бібліотеці. Щоб викликати блок, ви можете або використати `yield`,
або перетворити його на `Proc`, додавши спеціальний аргумент до списку
аргументів, наприклад:

{% highlight ruby %}
def block(&the_block)
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder is now a Proc object
adder.class # => Proc
{% endhighlight %}

Ви також можете створювати блоки поза викликами методів, викликаючи
`Proc.new` з блоком або метод `lambda`.

Подібно до цього, методи також є об’єктами в процесі:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Оператори — це синтаксичний цукор

Більшість операторів у Ruby — це лише синтаксичний цукор (з певними
правилами пріоритету) для викликів методів. Наприклад, ви можете
перевизначити метод `+` у Integer:

{% highlight ruby %}
class Integer
  # You can, but please don't do this
  def +(other)
    self - other
  end
end
{% endhighlight %}

Вам не потрібен `operator+` як у C++ тощо.

Ви навіть можете мати доступ до елементів у стилі масиву, якщо визначите
методи `[]` і `[]=`. Щоб визначити унарні + і - (тобто +1 і -2), потрібно
визначити методи `+@` і `-@` відповідно. Проте наведені нижче оператори
**не** є синтаксичним цукром. Це не методи, і їх неможливо перевизначити:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Крім того, `+=`, `*=` тощо — це лише скорочення для `var = var + other_var`,
`var = var * other_var` і т. д., тож їх також неможливо перевизначити.

## Дізнатися більше

Коли будете готові до більш глибоких знань Ruby, дивіться розділ
[Документація](/uk/documentation/).



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
