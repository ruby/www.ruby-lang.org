---
layout: page
title: "Da PHP a Ruby"
lang: it
---

PHP è un linguaggio diffusissimo in ambito di sviluppo di applicazioni
web, tuttavia se vuoi utilizzare Ruby on Rails o semplicemente stai
cercando un linguaggio che è stato pensato per un uso più generale, Ruby
può fare al caso tuo.

### Somiglianze

Come in PHP, in Ruby…

* viene usata una tipizzazione dinamica, come in PHP, quindi non devi
  preoccuparti di dichiarare variabili.
* Esistono delle classi, delle quali puoi controllare l’accesso come in
  PHP (`public`, `protected` e `private`).
* Alcune delle variabili incominciano per $, come in PHP (ma non sempre)
* Esiste il metodo `eval`.
* Puoi interpolare delle stringhe tra di loro. Invece di scrivere
  `"$x è un $y"` puoi fare `"#{x} è un #{y}"`—Come in PHP, questo non
  vale per le stringhe tra apici singoli.
* È possibile usare la sintassi heredoc.
* È possibile gestire le eccezioni, come in PHP5.
* Esiste una libreria standard molto completa.
* Array e hash si comportano come previsto, se cambi `array()`
  con `{` e `}`\: `array('a' => 'b')` diventa `{'a' => 'b'}`.
* `true` e `false` si comportano come in PHP, ma `null` è chiamato `nil`.

### Differenze

A differenza di PHP, in Ruby…

* C’è una forte tipizzazione. Devi chiamare `to_s`, `to_i` ecc. per
  effettuare delle conversioni tra stringhe, numeri interi, e così via,
  invece di lasciare al linguaggio tale compito.
* Stringhe, numeri, array, hash ecc. sono degli oggetti. Invece di
  chiamare `abs(-1)` si chiama `-1.abs`.
* Le parentesi sono opzionali nelle chiamate ai metodi, eccetto per
  chiarificare quali parametri si riferiscono a quali metodi.
* La libreria standard e le estensioni sono organizzate in moduli e classi.
* La riflessione è una capacità innata degli oggetti, non c’è bisogno di
  utilizzare classi `Reflection` come in PHP5.
* Le variabili sono dei riferimenti.
* Non esistono classi astratte o interfacce.
* Hash e array non sono intercambiabili.
* Solo `false` e `nil` ritornano falso: `0`, `array()` e `""` ritornano
  tutti vero.
* Quasi ogni cosa è una chiamata ad un metodo, anche `raise` (`throw` in
  PHP).
