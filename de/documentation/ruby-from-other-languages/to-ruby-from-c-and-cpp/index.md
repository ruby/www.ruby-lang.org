---
layout: page
title: "Von C und C++ zu Ruby"
lang: de
---

Es ist schwierig, eine Liste von Gemeinsamkeiten und Unterschieden
zwischen Ruby und C++ oder C zusammenzustellen, weil schon der
Unterschied zu C++ sehr groß ist. Eine Grundidee von Ruby ist es, dem
Entwickler die Arbeit möglichst zu erleichtern, indem die
Laufzeitumgebung viele Aufgaben *implizit* übernimmt. Dies ist dem
Prinzip der Sprache C, keine versteckten Mechanismen (*no hidden
mechanism*) zu haben, diametral entgegengesetzt. Wenn Sie Ihren
Quelltext nicht gerade optimieren wollen (wovon ohnehin meist abzuraten
ist), brauchen sie sich bei Ruby nicht darum zu kümmern, einen Compiler
(oder eben den Ruby-Interpreter) “glücklich” zu machen.

Es dürfte ohnehin klar sein, dass interpretierter Programmcode deutlich
langsamer ausgeführt wird als “vergleichbarer”, von einem optimierenden
C- oder C++-Compiler erzeugter Maschinen-Code — wenn auch vermutlich
nicht gar so langsam, wie Sie befürchten. Falls sich jedoch
herausstellt, dass Ruby-Code an performance-kritischen Stellen zu
langsam ist oder Zugriff auf plattformspezifische Resourcen außerhalb
des Ruby-Universums benötigt werden, bietet sich die Möglichkeit,
sogenannte *Erweiterungsmodule* (*extension modules*) in C zu schreiben,
die sich genau wie andere Ruby-Module verhalten.

Und natürlich ist der Ruby-Interpreter selbst in C geschrieben.

Andererseits werden Sie sich schnell daran gewöhnen, wie schnell Sie
eine Ruby-Applikation entwickeln und wie kurz die Iterationszyklen sind.
Und Sie werden überrascht sein, wie wenige Code-Zeilen notwendig sind,
ohne dass der Code kryptisch und unwartbar wird. Ruby ist erheblich
einfacher und produktiver zu programmieren als C++, und das werden Sie
schnell nicht mehr missen wollen.

Da es keinen Compiler gibt, erübrigt sich die Unterscheidung zwischen
*Compile-Zeit* und *Laufzeit*. Dementsprechend stellt sich erst zur
Laufzeit heraus, ob ein Objekt eine aufgerufene Methode überhaupt kennt.
Wenn es sie kennt, wird sie allerdings auch aufgerufen, was die
Verwendung von abstrakten Typen und Methoden überflüssig macht.

### Gemeinsamkeiten und Ähnlichkeiten mit C

Ruby und C haben tatsächlich eine Reihe von Gemeinsamkeiten:

* Man kann in Ruby prozedural programmieren. (Man kann in *jeder*
  Programmiersprache FORTRAN programmieren…) Allerdings nicht, ohne
  viele der vorhanden Objekte zu verwenden.
* Die meisten der Operatoren sind gleich, einschließlich der
  zusammengesetzten Zuweisungsoperatoren wie `+=` und der bitweisen
  Operatoren. Allerdings gibt es keinen `++`- oder `--`-Operator.
* Es gibt `__FILE__` und `__LINE__`.
* Es gibt *Konstanten*, die allerdings nicht durch ein spezielles
  Schüsselwort wie `const` markiert werden. Stattdessen werden
  Konstanten durch Großschreibung (implizit) markiert.
* *String*-Literale werden in doppelte Anführungszeichen gesetzt (können
  aber auch in einfachen Anführungszeichen stehen, was subtile
  Bedeutungsunterschiede hat).
* *Strings* sind veränderlich.
* Die meiste Dokumentation kann mit dem `ri`-Befehl in einem
  Terminal-Fenster angezeigt werden, genau wie *man pages* unter Unix.
* Es gibt einen `ruby-mode` für *emacs* und einen
  Kommandozeilen-Debugger. Aber es gibt natürlich auch integrierte
  Entwicklungsumgebungen.

### Gemeinsamkeiten und Ähnlichkeiten mit C++

Mit C++ gibt es eine Reihe von formalen und inhaltlichen Übereinstimmungen:

