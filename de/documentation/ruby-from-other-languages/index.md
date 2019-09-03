---
layout: page
title: "Ruby für Umsteiger"
lang: de
---

Wenn du zum ersten Mal Ruby-Code siehst, wird er dich wahrscheinlich an
andere Programmiersprachen erinnern, die du benutzt hast. Das ist
Absicht. Der größte Teil der Syntax ist (unter anderem) Perl-, Python-
und Java-Programmierern vertraut. Wenn du diese Sprachen also schon mal
benutzt hast, wird das Lernen von Ruby ein Kinderspiel.
{: .summary}

Dieses Dokument besteht aus zwei Teilen: Der erste versucht, eine
Dauerfeuer-Zusammenfassung darüber zu geben, was dich erwartet, wenn du
von *Sprache X* zu Ruby wechselst. Der zweite Teil geht auf die
Hauptbestandteile von Ruby ein und vergleicht sie mit Konstrukten
anderer Sprachen, die du bereits kennst.

## <span style="font-size:0.9em;;">Von *Sprache X* zu Ruby: Was erwartet mich?</span>

* [Von C und C++ zu Ruby](to-ruby-from-c-and-cpp/)
* [Von Java zu Ruby](to-ruby-from-java/)
* [Von Perl zu Ruby](to-ruby-from-perl/)
* [Von PHP zu Ruby](to-ruby-from-php/)
* [Von Python zu Ruby](to-ruby-from-python/)

## Wichtige Features und ein paar Fallen

Hier sind ein paar Hinweise zu wichtigen Ruby-Features, denen du beim
Lernen begegnen wirst.

### Iteration

Zwei Dinge, denen du in dieser Form vermutlich noch nicht begegnet bist,
und an die man sich ein wenig gewöhnen muss, sind Blöcke und Iteratoren.
In Ruby iteriert man weder über einen Index (wie in C), noch über eine
Liste (wie in Perls `for (@a) {...}` oder Pythons `for item in aList:`),
sondern in den meisten Fällen so:

{% highlight ruby %}
some_list.each do |item|
  # Wir sind im Innern des Blocks
  # und arbeiten mit item.
end
{% endhighlight %}

Mehr zu `each` (und seine Artgenossen `collect`/`map`, `find`, `inject`,
`sort` etc.) erfährst du über `ri Enumerable`
(bzw. `ri Enumerable#methodenname`).

### Alles hat einen Wert

Es gibt in Ruby keinen Unterschied zwischen einem Ausdruck und einer
Anweisung. Alles hat einen Wert, auch wenn er manchmal nur `nil` ist.
Damit ist so etwas möglich:

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

### Symbole sind keine Strings

Viele Ruby-Anfänger kämpfen damit, zu verstehen, was Symbole sind und
wofür sie benutzt werden können.

Symbole sind am einfachsten als Identitäten (IDs) zu verstehen. Bei
einem Symbol ist wichtig, *wer* es ist, nicht *was* es ist. Starte `irb`
und du siehst den Unterschied:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Die Methode `object_id` liefert die ID eines Objektes. Haben zwei
Objekte dieselbe `object_id`, dann sind sie identisch (zeigen auf
dasselbe Objekt im Speicher.)

Wie du siehst, zeigt jedes gleichnamige Symbol auf dasselbe Objekt im
Speicher, und zwar von dem Moment an, in dem du das Symbol zum ersten
mal benutzt. Zwei Symbole mit denselben Zeichen haben die selbe `object_id`.

Die Strings hingegen (`"george"`) haben eine unterschiedliche `object_id`.
Das bedeutet, dass sie auf zwei verschiedene Objekte im Speicher zeigen.
Immer wenn du einen neuen String benutzt, reserviert Ruby dafür Speicher.

Wenn du nicht genau weißt, ob du ein Symbol oder einen String brauchst,
überlege dir, was wichtiger ist: die Identität des Objektes (z. B. ein
Schlüssel in einem Hash) oder sein Inhalt (“george” im obigen Beispiel).

### Alles ist ein Objekt

Das ist keine Übertreibung. Sogar Klassen und Zahlen sind Objekte, und
du kannst mit ihnen dasselbe tun wie mit jedem anderen Objekt:

{% highlight ruby %}
# Das ist dasselbe wie
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Variable Konstanten

Konstanten sind in Ruby nicht wirklich konstant. Wenn du eine schon
initialisierte Konstante veränderst, wird eine Warnung erzeugt, aber das
Programm läuft weiter. Was nicht heißt, dass du Konstanten umdefinieren
*solltest*.

### Namenskonventionen

Ruby erzwingt einige Namenskonventionen. Wenn ein Bezeichner mit einem
Großbuchstaben beginnt, dann ist er eine Konstante. Beginnt er mit einem
Dollarzeichen (`$`), dann ist er eine globale Variable. Wenn er mit `@`
anfängt, ist es eine Instanzvariable, und Klassenvariablen beginnen mit
`@@`.

