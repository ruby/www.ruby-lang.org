---
layout: page
title: "Da Perl a Ruby"
lang: it
---

Perl è superbo; la documentazione Perl è superba; la comunità Perl è ...
superba. Tuttavia, il linguaggio è piuttosto esteso, e con una certa
complessità. Per quei programmatori Perl che aspirano a un’esperienza di
programmazione più semplice, a un linguaggio più cartesiano, e con
eleganti funzionalità OO presenti dall’inizio nel linguaggio stesso,
Ruby può essere la risposta che essi cercano.

### Somiglianze

Come in Perl, in Ruby…

* Hai un sistema di amministrazione package, simile a CPAN (che si
  chiama “[RubyGems][1]”).
* Le “Regular Expressions” sono construite nel linguaggio (buon
  appetito!).
* C’è un buon numero di operazioni comuni fornite dal linguaggio stesso.
* Le Parentesi sono spesso opzionali.
* Le Stringhe funzionano sostanzialmente nello stesso modo.
* Esiste una sintassi generale per delimitare le stringhe e le regex
  simile a Perl (ossia come `%q{questo}` (fra apici), o `%Q{questo}`
  (fra virgolette), e `%w{questo per una lista di parole fra apici}`. Tu
  `%Q|puoi|` `%Q(usare)` `%Q^altri^` delimitatori se preferisci).
* Si Ritrova l’interpolazione di variabili nelle stringhe fra
  virgolette, anche se `"appare #{così}.."` (bada che puoi inserire
  qualsiasi codice Ruby all’interno di `#{}`, non solo variabili).
* I comandi Shell vengono racchiusi `` `da apici sghembi` `` (“backticks” in
  Inglese).
* Hai tool di documentazione embedded (quello di Ruby si chiama rdoc).

### Differenze

A differenza di Perl, in Ruby,...

* Non hai regole che dipendono dal contesto come in Perl.
* Una variabile non è la stessa cosa dell’oggetto al quale fa
  riferimento. Invece, è solamente un riferimento a un oggetto.
* Benchè i simboli `$` e `@` vengano usati (in casi specifici)
  come primo carattere in nomi di variabili, invece di indicarne il
  tipo, ne indicano la portata ("scope") (più precisamente: `$` per le
  globali, `@` per le instanze di oggetti, e `@@` per le
  variabili di classe).
* Gli elementi di un Array sono racchiusi da parentesi quadre invece che
  fra parentesi.
* Comporre liste di altre liste non le riducono ad una sola grande
  lista; invece il risultato è un array di array.
* Si usa `def` invece di `sub`.
* Non sono necessari i punti e virgola alla fine di ciascuna linea. Per
  inciso, le definizioni di funzione, le definizioni di classe, e le
  istruzioni ‘case’ vengono chiusi dalla parola-chiave `end`.
* Gli oggetti sono fortemente tipizzati. Devi esplicitamente scrivere
  `foo.to_i`, `foo.to_s`, etc., se devi fare conversioni di tipo (il
  linguaggio non lo farà per te).
* Non ci sono `eq`, `ne`, `lt`, `gt`, `ge`, `le`.
* Non c’è l’operatore diamante (`<>`) per l’entrata-uscita dati; invece di
  solito si usa `IO.qualche_funzione`.
* Il simbolo `=>` (“fat comma”) viene usato solamente per segnalare la
  corrispondenza chiave-valore nei hash.
* Non esiste `undef`; in Ruby esiste solo `nil`, il quale è un oggetto
  (come d’altronde tutto in Ruby). Questo oggetto non è la stessa cosa
  di una variabile indefinita; è un oggetto che esiste, ma che ha il
  valore `false` quando lo valuti come boolean.
* Quando testi se un’espressione è ‘vera’, solamente `false` e `nil`
  rendono un valore falso. Tutto il resto è vero (includendo `0`, `0.0`,
  e `"0"`).
* Non ci sono [PerlMonks][2]. Tuttavia la mailing list ruby-talk è di
  grande aiuto.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
