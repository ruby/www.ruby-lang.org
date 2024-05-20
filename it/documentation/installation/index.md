---
layout: page
title: "Installare Ruby"
lang: it
---

Puoi usare diversi tool per installare Ruby.
Questa pagina descrive come usare i maggiori gestori di pacchetti
e i tool di terze parti per gestire ed installare Ruby
e come compilare Ruby dai sorgenti.
{: .summary}


## Scegliere il metodo di installazione

La seguente panoramica indica i metodi di installazione disponibili
per le maggiori piattaforme.
Scegli il modo più comodo per te.

* macOS

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [Building from source](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Package management systems](#package-management-systems)
  * [Building from source](#building-from-source)

* Windows

  * [RubyInstaller](#rubyinstaller)
  * [RVM 4 Windows](#rvm-windows)


## Tool di terze parti

Molti Rubysti usano tool di terze parti per installare Ruby.
Questi tool conferiscono molti vantaggi ma non sono supportati ufficialmente.
Tuttavia la loro rispettabile comunità è molto disponibile.


### rbenv
{: #rbenv}

[rbenv][rbenv] ti permette di gestire multiple installazioni di Ruby.
Non supporta l'installazione di Ruby, ma esiste un plugin molto popolare
chiamato ruby-build che permette di installare Ruby.
Entrambi i tool sono disponibili per macOS, Linux o altri sistemi operativi
UNIX-like.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] ti permette di installare e gestire multiple installazioni di Ruby
sul tuo sistema. Ti permette anche di gestire gemsets differenti.
È disponibile solo per macOS, Linux, o gli altri sistemi operativi UNIX-like.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] consente di installare e gestire installazioni 
multiple di Ruby su Windows. È un clone dell'RVM originale e supporta la linea 
di comando classica e Powershell, fornendo la stessa interfaccia della linea 
di comando dell'RVM originale.


### RubyInstaller
{: #rubyinstaller}

Se sei su Windows, esiste un ottimo progetto per aiutarti ad installare Ruby:
[RubyInstaller][rubyinstaller]. Ti da tutto quello che ti serve per avere un
ambiente di sviluppo per Ruby su Windows.

Fai il download, lancia l'installer, ed hai fatto!


### RailsInstaller e Ruby Stack

Se stai installando Ruby per usare Rails, puoi utilizzare questi installer:

* [RailsInstaller][railsinstaller]
  usa RubyInstaller ma ti dà degli strumenti exta per aiutarti
  con lo sviluppo in Rails.
  Supporta OS X e Windows.
* [Bitnami Ruby Stack][rubystack]
  fornisce un ambiente di sviluppo completo per Rails.
  Supporta Windows, macOS, Linux, macchine virtuali e immagini cloud.


## Sistemi di gestione dei pacchetti
{: #package-management-systems}

Se non puoi compilare il tuo Ruby, e non vuoi usare i tool di terze parti,
puoi utilizzare i gestori di pacchetti per installare Ruby.

Alcuni membri nella comunità Ruby sono fermamente convinti che non dovresti
mai usare un gestore di pacchetti per istallare Ruby e che dovresti usare i
tool. Anche se la lista dei pro e contro è fuori dallo scopo di questa pagina,
la ragione principale per non usare i gestori di pacchetti è che hanno
vecchie versioni di Ruby nei loro repository ufficiali. Se vuoi utilizzare le
nuove versioni di Ruby, fai attenzione ad utilizzare il pacchetto con il nome
corretto o i tool descritti precedentemente.

Di seguito sono descritti e seguenti gestori di pacchetti:

* [apt (Debian o Ubuntu)](#apt)
* [yum (CentOS, Fedora, o RHEL)](#yum)
* [portage (Gentoo)](#gentoo)
* [pacman (Arch Linux)](#pacman)
* [Homebrew (macOS)](#homebrew)
* [Solaris, OpenIndiana](#solaris)


### apt (Debian o Ubuntu)
{: #apt}

Debian GNU/Linux e Ubuntu usano il gestore di pacchetti apt.
Puoi usarlo in questo modo:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

Come detto, su Debian e Ubuntu, il pacchetto `ruby` fornito è il Ruby 2.3.1,
che è un vecchia release stabile.


### yum (CentOS, Fedora, o RHEL)
{: #yum}

CentOS, Fedora, e RHEL usano il gestore di pacchetti yum.
Puoi usarlo in questo modo:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Tipicamente la versione Ruby installata è l'ultima disponibile
al rilascio della distribuzione.


### portage (Gentoo)
{: #portage}

Gentoo usa il gestore di pacchetti portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Di default proverà ad installare tutte le versioni disponibili (1.8, 1.9 e 2.0).
Per installare una versione specifica,
settare `RUBY_TARGETS` nel tuo `make.conf`.
Vedi [Gentoo Ruby Project website][gentoo-ruby] per i dettagli.

### pacman (Arch Linux)
{: #pacman}

Arch Linux usa il gestore di pacchetti chiamato pacman.
Puoi usarlo in questo modo:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (macOS)
{: #homebrew}

Su OS X Mavericks, Ruby 2.0. è incluso.
OS X Mountain Lion, Lion, e Snow Leopard hanno la versione 1.8.7.

Ci sono diverse opzioni per installare le nuove versioni di Ruby.
Molti utenti macOS nella comunità Ruby usano i tool di terze parti per installare
Ruby, ma ci sono alcuni gestori di pacchetti che supportano Ruby.

Molti utenti su macOS usano [Homebrew][homebrew] come gestore di pacchetti.
Con questo è molto facile installare Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

In alternativa, dato che macOS è basato su Unix, si possonono scaricare ed
installare i sorgenti, è altrettanto facile ed efficace.
Per aiutarti nell'installazione delle nuove versioni Ruby su macOS, è
probabilmente una buona ida utilizzare i tool di terze parti.

### Ruby su Solaris e OpenIndiana
{: #solaris}

Ruby 1.8.7 è disponibile per Solaris 8 fino a Solaris 10 su
[Sunfreeware][sunfreeware] e Ruby 1.8.7 è disponibile su Blastwave.
Ruby 1.9.2p0 è disponibile su [Sunfreeware][sunfreeware], ma è outdate.
Si possono avere le ultime versioni di Ruby utilizzando i tool di terze parti.

Per installare Ruby su [OpenIndiana][openindiana], si consiglia di utilizzare il
client [Image Packaging System (IPS)][opensolaris-pkg].
Questo installerà l'ultima versione di Ruby dai binari e RubyGems direttamente
dal repository di OpenSolaris per la versione Ruby 1.9. Ed è facile:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Come detto prima, l'utilizzo di tool di terze parti è un buon modo per ottenere
l'ultima versione di Ruby.


### Altre Distribuzioni

Su altri sistemi operativi, puoi cercare i gestori di pacchetti per la tua
distribuzione Linux, o la scelta giusta potrebbe essere utilizzare i tool di
terze parti.


## Installare da Sorgenti
{: #building-from-source}

Sicuramente puoi installare Ruby da sorgenti.
[Scarica](/it/downloads/) e scompatta il tarball, dopo lancia semplicemente:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Di default Ruby verrà installato in `/usr/local`. Per cambiare modifica
l'opzione `--prefix=DIR` nello script `./configure`.

Utilizzare i tool di terze parti potrebbe essere l'idea migliore,
perchè la versione installata non verrebbe gestita da nessun tool.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
