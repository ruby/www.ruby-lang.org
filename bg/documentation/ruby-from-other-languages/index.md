---
layout: page
title: "Миграция от други езици"
lang: bg
---

Когато за първи път се сблъскате с код писан на Ruby е вероятно да ви напомни на езици за програмиране, които вече ползвате. Това е направено с цел. Много от синтаксиса е заимстван от Perl, Python и Java (както от други езици), за това научаването на Ruby би било много по-лесно. Този страница е разделена на две секции. Първата е обобщение на нещата, които ще видите от езика *X* в Ruby. Втората секция е посветена на някои от основните принципи на езика.

## Какво да очакваме

  * [Oт C/C++ към Ruby](/bg/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp/)
  * [Oт Java към Ruby](/bg/documentation/ruby-from-other-languages/to-ruby-from-java/)
  * [Oт Perl към Ruby](/bg/documentation/ruby-from-other-languages/to-ruby-from-perl/)
  * [Oт PHP към Ruby](/bg/documentation/ruby-from-other-languages/to-ruby-from-php/)
  * [Oт Python към Ruby](/bg/documentation/ruby-from-other-languages/to-ruby-from-python/)

## Важни неща в езика

Това са някои насоки за нещата, с които ще се запознаете при изучаването на Ruby.

### Итерация

Две от нещата, с които може би не сте се сблъсквали са \"блоковете\" и итераторите. Вместо да използваме цикъл с индекс ( както в C, C++ или в ранните версии на 1.5 Java), итерацията на списък (в Perl <tt>for (@a) \{...}</tt> или в Python <tt>for i in aList: ...</tt>) може да се осъществи с :

{% highlight ruby %}
some_list.each do |this_item|
  # операции за всеки елемент this_item.
end
{% endhighlight %}

