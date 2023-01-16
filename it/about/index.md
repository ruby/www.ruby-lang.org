---
layout: page
title: "A proposito di Ruby"
lang: it
---

Ti stai chiedendo perché Ruby sia così popolare? I suoi fan lo chiamano
“un linguaggio pulito ed elegante”, e tuttavia dicono che è pratico e
funzionale. Come mai?
{: .summary}

### Gli ideali del creatore di Ruby

Ruby è un linguaggio di equilibrio e armonia. Il suo creatore, [Yukihiro
“Matz” Matsumoto][matz], ha fuso insieme parti dei suoi linguaggi di
programmazione preferiti (Perl, Smalltalk, Eiffel, Ada e Lisp) per
creare un nuovo linguaggio in grado di bilanciare programmazione
funzionale con programmazione imperativa.

Lui stesso ha detto più volte che sta continuamente “provando a rendere
Ruby naturale, non semplice”, in un modo che rispecchia la vita.

Chiarificando questo concetto, Matz aggiunge:

> Ruby è apparentemente semplice, ma al suo interno è molto complesso,
> proprio come il corpo umano<sup>[1](#fn1)</sup>.

### Riguardo alla crescita di Ruby

Fin dalla prima release pubblica, nel 1995, Ruby ha attirato sviluppatori
appassionati da tutto il mondo. Nel 2006 Ruby è stato universalmente
accettato, con attivi gruppi di discussione formatisi nelle maggiori città
del mondo e conferenze a tema capaci di fare il tutto esaurito.

Ruby-Talk, la prima [lista di discussione](/it/community/mailing-lists/)
del linguaggio Ruby, ha raggiunto il traguardo di 200 nuovi messaggi
al giorno.

[L’indice TIOBE][tiobe], che misura la crescita dei linguaggi di programmazione,
mette Ruby al decimo posto tra tutti i linguaggi di programmazione
esistenti al mondo. Gran parte di questa crescita è da attribuire alla
popolarità dei programmi scritti in Ruby, in particolare il framework
[Ruby on Rails][ror].

Ruby è anche un linguaggio [libero e gratuito]({{ site.license.url }}). Non
solo non costa nulla, ma può anche essere usato, copiato, modificato e
distribuito liberamente.

### Interpretare ogni cosa come un Oggetto

Inizialmente, Matz guardò ad altri linguaggi per trovare una sintassi
ideale. Pensando a questa sua ricerca, ha detto lui stesso: “Volevo un
linguaggio di scripting che fosse più potente di Perl, e allo stesso
tempo più orientato agli oggetti di Python<sup>[2](#fn2)</sup>.”

In Ruby, ogni cosa è un oggetto: ogni parte di informazione e codice ha
delle sue proprietà e azioni. La programmazione ad oggetti chiama le
proprietà con il nome *variabili di istanza* e le azioni sono conosciute
come *metodi*. L’approccio puramente orientato agli oggetti di Ruby è
facilmente dimostrabile dalla seguente porzione di codice che applica
un’azione ad un numero:

{% highlight ruby %}
5.times { print "Ruby è un linguaggio fantastico" }
{% endhighlight %}

In molti linguaggi, i numeri e gli altri tipi primitivi non sono
oggetti, ma Ruby, seguendo l’esempio di Smalltalk, dà metodi e variabili
di istanza a tutti i suoi tipi. Questo rende più facile l’utilizzo di
Ruby, dal momento che tutte le regole applicabili agli oggetti si
applicano, di fatto, all’intero linguaggio.

### La flessibilità di Ruby

Ruby è visto come un linguaggio flessibile, dal momento che permette
agli utenti di alterare liberamente le sue parti, che possono essere
rimosse o ridefinite a discrezione dell’utente stesso: Ruby cerca di non
dare troppi limiti agli sviluppatori. Per esempio, la somma è eseguita
mediante l’operatore `+`, ma se preferisci usare la parola `aggiungere`,
puoi creare tale metodo aggiungendolo alla stessa classe `Numeric`, che
è predefinita, così:

{% highlight ruby %}
class Numeric
  def aggiungi(x)
    self.+(x)
  end
end

y = 5.aggiungi 6
# y è ora uguale a 11
{% endhighlight %}

Gli operatori di Ruby non sono altro che un modo semplice per eseguire
operazioni normalmente effettuate dai metodi, e possono essere
ridefiniti.

### I blocchi, una peculiarità veramente interessante

I *blocchi* sono una delle molteplici ragioni della flessibilità di
questo linguaggio. Un programmatore può collegare una *closure* ad ogni metodo,
descrivendo come quel metodo dovrebbe agire. La *closure* viene chiamata
*blocco* ed è diventata una delle funzionalità più popolari per i nuovi
arrivati a Ruby da altri linguaggi imperativi come PHP o Visual Basic.

I blocchi sono stati ispirati dai linguaggi funzionali. Matz ha detto,
“nelle *closures* ho voluto rispettare la cultura di Lisp<sup>[3](#fn3)</sup>.”

{% highlight ruby %}
motori_di_ricerca =
  %w[Google Yahoo MSN].map do |sito|
    "http://www." + sito.downcase + ".com"
  end
{% endhighlight %}

In questo pezzo di codice, il blocco è delimitato dal costrutto `do ...
end`, e il metodo `map` applica il codice del blocco alla lista di
parole specificata. Molti altri metodi in Ruby danno spazio allo
sviluppatore per creare i propri blocchi in modo da definire le
operazioni che quel metodo deve eseguire.

### Ruby e “miscugli”

A differenza di molti altri linguaggi ad oggetti Ruby ha
solamente l’ereditarietà singola, **volontariamente**. Tuttavia, Ruby
dispone del concetto di “modulo” (chiamato Categoria nell’Objective-C),
ovvero un raggruppamento di metodi.

In Ruby è possibile utilizzare i moduli per creare dei “miscugli”
(mixins): le classi possono infatti includere al loro interno un modulo
ed ereditare tutti i suoi metodi, automaticamente. Per esempio,
qualsiasi classe che implementa il metodo `each` può includere il modulo
`Enumerable` per ottenere una serie di metodi utili che usano il metodo
`each` per le iterazioni.

{% highlight ruby %}
class IlMioArray
  include Enumerable
end
{% endhighlight %}

Generalmente gli appassionati di Ruby vedono questa pratica come molto
più pulita e gestibile dell’eredità multipla, che è complessa e può
essere troppo restrittiva.

### L’aspetto di Ruby

Sebbene Ruby limiti il più possibile la punteggiatura a favore di parole
chiave in lingua inglese, certi segni di interpunzione sono usati per
“decorare” il linguaggio. Ruby non ha bisogno di dichiarazioni di
variabili, perché usa convenzioni particolari per denotare la visibilità
delle variabili:

* `var` potrebbe essere una variabile locale.
* `@var` è una variabile di istanza.
* `$var` è una variabile globale.

Questi marcatori rendono il linguaggio più leggibile dando la
possibilità al programmatore di identificare a colpo d’occhio il ruolo
di ogni variabile. In questo modo, anche l’uso della parola chiave
`self` da prependere a ogni membro di istanza diventa superfluo.

### Funzionalità avanzate

Ruby è in grado di offrire una marea di altre funzionalità, tra cui:

* la gestione delle eccezioni, proprio come Java o Python, per rendere
  la gestione degli errori più semplice.

* Ruby ha un vero Garbage collector mark-and-sweep per tutti gli oggetti.
  Come dice Matz: “Molto meglio per la tua salute!”

* Scrivere estensioni in linguaggio C per Ruby è più facile che
  scriverle per Perl o Python, grazie a un’API molto elegante per
  accedere a Ruby da C. Tale API ha chiamate per includere Ruby in
  programmi, in modo da usarlo come linguaggio di scripting. È
  disponibile anche un’interfaccia SWIG.

* Ruby è in grado di caricare dinamicamente delle librerie di estensione,
  se il sistema operativo lo permette.

* Ruby offre funzionalità di threading indipendenti dal sistema
  operativo. In questo modo si può avere multithreading su tutte le
  piattaforme in grado di eseguire Ruby, indipendentemente dal fatto che
  il sistema operativo lo supporti o meno, anche in DOS!

* Ruby è altamente portatile: è sviluppato principalmente su GNU/Linux,
  ma funziona su molte varianti di UNIX, macOS,
  Windows, DOS, BeOS, OS/2, ecc.

### Riferimenti

<sup>1</sup> Matz, parlando nella lista di discussione “Ruby-Talk”, [May
12th, 2000][blade].
{: #fn1}

<sup>2</sup> Matz, in [Un’intervista con il creatore di Ruby][linuxdevcenter], Nov.
29th, 2001.
{: #fn2}

<sup>3</sup> Matz, in [Blocchi e *closure* in Ruby][artima], December 22nd,
2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
