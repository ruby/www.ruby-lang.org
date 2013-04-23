---
layout: page
title: "Von Python zu Ruby"
lang: de
---

Auch Python ist (wie Ruby) eine dynamische Allzweck-Scriptsprache, und
gehört somit zur engen Familie der *agilen Sprachen*. Im Vergleich zu
Python gibt es in Ruby allerdings ein wenig mehr Syntax zu lernen. Mehr
über Python findest du auf der [Python-Website][1].

Ruby verletzt die Regeln des [Python-Zen][2] und kann Perl ähnlich
sehen, was viele Pythonisten abschreckt. Bei genauerem Hinsehen wird
deutlich, dass beide Sprache sehr ähnliche Ziele verfolgen, diese aber
mit unterschiedlichen Mitteln erreichen.

Die Communities von Python und Ruby sind deshalb oft in produktivem
Kontakt.

### Ähnlichkeiten

#### Spracheigenschaften

* **Alles ist ein Objekt**, und Variablen sind Referenzen auf Objekte.
* Die **Typisierung** ist dynamisch, aber stark. Auch in Python ist
  *Duck Typing* verbreitet.
* **Klassen sind offen** und können nach Belieben erweitert werden.
* Objekte und Klassen können **eigene Methoden** besitzen.
* **Introspektion** und **Meta-Programmierung** sind möglich.
* Operatoren wie `+` oder `[]` können überschrieben werden.
* **Exceptions** arbeiten ähnlich (wenn auch mit anderer Syntax).

#### Tools und Bibliotheken

* Ruby selbst ist ein **Interpreter**\: `ruby`.
* Ruby hat ein **interaktives Interface**\: `irb`.
* Es gibt ein eingebautes **Dokumentations-Tool**\: [`rdoc`][3]
* Man kann die **Dokumentation über die
  Kommandozeile<sup>[1](#fn1)</sup>** lesen: `ri`.
* Die verbreiteten **Editoren** bieten mittlerweile guten Ruby-Support.
* Es gibt eine reichhaltige **Bibliothek**.
* Es gibt moderne **Web-Frameworks** ;-)

