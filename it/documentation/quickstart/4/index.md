---
layout: page
title: "Ruby in Venti Minuti"
lang: it

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby in Venti Minuti</h1>

---

Guardiamo con un po’ più di attenzione il nostro nuovo programma. Fate
attenzione a (#). In Ruby, qualsiasi linea preceduta da questo carattere
viene ignorata dall’interprete dei comandi. La prima linea del nostro
file è speciale, ovvero nei sistemi tipo Unix dice alla shell come
avviare il file. Il resto dei commenti invece serve come spiegazione.

Il nostro metodo `saluta` è diventato un pochino più complicato.

{% highlight ruby %}
# Saluta tutti
def saluta
  if @nomi.nil?
    puts "..."
  elsif @nomi.respond_to?("each")
    # @nomi è una lista di qualche tipo, allora iteriamo!
    @nomi.each do |nome|
      puts "Ciao #{nome}!"
    end
  else
    puts "Ciao #{@nomi}!"
  end
end
{% endhighlight %}

Ora controlla la variabile di istanza `@nomi` per prendere una
decisione. Se è nil, mostra tre puntini: senza nome non possiamo
salutare nessuno giusto?

## Cicli e iterazione

Se l’oggetto `@nomi` risponde al metodo `each` possiamo interagire
quindi saluta ogni persona. Infine se `@nomi` è qualcos’altro
automaticamente lo convertiamo in stringa e usiamo il saluto di default.

Vediamo l’iterazione in modo più approfondito:

{% highlight ruby %}
@nomi.each do |nome|
  puts "Ciao #{nome}!"
end
{% endhighlight %}

`each` è un metodo che accetta un bloccho di codice e lo ripete per ogni
elemento nella lista, il codice tra `do` e `end` è il blocco che verrà
ripetuto. Il blocco è come una funzione anonima o `lambda`. La variabile
tra \| è il parametro del blocco.

Qui, per ogni elemento della lista `nome` viene eseguita l’espressione
`puts "Ciao #{nome}!"`.

Molti altri linguaggi di programmazione esaminano una lista utilizzando
il ciclo `for`, in C si ottiene qualcosa di simile:

{% highlight c %}
for (i=0; i<numero_di_elementi; i++)
{
  fai_qualcosa_con(elemento[i]);
}
{% endhighlight %}

Funziona ma non è molto elegante. C’è bisogno di una variabile come `i`,
capire quanto è lunga la lista e creare una funzione da ripetere. In
ruby è molto più elegante. Tutti i dettagli dell’infrastruttura sono
nascosti nel metodo `each`, quello che devi fare semplicemente dire cosa
fare per ogni elemento. All’interno del metodo `each` essenzialmente
viene chiamato `yield "Fabio"`, poi `yield "Davide"` e poi `yield
"Raul"`, e così via.

## I blocchi, una delle funzionalità più potenti di Ruby

La vera potenza dei blocchi si ottiene quando trattiamo qualcosa di più
complicato rispetto alle liste. Al di là di semplici esempi all’interno
del metodo, puoi anche gestire l’inizializzazione, la finalizzazione e
gli errori. Tutti nascosti dagli occhi indiscreti degli utenti.

{% highlight ruby %}
# Congeda tutti
def congeda
  if @nomi.nil?
    puts "..."
  elsif @nomi.respond_to?("join")
    # Unisci gli elementi della lista con delle virgole
    puts "Arrivederci #{@nomi.join(", ")}. A presto!"
  else
    puts "Arrivederci #{@nomi}. A presto!"
  end
end
{% endhighlight %}

Il metodo `congeda` non usa `each`, ma controlla se `@nomi` risponde al
metodo `join` e in tal caso viene utilizzato. Se non risponde al metodo
`join` il contenuto di `nomi` viene convertito in stringa. Questo metodo
non si preoccupa del tipo della variabile, è sufficiente verificare
quali metodi supporta un pò come il “Duck Typing”... “Se cammina come
anatra e fa il verso dell’anatra…” Il vantaggio è quindi che non siamo
limitati necessariamente ad usare i tipi di variabili supportate. Se
qualcuno inventa un nuovo tipo di lista e questa lista risponde al
metodo `join` tutto funzionerà come previsto.

## Lanciare lo script

Quindi questa è la nostra classe AmicoDiTutti, il resto del file si
preoccupa di chiamare i metodi di questa classe. C’è qualcos’altro che
dobbiamo vedere:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` è una variabile “magica” che contiene il nome del file. `$0`
è il nome del file utilizzato per avviare il programma. Questo controllo
dice: “Se questo è il file principale utilizzato…” Ciò permette al file
di essere utilizzato come una libreria e il codice non viene eseguito in
questo contesto ma se il file viene utilizzato come eseguibile allora
anche il codice viene eseguito.

## Ora sai qualcosa di Ruby

Questo è stato un piccolo tour di Ruby. Ci sono moltissime cose da
scoprire, le diverse strutture di controllo che Ruby offre; l’uso dei
blocchi e lo `yield`; moduli come mixins e molto altro. Spero che Ruby
ti abbia invogliato a saperne di più.

Se così fosse, allora dai un occhiata alla nostra sezione
[Documentazione](/it/documentation) che contiene link a manuali e
tutorial tutti disponibili gratuitamente online.
