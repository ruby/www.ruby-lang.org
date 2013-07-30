---
layout: page
title: "Scarica Ruby"
lang: it
---

Qui è possibile scaricare le distribuzioni di Ruby più recenti nel tuo
formato preferito. La versione stabile corrente è la
{{ site.downloads.stable.version }}.

### Tre modi di installare Ruby

Puoi ottenere una copia di ruby in una varietà di modi, e persone
diverse preferiscono un modo piuttosto che un altro per ragioni diverse.
Ognuno dei modi è descritto in una delle sezioni sotto, comunque ecco un
breve riassunto:

* **Compilare i sorgenti** è il modo standard in cui software è stato
  reso disponibile per molti, molti anni. Questo sarà più familiare alla
  maggior parte degli sviluppatori di software.
* Ci sono alcuni **strumenti di terze parti** per installare Ruby.
  Questi strumenti sono spesso più semplici per i neofiti ma anche per
  gli utenti avanzati.
* Infine, ci sono alcuni **sistemi di gestione dei pacchetti** che
  supportano Ruby. Questo sarà più familiare a persone che utilizzano un
  sistema operativo solo per tutto, e a coloro a cui piace seguire tali
  singoli standard.

Inoltre, se vuoi utilizzare multiple versioni di Ruby sulla stessa
macchina, dai un’occhiata alla sezione **strumenti di terze parti** e
usa RVM. È di gran lunga il modo migliore per farlo, a meno che tu non
sappia esattamente cosa fare in questa situazione.

### Compilare Ruby dal Codice Sorgente

Installare a partire dal codice sorgente è la soluzione migliore se hai
confidenza con la tua piattaforma e magari hai bisogno di specificare
alcune opzioni avanzate. È anche una buona soluzione nel caso in cui non
siano disponibili pacchetti di installazione precompilati per il tuo
sistema operativo.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Stabile (*raccomandato*)
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Precedente
* [Snaphot Stabile][3] Questa è la tarball con l’ultimo snapshot del
  branch stabile.
* [Snapshot Giornaliero][4] Questa è la tarball di ciò che c’è in svn,
  generata giornalmente. Potrebbe contenere bachi o avere altri
  problemi, da usare a tuo rischio e pericolo!

Per maggiori informazioni sul repository Subversion di Ruby, vedi la
pagine For information about the Ruby Subversion repository, vedi [Ruby
Core](/it/community/ruby-core/).

### Strumenti di Terze Parti

Moilti utenti di Ruby utilizzano strumenti di terze parti per installare
Ruby. Tali strumenti hanno diversi vantaggi, ma non sono ufficialmente
supportati. Tuttavia, le rispettive comunità sono molto disponibili.

#### RVM

Lo strumento più popolare per installare Ruby è **RVM**, che sta per
“Ruby Version Manager”. Non solo rende l’installazione di Ruby
incredibilmente facile, ma ti permette anche di installare e gestire
multiple versioni di Ruby sul tuo sistema, così come implementazioni
alternative.

RVM è disponibile solo su MAX OS X, Linux, o qualsiasi sistema operativo
UNIX-like. Gli utenti Windows possono dare un’occhiata a [pik][5] che è
un sistema simile, o utilizzare RubyInstaller, descritto nella sezione
successiva.

Puoi installare RVM tramite [git][6], in questo modo:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Per le istruzioni più recenti su come installare RVM, vedi la [pagina di
installazione di RVM][7]. Il comando sopra installa sia RVM che l’ultima
versione di Ruby. RVM può anche installare la maggior parte delle
implementazioni menzionate sotto. Per visualizzare tutte le versioni
supportate, esegui `rvm list known`.

#### RubyInstaller

Se usi Windows, c’è un progetto che può aiutarti ad installare Ruby:
[RubyInstaller][8] ti fornisce tutto ciò di cui hai bisogno per creare
un ambiente di sviluppo Ruby su Windows.

Per utilizzare RubyInstaller, scaricalo dalla [RubyInstaller download
page][9]. Lancia l’installer, e poi è tutto fatto.

Se stai installando Ruby per poter utilizzare Rails, ti raccomandiamo di
utilizzare [RailsInstaller][10], che utilizza RubyInstaller ma ti dà
anche degli strumenti aggiuntivi per aiutarti a sviluppare con Rails.