<sup>1</sup> Zur Zeit bietet ri leider noch keine Informationen zur
Sprache selbst, sondern nur zu eingebauten Klassen und Bibliotheken.
Dafür gibt es die erste Version der *Pickaxe* (das bekannteste
Ruby-Referenz-Buch) online auf [Englisch][4].
{: #fn1}

#### Syntax

* Anweisungen benötigen **kein Semikolon** und enden mit der Zeile.
* Die meisten **Schlüsselworte** sind dieselben wie in Python.
* **Eckige Klammern** erzeugen Listen, **geschweifte Klammern** erzeugen
  Hashes (Rubys *dict*). Schlüssel und Wert werden allerdings mit `=>`
  getrennt anstatt mit Doppelpunkten.
* Auch Ruby neigt dazu, wesentlich kürzer zu sein als Java oder C.

### Unterschiede

#### Spracheigenschaften

* Die Realisierung von **Klassen**, Attributen und Methoden
  unterscheidet sich stark von Python.
* Es gibt keine *new style*- und *old style*-Klassen.
* Man greift niemals direkt auf **Instanzvariablen** zu. In Ruby ruft
  man immer nur Methoden auf. Da in Ruby Klammern optional sind, kann
  man aber Methoden erstellen, die sich wie Attribute anfühlen (wie
  *Properties* in Python).
* Es gibt `public`, `private` und `protected`, um **Zugriff auf
  Methoden** zu steuern.
* **Mixins** werden anstelle von **Mehrfachvererbung** benutzt.
* Man darf auch **eingebaute Ruby-Klassen** verändern.
* Es gibt **Konstanten** (die eine Warnung erzeugen, wenn man ihren Wert
  ändert.)
* Es gibt nur einen **Listentyp** (`Array`), der seinen Wert verändern
  kann, und der gleichzeitig als Tupel, Liste, Stack, Queue und Set
  fungiert. Für effiziente Mengenalgorithmen benutzt man allerdings
  `Set`.
* In Ruby läd man **zusätzliche Dateien** mit `require 'filename'`
  anstatt mit `import modulename`. **Modul- und Ordnerhierarchien** sind
  nur durch Konvention miteinander verbunden. Es gibt keine direkten
  Entsprechungen zu `from...import` und `import...as`.
* Ruby hat **globale Variablen** (`$foo`), die aber selten verwendet
  werden.

#### Strings, Symbole und Reguläre Ausrücke

* **Ruby-Strings** können ihren Wert ändern (sind also *mutable*).
* In Ruby werden statt Strings häufig **Symbole** verwendet, wenn der
  Inhalt des Strings nicht der Ausgabe dient. Symbole sind im Gegensatz
  zu Strings nicht veränderbar und existieren nur einmal im Speicher.
* In Ruby verhalten sich Strings in `'einfachen'` Anführungszeichen wie
  Pythons `r"aw strings"`.
* Alle Stringtypen dürfen **mehrzeilig** sein; anstatt Triple-Quotes
  werden häufig `<<-HEREDOCS` eingesetzt.
* **Interpretierte Stringliterale** (`"solche"` und `%Q[solche]`) dürfen
  `"#{Ruby-Code}"` enthalten. Der Wert des Ausdrucks wird in einen
  String verwandelt und direkt eingefügt.
* Ruby kennt auch Pythons **Format-Strings** samt `%`-Methode; man
  verwendet allerdings Arrays statt Tupeln, um mehrere Argumente zu
  übergeben.
* Für **reguläre Ausdrücke** gibt es eine `/(?:einge\baute) Synta/x`.
* Die Ergebnisse des letzten Matches werden in den aus Perl bekannten
  Variablen `$1`, `$&`, `` $` `` usw. abgelegt (diese Variablen sind
  allerdings lokal.) Für Objektorientierte gibt es die Klassen `Regexp`
  und `MatchData`.

#### Syntax

* **Einrückung** ist in Ruby freiwillig. Mehrzeilige Anweisungen werden
  mit **`end`** beendet.
* Kein explizites **`self`** in Methodensignaturen.
* Ruby hat **Blöcke**, die [vielfältig][6] eingesetzt werden.
* In Ruby **ist alles ein Ausdruck**, so dass Code-Elemente fast
  beliebig kombiniert werden können.
* **Implizites `return`**\: Der Wert des letzten Ausdrucks einer Methode
  wird zurückgegeben. Man kann `return` aber auch wie in Python explizit
  angeben.
* Es gibt ein paar **erzwungene Namenskonventionen** (z.B. beginnen
  Klassennamen immer mit einem Großbuchstaben, Variablen werden dagegen
  klein geschrieben.)
* Methoden können **ohne Klammern** aufgerufen werden (`require 'set'`
  usw.) Das hat zur Folge, dass man auf Methodenobjekte nur über
  `obj.method :name` zugreifen kann, die dann mittels `meth.call` oder
  `meth[]` aufgerufen werden.
* **Instanzen** werden mit `Foo.new` erstellt, nicht mit `Foo()`. Die
  zugehörige Methode heißt `initialize` statt `__init__`.
* `true`, `false` und `nil` sind Rubys `True`, `False` und `None`.
* In **Bedingungen** sind *nur* die Werte `nil` und `false` negativ.
  Alles andere (0, leere Strings und Listen usw.) ist positiv.
* Ruby benutzt `elsif` statt `elif`.
* **Namespaces** werden mit dem `::`-Operator verknüpft, mit dem man
  auch auf Konstanten wie `Math::PI` zugreift.
* Ruby hat keine echten Keyword-Argumente; stattdessen werden Hashes mit
  optionalen Klammern eingesetzt.
* Ruby hat keine List-Comprehensions; stattdessen benutzt man die
  Methoden des Moduls `Enumerable`.

#### Konventionen

* **Namen**\: Methoden und Variablen jeder Art sind `under_score`,
  Klassen `CapitalCase` und Konstanten `ALL_CAPITAL_CASE`.
* **Kommentare** stehen *über* den Methoden und Klassen, wie in Java.
* Das **Ändern eingebauter Klassen** ist nicht geächtet, sondern wird
  fröhlich praktiziert.
* **Eingerückt** wird mit zwei Leerzeichen.



[1]: http://python.org
[2]: http://python.org/dev/peps/pep-0020/
[3]: http://www.ruby-doc.org/stdlib/libdoc/rdoc/rdoc/index.html
[4]: http://www.rubycentral.com/book/
[6]: http://www.rubyist.net/~matz/slides/oscon2005/mgp00044.html
