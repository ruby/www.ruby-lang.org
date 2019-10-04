---
layout: page
title: "Миграция от други езици"
lang: bg
---

Когато за първи път се сблъскате с код, писан на Ruby, е вероятно да ви напомни
на езици за програмиране, които вече ползвате. Това е направено с цел. Много
от синтаксиса е заимстван от Perl, Python и Java (както и от други езици),
затова научаването на Ruby би било много по-лесно.
{: .summary}

Този страница е разделена на две секции. Първата е обобщение на нещата, които
ще видите от езика *X* в Ruby. Втората секция е посветена на някои от основните
принципи на езика.

## Какво да очакваме

* [Oт C/C++ към Ruby](to-ruby-from-c-and-cpp/)
* [Oт Java към Ruby](to-ruby-from-java/)
* [Oт Perl към Ruby](to-ruby-from-perl/)
* [Oт PHP към Ruby](to-ruby-from-php/)
* [Oт Python към Ruby](to-ruby-from-python/)

## Важни неща в езика

Това са някои насоки за нещата, с които ще се запознаете при изучаването на Ruby.

### Итерация

Две от нещата, с които може би не сте се сблъсквали са "блоковете" и
итераторите.  Вместо да използваме цикъл с индекс (както в C, C++ или във
версиите на Java преди 1.5), итерацията на списък (в Perl `for (@a) {...}` или
в Python `for i in aList: ...`) може да се осъществи с:

{% highlight ruby %}
some_list.each do |this_item|
  # операции за всеки елемент this_item.
end
{% endhighlight %}

За повече информация относно `each` (и неговите приятели `collect`, `find`,
`inject`, `sort` и т.н.) можете да използвате командата `ri Enumerable` (и `ri
Enumerable#име_на_метод`).

### Всичко има стойност

Няма разлика между expression и statement. Всичко има стойност, дори и тя да
бъде `nil`:

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

### Символите не са опростен вариант на низовете

Много хора, учещи Ruby, имат трудности с разбирането на символите и тяхната
употреба.

Символите могат да се приемат за идентификатори. Стартирайте `irb` и вижте
разликата:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Методът `object_id` връща идентификатора на обекта. Ако два обекта имат един и
същи `object_id`, те са еднакви (сочат към един и същ обект в паметта).

Както може да видим когато използваме символи, всеки един от тях има
характеристики с референция към обект в паметта. За всеки символ, имащ еднаква
характеристика, идентификаторът на обекта съвпада.

Ако погледнем примера с низовете виждаме, че техните `object_id` не съвпадат.
Това означава, че те реферират към два отделни обекта в паметта. Това е така,
тъй като при създаването на нов низ се заделя памет отделно.

Ако се чудите дали да ползвате низ или символ, помислете кое е по-важно:
идентификацията на обекта (например ключ на хеш) или неговото съдържание
("george" в горният пример).

### Всичко е обект

"Всичко е обект" не е хипербола. Дори класовете и числата са обекти:

{% highlight ruby %}
# Двете дефиниции са еднакви
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Променливи константи

Константите всъщност не са константни. Ако промените съдържанието на
съществуваща константа ще получите предупреждение, но това няма да наруши
изпълнението на програмата. Това не значи, че **трябва** да предефинирате
константи.

### Конвенции при наименуването

Ruby ни "принуждава" да ползваме някои конвенции при наименуването. Ако
идентификаторът започва с главна буква, той е константа. Ако започва с `$`,
той е глобална променлива. Ако започва с `@` той е променлива на инстанцията,
а с `@@` се именуват клас променливите.

Въпреки това може да ползваме главна буква за името на метод, въпреки, че това
може да доведе до объркване:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

`Constant` е променлива със стойност 10, но `Constant()` извиква метод,
който връща 11.

### Именувани аргументи

Както в Python, от Ruby 2.0 методите могат да използват именувани аргументи:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### Универсалната истина

В Ruby всяко нещо, различно от `nil` и `false`, е `true`. В C, Python и други
езици `0`, `""` и други се считат за `false`. Нека разгледаме пример с код
на Python:

{% highlight python %}
# in Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

Изхода от кода е `0 is false`. Еквивалента, написан на Ruby:

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

