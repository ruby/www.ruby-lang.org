---
layout: page
title: "Ruby за двадцать минут"
lang: ru

header: |
  <div class="multi-page">
    <a href="../" title="Часть 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Часть 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Часть 4">4</a>
  </div>
  <h1>Ruby за двадцать минут</h1>

---

Давайте теперь создадим приветствующий объект и используем его:

{% highlight irb %}
irb(main):035:0> g = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> g.say_hi
Hi Pat!
=> nil
irb(main):037:0> g.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Как только объект `g` создан, он запоминает, что имя – Pat. Хмм, а что
если мы попробуем получить имя напрямую?

{% highlight irb %}
irb(main):038:0> g.@name
SyntaxError: (irb):38: syntax error, unexpected tIVAR, expecting '('
{% endhighlight %}

Неа, не можем этого сделать.

## Внутренности объекта

Переменные объекта скрыты внутри объекта. Они не супер скрыты, вы можете
увидеть их, когда вы просматриваете объект и есть несколько других
способов доступа к ним, но Ruby использует хороший
объектно-ориентированный подход – держать данные такого типа скрытыми.

Итак, какие методы существуют для объектов класса Greeter?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> [:say_hi, :say_bye, :instance_of?, :public_send,
    :instance_variable_get, :instance_variable_set,
    :instance_variable_defined?, :remove_instance_variable,
    :private_methods, :kind_of?, :instance_variables, :tap,
    :is_a?, :extend, :define_singleton_method, :to_enum,
    :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?,
    :freeze, :inspect, :display, :send, :object_id, :to_s,
    :method, :public_method, :singleton_method, :nil?, :hash,
    :class, :singleton_class, :clone, :dup, :itself, :taint,
    :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods,
    :protected_methods, :frozen?, :public_methods,
    :singleton_methods, :!, :==, :!=, :__send__, :equal?,
    :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

Ого! Это куча методов. А мы объявили всего два. Что здесь происходит?
Ну, это **все** методы для объектов класса Greeter, полный список,
включая те, которые определены родительскими классами. Если мы хотим
список тех методов, которые мы определили в классе Greeter, мы можем
сказать не включать методы родительских классов, посредством передачи
параметра `false`, означающего как раз это.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

Ага, это больше похоже на то, что нам нужно. Итак, давайте посмотрим на
какие методы наш объект может отвечать:

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Как мы видим, он знает `say_hi` и `to_s` (метод, служащий для
превращения чего-либо в строку. Определен для всех объектов
по-умолчанию), но он не знает `name`.

## Изменяем классы – никогда не поздно

Но что если вы хотите иметь возможность получить или изменить имя? Ruby
предоставляет простой способ для получения доступа к переменным объекта.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

В Ruby вы можете открыть класс снова и изменить его. Изменения будут
актуальны для всех новых объектов, которые вы создаете, и даже доступны
для существующих объектов класса. Итак, давайте создадим новый объект и
поиграем с его свойством `@name`.

{% highlight irb %}
irb(main):047:0> g = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> g.respond_to?("name")
=> true
irb(main):049:0> g.respond_to?("name=")
=> true
irb(main):050:0> g.say_hi
Hi Andy!
=> nil
irb(main):051:0> g.name="Betty"
=> "Betty"
irb(main):052:0> g
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> g.name
=> "Betty"
irb(main):054:0> g.say_hi
Hi Betty!
=> nil
{% endhighlight %}

Использование `attr_accessor` определяет два новых метода для нас:
`name`, чтобы получать значение переменной `@name` и `name=`, чтобы это
значение назначать.

## Приветствовать всех и вся, MegaGreeter никого не забудет!

Этот приветствующий не особо интересен, он может иметь дело только с
одним человеком. Что если мы хотим некий класс MegaGreeter, который
может приветствовать и весь мир, и одного человека, и целый список
людей?

Давайте запишем его в файл, вместо того чтоб писать построчно в IRB.

Чтобы выйти из IRB, наберите `quit`, `exit` или просто нажмите
Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Сохраните этот файл как "ri20min.rb" и запустите его как "ruby
ri20min.rb". Результат должен быть следующим:

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

Здесь куча новых вещей в последнем примере, на которые [мы взглянем
подробнее.](../4/)
