---
layout: page
title: "Über Ruby"
lang: de
---

Warum ist Ruby so populär? Fans nennen es schön und künstlerisch, aber
gleichzeitig funktional und praktisch. Wie kommt das?

### Die Ideale des Ruby-Erfinders

Ruby ist eine Sprache der Balance. Ihr Schöpfer [Yukihiro “matz”
Matsumoto][1] vermischte Teile seiner Lieblingssprachen (Perl,
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

Seit ihrer Veröffentlichung im Jahr 1995 hat Ruby Programmierer auf der
ganzen Welt angezogen und begeistert. Im Jahr 2006 hat Ruby die Massen
erreicht: Aktive Usergroups entstehen in den großen Weltstädten und
Konferenzen rund um Ruby sind ausverkauft.

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=280&amp;height=140&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

Ruby-Talk, die wichtigste [Mailing-Liste](/en/community/mailing-lists/)
zur Sprache Ruby, verzeichnet inzwischen 200 Einträge pro Tag.

Der [TIOBE-Index][2], der die Verbreitung von Programmiersprachen misst,
listet Ruby auf Platz 10 der populärsten Sprachen. Ein großer Teil
dieses Wachstums ist der Beliebtheit von in Ruby geschriebener Software
zu verdanken, insbesondere dem Web-Framework Ruby on
Rails<sup>[2](#fn2)</sup>.

Ruby ist außerdem [absolut frei]({{ site.license.url }}). Nicht nur kostenlos,
sondern auch frei zu benutzen, zu kopieren, zu verändern und zu
vertreiben.

### Alles ist ein Objekt

Am Anfang hat Matz andere Sprachen studiert, um die ideale Syntax zu
finden. An diese Suche erinnert sagt er: “Ich wollte eine Scriptsprache,
die mächtiger als Perl und objektorientierter als Python
ist<sup>[3](#fn3)</sup>.”

In Ruby ist alles ein Objekt. Jedes Stück Information kann eigene
Eigenschaften und Aktionen besitzen. In der Welt der objektorientierten
Programmierung nennt man diese Eigenschaften *Instanzvariablen* und die
Aktionen *Methoden*. Rubys rein objektorientierter Ansatz wird
üblicherweise mit einem Stück Code demostriert, in dem die Methode einer
Zahl aufgerufen wird:

{% highlight ruby %}
5.times { print "Wir *lieben* Ruby -- es ist ungeheuerlich!" }
{% endhighlight %}

In vielen Sprachen sind Zahlen und andere primitive Typen keine Objekte.
Ruby folgt dem Einfluss von Smalltalk und gibt all ihren Typen Methoden
und Instanzvariablen. Das erleichtert die Verwendung von Ruby, da die
Regeln für Objekte überall in der Sprache gültig sind.

### Rubys Flexibilität

Ruby wird als flexible Sprache angesehen, da der Programmierer die
Bestandteile der Sprache beliebig verändern kann. Grundlegendes kann
gelöscht oder umdefiniert werden. Vorhandenes kann erweitert werden.
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
bewahren<sup>[4](#fn4)</sup>.”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

Im obigen Quelltext steht der Block zwischen `do` und `end`. Die Methode
`map` wendet den Block auf die gegebene Liste von Namen an. Viele andere
Ruby-Methoden lassen ähnliche Lücken offen, damit der Programmierer
Details über die Vorgehensweise einfügen kann.

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
benutzt. Ruby nutzt einfache Namenskonventionen, um den Geltungsbereich
von Variablen festzulegen:

* `var` kann eine lokale Variable sein.
* `@var` ist eine Instanzvariable.
* `$var` ist eine globale Variable.

Diese Vorzeichen verbessern die Lesbarkeit, indem sie dem Programmierer
erlauben, die Rollen der einzelnen Variablen zu erkennen. Außerdem wird
dadurch das `self.` / `this.` vor jeder Instanzvariable überflüssig.

### Jenseits der Grundlagen

Ruby hat eine Fülle weiterer Features, unter ihnen folgende:

* Ruby kennt Exceptions wie Java oder Python, um Fehlerbehandlung zu
  vereinfachen.
^

* Ruby hat einen echten Mark-and-Sweep-Garbage-Collector für alle
  Ruby-Objekte. Es ist nicht nötig, Referenzen in
  Erweiterungsbibliotheken zu zählen. Wie Matz sagt: “Das ist besser für
  die Gesundheit.”
^

* C-Erweiterungen für Ruby zu schreiben ist einfacher als in Perl oder
  Python, da es eine sehr elegante API zum Aufrufen von Ruby aus C
  besitzt. Das schließt auch Aufrufe ein, um Ruby als Scriptsprache in
  fremde Software zu integrieren. Ein SWIG-Interface ist ebenfalls
  verfügbar.
^

* Ruby kann Erweiterungen dynamisch laden, wenn es das Betriebssystem
  erlaubt.
^

* Ruby hat plattformunabhängige Threads. Damit hat man unter allen
  Systemen, die Ruby unterstützen, auch Multithreading, sogar unter
  MS-DOS!
^

* Ruby ist in hohem Maße portabel: Es wird vorrangig auf GNU/Linux
  entwickelt, arbeitet aber auf vielen UNIX-Varianten wie Mac OS X, auf
  Windows 95/98/Me/NT/2000/XP, DOS, BeOS, OS/2 usw.

#### Referenzen

<sup>1</sup> Matz auf der Ruby-Talk-Mailingliste am [12. Mai 2000][3].
{: #fn1}

<sup>2</sup> Besuche die Website von [Ruby on Rails][4], um mehr zu
erfahren.
{: #fn2}

<sup>3</sup> Matz in [An Interview with the Creator of Ruby][5], 29.
November 2001.
{: #fn3}

<sup>4</sup> Matz in [Blocks and Closures in Ruby][6], 22. Dezember
2003.
{: #fn4}



[1]: http://www.rubyist.net/~matz/
[2]: http://www.tiobe.com/tpci.htm
[3]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[4]: http://rubyonrails.org/
[5]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[6]: http://www.artima.com/intv/closures2.html