* Es gibt weitere gemeinsame Operatoren wie `::`. Der *Shift*-Operator
  `<<` wird z. B. auch verwendet, um Elemente an eine Liste anzuhängen.
  Es gibt allerdings keine *Pointer* und folglich keinen Pfeil-Operator
  `->`, es wird immer der Punkt `.` verwendet.
* Die Schlüsselworte `public`, `private` und `protected` haben ähnliche
  Bedeutung.
* Die Vererbungssyntax benötigt nur ein Zeichen (und kein Schüsselwort),
  allerdings ist es das Kleiner-Zeichen `<` anstelle des Doppelpunkt `:`
  .
* Analog zu den Namensräumen in C++ gibt es *Module*, die Methoden und
  Klassen aufnehmen können.
* *Exceptions* funktionieren auf vergleichbare Art und Weise, allerdings
  gibt es andere Schlüsselwörter.

### Unterschiede zwischen Ruby und C

Es gibt allerdings deutlich mehr Unterschiede als Gemeinsamkeiten zwischen Ruby und C:

* Stand Ruby 1.8 wird Ruby-Code interpretiert. Es gibt keinen Compiler,
  der Machinen- oder Byte-Code erzeugt.
* Es gibt keine direkte Möglichkeit, Assembler-Code zu verwenden.
* Ruby-Code wird so interpretiert, wie er ist. Dementsprechend gibt es
  keinen Präprozessor und keine Makros. Anstelle von mit
  `#define` festgelegten Namen für Literale werden Konstanten
  verwendet.
* Es werden keine *header-Dateien* benötigt. Alle Funktionen (die unter
  Ruby *Methoden* genannt werden) und Strukturen werden in Modulen oder
  direkt im Hauptquelltext angelegt.
* Anstelle von `#include <bla.h>` oder `#include "bli"` wird `require
  'blubb'` geschrieben.
* Der Typ von Objekten wird zur Laufzeit überprüft, allerdings sind
  Variablen typenlos (sozusagen `void`). Dementsprechend gibt es keine
  *Type-Casts* und keine `typedef`s.
* Das Speichermodell von Ruby ist aus Sicht des Programmierers sehr
  einfach: Alle Klassen und Objekte werden (implizit) auf dem Heap
  gespeichert. Es gibt einen *Garbage-Collector* der den Speicher nicht
  mehr referenzierter Objekte wieder freigibt. Der Programmierer muss
  sich nur insoweit um die Speicherverwaltung kümmern, als dass nicht
  mehr benötigte Objekte, die in irgend einer Liste stecken, aus dieser
  entfernt werden. Speicher muss weder explizit angefordert noch
  freigegeben werden.
* Die technischen Aspekte eines Objekts (Größe und Speicheradresse) sind
  irrelevant, dementsprechend gibt es keine Pointer und kein `sizeof`.
* Es gibt keine `enum`s. Es gibt zwar *Symbole*, die aber keinen
  implizit zugeordneten Zahlenwert haben.
* Parameter von Methoden (oder Funktionen) werden immer als Wertparameter
  übergeben, wobei die Werte selbst stets Referenzen auf Objekte sind.
* Lokale Variablen werden nicht explizit deklariert. Es wird einfach ein
  typenloser Name vergeben und Wert zugewiesen, wo gerade eine lokale
  Variable benötigt wird.