На екрана се изписва `0 is true`.

### Модификаторите за достъп важат до края на декларацията

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

Може би очаквате `another_method` да бъде `public`, но това не е така.
Модификатора `private` важи до употребата на друг модификатор. По подразбиране
всички методи са `public`:

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method is private
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` и `protected` всъщност са методи и за това могат да приемат
параметри. Ако подадем символ на този метод, променяме видимостта на метода с
име на символа.

### Достъп до метод

В Java, `public` означава, че методът е достъпен за всички. `protected`
означава, че инстанциите на класа и всички наследяващи го класове, както и
класове в същият package могат да го достъпят. `private` означава, че
единствено инстанциите на класа имат достъп до метода.

В Ruby нещата стоят по малко по-различен начин. `public` работи по същият
начин. `private` се използва за модификатор за достъп, който прави методите
достъпни, когато се викат без explicit receiver. В този случай единствено
`self` може да е получател на извикването на `private` метод.

Към `protected` трябва да се подхожда с внимание. `protected` метод може да
бъде извикан от клас или инстанция на наследен клас, но също така и с друга
инстанции като неговият receiver.

Пример, взет от [Ruby Language FAQ][faq]:

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

### Отворени класове

Класовете в Ruby могат винаги да бъдат отворени, за да се допълват и променят.
Всеки вграден клас от стандартната библиотека, като `Integer` или дори `Object`,
родителят на всички обекти, може да бъде променен. Ruby on Rails дефинира
множество методи за употребата на дати и времена във `Integer`. Пример:

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

### Методи със странни имена

В Ruby е разрешено да използваме "?" и "!" като последен символ в името на
метод. По конвенция методи, които завършват с "?" (например `Array#empty?`
връща `true` ако receiver празен) връща булев израз. Потенциално "опасни"
методи (тоест методи, променящи `self` или аргументите си, например `exit!`)
завършват с "!". Не всички методи, променящи аргументите си, завършват с "!".
. `Array#replace` заменя съдържанието на масив със съдържанието на друг масив.
Няма смисъл да има подобен метод, който не променя себе си.

### Singleton методи

Singleton методите са асоциирани с един единствен метод:

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

### Липсващи методи

Ruby не се отказва, ако не може да намери метод, отговарящ на дадено съобщение
към обект. Когато това стане, се извиква метода `method_missing`. По
подразбиране `method_missing` активира изключение, но поради динамиката на
Ruby можем да го предефинираме, както правят много библиотеки:

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

При изпълнението на горният код се извеждат детайли относно извикването на
метода, но Вие можете свободно да контролирате следствието от този метод.

### Предаване на метод

Извикването на метод представлява изпращане на **съобщение** към друг обект:

{% highlight ruby %}
# This
1 + 2
# Is the same as this ...
1.+(2)
# Which is the same as this:
1.send "+", 2
{% endhighlight %}

### Блоковете са обекти, които просто не го знаят

Блоковете (всъщност closures) се използват интензивно в стандартната
библиотека. При извикването на блок можем да ползваме `yield` или да го
направим `Proc` чрез добавянето на специален аргумент:

{% highlight ruby %}
def block(&the_block)
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder is now a Proc object
adder.class # => Proc
{% endhighlight %}

Можем да създаваме блокове извън методи чрез `Proc.new` или чрез метода
`lambda`. Впрочем, методите също са обекти:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Операторите са синтактична захар

Повечето оператори са "синтактична захар" за извиквания на методи. Може
например да се предифинира `Integer#+`:

{% highlight ruby %}
class Integer
  # You can, but please don't do this
  def +(other)
    self - other
  end
end
{% endhighlight %}

Не е нужен `operator+` от C++ например.

Може дори и да се направи достъп, подобен на този при масивите, ако се
предефинират `[]` и `[]=`. `+` и `-` могат също да бъдат предефинирани
съответно чрез `+@` и `-@`.

Операторите, които следват, не са методи и поради това не могат да бъдат
предефинирани:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

В допълнение `+=`, `*=` и т.н са съкращения за `var = var + other_var`,
`var = var * other_var` и не могат да бъдат предефинирани.

## Научете още

Ако сте готови за още знания, посетете [документацията](/bg/documentation/).



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
