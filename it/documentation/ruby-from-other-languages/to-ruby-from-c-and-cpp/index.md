---
layout: page
title: "Da C/C++ a Ruby"
lang: it
---

È difficile descrivere in una lista come del codice in Ruby differisce
da C o C++, dal momento che esistono delle notevoli differenze. Una
ragione è che il runtime di Ruby fa molte cose per lo sviluppatore. Ruby
sembra il più distante possibile dal principio di C “nessun meccanismo
nascosto”—lo scopo di Ruby è rendere il lavoro umano facile a spese del
runtime, che svolge gran parte del lavoro. A meno a che (o fino a
quando) non decidi di analizzare il tuo codice per ottimizzarlo, non
devi preoccuparti di “far felice il compilatore” quando usi Ruby.

Detto questo, il codice scritto in Ruby viene eseguito molto più
lentamente del codice equivalente in C o C++ . Allo stesso tempo, ti
meraviglierai di quanto poco tempo ti ci vorrà per avere un programma in
Ruby pronto e funzionante e anche di quante righe di codice in meno ti
ci vorranno per scriverlo. Ruby è molto, molto più semplice di C++: ti
vizierà in men che non si dica!

Ruby è tipizzato dinamicamente, invece che staticamente—il runtime fa
quanto più possibile quando il programma è in esecuzione. Per esempio,
non devi sapere a quanti moduli il tuo programma in Ruby si “linkerà”
(ovvero: caricherà e userà), o di quanti metodi chiamerà prima in
anticipo.

Inoltre, Ruby e C sono in stretta relazione: Ruby supporta i “moduli di
estensione”, che possono essere chiamati da programmi scritti in Ruby e
che, dall’esterno, si comportano proprio come altri moduli di Ruby, ma
sono scritti in C. In questo modo, puoi rendere più performanti parti
critiche della tua applicazione scrivendole in puro C.

E non dimentichiamo che, ovviamante, anche Ruby stesso è scritto in C.

### Somiglianze con C

Come in C, in Ruby…

* Puoi programmare in modo procedurale, se vuoi (ma in realtà Ruby
  lavorerà sempre in maniera orientata agli oggetti, a un livello più
  basso)
* Molti degli operatori sono gli stessi, inclusi le assegnazioni
  compound e gli operatori per bit, però Ruby non ha `++` o `--`
* Esistono `__FILE__` e `__LINE__`.
* Esistono le costanti, ma non si usa la parola chiave `const`. Le
  costanti create attraverso la convenzione che i nomi devono
  incominciare per una lettera maiuscola.
* Le stringhe sono racchiuse in doppi apici.
* Le stringhe sono mutabili.
* Puoi leggere la maggior parte dei documenti da riga di comando,
  attraverso il comando `ri`
* Esiste una sorta di debugger da riga di comando.

### Somiglianze con C++

Come in C++, in Ruby…

* Esistono più o meno gli stessi operatori (anche `::`). L’operatore
  `<<` è usato spesso per aggiungere elementi ad una lista. Rubi
  tuttavia non usa mai l’operatore `->`, è sempre solo `.`.
* `public`, `private` e `protected` si comportano in modo simile
* La sintassi per l’ereditarietà è sempre costituita da un solo
  carattere, ma è `<` invece di `:`.
* &amp;Eegrave; possibile raggruppare il tuo codice in moduli, usati in
  modo simile ai namespace.
* Le eccezioni lavorano nello stesso modo, ma i nomi delle parole chiave
  sono diversi.

### Differenze da C

A differenza di C, in Ruby…

* Gli oggetti sono fortemente tipizzati (e i nomi di variabili in sè
  stessi non hanno nessun tipo)
* Non ci sono nè macro nè preprocessore. Non ci sono operazioni di cast,
  puntatori, typedef, sizeof o enum,
* Non ci sono file header. Bisogna definire le funzioni (normalmente
  chiamate “metodi”) e classi nei file sorgenti
* Non esiste il <tt>#define</tt>, ma vengono usate delle costanti
* Da Ruby 1.8 in poi, il codice è interpretato a runtime invece di
  essere compilato in qualsiasi tipo di codice macchina o simili.
