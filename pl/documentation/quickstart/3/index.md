---
layout: page
title: "Ruby w 20 Minut"
lang: pl

header: |
  <div class="multi-page">
    <a href="../" title="Część 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Część 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Część 4">4</a>
  </div>
  <h1>Ruby w 20 Minut</h1>

---

Utwórzmy teraz obiekt klasy Greeter:

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

Gdy obiekt `g` jest utworzony, zapamiętuje on imię jako Pat. Hmm, co
jeśli chcielibyśmy dostać się bezpośrednio do imienia ?

{% highlight irb %}
irb(main):038:0> g.@name
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Niestety, nie możemy tak zrobić.

## Pod Skórą Obiektu

Zmienne instancji są ukryte wewnątrz obiektu. Nie są ukryte jakoś bardzo
głęboko, zobaczysz je kiedy zbadasz bliżej obiekt. Isnieją inne metody
dostępu do zmiennych instancji, ale Ruby używa sprawdzonego, obiektowego
podejścia “trzymania danych w pewien sposób ukrytych”.

Więc jakie to metody istnieją dla obiektów klasy Greeter?

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

Dużo metod. My zdefiniowaliśmy tylko dwie metody. Co tutaj się dzieje?
No coż, to są **wszystkie** metody obiektów klas Greeter, kompletna
lista, wliczając w to metody zdefiniowane w klasach nadrzędnych. Jeśli
chcemy wyświetlić tylko metody zdefiniowane w klasie Greeter, możemy
wskazać, że nie chcemy wyświetlać metod zdefiniowanych w klasach
nadrzędnych poprzez przekazanie parametru `false`.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

Zobaczmy więc, na jakie metody nasz obiekt odpowiada (responds\_to):

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Rozumie więc `say_hi`, oraz `to_s` (oznaczającą zamienienie czegoś w
stringa, metoda która jest zdefiniowana domyślnie dla każdego obiektu),
ale nie wie nic o metodzie `name`.

## Zmienianie Klas—Na To Nigdy Nie Jest Za Późno

Co jeśli chielibyśmy wyświetlić albo zmienić imię (name)? Ruby zapewnia
nam łatwy dostępn do zmiennych obiektu.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

W Rubim możesz ponownie otworzyć klasę i zmodyfikować ją. To nie zmienia
żadnych obiektów, które juz isnieją, ale zmienia obiekty, które dopiero
powstaną. Utwórzmy więc nowy obiekt i pobawmy się jego właściwością
`@name`.

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

Użycie `attr_accessor` zdefiniowało dwie nowe metody dla nas, `name` aby
odczytać wartość oraz `name=` aby ją ustawić.

## Witanie Wszystkiego, MegaGreeter Nie Opuszcza Niczego!

Nasz witający obiekt nie jest bardzo interesujący, może on zajmować się
tylko jedną osobą naraz. Co jeśli mielibyśmy pewien rodzaj
MegaGreeter’a, który mógłby witać albo cały świat, jedną osobę albo całą
listę osób ?

Napiszmy go tym razem w pliku a nie w interaktywnej konsoli IRB’a.

Aby wyjść z IRB’a wpisz “quit”, “exit” albo po prostu naciśnij
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

  # Zmień imię na "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Zmień imię na tablicę imion
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Zmień imię na nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Zapisz ten plik pod nazwą “ri20min.rb”, i uruchom go wpisując “ruby
ri20min.rb”. Wynik poniżej:

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

W powyższym przykładzie jest sporo nowych rzeczy, [którym możemy się
bliżej przyjrzeć.](../4/)
