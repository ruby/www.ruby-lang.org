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
    <a href="../3/" title="Teil 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby in 20 Minuten</h1>

---

Wenn wir unser Programm etwas genauer ansehen, fallen uns die Zeilen
auf, die mit einem Rautenzeichen (#) anfangen. In Ruby ist alles nach
einem Rautenzeichen ein Kommentar, der vom Interpreter ignoriert wird.
Die erste Zeile der Textdatei ist ein Spezialfall: Bei einem
Unix-artigen Betriebssystem sagt es dem Kommandozeileninterpreter (der
“Shell”), wie die Datei ausgeführt werden soll. Der Rest der Kommentare
dient nur der Verdeutlichung.

Unsere `sag_hallo`-Methode ist ein bisschen trickreicher geworden:

{% highlight ruby %}
# Sag Hallo zu allen
def sag_hallo
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names ist eine Liste, iteriere!
    @names.each do |name|
      puts "Hallo, #{name}!"
    end
  else
    puts "Hallo, #{@names}!"
  end
end
{% endhighlight %}

Sie berücksichtigt nun den `@names`-Parameter und trifft abhängig davon
Entscheidungen. Ist er nil, schreibt sie nur drei Punkte auf den
Bildschirm. Es ist schließlich nicht unbedingt sinnvoll, niemanden zu
grüßen, nicht wahr?

## Zyklen und Schleifen – auch Iteration genannt

Wenn das `@names`-Objekt auf das `each` antwortet, gibt es etwas, das
man durchlaufen kann, also wird es durchlaufen und somit jede Person
begrüßt. Wenn `@names` irgendetwas anderes ist, wird es automatisch in
einen String umgewandelt und die Standard-Begrüßung veranlasst.

Sehen wir uns den Iterator genauer an:

{% highlight ruby %}
@names.each do |name|
  puts "Hallo, #{name}!"
end
{% endhighlight %}

`each` ist eine Methode, die einen Code-Block akzeptiert und diesen für
jedes einzelne Element der Liste ausführt. Das Stück zwischen `do` und
`end` ist ein solcher Block. Man kann ihn als eine anonyme Funktion oder
`lambda` ansehen. Die Variable zwischen den Pipe-Zeichen (“\|”) ist der
Parameter für diesen Block.

Was hier passiert, ist dass für jeden Eintrag in einer Liste `name` an
das aktuelle Listenelement gebunden und dann der Ausdruck `puts "Hallo,
#{name}!"` mit diesem Namen als Parameter aufgerufen wird.

Die meisten anderen Programmiersprachen behandeln einen Listendurchlauf
mit einer `for`-Schleife, was in C in etwa so aussieht:

{% highlight c %}
for (i=0; i<anzahl_der_elemente; i++)
{
  mach_etwas_mit(element[i]);
}
{% endhighlight %}

Das funktioniert auch, ist aber nicht besonders elegant. Man benötigt
eine “Wegwerf-Variable” wie `i`, man muss die Größe der Liste kennen,
und man muss auch genau festlegen, wie man die Liste durchläuft. Die Art
und Weise, wie Ruby das macht, ist viel eleganter. Alle administrativen
Details sind innerhalb der `each`-Methode versteckt. So ist alles, was
man braucht, die Angabe, was man mit jedem Element zu tun hat. Intern
wird die `each`-Methode `yield "Albert"` aufrufen, dann `yield
"Bianca"`, dann `yield "Carl-Heinz"` und so weiter.

## Blöcke – das Funkeln an den Kanten des Rubins

Die wahren Fähigkeiten von Blöcken zeigen sich dann, wenn es um Dinge
geht, die etwas komplizierter als Listen sind. Neben der Behandlung
einfacher administrativer Details innerhalb der Methode kann man damit
auch Aufbau, Abbau und Fehler behandeln—versteckt vor den Belangen des
Benutzers.

{% highlight ruby %}
# Sag Tschuess zu allen
def sag_tschuess
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Verbinde die Listenelemente mit Kommata
    puts "Tschuess, #{@names.join(", ")}, bis bald!"
  else
    puts "Tschuess, #{@names}, bis bald!"
  end
end
{% endhighlight %}

Die `sag_tschuess`-Methode benutzt kein `each`. Stattdessen prüft sie,
ob `@names` der `join`-Methode antwortet, und benutzt sie in diesem
Fall. Andernfalls gibt sie nur die Variable als Zeichenkette aus. Diese
Art des Nicht-Kümmerns um den aktuellen *Typ* einer Variable und sich
dabei nur darauf zu verlassen, welche Methode sie unterstützt, nennt man
“Duck Typing” (“Enten-Typisierung” – wie in “Wenn es läuft wie eine Ente
und quakt wie eine Ente …”). Der Nutzen dessen ist, dass es die Typen
von Variablen, die unterstützt werden, nicht unnötigerweise einschränkt.
Wenn jemand eine neue Art einer Listenklasse benutzen möchte, dann wird
alles wie beabsichtigt funktionieren, solange sie die `join`-Methode mit
derselben Semantik wie bei anderen Listen implementiert.

## Anstoß für das Skript

Nun haben wir also unsere MegaGreeter-Klasse. Der Rest der Datei ruft
nur Methoden dieser Klasse auf. Es gibt einen letzten Trick, den man
beachten sollte, und das ist diese Zeile:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` ist die magische Variable, die den Namen der gerade benutzen
Datei als Wert hat, während `$0` der Name der Datei ist, mit dem das
Programm gestartet wurde. Die oben angegebene Anweisung besagt also
“Wenn diese Datei die Haupt-Programmdatei ist …”. Dies erlaubt es, eine
Datei als Bibliothek (“library”) zu benutzen und in diesem Zusammenhang
keinen Code auszuführen, aber wenn die Datei als ausführbare Datei
benutzt wird, wird der Code ausgeführt.

## Betrachte Dich als in Ruby eingeführt!

So, das war’s mit der kurzen Einführung in Ruby. Es gibt noch viel mehr
zu entdecken – die verschiedenen von Ruby angebotenen
Kontrollstrukturen, die Benutzung von Blöcken und `yield`, Module als
Mixins und viele Dinge mehr. Ich hoffe, diese Anleitung hat Appetit auf
mehr gemacht.

Falls ja, schau doch einfach in unsere
[Dokumentations-Abteilung](/de/documentation/). Dort gibt es Links zu
Handbüchern und Anleitungen, die alle kostenlos und online verfügbar
sind.
