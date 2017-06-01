---
layout: page
title: "Librerie"
lang: it
---

Come la maggior parte dei linguaggi, Ruby sfrutta una miriade di librerie
di terze parti.
{: .summary}

La maggior parte di queste sono rilasciate sotto forma di **gem**.
[**RubyGems**][1] è un sistema di pacchettizzazione Ruby progettato per
facilitare la creazione, la condivisione e l'installazione di librerie
(in un certo senso è un sistema di pacchettizzazione delle distribuzioni
simile ad `apt-get`, ma specifico per il software Ruby).
Dalla versione 1.9 Ruby è distribuito di default con RubyGems; nelle
precedenti versioni di Ruby è necessario [installarlo manualmente][2].

Alcune librerie sono rilasciate tramite un archivio (.zip o .tar.gz)
contenente il **codice sorgente**. Il processo di installazione
potrebbe in questo caso cambiare, solitamente un file `README` o
`INSTALL` è presente con le istruzioni.

Diamo un'occhiata a come trovare le librerie ed installarle per farne
uso.

### Trovare le librerie

Tipicamente il posto più comune dove vengono mantenute le librerie è
[**RubyGems.org**][1], dove è possibile ottenere librerie Ruby sotto
forma di gem. È possibile esplorare il sito direttamente o usare il
comando `gem`.

Usando `gem search -r` puoi ispezionare il repository RubyGems.
Ad esempio, `gem search -r rails` ritornerà una lista di gem correlate
a Rails. Con l'opzione `--local` (`-l`), è possibile effettuare una
ricerca locale tra le gem installate. Per installare una gem, puoi
usare `gem install [gem]`. Per vedere tutte le gem installate puoi
usare `gem list`. Per maggiori informazioni sul comando `gem`, guarda
a fondo pagina o visita la [documentazione RubyGems][3].

Ci sono anche altre fonti per ottenere delle librerie. [RubyForge][4]
è stato in passato un sistema molto popolare per trovare delle librerie
Ruby; negli ultimi anni è stato sostituito in popolarità da
[**GitHub**][5] come fonte per repository contenenti codice Ruby. Molto
spesso il codice sorgente di una gem è mantenuto su GitHub mentre su
RubyGems.org viene mantenuta la versione del codice sotto forma di gem.

[**The Ruby Toolbox**][6] è un progetto che permette di esplorare facilmente
i progetti Ruby open source. Mette a disposizione categorie relative ad
i più comuni task e problematiche di programmazione; colleziona molte
informazioni relative ai progetti come le release, l'attività sul codice
sorgente o le dipendenze ed assegna una valutazione ai progetti
basandosi sulla popolarità su RubyGems.org e GitHub.
La ricerca permette spesso di trovare quello che cerchi facilmente.

### Una rapida introduzione a RubyGems

Di seguito viene presentato il comando `gem` come viene più frequentemente
utilizzato. È anche disponibile [la documentazione più dettagliata][7],
che spiega tutti gli aspetti di questo sistema di pacchettizzazione.

#### Cercare tra le gem disponibili

Il comando **search** può essere usato per cercare delle gem con un
certo nome. Per esempio, per cercare la parola “html” nel nome di una gem:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

L'opzione `--remote` / `-r` indica che vogliamo effettuare una
ricerca sul repository ufficiale RubyGems.org (comportamento
di default).
Con l'opzione `--local` / `-l` è invece possibile effettuare
una ricerca tra le gem installate localmente sul sistema.

#### Installare una gem

Una volta che conosci il nome della gem che ti serve, ad esempio
la molto conosciuta Rails:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Puoi anche installare solamente una determinata versione della libreria
specificando l'opzione `--version` / `-v`.

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Elencare tutte le gem

Per una lista completa di tutte le gem presenti localmente, usa il
comando **list**\:

{% highlight sh %}
$ gem list
{% endhighlight %}

Per ottenere una lista (molto lunga) di tutte le gem disponibili
su RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Aiuto!

La documentazione è a tua disposizione direttamente dal terminale:

{% highlight sh %}
$ gem help
{% endhighlight %}

Per esempio, `gem help commands` è molto utile per avere una lista
di tutti i comandi di `gem`.

#### Creare le tue gem

RubyGems.org ha [diverse guide][3] sull'argomento. Probabilmente potresti
essere interessato anche a [Bundler][9], un tool progettato per facilitare
la gestione delle dipendeze di un'applicazione che può essere usato insieme
a RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