Methodennamen dürfen allerdings auch mit einem Großbuchstaben beginnen.
Das kann zu Verwirrung führen, wie das folgende Beispiel zeigt:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Nun hat `Constant` den Wert 10, aber die Funktion `Constant()` gibt 11
aus.

Nützlich ist dies, wenn man eine Methode genauso nennen möchte wie eine
Klasse. Die folgenden Aufrufe generieren drei mal dasselbe Array mit den
Zahlen von 1 bis 5:

{% highlight ruby %}
five1 = [1, 2, 3, 4, 5]
# Klasse Array
five2 = Array.new << 1 << 2 << 3 << 4 << 5
# Methode Array
five3 = Array(1..5)
{% endhighlight %}

### Benannte Argumente

Seit Ruby 2.0 können Methoden wie auch in Python mit benannten Argumenten
(Keyword-Argumenten) aufgerufen werden:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### Die reine Wahrheit

In Ruby wird alles außer `nil` und `false` als Wahr (true) behandelt. In
C, Python und vielen anderen Sprachen verhalten sich die Zahl 0, leere
Listen und andere Werte als Unwahr (false). Sieh dir dazu folgenden
Python-Code an (das Beispiel funktioniert auch in anderen Sprachen):

{% highlight python %}
# in Python
if 0:
  print("0 ist true")
else:
  print("0 ist false")
{% endhighlight %}

Hier wird “0 ist false” ausgeben. Dasselbe in Ruby:

{% highlight ruby %}
# in Ruby
if 0
  puts "0 ist true"
else
  puts "0 ist false"
end
{% endhighlight %}

Ruby gibt “0 ist true” aus.

### Sichtbarkeits-Modifikatoren gelten bis zum Ende des Blocks

Im folgenden Ruby-Code:

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

könnte man erwarten, dass `another_method` *public* ist. Falsch.
`private` gilt bis zum Ende des Blocks, oder bis ein anderer Modifikator
aufgerufen wird. Standardmäßig sind Methoden *public*\:

{% highlight ruby %}
class MyClass
  # Jetzt ist a_method "public".
  def a_method; true; end

  private

  # another_method ist "private".
  def another_method; false; end
end
{% endhighlight %}

 `public`, `private` und `protected` sind in Wirklichkeit Methoden und akzeptieren Parameter. Wenn du ein Symbol an eine davon übergibst, wird die Sichtbarkeit der Methode mit diesem Namen geändert:

{% highlight ruby %}
class MyClass
  # Jetzt ist a_method wieder "private".
  private :a_method
end
{% endhighlight %}

### Sichtbarkeit von Methoden

In Java bedeutet *public*, dass jeder eine Methode aufrufen darf.
*protected* bedeutet, dass nur die Klasse selbst, ihre Instanzen und von
ihr abgeleitete Klassen und deren Instanzen Zugriff haben. *private*
beschränkt den Zugriff ganz auf die Klasse und ihre Instanzen.

Ruby verhält sich anders. *public* ist natürlich öffentlich. *private*
bedeutet, dass die Methode nicht mit einem expliziten Empfänger
aufgerufen werden kann, mit anderen Worten: Der Empfänger ist immer
`self`.

Bei *protected* muss man aufpassen: Eine so geschützte Methode kann ohne
Empfänger in der Klasse und abgeleiteten Klassen aufgerufen werden (wie
bei *private*), aber zusätzlich auch mit einer anderen Instanz dieser
Klasse als Empfänger.

Ein Beispiel aus den [Ruby Language FAQ][faq]:

{% highlight ruby %}
class Test
  # standardmäßig "public"
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

# `identifier' ist jetzt "protected"; das funktioniert noch,
# weil `other' eine Instanz derselben Klasse ist

class Test
  protected :identifier
end

t1 == t2  # => true

# nun ist `identifier' "private"

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Offene Klassen

Ruby-Klassen sind offen. Du kannst sie jeder Zeit verändern und ihnen
Methoden hinzufügen. Sogar eingebaute Klassen wie `Integer` oder `Object`
(die Mutter aller Objekte) sind erweiterbar. ActiveSupport fügt `Integer`
viele Methoden zur Erzeugung von Zeitangaben hinzu:

{% highlight ruby %}
class Integer
  def hours
    self * 3600  # Anzahl der Sekunden in einer Stunde
  end
  alias hour hours
end

# 14 Stunden nach 00:00 am 1. Januar
# (oder "als du endlich aufwachst" ;)
Time.mktime(2006, 01, 01) + 14.hours  #-> Sun Jan 01 14:00:00
{% endhighlight %}

### Lustige Namen für Methoden

