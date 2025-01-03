---
layout: page
title: "Ruby in 20 Minuten"
lang: de

header: |
  <div class="multi-page">
    <a href="../" title="Teil 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Teil 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Teil 4">4</a>
  </div>
  <h1>Ruby in 20 Minuten</h1>

---

Erzeugen wir nun ein Greeter-Objekt und benutzen es:

{% highlight irb %}
irb(main):035:0> g = Greeter.new("Patrick")
=> #<Greeter:0x16cac @name="Patrick">
irb(main):036:0> g.sag_hallo
Hallo, Patrick!
=> nil
irb(main):037:0> g.sag_tschuess
Tschuess, Patrick, bis bald!
=> nil
{% endhighlight %}

Wenn `g` einmal erzeugt wurde, merkt es sich, dass der Name Patrick ist.
Hmm, und wenn wir direkt auf den Namen im Objekt zugreifen wollen?

{% highlight irb %}
irb(main):038:0> g.@name
<internal:kernel>:187:in `loop': (irb):52: syntax error, unexpected instance variable (SyntaxError)
{% endhighlight %}

Nö, das geht offensichtlich nicht.

## Objekten unter die Haube geschaut

Instanzvariablen werden im Inneren des Objekts verborgen. Sie sind nicht
so versteckt, dass man sie nicht mehr sieht, wenn man das Objekt
untersucht, und es gibt auch andere Wege, auf sie zuzugreifen, aber Ruby
benutzt den guten objektorientieren Ansatz der Datenkapselung.

Welche Methoden existieren nun für Greeter-Objekte?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=>
[:sag_hallo, :sag_tschuess, :to_yaml, :to_json,
 :pretty_print, :pretty_print_inspect, :pretty_print_cycle,
 :pretty_print_instance_variables, :Namespace,
 :singleton_class, :dup, :itself, :methods,
 :singleton_methods, :protected_methods, :private_methods,
 :public_methods, :instance_variables, :instance_variable_get,
 :instance_variable_set, :instance_variable_defined?,
 :remove_instance_variable, :instance_of?, :kind_of?, :is_a?,
 :display, :TypeName, :public_send, :extend, :clone, :<=>,
 :===, :class, :!~, :tap, :frozen?, :yield_self, :then, :nil?,
 :eql?, :respond_to?, :method, :public_method, :singleton_method,
 :define_singleton_method, :hash, :freeze, :inspect, :object_id,
 :send, :to_s, :pretty_inspect, :to_enum, :enum_for, :equal?, :!,
 :__send__, :==, :!=, :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

Hoppla, das sind aber ganz schön viele! Wir haben doch nur zwei Methoden
definiert. Was ist hier also los? Es handelt sich hier um **alle**
Methoden für das Greeter-Objekt – die komplette Liste – inklusive der
Methoden, die von Eltern-Klassen definiert wurden. Wenn wir nur die
Methoden auflisten wollen, die für Greeter definiert wurden, können wir
aber festlegen, dass die Eltern-Klassen nicht berücksichtigt werden
sollen, indem wir `false` als Parameter angeben.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["sag_hallo", "sag_tschuess"]
{% endhighlight %}

Aha, das sieht schon besser aus! Nun schauen wir mal, auf welche
Methoden unser Greeter-Objekt reagiert:

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("sag_hallo")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Es kennt also `sag_hallo` und `to_s`. (Die zuletzt genannte Methode ist
jedem Objekt per Voreinstellung bekannt – sie wandelt etwas in einen
String um.) Aber es kennt nicht `name`.

## Für Klassen-Veränderungen ist es nie zu spät

Aber was, wenn wir es ermöglichen wollen, dass man den Namen ansehen
oder ändern kann? Ruby liefert eine einfache Möglichkeit, Zugriff auf
die Variablen eines Objekts zu gewähren.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

In Ruby kann man eine Klasse jederzeit verändern. Die Änderungen werden
in sämtlichen neu erzeugten Objekten vorhanden sein und darüber hinaus
sogar von bereits existenten Objekten übernommen. Erzeugen wir also ein
neues Objekt und spielen ein bisschen mit dessen `@name`-Eigenschaft
herum.

{% highlight irb %}
irb(main):047:0> g = Greeter.new("Andreas")
=> #<Greeter:0x3c9b0 @name="Andreas">
irb(main):048:0> g.respond_to?("name")
=> true
irb(main):049:0> g.respond_to?("name=")
=> true
irb(main):050:0> g.sag_hallo
Hallo, Andreas!
=> nil
irb(main):051:0> g.name="Bettina"
=> "Bettina"
irb(main):052:0> g
=> #<Greeter:0x3c9b0 @name="Bettina">
irb(main):053:0> g.name
=> "Bettina"
irb(main):054:0> g.sag_hallo
Hallo, Bettina!
=> nil
{% endhighlight %}

Die Benutzung von `attr_accessor` hat zwei neue Methoden für uns
definiert: Mit `name` erhält man den Wert, mit `name=` setzt man ihn.

## Die Begrüßung von allem und jedem – MegaGreeter vernachlässigt niemanden!

Die Greeter-Klasse ist nicht unbedingt interessant, sie kann nur eine
Person gleichzeitig behandeln. Was, wenn wir eine Art MegaGreeter
hätten, der entweder die ganze Welt, eine Person oder eine Liste von
Leuten begrüßen könnte?

Schreiben wir das lieber in eine Textdatei, statt es direkt in den
interaktiven Ruby-Interpreter IRB zu tippen.

Um IRB zu beenden, gib “quit” oder “exit” ein, oder drücke einfach
Strg-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Erzeuge das Objekt
  def initialize(names = "Welt")
    @names = names
  end

  # Sag Hallo zu allen
  def sag_hallo
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names ist eine Liste, durchlaufe sie!
      @names.each do |name|
        puts "Hallo, #{name}!"
      end
    else
      puts "Hallo, #{@names}!"
    end
  end

  # Sag Tschuess zu allen
  def sag_tschuess
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Verbinde die Listenelemente mit einem Komma
      puts "Tschuess, #{@names.join(", ")}, bis bald!"
    else
      puts "Tschuess, #{@names}, bis bald!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.sag_hallo
  mg.sag_tschuess

  # Aendere den Namen in "Maximilian"
  mg.names = "Maximilian"
  mg.sag_hallo
  mg.sag_tschuess

  # Aendere den Namen in ein Array von Namen
  mg.names = ["Albert", "Bianca", "Carl-Heinz",
    "David", "Engelbert"]
  mg.sag_hallo
  mg.sag_tschuess

  # Aendere in nil
  mg.names = nil
  mg.sag_hallo
  mg.sag_tschuess
end
{% endhighlight %}

Speichere diese Textdatei als “ri20min.rb” und starte es mit “ruby
ri20min.rb”. Die Ausgabe sollte sein:

    Hallo, Welt!
    Tschuess, Welt, bis bald!
    Hallo, Maximilian!
    Tschuess, Maximilian, bis bald!
    Hallo, Albert!
    Hallo, Bianca!
    Hallo, Carl-Heinz!
    Hallo, David!
    Hallo, Engelbert!
    Tschuess, Albert, Bianca, Carl-Heinz, David, Engelbert, bis bald!
    ...
    ...
{: .code}

In dieses Beispiel wurden einige neue Dinge gestreut, auf die wir
sogleich [näher eingehen werden](../4/).
