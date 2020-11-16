---
layout: page
title: "Ruby in Venti Minuti"
lang: it

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby in Venti Minuti</h1>

---

## Introduzione

Questo è un breve tutorial che non dovrebbe richiedere più 20 minuti per
essere completato. Si presume che tu abbia già installato Ruby sul tuo
computer (se non l’hai fatto puoi [scaricarlo](/it/downloads/) ed
installarlo prima di cominciare).

## L’interattività di Ruby

Apri la shell interattiva di Ruby (IRB).

* Se stai usando **macOS** apri il `Terminal`, scrivi `irb` e premi
  invio.
* Se stai usando **Linux**, apri una shell, scrivi `irb` e premi invio.
* Se stai usando **Windows**, seleziona `Interactive Ruby` dalla
  sezione Ruby del menu di avvio.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Perfetto, ora è aperta… e adesso?

Prova a scrivere `"Ciao Mondo"`

{% highlight irb %}
irb(main):001:0> "Ciao Mondo"
=> "Ciao Mondo"
{% endhighlight %}

## Ruby ti ha obbedito!

Che cosa è successo? Abbiamo appena scritto il più corto programma “Ciao
Mondo” di tutti i tempi? Non esattamente: la seconda riga è solo il modo
di IRB di dirci che è stato ritornato un valore dall’ultima espressione.
Se vogliamo stampare a schermo “Ciao Mondo” dobbiamo aggiungere qualcosa
in più:

{% highlight irb %}
irb(main):002:0> puts "Ciao Mondo"
Ciao Mondo
=> nil
{% endhighlight %}

`puts` è il comando base per stampare a schermo qualcosa, in Ruby.
Invece `=> nil` in questo caso è il risultato dell’espressione, dal
momento che `puts` ritorna sempre nil, ovvero assolutamente nulla.

## La tua calcolatrice personale

IRB si può usare come una calcolatrice:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Tre più due è abbastanza semplice dopotutto. Così come tre per due, per
esempio: potresti scriverlo direttamente in IRB, ma è anche possibile
premere **freccia su** e vedere se l’ultima espressione viene
visualizzata, nel cui caso è solamente sufficiente sostituire `+` con
`*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Ora proviamo a calcolare il quadrato di tre:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

In Ruby `**` rappresenta l’operatore per calcolare le potenze. Mentre
per calcolare una radice quadrata si fa così:

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Già, funziona, ma che cosa è successo? E in particolare che cos’è
`Math`?

## Moduli – ovvero come raggruppare del codice per argomento

`Math` è un modulo predefinito per i calcoli matematici. I moduli hanno
un duplice scopo in Ruby, e uno di questi è raggruppare metodi simili
insieme utilizzando un particolare nome adatto allo scopo. `Math`
contiene molti altri metodi come per esempio `sin()` e `tan()`.

Dopo `Math` c’è un punto, ma per quale ragione? Il punto è il modo per
identificare il ricevente di un dato messaggio, in questo caso
`sqrt(9)`, che indica una chiamata al metodo `sqrt` con un parametro
pari a `9`. `sqrt` viene dall’inglese “square root”, radice quadrata.

Il risultato di questa chiamata è il valore `3.0`. Da notare che non è
solo `3`, dal momento che nella maggior parte dei casi la radice
quadrata di un numero non è un intero, bensì un numero a virgola mobile.

E se vogliamo salvare il risultato di questo calcolo? Semplice, basta
assegnarlo ad una variabile:

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Sebbene tutto questo sia utile ai fini della nostra “calcolatrice”, ci
stiamo allontanando troppo dal messaggio `Ciao Mondo` usato in tutti i
tutorial per principianti… [Ritorniamoci su.](2/)