За повече информация относно `each` (и неговите приятели `collect`, `find`, `inject`, `sort` и т.н.) можете да прочетете с командата `ri Enumerable` (и <tt>ri Enumerable#*име\_на\_метод*</tt>).

### Всичко има стойност

Няма разлика между expression и statement. Всичко има стойност, дори и тя да бъде **nil**:

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

Много хора, учещи Ruby имат трудности с разбирането на символите и тяхната употреба. Символите могат да се приемат за идентификатори. Стартирайте `irb` и вижте разликата:

{% highlight ruby %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Методът `object_id` връща идентификатора на обекта. Ако два обекта имат един и същ `object_id`, те са еднакви (сочат към един и същ обект в паметта). Както може да видим, когато използваме символи, всеки един от тях има характеристики с референция към обект в паметта. За всеки символ, имащ еднаква характеристика, идентификаторът на обекта съвпада. Ако погледнем примера с низовете, виждаме, че имаме два различни обекта. Това е така, тъй като при създаването на нов низ се заделя памет отделно. Ако се чудите дали да ползвате низ или символ, помислете кое е по-важно: идентификацията на обекта или неговото съдържание (\"george\" в горния пример).

### Всичко е обект

"Всичко е обект" не е хипербола. Дори класовете и числата се представят като обекти:

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

Константите всъщност не са константи. Ако промените съдържанието на съществуваща константа ще получите предупреждение, но това няма да наруши изпълнението на програмата. Това не значи, че трябва да предефинирате константите.

### Конвенции при наименуването

Ruby ни \"принуждава\" да ползваме някои конвенции при наименуването. Ако идентификаторът започва с главна буква, той е константа. Ако започва с $, той е глобална променлива. Ако започва с `@` той е променлива на инстанцията, а с `@@` се именоват клас променливите. Въпреки това може да ползваме главна буква за името на метод, въпреки, че това може да доведе до объркване:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

`Constant` е 10, но `Constant()` вика метод, който връща 11.

### Симулиране на ключови параметри

В Ruby липсват ключови параметри както в Python, но това може да бъде симулирано с употребата на символи и хешове:

{% highlight ruby %}
def some_keyword_params( params )
  params
end
some_keyword_params( :param_one => 10, :param_two => 42 )
# => {:param_one=>10, :param_two=>42}
{% endhighlight %}

### Универсалната истина

В Ruby, всяко нещо, различно от **nil** и **false**, е истина. В C, Python и други езици 0, празен низ и други се считат за лъжа ( false ). Нека разгледаме пример с код на Python code:

{% highlight python %}
# in Python
if 0:
  print "0 is true"
else:
  print "0 is false"
{% endhighlight %}

Изхода от кода е \"0 is false\". Еквивалента на Ruby

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}


Принтира се \"0 is true\".

### Модификаторите за достъп важат до края на декларацията

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

Може би очаквате `another_method` да бъде public, но това не е така. Модификатора \'private\' важи до употребата на друг модификатор. По подразбиране методите са public:

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method is private
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` и `protected` всъщност са методи и за това могат да приемат параметри. Ако предадем символ към този метод, променяме видимостта на метода с име на символа.

### Достъп до метод

В Ruby `private` се изпозлзва за модификатор за достъп, който прави методите достъпни, когато се викат без explicit receiver. В този случай Само **self** е receiver на извикването на private метод. Към `protected` трябва да се подхожда с внимание. protected метод може да бъде извикан от клас или инстанция на наследен клас, но също така и с друга инстанции като receiver. Пример, взет от [Ruby FAQ](http://faq.rubygarden.org/entry/show/57?controller\_prefix=faq%2F):

{% highlight ruby %}
$ irb
irb(main):001:0> class Test
irb(main):002:1>   # public by default
irb(main):003:1*   def func
irb(main):004:2>     99
irb(main):005:2>   end
irb(main):006:1>
irb(main):007:1*   def ==(other)
irb(main):008:2>     func == other.func
irb(main):009:2>   end
irb(main):010:1> end
=> nil
irb(main):011:0>
irb(main):012:0* t1 = Test.new
=> #<Test:0x34ab50>
irb(main):013:0> t2 = Test.new
=> #<Test:0x342784>
irb(main):014:0> t1 == t2
=> true
irb(main):015:0> # now make `func` protected, still works
irb(main):016:0* # because protected allows the other reference
irb(main):017:0* class Test
irb(main):018:1>   protected :func
irb(main):019:1> end
=> Test
irb(main):020:0> t1 == t2
=> true
irb(main):021:0> # now make `func` private
irb(main):022:0* class Test
irb(main):023:1>   private :func
irb(main):024:1> end
=> Test
irb(main):025:0> t1 == t2
NoMethodError: private method `func' called for #<Test:0x342784>
        from (irb):8:in `=='
        from (irb):25
        from :0
irb(main):026:0>
{% endhighlight %}

### Отворени класове

Класовете в Ruby могат винаги да бъдат отворени за да се добавят и променят. Всеки вграден клас от стандартната библиотека, като `Fixnum` или дори `Object`, родителя на всички обекти, могат да бъдат променяни. Ruby on Rails дефинира множество методи за употребата на дати и времена в `Fixnum`. Пример:

{% highlight ruby %}
class Fixnum
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

В Ruby е разрешено да използваме \'?\' и \'!\' като последен символ в името на метод. По конвенция, методи, които завършват с \'?\' (i.e. <tt>Array#empty?</tt> връща **true** ако receiver празен) връща булев израз. Потенциално \"опасни\" методи (тоест методи променящи **self** или аргументите си) завършват с \'!\'. Всички методи, променящи аргументите си не завършват с \'!\'. <tt>Array#replace</tt> заменя съдържанието на масив със съдържанието на друг масив.

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

Ruby не се отказва, ако не може да намери метод отговарящ на дадено съобщение към обект. Когато това стане се вика метода `method_missing`. По подразбиране, method\_missing активира изключение, но поради динамиката на Ruby, можем да го предефинираме:

{% highlight ruby %}
# id is the name of the method called, the * syntax collects
# all the arguments in an array named 'arguments'
def method_missing( id, *arguments )
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

При изпълнението на горния код се извеждат детайли относно извикването на метода, но Вие можете свободно да контролирате следствието от този метод.

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

### Блокове и Обекти

Блоковете (closures) се използват интензивно в стандартната библиотека. При извикването на блок можем да ползваме `yield`, или да го направим `Proc` чрез добавянето на специален аргумент:

{% highlight ruby %}
def block( &the_block )
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder is now a Proc object
adder.class # => Proc
{% endhighlight %}

Можем да създаваме блокове извън извиквания към методи чрез Proc.new или чрез метода `lambda`. Впрочем, методите са обекти:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Операторите са синтактична захар

Повечето оператори са \"синтактична захар\" за извиквания на методи. Пример за предефинирането на + :

{% highlight ruby %}
class Fixnum
  # You can, but please don't do this
  def +( other )
    self - other
  end
end
{% endhighlight %}

Оператоите, които следват не са методи и поради това не могат да бъдат предефинирани:

{% highlight ruby %}
=, .., ..., !, not, &&, and, ||, or, !=, !~, ::
{% endhighlight %}

В допълнение +=, \*= и т.н са съкращения за `var = var + other_var`, `var = var * other_var` и не могат да бъдат предефинирани. cannot be redefined.

## Научете още

Ако сте готови за още знания, посетете [документацията](/en/documentation/).