* Ruby kommt weitgehend ohne Semikolons aus. Ein Statement ist am
  Zeilenende zuende, es sei denn, es geht offensichtlich weiter, weil
  das letzte Zeichen ein Operator, z. B. `+`, ist. Man kann Zeilen auch
  mit `\` fortsetzen.
* Ruby kommt mit bedeutend weniger runden Klammern aus: `if`- und
  `while`-Bedingungen müssen nicht in Klammern stehen. Auch bei
  Methodenaufrufen dienen Klammern nur der Eindeutigkeit.
* Für mehrzeilige Konstrukte wie Klassen und Methoden, aber auch
  `if`-Blöcke oder `while`-Schleifen werden keine geschweiften Klammern
  verwendet, sie enden mit dem Schlüsselwort `end`.
* Das `do`-Schlüsselwort hat eine andere Bedeutung als in C (kann aber
  in Konstrukten verwendet werden, die einem `do`-`while`-Block recht
  ähnlich sind). Ein Code-Block in geschweiften Klammern oder zwischen
  `do` und `end` wird einer Methode übergeben, ähnlich einem impliziten
  Funktionspointer. Allerdings bietet dieses Konstrukt ungleich mehr
  Möglichkeiten, wie z. B. den Zugriff auf lokale Variablen der
  Umgebung.
* Wahrheitswerte werden anders ausgewertet als in C: nur `false` und
  `nil` gelten als *falsch*, alles andere ist *wahr*, und zwar
  insbesondere auch `0`, `0.0`, `""` und `"0"`.
* Es gibt keine einzelnen *Zeichen*, also `char`s. Ein String kann
  allenfalls in Strings der Länge 1 zerlegt werden.
* Strings enden nicht mit einem 0-Zeichen. Ihre Länge wird nicht
  durchgezählt sondern ist ein Attribut.
* Array-Literale stehen in eckigen und nicht in geschweiften Klammern.
* Arrays werden automatisch länger, wenn Elemente hinzugefügt werden.
* Auch ein Array ist kein Pointer. “Addiert” man zwei Arrays, bekommt
  man keine Pointer-Arithmetik, sondern ein neues Array mit den
  Elementen der beiden Summanden.
* Fast alles hat einen Rückgabewert, auch `if` und `while`. Wer eine
  Allergie gegen den ternären Operator `?:` hat, kann in gleicher Weise
  `if`, `else`, `end` verwenden.

### Unterschiede zwischen Ruby und C++

Naheliegenderweise gibt es auch eine lange Liste von Unterschieden
zwischen Ruby und C++:

* Referenzen sind implizit und es gibt keine Möglichkeit, Objekte *by
  value* an Methoden zu übergeben. Variablen enthalten immer eine
  Referenz auf ein Objekt.
* Ob ein Objekt eine Methode wirklich kennt, wird erst zu Laufzeit
  überprüft. Die Notwendigkeit abstrakter Klassen und Methoden entfällt.
* Statt `this` schreibt man `self`.
* Der Konstruktor heißt `initialize`.
* Alle Methoden sind virtuell.
* Es gibt keine Mehrfachvererbung, allerdings kann eine Klasse die
  Methoden eines oder mehrerer Module erben (“mixins”).
* Es können jederzeit zusätzliche Methoden zu einer Klasse hinzugefügt
  werden. Objekte können Methoden ihrer Klasse überschreiben oder neue
  Methoden hinzufügen. Dies vereinfacht die Implementierung von
  Strategien.
* Anzahl und Typ der Argumente dienen nicht der Identifikation einer
  Methode, ihre “Signatur” besteht nur aus dem Namen. Daher können
  Methoden überschrieben, aber nicht überladen werden.
* Es gibt Konventionen zur Groß- und Kleinschreibung, die auch beachtet
  werden sollten: Klassennamen und Konstanten fangen mit einem
  Großbuchstaben an, Methoden und Variablen mit einem kleinen. Bei der
  Auswertung eines Ausdrucks beeinflusst die Schreibweise das Verhalten
  des Interpreters.
* Methodennamen dürfen auf ’?’ oder ’!’ enden. Solche Methoden sollten
  per Konvention einen Wahrheitswert zurückgeben (?) oder das Objekt
  verändern (!).
* Die Namen von Instanzvariablen (in Ruby “Attribut” genannt) beginnen
  immer mit einem `@`, Klassenvariablen werden nicht mit den
  Schlüsselwort `static` gekennzeichnet, stattdessen beginnt der Name
  einer Klassenvariablen mit `@@`.
* Der Zugriff auf Attribute erfolgt immer über Zugriffsmethoden.
* Da es keine statische Typprüfung gibt, werden C++-Templates und Casts
  nicht benötigt.
* Es gibt keine Typ-Konvertierungsoperatoren. Sie werden sie aber
  voraussichtlich nicht vermissen.
* Es gibt von Hause aus nur zwei Container-Typen: `Array` und `Hash`.
* Iteration wird etwas unterschiedlich gehandhabt. In Ruby verwendet man
  kein separates Iterator-Object (wie z. B. `vector<T>::const_iterator
  iter`). Stattdessen können Klassen das `Enumerator`-Module erben (als
  Mixin), dann steht die Methode `my_obj.each` zur Verfügung.
* Multithreading ist in den Ruby-Interpreter bereits eingebaut, in der
  Version 1.8 gibt es allerdings nur “green threads”, also keine
  Abbildung auf die Threads des Betriebssystems.
* Ruby enthält bereits ein Unit-Test-Framework.