### Ruby su Linux

A seconda della distribuzione che stai utilizzando, ci sono diversi modi
per installare Ruby. La prima opzione consiste nello scaricare il codice
sorgente e compilarlo a mano. In ogni caso, su alcune piattaforme sono
normalmente installati dei programmi di gestione dei package che rendono
l’installazione di Ruby estremamente più facile.

Per esempio, In Debian e Ubuntu `apt-get` è una delle soluzioni più
eleganti:

{% highlight sh %}
$ sudo apt-get install ruby irb rdoc
{% endhighlight %}

Per installare irb e rdoc devi abilitare il repository universale.

### Ruby su Mac OS X

Ruby 1.8.6 è completamente supportato in Mac OS X Leopart, incluso Ruby
on Rails, Mongrel, Capistrano e molte altre gemme.

Mac OS X Tiger include la versione 1.8.2 di Ruby, tuttavia, per coloro
che non hanno aggiornato il loro sistema alla versione Leopard, ci sono
diverse opzioni per installare l’ultima versione di Ruby.
[Locomotive][12] è una scelta eccellente se cerchi qualcosa di facile e
veloce per incominciare a sviluppare con Rails. Alternativamente, c’è
anche un [Programma di installazione per Mac OS X][13]. Infine,
l’utilizzo di [MacPorts][14] o [Fink][15] può essere una soluzione più
elegante per coloro che hanno padronanza di questi strumenti.

Tramite MacPorts, è possibile installare Ruby con il comando seguente:

{% highlight sh %}
$ sudo port install ruby
{% endhighlight %}

Fink invece offre un’interfaccia grafica (utilizzando Fink Commander)
per installare Ruby.

Inoltre, dal momento che Mac OS X è basato su Unix, è anche possibile
scaricare e compilare il codice sorgente di Ruby, una soluzione tanto
facile efficiente quanto le altre.

Per maggiori informazioni su come installare Ruby (e Rails),
l’eccellente articolo di Dan Benjamin [*Building Ruby, Rails,
Subversion, Mongrel, and MySQL on Mac OS X*][16] è proprio quello che fa
al caso tuo.

### Ruby per Solaris e OpenSolaris

Ruby 1.8.7 è disponibile per Solaris 8, 9 e 10 tramite [Sunfreeware][17]
e Ruby 1.8.6 è disponibile tramite [Blastwave][18]. Una versione
ottimizzata di Ruby on Rails per Solaris 10 è disponibile tramite
[Coolstack][19], parte del progetto Cooltools di Sun.

Per installare Ruby su [OpenSolaris][20], usa l’[Image Packaging System,
o IPS][21] client. Questo installerà l’ultima versione dei binari di
Ruby e Rubygems direttamente dal repository della rete di OpenSolaris.

È facile:

{% highlight sh %}
$ pfexec pkg install SUNWruby18
{% endhighlight %}

Questo comando installerà Ruby, RubyGems, le estensioni comuni e le
relative librerie. Questo pacchetto contiene anche supporto per DTrace e
ottimizzazioni di performance. Per saperne di più, puoi leggerti il
[Ruby OpenSolaris ARC Case][22].

L’altra distribuzione per OpenSolaris, chiamata [Solaris Express
Community Edition or SXCE][23] include Ruby preinstallato. Ka versione,
locazione, etc. sono le stessedelle altre distribuzioni tradizionali di
OpenSolaris, e sono documentate nell’ARC case menzionato
precedentemente.

Per installare i pacchetti SRV4 manualmente, visita il [progetto
RubyOpenSolaris su Rubyforge][24].



[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[6]: http://git-scm.com/
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[12]: http://locomotive.raaum.org/
[13]: http://rubyosx.rubyforge.org/
[14]: http://www.macports.org/
[15]: http://fink.sourceforge.net/
[16]: http://hivelogic.com/narrative/articles/ruby-rails-mongrel-mysql-osx
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://cooltools.sunsource.net/coolstack
[20]: http://www.opensolaris.org
[21]: http://opensolaris.org/os/project/pkg/
[22]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/
[23]: http://opensolaris.org/os/downloads
[24]: http://rubyforge.org/projects/rubyopensolaris