* Tutte le variabili sono allocate nella heap. Inoltre, non è necessario
  distruggerle a mano—il *garbage collector* lo fa automaticamente.
* Gli argomenti dei metodi sono passati come reference, non come valori.
* Bisogna scrivere `require 'xxx'` invece di `#include <xxx>` o
  `#include "xxx"`.
* Non si può ricorrere all’assembly
* Non si usano punti e virgola alla fine di ogni riga
* Si possono omettere parentesi in espressioni condizionali come `if` e
  `while`
* Le parentesi sono opzionali nelle chiamate ai metodi
* Normalmente non si utilizzano le parentesi graffe, i costrutti su più
  righe si concludono con la keyword `end`
* La keyword `do` è per i cosiddetti “blocchi”; non esistono costrutti
  con il “do” come in C.
* Il termine “blocco” si riferisce ad un blocco di codice che viene
  associato ad una chiamata ad un metodo in modo che il metodo possa
  chiamare il codice nel blocco durante l’esecuzione.
* Non ci sono dichiarazioni di variabili: è sufficiente solo assegnare
  nuovi nomi al momento, ove necessario.
* Solo `false` e `nil` risultano essere dei valori falsi, ogni altra
  cosa ritorna “true” (inclusi `0`, `0.0` e `"0"`)
* Non esistono `char`, ma solamente delle stringhe di un solo carattere.
* Le stringhe non terminano con un byte nullo.
* Gli elementi di un array sono racchiusi in parentesi quadre, non
  graffe.
* Gli array diventano più grandi mano a mano che vengono aggiunti dei
  nuovi elementi al loro interno
* Se due array vengono sommati, viene ritornato un nuovo array più
  grande (sempre allocato nella heap). Non bisogna ricorrere
  all’aritmetica dei puntatori.
* Generalmente, ogni cosa è un’espressione (ovvero cose come costrutti
  `while` ritornano sempre un rvalue)

### Differenze da C++

A differenza di C++, in Ruby…

* Non ci sono riferimenti expliciti. Ovvero ogni variabile è di fatto un
  nome di un’oggetto deferenziato automaticamente.
* Gli oggetti sono tipizzati fortemente ma *dinamicamente*. Il runtime
  capisce automaticamente *a runtime* che se un metodo funziona oppure
  no.
* Il “costruttore” è chiamado `initialize` invece di avere lo stesso
  nome della classe.
* Tutti i metodi sono sempre virtuali.
* I nomi delle variabili di classe (statiche) incominciano sempre con
  `@`, es. `@totale_oggetti`.
* Non si accede alle variabili membro, l’accesso ai membri pubblici
  (chiamati attributi in Ruby) è effettuato tramite metodi.
* Si usa `self` e non `this`
* Alcuni metodi finiscono con ’?’ o ’!’, che è di fatto parte del nome
  del metodo stesso.
* Non esiste l’ereditarietà multipla, anche se Ruby ha dei “miscugli”
  (ovvero si possono “ereditare” tutti i metodi di istanza di un modulo)
* Esistono delle convenzioni particolari sulle maiuscole e minuscole,
  che vanno rispettate (es. i nomi delle classi devono iniziare sempre
  con una lettera maiuscola, le variabili con una lettera minuscola).
* Le parentesi per le chiamate ai metodi sono normalente opzionali.
* Non c’è bisocno dei template di C++, dal momento che è possibile
  assegnare qualsiasi tipo di oggetto ad una particolare variabile, e i
  tipi vengono determinati a runtime. Non c’è nemmeno nessun tipo di
  casting.
* L’iterazione avviene in modo leggermente diverso. Ruby non utilizza
  oggetti separati come iteratori (come `vector<T>::const_iterator
  iter`) ma gli oggetti possono “mescolarsi” con il modulo `Enumerator`
  ed effettuare una chiamata ad un metodo, come `oggetto.each`.
* Esistono solo due tipi di contenitori: `Array` e `Hash`.
* Non ci sono conversioni di tipo, ma non sono necessarie in Ruby.
* Il multithread è disponibile di default, ma da Ruby 1.8 si usano dei
  “green thread” (implementati solo all’interno dell’interpreter) e non
  dei thread nativi.
* Una libreria standard di unit test è disponibile di default.

