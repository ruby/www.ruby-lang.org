---
layout: page
title: "Ruby in Venti Minuti"
lang: it

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby in Venti Minuti</h1>

---

Se vogliamo dire “Ciao” molte volte senza stancarci troppo le dita?
Dobbiamo definire un metodo!

{% highlight irb %}
irb(main):010:0> def c
irb(main):011:1> puts "Ciao Mondo!"
irb(main):012:1> end
=> nil
{% endhighlight %}

Il codice `def c` apre la definizione del metodo. Non fa altro che dire
a Ruby che stiamo definendo un metodo, il cui nome è `c`. La linea
successiva è il corpo, la stessa linea che abbiamo visto in precedenza:
`puts "Ciao Mondo"`. Infine l’ultimo `end` dice a Ruby che abbiamo
finito la definizione del metodo. La risposta di Ruby `=> nil` significa
che ha capito che abbiamo finito la creazione del metodo.

## Chiamare un metodo più volte

Ora proviamo questo metodo più volte:

{% highlight irb %}
irb(main):013:0> c
Ciao  Mondo!
=> nil
irb(main):014:0> c()
Ciao Mondo!
=> nil
{% endhighlight %}

Bene, fino a qui è facile. Chiamare un metodo in Ruby è semplice, basta
scrivere il suo nome. Se il metodo non ha bisogno parametri, questo è
tutto ciò che hai bisogno di fare. Se preferisci puoi anche aggiungere
delle parentesi vuote, ma non sono necessarie.

E se vogliamo dire “ciao” ad una sola persona e non a tutto il mondo?
Basta ridefinire `c` in modo che accetti “nome” come parametro.

{% highlight irb %}
irb(main):015:0> def c(nome)
irb(main):016:1> puts "Ciao #{nome}!"
irb(main):017:1> end
=> nil
irb(main):018:0> c("Matz")
Ciao Matz!
=> nil
{% endhighlight %}

Così funziona… ma diamo un’occhiata a cosa sta succedendo.

## Convertire variabili in stringhe

Che cosa è `#{nome}` ? Questo è un modo per inserire qualcosa in una
stringa. Quello che è contenuto nelle graffe viene convertito in una
stringa (se non lo è già) e sostituito col valore a cui fa riferimento.
Puoi anche utilizzare questa strada per essere sicuro che un nome abbia
le iniziali maiuscole:

{% highlight irb %}
irb(main):019:0> def c(nome = "Mondo")
irb(main):020:1> puts "Ciao #{nome.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> c "chris"
Ciao Chris!
=> nil
irb(main):023:0> c
Ciao Mondo!
=> nil
{% endhighlight %}

Ci sono molte altre cose che puoi fare in questo modo. Una è chiamare il
metodo senza le parentesi. Se quello che stai facendo è ovvio, le
parentesi non sono obbligatorie. L’altro esempio riguarda il parametro
di default `Mondo`. Letteralmente significa “Se non viene passato il
campo nome, usa come nome di default `"Mondo"`”.

## Diventare Persone Cordiali

Se vogliamo veramente una “persona” cordiale, che ricorda il tuo nome,
che ti saluta e che ti tratta sempre con rispetto dobbiamo creare un
oggetto. Creiamo quindi una classe chiamata “PersonaCordiale”.

{% highlight irb %}
irb(main):024:0> class PersonaCordiale
irb(main):025:1>   def initialize(nome = "Mondo")
irb(main):026:2>     @nome = nome
irb(main):027:2>   end
irb(main):028:1>   def saluta
irb(main):029:2>     puts "Ciao #{@nome}!"
irb(main):030:2>   end
irb(main):031:1>   def congeda
irb(main):032:2>     puts "Arrivederci #{@nome}, a presto."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

La nuova parola qui è `class`, essa definisce una nuova classe chiamata
PersonaCordiale ed una serie di metodi. Fai attenzione a `@nome`. Questa
è una variabile d’istanza ed è disponibile a tutti i metodi della
classe. Come vedi l’abbiamo usata in `saluta` e in `congeda`.

Quindi come mettiamo in funzione la nostra classe PersonaCordiale?
[Creare un oggetto.](../3/)