In Ruby dürfen Methoden mit einem Frage- oder Ausrufezeichen enden. Die
Konvention ist, dass Methoden, die auf eine Ja-Nein-Frage antworten, ein
Fragezeichen erhalten: `Array#empty?` liefert `true`, wenn das Array
leer ist. Potentiell gefährliche Methoden (die den Empfänger selbst
verändern wie `String#reverse!`, oder das brutale `exit!`) enden mit
einem Ausrufezeichen.

Aber nicht alle Methoden, die ihre Empfänger verändern, haben ein
Ausrufezeichen. `Array#replace` ersetzt den Inhalt des Arrays mit dem
Inhalt eines anderen. Es macht wenig Sinn, eine derartige Methode zu
schreiben, die den Empfänger *nicht* verändert.

### Singleton-Methoden

Singleton-Methoden sind Methoden für Objekte. Sie gehören nur zu dem
Objekt, für das du sie definierst:

{% highlight ruby %}
class Car
  def inspect
    "billig"
  end
end

porsche = Car.new
porsche.inspect  #-> billig

def porsche.inspect
  "teuer"
end

porsche.inspect  #-> teuer

# Andere Objekte werden nicht beeinflusst:
car = Car.new
car.inspect  #-> billig
{% endhighlight %}

### Fehlende Methoden

Ruby gibt nicht auf, wenn es zu einem Aufruf keine passende Methode
finden kann. Es ruft stattdessen die Methode `method_missing` auf und
übergibt den Namen der fehlenden Methode und die Argumente.
Standardmäßig erzeugt `method_missing` einen `NameError`, aber du kannst
es umdefinieren, so dass es besser in deine Anwendung passt (was viele
Bibliotheken auch tun.) Hier ist ein Beispiel:

{% highlight ruby %}
# 'id' ist der Name der aufgerufenen Methode, ein * sammelt
# alle argumente in einem Array namens 'arguments'.
def method_missing(id, *arguments)
  puts "Die Methode #{id} wurde nicht gefunden."
  puts "Folgende Argumente wurden übergeben: " + arguments.join(", ")
end

__ :a, :b, 10
#-> Die Methode __ wurde nicht gefunden.
#-> Folgende Argumente wurden übergeben: a, b, 10
{% endhighlight %}

Der obige Code gibt nur die Details des Aufrufs aus, aber du kannst die
Botschaft natürlich auch völlig anders behandeln.

### Botschaften senden statt Funktionen aufrufen

Ein Methodenaufruf ist in Ruby in Wirklichkeit eine Botschaft an ein
Objekt:

{% highlight ruby %}
1 + 2
# ist dasselbe wie
1.+(2)
# ist dasselbe wie
1.send "+", 2
{% endhighlight %}

### Blöcke sind Objekte, sie wissen es nur noch nicht

Blöcke werden überall in der Standardbibliothek benutzt. Um einen Block
aufzurufen, kannst du `yield` benutzen, oder du machst eine
`Proc`-Instanz daraus, indem du einen speziellen Parameter zur Signatur
hinzufügst:

{% highlight ruby %}
def block(&the_block)
  # der Block, der an die Methode übergeben wurde
  the_block  # Gib den Block zurück.
end
adder = block { |a, b| a + b }
# adder ist jetzt ein Proc
adder.class  #-> Proc
{% endhighlight %}

Du kannst Blockobjekte auch außerhalb von Methodenaufrufen erzeugen,
indem du `Proc.new` oder die Methode `lambda` mit dem Block aufrufst.

In ähnlicher Weise können auch aus Methoden Objekte gemacht werden:

{% highlight ruby %}
method(:puts).call "puts ist ein Objekt!"
#-> puts ist ein Objekt!
{% endhighlight %}

### Operatoren sind syntaktischer Zucker

Die meisten Operatoren in Ruby sind nur Methodenaufrufe mit einer
speziellen Syntax (und ein paar Vorrangregeln). Du kannst zum Beispiel
die Methode `+` für `Integer` überschreiben:

{% highlight ruby %}
class Integer
  # Du kannst, aber bitte tu es nicht.
  def +(other)
    self - other
  end
end
{% endhighlight %}

Du brauchst kein `operator+` oder ähnliches.

Du kannst sogar Elementzugriff in der Art eines Arrays ermöglichen, wenn
du die Methoden `[]` und `[]=` definierst. Um das unäre `+` und `-` zu
überschreiben (für Vorzeichen), musst du die Methoden `+@` und `-@`
benutzen.

Die folgenden Operatoren sind *kein* syntaktischer Zucker. Sie sind
keine Methoden, und können nicht umdefiniert werden:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Zudem sind `+=`, `*=`, usw. nur Abkürzungen für `foo = foo + bar`,
`foo = foo * bar` usw. und können deshalb auch nicht überschrieben werden.

## Weiterlesen

Wenn du bereit für noch mehr Ruby-Wissen bist, dann schau dir die
[Dokumentation](/de/documentation/) an.



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
