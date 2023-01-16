---
layout: page
title: "Über Ruby"
lang: de
---

Warum ist Ruby so populär? Fans nennen es schön und künstlerisch, aber
gleichzeitig funktional und praktisch. Wie kommt das?
{: .summary}

### Die Ideale des Ruby-Erfinders

Ruby ist eine Sprache der Balance. Ihr Schöpfer [Yukihiro “Matz”
Matsumoto][matz] kombinierte Teile seiner Lieblingssprachen (Perl,
Smalltalk, Eiffel, Ada und Lisp) und formte daraus eine neue
Programmiersprache, in der funktionale und imperative Programmierung
ausbalanciert sind.

Er hat oft gesagt, er versuche “Ruby natürlich zu machen, nicht
einfach”, als Spiegel des echten Lebens.

Darauf aufbauend fügt er hinzu:

> Ruby is simple in appearance, but is very complex inside, just like
> our human body<sup>[1](#fn1)</sup>.

> Ruby wirkt simpel, aber ist innen sehr komplex, genau wie der
> menschliche Körper.

### Ruby wächst

Seit seiner Veröffentlichung im Jahr 1995 hat Ruby Programmierer auf der
ganzen Welt angezogen und begeistert. Im Jahr 2006 hat Ruby die Massen
erreicht: Aktive Usergroups entstehen in den großen Weltstädten und
Konferenzen rund um Ruby sind ausverkauft.

Ruby-Talk, die wichtigste [Mailingliste](/de/community/mailing-lists/)
für Diskussionen rund um Ruby, erreichte 2006 einen Spitzenwert von etwa
200 Nachrichten pro Tag. Seither ist die Aktivität wieder zurückgegangen,
da mit dem starken Anwachsen der Community zahlreiche kleinere Listen
entstanden sind.

Die meisten Indizes, die das Wachstum und die Beliebtheit von
Programmiersprachen weltweit messen, listen Ruby unter den beliebtesten
zehn Sprachen (wie zum Beispiel der [TIOBE-Index][tiobe]).
Ein großer Teil dieses Wachstums ist der Beliebtheit von in Ruby
geschriebener Software zu verdanken, insbesondere dem Web-Framework
[Ruby on Rails][ror].

Ruby ist außerdem [absolut frei]({{ site.license.url }}). Nicht nur kostenlos,
sondern auch frei zu benutzen, zu kopieren, zu verändern und zu
vertreiben.

### Alles ist ein Objekt

Am Anfang hat Matz andere Sprachen studiert, um die ideale Syntax zu
finden. An diese Suche erinnert sagt er: “Ich wollte eine Skriptsprache,
die mächtiger als Perl und objektorientierter als Python
ist<sup>[2](#fn2)</sup>.”

In Ruby ist alles ein Objekt. Jedes Stück Information kann eigene
Eigenschaften und Aktionen besitzen. In der Welt der objektorientierten
Programmierung nennt man diese Eigenschaften *Instanzvariablen* und die
Aktionen *Methoden*. Rubys rein objektorientierter Ansatz wird
üblicherweise mit einem Stück Code demonstriert, in dem die Methode einer
Zahl aufgerufen wird:

{% highlight ruby %}
5.times { print "Wir *lieben* Ruby -- es ist ungeheuerlich!" }
{% endhighlight %}

In vielen Sprachen sind Zahlen und andere primitive Typen keine Objekte.
Ruby folgt dem Einfluss von Smalltalk und gibt all seinen Typen Methoden
und Instanzvariablen. Das erleichtert die Verwendung von Ruby, da die
Regeln für Objekte überall in der Sprache gültig sind.

### Rubys Flexibilität

Ruby wird als flexible Sprache angesehen, da der Programmierer die
Bestandteile der Sprache beliebig verändern kann. Zentrale Teile von Ruby
können gelöscht oder umdefiniert werden. Vorhandenes kann erweitert werden.
Ruby versucht, den Programmierer nicht zu behindern.

Ein Beispiel: In Ruby wird mit dem Plus-Operator (`+`) addiert. Aber
wenn man lieber das Wort `plus` benutzen möchte, kann man diese Methode
zu Rubys eingebauter Klasse `Numeric` hinzufügen.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y ist jetzt 11
{% endhighlight %}

Rubys Operatoren sind syntaktischer Zucker für Methoden; man kann sie
ebenfalls umdefinieren.

### Blöcke: Ein mächtiges Ruby-Konstrukt

Auch Rubys Blöcke bieten große Flexibilität. Der Programmierer kann eine
echte Closure an eine Methode übergeben, die beschreibt, wie diese
Methode arbeiten soll. Diese wird *Block* genannt und ist zu einer der
beliebtesten Eigenschaften von Ruby geworden – insbesondere unter
Ruby-Neulingen, die vorher mit imperativen Sprachen wie PHP oder Visual
Basic gearbeitet haben.

Blöcke sind durch funktionale Programmiersprachen inspiriert. Matz sagt:
“Mit Ruby-Closures wollte ich die Kultur von LISP
bewahren<sup>[3](#fn3)</sup>.”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

Im obigen Quelltext steht der Block zwischen `do` und `end`. Die Methode
`map` wendet den Block auf die gegebene Liste von Namen an. Viele andere
Ruby-Methoden lassen ähnliche Lücken offen, damit der Programmierer
Details der Vorgehensweise einfügen kann.

### Ruby und Mixins

Im Gegensatz zu vielen anderen objektorientierten Sprachen unterstützt
Ruby nur Einfachvererbung – **mit Absicht**. Dafür kennt Ruby *Module*
(in Objective-C *Categories* genannt). Module sind Methodensammlungen.

Klassen können Module *einmixen* und bekommen dadurch all ihre Methoden
geschenkt. Zum Beispiel kann jede Klasse, die die Methode `each`
implementiert, das Modul `Enumerable` einmixen, und erhält zwei Dutzend
neue Methoden, die auf `each` aufbauen (wie `map`).

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Im Allgemeinen halten Rubyisten Mixins für klarer als Mehrfachvererbung,
die komplex und einschränkend sein kann.

### Rubys äußeres Design

Obwohl Ruby eine eher begrenzte Zeichensetzung zu Gunsten von englischen
Schlüsselworten verwendet, werden einige Zeichen zum Ausschmücken
benutzt. Ruby verlangt keine Variablendeklarationen. Ruby nutzt einfache
Namenskonventionen, um den Geltungsbereich von Variablen festzulegen:

* `var` kann eine lokale Variable sein.
* `@var` ist eine Instanzvariable.
* `$var` ist eine globale Variable.

Diese Präfixe verbessern die Lesbarkeit, indem sie dem Programmierer
erlauben, die Rollen der einzelnen Variablen zu erkennen. Außerdem wird
dadurch das `self.` vor jeder Instanzvariablen überflüssig.

### Jenseits der Grundlagen

Ruby hat eine Fülle weiterer Features, unter ihnen folgende:

* Ruby kennt Exceptions wie Java oder Python, um Fehlerbehandlung zu
  vereinfachen.

* Ruby hat einen echten Mark-and-Sweep-Garbage-Collector für alle
  Ruby-Objekte. Es ist nicht nötig, Referenzen in
  Erweiterungsbibliotheken zu zählen. Wie Matz sagt: “Das ist besser für
  die Gesundheit.”

* C-Erweiterungen für Ruby zu schreiben ist einfacher als in Perl oder
  Python, da es eine sehr elegante API zum Aufrufen von Ruby aus C
  besitzt. Das schließt auch Aufrufe ein, um Ruby als Skriptsprache in
  fremde Software zu integrieren. Ein SWIG-Interface ist ebenfalls
  verfügbar.

* Ruby kann Erweiterungen dynamisch laden, wenn es das Betriebssystem
  erlaubt.

* Ruby hat plattformunabhängige Threads. Damit steht unter allen Systemen,
  die Ruby unterstützen, auch Multithreading zur Verfügung, sogar unter
  MS-DOS!

* Ruby ist in hohem Maße portabel: Es wird vorrangig auf GNU/Linux
  entwickelt, arbeitet aber auf vielen UNIX-Varianten wie macOS,
  auf Windows, DOS, BeOS, OS/2, usw.

### Alternative Ruby-Implementierungen

Ruby als Sprache hat einige verschiedene Implementierungen.
Diese Seite diskutiert die Referenzimplementierung, in der
Community auch bekannt als **MRI** („Matz’ Ruby-Interpreter“) oder
**CRuby** (da sie in C geschrieben ist), es gibt aber noch einige weitere.
Oftmals sind diese in bestimmten Situationen nützlich, stellen spezielle
Sprach- oder Umgebungsintergration zur Verfügung oder haben einfach
spezielle Features, die MRI nicht hat.

Hier ist eine Liste:

* [JRuby][jruby] ist ein Ruby auf der JVM (Java Virtual Machine), das von
  den optimierenden JIT-Compilern der JVM, ihrem Garbage Collector,
  nebenläufigen Threads, diversen Tools und einer immensen Menge an
  Programmbibliotheken profitiert.
* [Rubinius][rubinius] ist ein „Ruby geschrieben in Ruby“. Aufgebaut auf der
  LLVM stellt Rubinius eine gute virtuelle Maschine zur Verfügung, auf
  der sogar andere Sprachen aufbauen. Ebenso wie JRuby besitzt es echt
  nebenläufige Threads, ist jedoch im Gegensatz zu diesem kompatibel zur
  C-API des MRI.
* [mruby][mruby] ist eine schlanke Ruby-Implementierung, die
  gelinkt und in Anwendungen eingebunden werden kann.
  Die Entwicklung von mruby wird von Yukihiro “Matz” Matsumoto geleitet,
  dem Schöpfer von Ruby.
* [IronRuby][ironruby] integriert sich gut in die .NET-Plattform.
* [MagLev][maglev] definiert sich selbst als „eine schnelle, stabile
  Ruby-Implementierung mit integrierter Objektpersistenz und verteiltem
  Shared Cache“.
* [Cardinal][cardinal] ist ein „Ruby-Compiler für die
  [Parrot][parrot] Virtual Machine“ (Perl 6).

### Referenzen

<sup>1</sup> Matz in der Ruby-Talk-Mailingliste am [12. Mai 2000][blade].
{: #fn1}

<sup>2</sup> Matz in [An Interview with the Creator of Ruby][linuxdevcenter], 29.
November 2001.
{: #fn2}

<sup>3</sup> Matz in [Blocks and Closures in Ruby][artima], 22. Dezember
2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[mruby]: http://www.mruby.org/
[ironruby]: http://www.ironruby.net
[maglev]: http://maglev.github.io
[cardinal]: https://github.com/parrot/cardinal
[parrot]: http://parrot.org
