---
layout: page
title: "Da Java a Ruby"
lang: it
---

Java è un linguaggio maturo, testato e veloce (contrariamente a quanto
affermano i programmatori che non amano questo linguaggio). È anche
tuttavia molto prolisso, quindi passando a Ruby il numero di righe di
codice diminuirà sensibilmente. C’è anche da aspettarsi che la creazione
di prototipi riutilizzabili risulti più facile e veloce.

### Somiglianze

Come in Java, in Ruby…

* La memoria è gestita automaticamente tramite un garbage collector.
* Gli oggetti sono fortemente tipizzati.
* Ci sono metodi pubblici, privati e protetti.
* Esistono dei tool di documentazione embeddati, come RDoc, che generano
  documenti molto simili a quelli generati da JavaDoc.

### Differenze

A differenza di Java, in Ruby…

* Non devi compilare il codice, viene eseguito direttamente.
* Ci sono molti toolkit di terze parti per creare interfacce grafiche,
  per esempio [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3], [Qt][4],
  o Ruby Tk (già integrato).
* Puoi usare la parola chiave `end` dopo aver definito delle classi o
  dei metodi, per esempio, senza dover usare delle parentesi graffe.
* Si usa `require` invece di `import`.
* Tutte le variabili membro sono private e si può accedere a tutto
  dall’esterno tramite metodi.
* Le parentesi nelle chiamate ai metodi sono normalmente opzionali e
  omesse di frequente.
* Ogni cosa è un oggetto, inclusi i numeri come 2 e 3.14159.
* Non vi è un controllo di tipo statico.
* I nomi delle variabili sono semplicemente delle “etichette”, non hanno
  un tipo associato.
* Non ci sono dichiarazioni di tipo, si può direttamente effettuare
  delle assegnazioni a nuove variabili quando ce n’è bisogno ed esse
  vengono popolate direttamente (per esempio tramite `a = [1,2,3]`
  invece che `int[] a = {1,2,3};`)
* Non esiste il casting. I tuoi unit test ti dovrebbero dire prima che
  il codice venga eseguito se verrà lanciata un’eccezione.
* Si creano oggetti usando assegnazioni come `test =
  TestClass.new("ciao!")` invece di `test = new TestClass("ciao!")`
* Il costruttore si chiama sempre “initialize”, e non come il nome della
  classe.
* Esistono dei “miscugli” (mixins) invece delle interfacce.
* YAML tende ad essere più usato di XML.
* Si usa `nil` invece di `null`.
* `==` e `equals()` sono gestiti in modo diverso in Ruby. Usa `==`
  quando vuoi testare un’equivalenza in Ruby (`equals()` in Java) e usa
  `equal?()` quando vuoi sapere se due oggetti sono lo stesso (`==` in
  Java).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
