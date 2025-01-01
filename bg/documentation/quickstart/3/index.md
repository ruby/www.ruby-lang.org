---
layout: page
title: "Ruby в 20 минути"
lang: bg

header: |
  <div class="multi-page">
    <a href="../" title="Част 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Част 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Част 4">4</a>
  </div>
  <h1>Ruby в 20 минути</h1>

---

Нека създадем и използваме нов обект:

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

След като веднъж сме създали обектът `g`, той запаметява името Pat.
Какво би се случило, ако искаме да променим името директно ?

{% highlight irb %}
irb(main):038:0> g.@name
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Изходът от горния пример е грешка.

## Под повърхноста на обекта

Променливите на инстанциите са скрити от външно въздействие. Всъщност те
са видими при инспекция на обекта и има начини за достъп до тях, но Ruby
се старае да капсулира данните, следвайки обектно-ориентирания подход.

Може да разгледаме достъпните методи за обектите от тип Greeter лесно:

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "say_hi", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "say_bye", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Интересно е да видим, че обектът “притежава” доста методи, въпреки, че
ние сме дефинирали само 3. Ще разбулим мистерията, като кажем, че това
са всички методи на обектът Greeter, включително и тези от наследените
класове. За да скрием от показване наследените методи ще използваме
флага `false` при извикването на **instance\_methods**\:

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

Съществува метод, който ни дава представа какви методи може да извикаме
върху обекта:

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

## Никога не е късно за промяна на класа

Как да процедираме, ако искаме да отпечатаме или променим директно
името, зададено в клас ? Ruby предлага лесен начин за достъп до
променливите на обекта.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

В Ruby лесно може да отворим класа отново за модификация. Промените ще
се отразят на наличните и новите обекти. Нека създадем нов обект.

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

Използването на `attr_accessor` дефинира два нови метода, `name` за
прочитане на стойността и `name=` за промяна на стойността.

## Приветстване на всички !

В този си вид, класът ни може да приветства само един човек
едновременно. Следващия пример ни показва как може да поздравим един
човек, списък от хора или света глобално.

Нека напишем програмата в отделен файл вместо в IRB.

За да излезете от IRB, напишете “quit”, “exit” или просто натиснете
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

Съхранете този файл като “ri20min.rb” и го стартирайте, като напишете
“ruby ri20min.rb”. Изходът на програмата би изглеждал така:

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

В този финален пример има много нови неща, които ще бъдат разгледани в
[последната част на това ръководство](../4/)
