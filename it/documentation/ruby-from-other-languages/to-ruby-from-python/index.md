---
layout: page
title: "Da Python a Ruby"
lang: it
---

Python è un’altro valido linguaggio utilizzabile per diversi scopi.
Passando da Python a Ruby, troverai che c’è un po’ più di sintassi da
imparare che in Python.

### Somiglianze

Come in Python, in Ruby,...

* C’è un prompt interattivo (chiamato `irb`).
* Puoi consultare la documentazione da riga di comando (con il comando
  `ri` invece di `pydoc`).
* Non ci sono terminatori di riga speciali (eccetto l’accapo).
* Alcune stringhe possono occupare più di una riga, come le stringhe tra
  triple virgolette in Python.
* Le parentesi quadre sono per le liste,
  mentre le graffe sono per i dict (che in Ruby sono chiamati “hash”).
* Gli array si usano allo stesso modo (Si possono aggiungere elementi ad
  un array e comporli tra loro per ottenere delle matrici o array di
  array).
* Gli oggetti sono fortemente e dinamicamente tipizzati.
* Ogni cosa è un oggetto, e le variabili sono solo riferimenti a
  oggetti.
* Sebbene le parole chiave siano un po’ diverse, le eccezioni lavorano
  più o meno nello stesso modo.
* Esiste un tool per generare automaticamente la documentazione
  direttamente dal codice (quello di Ruby è chiamato rdoc).

### Differenze

A differenza di Python, in Ruby…

* Le stringhe sono mutabili.
* È possibile creare delle costanti (variabili che non vengono
  cambiate).
* Ci sono delle convenzioni riguardanti i nomi e le maiuscole (per
  esempio i nomi delle classi iniziano con una maiuscola, e le variabili
  con una minuscola).
* C’è un solo tipo di contenitore per le liste (un Array) ed è mutabile.
* Le stringhe tra virgolette supportano diverse sequenze di escape (come
  `\t`) e una speciale “sostituzione di espressioni” direttamente in
  altre stringhe senza dover `"concatenare" + "più stringhe" +
  "insieme"`. Le stringhe tra apici sono le `r"raw string"` di Python.
* Non vi sono classi di nuovo o vecchio stile, ma di un solo tipo
  soltanto.
* Si accede agli attributi di una classe sempre tramite delle chiamate a
  metodi.
* Le parentesi per le chiamate a metodi sono normalmente opzionali.
* Esistono le parole chiave `public`, `private`, e `protected` per i
  controlli di accesso, invece delle `_convenzioni_` di undescore
  `__volontarie__` di Python.
* Si usano dei miscugli (mixins) invece dell’eredità multipla.
* È possibile “riaprire” una classe in qualsiasi momento e aggiungere
  dei metodi nuovi.
* Esistono `true` e `false` invece di `True` e `False` (e `nil` invece
  di `None`).
* Nei controlli di verità, solo `false` e `nil` sono considerati dei
  valori falsi, ogni altra cosa è sempre vera (anche `0`, `0.0`, `""`, e
  `[]`).
* Si usa `elsif` invece di `elif`.
* Si usa `require` invece di `import`. Per il resto l’uso è lo stesso
* I commenti *sopra* una riga di codice (invece di docstring sotto di
  esse) sono usati per generare i commenti.
* Ci sono diversi shortcut che, sebbene siano di più da ricordare,
  imparerai in fretta e possono essere usati per rendere il codice Ruby
  più scorrevole e molto produttivo.
* Non c’è modo di desettare una variabile una volta che è stata settata
  (come nello statement `del` di Python). Puoi resettare una variabile a
  `nil`, dando così la possibilità ai vecchi contenuti di essere rimossi
  tramite garbage collection, ma la variabile rimane nella tabella dei
  simboli fintanto che è in scope.
