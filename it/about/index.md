---
layout: page
title: "A proposito di Ruby"
lang: it
---

Ti stai chiedendo perché Ruby sia così popolare? I suoi fan lo chiamano
“un linguaggio pulito ed elegante”, e ciononostante è pratico e
funzionale. Come mai?

### Gli ideali del creatore di Ruby

![](http://redhanded.hobix.com/images/ruby-lang-matz.png){:
style="padding-left:8px;"}
{: style="float:right"}

Ruby è un linguaggio di equilibrio e armonia. Il suo creatore, [Yukihiro
“matz” Matsumoto][1], ha fuso insieme parti dei suoi linguaggi di
programmazione preferiti (Perl, Smalltalk, Eiffel, Ada e Lisp) per
creare un nuovo linguaggio in grado di bilanciare programmazione
funzionale con programmazione imperativa.

Lui stesso ha detto più volte che sta continuamente “provando a rendere
Ruby naturale, non semplice”, in un modo che è simile alla stessa vita.

Chiarificando questo concetto, Matz aggiunge:

> Ruby è apparentemente semplice, ma al suo interno è molto complesso,
> proprio come il corpo umano<sup>[1](#fn1)</sup>.

### Riguardo alla crescita di Ruby

Fin dalla prima release pubblica, nel 1995, Since its public release in
1995, Ruby ha attirato sviluppatori appassionati da tutto il mondo. Nel
2006, Ruby è stato universalmente accettato, con attivi gruppi di
discussione formatisi nelle maggiori città del mondo e conferenze a tema
capaci di fare il tutto esaurito.

![Grafico per cortesia di
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=280&amp;height=140&amp;title=Ruby-Talk+Activity+over+4+Years
"Grafico per cortesia di Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

Ruby-Talk, la prima [lista di discussione](/it/community/mailing-lists/)
per il linguaggio Ruby, ha raggiunto il traguardo di 200 nuovo messaggi
al giorno.

L’indice TIOBE, che misura la crescita dei linguaggi di programmazione,
mette Ruby al decimo posto tra tutti i linguaggi di programmazione
esistenti al mondo. Gran parte di questa crescita è da attribuire alla
popolarità dei programmi scritti in Ruby, in particolare il framework
Ruby on Rails<sup>[2](#fn2)</sup>.

Ruby è anche un linguaggio [libero e gratuito](./license.txt). Non solo
non costa nulla, ma può anche essere usato, copiato, modificato e
distribuito liberamente.

### Interpretare ogni cosa come un Oggetto

Inizialmente, Matz guardò ad altri linguaggi per trovare una sintassi
ideale. Pensando a questa sua ricerca, ha detto lui stesso: “Volevo un
linguaggio di scripting che fosse più potente di Perl, e allo stesso
tempo più orientato agli oggetti di Python<sup>[3](#fn3)</sup>.”

In Ruby, ogni cosa è un oggetto: ogni parte di informazione e codice ha
delle sue proprietà e azioni. La programmazione ad oggetti chiama le
proprietà con il nome *variabili di istanza* e le azioni sono conosciute
come *metodi*. L’approccio puramente orientato agli oggetti di Ruby è
facilmente dimostrabile dalla seguente porzione di codice che applica
un’azione ad un numero:

    5.times { print "Ruby è un linguaggio fantastico" }
{: .code .ruby-code}

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

    class Numeric
      def aggiungi(x)
        self.+(x)
      end
    end
    
    y = 5.aggiungi 6
    # y è ora uguale a 11
{: .code .ruby-code}

Gli operatori di Ruby non sono altro che un modo semplice per eseguire
operazioni normalmente effettuate dai metodi, e possono essere
ridefiniti.

### I blocchi, una peculiarità veramente interessante

I *blocchi* sono una delle molteplici ragioni della flessibilità di
questo linguaggio. A programmer can attach a closure to any method,
describing how that method should act. The closure is called a *block*
and has become one of the most popular features for newcomers to Ruby
from other imperative languages like PHP or Visual Basic.

I blocchi sono stati ispirati dai linguaggi funzionali. Matz ha detto,
“nelle *closures* in Ruby closures, ho voluto rispettare la cultura di
Lisp<sup>[4](#fn4)</sup>.”

    motori_di_ricerca = 
      %w[Google Yahoo MSN].map do |sito|
        "http://www." + sito.downcase + ".com"
      end
{: .code .ruby-code}

In questo pezzo di codice, il blocco è deimitato dal costrutto `do ...
end`, e il metodo `map` applica il codice del blocco alla lista di
parole specificata. Molti altri metodo in Ruby danno spazio allo
sviluppatore per creare i propri blocchi in modo da definire le
operazioni che quel metodo deve eseguire.

### Ruby e “miscugli”

A differenza di molti altri linguaggi ad oggetti, in Ruby si può usare
solamente l’ereditarietà singola. Tuttavia, Ruby dispone del concetto di
“modulo” (Categoria nell’Objective-C), ovvero un raggruppamento di
metodi.

In Ruby, è possibile utilizzare i moduli per creare dei “miscugli”
(mixins): le classi possono infatti includere al loro interno un modulo
ed ereditare tutti i suoi metodi, automaticamente. Per esempio,
qualsiasi classe che implementa il metodo `each` può includere il modulo
`Enumerable` per ottenere una serie di metodi utili che usano il metodo
`each` per le iterazioni.

    class IlMioArray
      include Enumerable
    end
{: .code .ruby-code}

Generalmente, gli appassionati di Ruby considerano questa pratica molto
più pulita e gestibile dell’eredità multipla, che è complessa e può
essere troppo restrittiva.

### L’aspetto di Ruby

Sebbene Ruby limiti il più possibile la punteggiatura a favore di parole
chiave in lingua inglese, certi segni di interpunzione sono usati per
“decorare” il linguaggio. Ruby non ha bisogno di dichiarazioni di
variabili, perché usa convenzioni particolari per denotare la visibilità
delle variabili:

* `var` potrebbe essere una variabile locale
* `@var` è una variabile di istanza
* `$var` è una variabile globale

Questi marcatori rendono il linguaggio più leggibile dando la
possibilità al programmatore di identificare a colpo d’occhio il ruolo
di ogni variabile. In questo modo, anche l’uso della parola chiave
`self` da prependere a ogni membro di istanza diventa superfluo.

### Funzionalità avanzate

Ruby è in grado di offrire una marea di altre funzionalità, tra cui:

* la gestione delle eccezioni, proprio come Java o Python, per rendere
  la gestione degli errori più semplice.
^

* Garbage collection automatica per tutti gli oggetti, come dice Matz:
  “Molto meglio per la tua salute!”
^

* Scrivere estensioni in linguaggio C per Ruby è più facile che
  scriverle per Perl o Python, grazie a un’API molto elegante per
  accedere a Ruby da C. Tale API include chiamate per includere ruby in
  programmi, in modo da usarlo come linguaggio di scripting. È
  disponibile anche un’interfaccia SWIG.
^

* Ruby è in grado di caricare dinamicamente delle extension library, se
  il sistema operativo lo permette.
^

* Ruby offre funzionalità di threading indipendenti dal sistema
  operativo. In questo modo si può avere multithreading su tutte le
  piattaforme in grado di eseguire Ruby, indipendentemente dal fatto che
  il sistema operativo lo supporti o meno, anche in DOS!
^

* Ruby è altamente portatile: è sviluppato principalmente su GNU/Linux,
  ma funzione su molte varianti di UNIX, Mac OS X, Windows
  95/98/Me/NT/2000/XP, DOS, BeOS, OS/2, ecc.

#### References

<sup>1</sup> Matz, parlando nella lista di discussione “Ruby-Talk”, [May
12th, 2000][2].
{: #fn1}

<sup>2</sup> Per ulteriori informazioni, visita la home page di [Ruby on
Rails][3].
{: #fn2}

<sup>3</sup> Matz, in [Un’intervista con il creatore di Ruby][4], Nov.
29th, 2001.
{: #fn3}

<sup>4</sup> Matz, in [Blocchi e *closure* in Ruby][5], December 22nd,
2003.
{: #fn4}



[1]: http://www.rubyist.net/~matz/ 
[2]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773 
[3]: http://rubyonrails.org/ 
[4]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html 
[5]: http://www.artima.com/intv/closures2.html 
