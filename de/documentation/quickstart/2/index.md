---
layout: page
title: "Ruby in 20 Minuten"
lang: de
---

Was machen wir, wenn wir ganz oft “Hallo” sagen wollen, ohne uns die
Finger wund zu tippen? Wir definieren eine Methode!

    irb(main):010:0> def h
    irb(main):011:1> puts "Hallo, Welt!"
    irb(main):012:1> end
    => nil

Mit dem Code `def h` beginnt man die Methodendefinition. Er teilt Ruby
mit, dass wir eine Methode definieren, deren Name `h` ist. Die nächste
Zeile nennt man Rumpf (“Body”) der Methode. Sie ist identisch zu der
Zeile, die wir schon von vorhin kennen: `puts "Hallo, Welt!"`. Und
schließlich teilt die letzte Zeile `end` Ruby mit, dass wir fertig mit
der Methodendefinition sind. Rubys Antwort `=> nil` sagt uns, dass Ruby
das nun weiß.

## Die kurzen, immer wiederkehrenden Lebenszyklen einer Methode

Rufen wir nun die Methode ein paar Mal auf:

    irb(main):013:0> h
    Hallo, Welt!
    => nil
    irb(main):014:0> h()
    Hallo, Welt!
    => nil

So einfach ist das also! Man ruft eine Methode auf, indem man Ruby
einfach ihren Namen nennt. Wenn die Methode keine Parameter hat, ist das
alles, was man machen muß. Wenn man will, kann man noch ein leeres
Klammer-Paar ans Ende des Methodennamens setzen, aber das ist nicht
notwendig.

Was, wenn wir nun Hallo zu einer ganz bestimmten Person statt zur ganzen
Welt sagen möchten? Dann definieren wir `h` einfach neu, so dass ein
Name als Parameter akzeptiert wird:

    irb(main):015:0> def h(name)
    irb(main):016:1> puts "Hallo, #{name}!"
    irb(main):017:1> end
    => nil
    irb(main):018:0> h("Matz")
    Hallo, Matz!
    => nil

Es funktioniert also … aber sehen wir uns genauer an, was hier vor sich
geht.

## Platzhalter in Zeichenketten

Mit dem Platzhalter `#{name}` fügt man in Ruby etwas in eine
Zeichenkette (“String”) ein. Die Variable `name` selbst wird zuerst in
einen String umgewandelt (falls sie nicht bereits eine ist) und dann an
der entsprechenden Stelle innerhalb der Zeichenkette eingefügt. Das kann
man auch dazu benutzen, um sicherzugehen, dass der Name einer Person mit
einem Großbuchstaben anfängt:

    irb(main):019:0> def h(name = "Welt")
    irb(main):020:1> puts "Hallo, #{name.capitalize}!"
    irb(main):021:1> end
    => nil
    irb(main):022:0> h "chris"
    Hallo, Chris!
    => nil
    irb(main):023:0> h
    Hallo Welt!
    => nil

Hier kann man noch weitere Tricks beobachten. Einer davon ist, dass wir
die Methode wieder ohne Klammern aufrufen. Wenn es also offensichtlich
ist, was man machen will, kann man die Klammern ruhig weglassen. Der
andere Trick ist der voreingestellte Parameter (“default parameter”)
`Welt`. Was das bedeutet, ist: “Wenn kein Name als Parameter
mitgeliefert wird, benutze `'Welt'` als Namen”.

## Ein simples Hallo entwickelt sich zu einer richtigen Begrüßung

Du möchtest eine richtige Begrüßung? Etwas, das sich an Deinen Namen
erinnert, Dich willkommenheißt und Dich immer mit Respekt behandelt?
Dafür erzeugen wir am besten ein Objekt. Lass uns also eine Klasse
“Greeter” (“Begrüßer”) schreiben!

    irb(main):024:0> class Greeter
    irb(main):025:1>   def initialize(name = "Welt")
    irb(main):026:2>     @name = name
    irb(main):027:2>   end
    irb(main):028:1>   def sag_hallo
    irb(main):029:2>     puts "Hallo, #{@name}!"
    irb(main):030:2>   end
    irb(main):031:1>   def sag_tschuess
    irb(main):032:2>     puts "Tschuess, #{@name}, bis bald!"
    irb(main):033:2>   end
    irb(main):034:1> end
    => nil

Das neue Schlüsselwort hier ist `class`. Damit definieren wir eine neue
Klasse namens “Greeter” und eine gewisse Anzahl von Methoden für diese
Klasse. Beachte auch `@name`! Das ist eine Instanzvariable, die allen
Methoden der Klasse zur Verfügung steht. Wie Du sehen kannst, wird sie
von `sag_hallo` und `sag_tschuess` benutzt.

Wie setzen wir diese Begrüßungsklasse also in Bewegung? Ganz einfach:
[Wir erzeugen ein Objekt!](../3/)

