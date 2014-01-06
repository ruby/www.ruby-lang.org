---
layout: page
title: "Scarica Ruby"
lang: it
---

Tramite questa pagina è possibile scaricare le distribuzioni di Ruby più
recenti nel tuo formato preferito. La versione stabile corrente è la
{{ site.downloads.stable.version }}. Assicurati di aver letto
la [Licenza di Ruby]({{ site.license.url }}).
{: .summary}

### Tre modi per installare Ruby

Puoi ottenere una copia di Ruby in svariati modi, e persone diverse ne
preferiscono uno piuttosto che un altro per diverse ragioni.
Ognuno di questi modi è descritto nelle sezioni sottostanti.
Eccone un breve riassunto:

* La **compilazione dei sorgenti** è lo standard attraverso cui il software è
  stato reso disponibile per molti, molti anni. Questo è il metodo più
  familiare alla maggior parte degli sviluppatori.
* Ci sono alcuni **strumenti di terze parti** per installare Ruby. Questi
  strumenti sono spesso i più usati sia dai neofiti sia dagli utenti più
  esperti.
* Infine, se preferisci usare gli standard del tuo sistema operativo,
  Ruby è installabile tramite i più comuni **sistemi di gestione dei
  pacchetti**.

Inoltre, se vuoi utilizzare più versioni di Ruby sulla stessa macchina,
puoi provare RVM. Lo trovi nella sezione **strumenti di terze parti**.
Usare RVM è di gran lunga il modo migliore per farlo, a meno che tu non
sappia esattamente cosa stai facendo.

### Compilare Ruby dal Codice Sorgente

Installare Ruby a partire dal codice sorgente è la soluzione migliore se hai
confidenza con la tua piattaforma e magari hai bisogno di specificare
alcune opzioni avanzate. È anche una buona soluzione nel caso in cui non
siano disponibili pacchetti di installazione precompilati per il tuo
sistema operativo.

Se hai problemi con la compilazione di Ruby considera l'utilizzo di uno
degli strumenti di terze parti presenti nella sezione successiva. Potrebbero
esserti di aiuto.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Stabile
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Precedente
* [Snaphot Stabile][3] Questo è il tarball dell'ultimo snapshot del
  branch stabile (ruby\_2\_0\_0).
* [Snapshot Giornaliero][4] Questo è il tarball di ciò che c’è in svn,
  generato giornalmente. Potrebbe contenere bug o avere altri
  problemi, usalo a tuo rischio e pericolo!

Puoi trovare maggiori informazioni sui repository Subversion e Git di Ruby
nella pagina [Ruby Core](/it/community/ruby-core/).

### Siti mirror

Il codice sorgente di Ruby è disponibile tramite alcuni siti mirror in
giro per il mondo. Cerca di utilizzare il sito mirror più vicino a te.

#### Siti mirror via HTTP

* [CDN][64] (fastly.com)
* [Giappone 1][mirror-https-jp] (Master) - HTTPS
* Giappone 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-http-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-http-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-http-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-http-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-http-jp-ring-airnet]
  * [maffin.ad.jp][mirror-http-jp-ring-maffin]
* [Gran Bretagna][mirror-http-uk] (The Mirror Service)
* [Germania][mirror-http-de] (AmbiWeb GmbH)
* [Belgio][mirror-http-be] (Easynet)
* [Danimarca][mirror-http-dk] (sunsite.dk)
* [Olanda][mirror-http-nl] (XS4ALL) - solo release
* [USA 1][mirror-http-us1] (ibiblio.org)
* [USA 2][mirror-http-us2] (lcs.mit.edu)
* [USA 3][mirror-http-us3] (binarycode.org)
* [USA 4][mirror-http-us4] (online-mirror.org)
* [USA 5][mirror-http-us5] (trexle.com)
* [Austria][mirror-http-at] (tuwien.ac.at)
* [Taiwan 1][mirror-http-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-http-tw2] (ftp.cs.pu.edu.tw)
* [China 1][mirror-http-cn] (ruby.taobao.org)

#### Siti mirror via FTP

* [Giappone 1][mirror-ftp-jp1] (Master: ruby-lang.org)
* Giappone 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-ftp-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-ftp-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-ftp-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-ftp-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-ftp-jp-ring-airnet]
  * [maffin.ad.jp][mirror-ftp-jp-ring-maffin]
* [Giappone 3][mirror-ftp-jp3] (IIJ)
* [Corea del Sud][mirror-ftp-kr] (Korea FreeBSD Users Group)
* [Germania][mirror-ftp-dk] (FU Berlin)
* [Gran Bretagna][mirror-ftp-uk] (The Mirror Service)
* [Belgio][mirror-ftp-be] (Easynet)
* [Russia][mirror-ftp-ru] (ChgNet)
* [Grecia][mirror-ftp-gr] (ntua.gr)
* [Danimarca][mirror-ftp-dk] (sunsite.dk)
* [USA 1][mirror-ftp-us1] (ibiblio.org)
* [USA 2][mirror-ftp-us2] (lcs.mit.edu)
* [Austria][mirror-ftp-at] (tuwien.ac.at)
* [Taiwan 1][mirror-ftp-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-ftp-tw2] (ftp.cs.pu.edu.tw)
* [Canada][mirror-ftp-ca] (mirror.cs.mun.ca)

#### Siti mirror via rsync

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Gran Bretagna)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Danimarca)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canada)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

### Strumenti di Terze Parti

Molti rubisti utilizzano strumenti di terze parti per installare
Ruby. Questi strumenti hanno diversi vantaggi ma non sono ufficialmente
supportati. Tuttavia, le rispettive comunità sono molto disponibili.

#### RVM

Lo strumento più popolare per installare Ruby è **RVM**, che sta per
“Ruby Version Manager”. Non solo rende l’installazione di Ruby
incredibilmente facile, ma ti permette anche di installare e gestire
sul tuo sistema sia molteplici versioni di Ruby sia implementazioni
alternative.

RVM è disponibile solo su Mac OS X, Linux, o qualsiasi sistema operativo
UNIX-like. Gli utenti Windows possono dare un’occhiata a [pik][5] che è
un sistema simile, o utilizzare RubyInstaller, descritto nella sezione
successiva.

Se la procedura non è stata modificata dalla scrittura di questo
documento, dovresti essere in grado di installare RVM con il seguente
comando:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Per le istruzioni più recenti su come installare RVM, vedi la [pagina di
installazione di RVM][7]. Il comando appena descritto installa sia RVM sia
l’ultima versione di Ruby. RVM può anche installare la maggior parte delle
implementazioni di Ruby descritte più avanti. Per visualizzare tutte le
versioni supportate, lancia il comando `rvm list known`.

#### RubyInstaller

Se usi Windows, c’è un progetto che può aiutarti ad installare Ruby:
[RubyInstaller][8] ti fornisce tutto ciò di cui hai bisogno per creare
un ambiente di sviluppo Ruby su Windows.

Per utilizzare RubyInstaller, scaricalo dalla [RubyInstaller download
page][9], lancia l’installer, e poi è tutto fatto.

Se stai installando Ruby per utilizzare Rails, ti raccomandiamo di
usare [RailsInstaller][10], che include RubyInstaller ma ti dà
anche degli strumenti aggiuntivi per aiutarti a sviluppare con Rails.

### Sistemi di gestione dei pacchetti

Se non puoi compilare Ruby e non vuoi usare uno strumento di terze parti
puoi utilizzare il tuo sistema di gestione dei pacchetti per installare Ruby.

Alcuni membri della comunità Ruby sono fortemente convinti che non dovresti
mai usare un sistema di gestione dei pacchetti per installare Ruby e che
dovresti utilizzare RVM. Tralasciando la lista completa di pro e contro, che
va oltre lo scopo di questa pagina, la motivazione principale è che la
maggior parte dei sistemi di gestione dei pacchetti contiene versioni
datate di Ruby. Se vuoi usare l'ultima versione di Ruby assicurati di
utilizzare il nome del pacchetto giusto oppure utilizza RVM.

### Ruby su Linux

Debian GNU/Linux e Ubuntu usano il sistema di gestione dei pacchetti apt.
Puoi usarlo in questo modo:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Questo comando installerà Ruby 1.9.2 o successive. Il nome del pacchetto
deriva dal fatto che contiene una libreria compatibile con
la versione 1.9.1.

Su alcune distribuzioni, se installi semplicemente il pacchetto ‘ruby’,
potresti avere la vecchia versione 1.8.

Arch Linux usa un sistema di gestione dei pacchetti chiamato pacman. Per
installare Ruby, devi solamente lanciare questo comando:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Per gli altri sistemi operativi puoi cercare il repository del pacchetto
della tua distribuzione oppure RVM potrebbe essere la scelta giusta per te.

### Ruby su Mac OS X

Ruby 1.8.7 è completamente supportato in Mac OS X Lion così come le più
famose Ruby gems (pacchetti). Per ulteriori dettagli guarda [Ruby wiki at
Mac OS Forge][11].

Mac OS X Tiger include la versione 1.8.2 di Ruby, e Leopard include la 1.8.6
ma, per coloro che non hanno effettuato l'upgrade a Leopard, ci sono svariate
opzioni per installare l'ultima versione di Ruby.

Molti utenti di Mac OS X usano [Homebrew][12] come sistema di gestione dei
pacchetti. È molto facile installare Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Inoltre, siccome OS X è basato su Unix, scaricare ed installare Ruby dal
codice sorgente è ugualmente facile e efficiente che con le altre soluzioni.
Per agevolare l'installazione delle nuove versioni di Ruby su OS X,
probabilmente è una buona idea usare RVM. Digita `rvm notes` per le
informazioni specifiche del tuo sistema.

Per una panoramica dettagliata su come installare Ruby (e Rails) è
possibile consultare gli eccellenti articoli di Dan Benjamin per
[Tiger][13], [Leopard][14] e [Snow Leopard][15]. Gli utenti Lion
possono consultare [questo articolo][16].

### Ruby per Solaris e OpenSolaris

Ruby 1.8.7 è disponibile per Solaris 8, 9 e 10 tramite [Sunfreeware][17]
e Ruby 1.8.6 è disponibile tramite [Blastwave][18]. Anche Ruby 1.9.2p0 è
disponibile tramite [Sunfreeware][17] ma la versione è datata. Usare RVM
può permetterti di utilizzare l'ultima versione di Ruby.

Per installare Ruby su [OpenIndiana][19], usa il client [Image Packaging
System, o IPS][20]. Questo installerà l’ultima versione dei binari di
Ruby e Rubygems direttamente dal repository del network di OpenSolaris
per Ruby 1.9. È facile:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Anche in questo caso, RVM è un ottimo modo per ottenere l'ultima versione
di Ruby.

### Altre implementazioni di Ruby

Ruby, come linguaggio, ha diverse implementazioni. Questa guida si riferisce
all'implementazione di riferimento, **MRI** (“Matz's Ruby
Interpreter”) o **CRuby**, ma ne esistono anche altre.
Spesso le altre implementazioni sono utili in specifiche situazioni,
forniscono integrazioni aggiuntive con altri linguaggi e ambienti oppure
hanno funzionalità speciali che non sono presenti in MRI.

Eccone una lista:

* [JRuby][21] è Ruby sulla JVM (Java Virtual Machine) ottimizzata per
  utilizzare il compilatore JIT, i garbage collectors, i thread concorrenti,
  un ecosistema di strumenti e un vasto numero di librerie.
* [Rubinius][22] è ‘Ruby scritto in Ruby’. Costruito su LLVM, Rubinius
  mette in mostra un'elegante virtual machine sulla quale sono stati
  costrutiti anche altri linguaggi.
* [MacRuby][23] è un'implementazione di Ruby strettamente integrata con le
  librerie Cocoa di Apple per Mac OS X, permettendoti di scrivere facilmente
  applicazioni desktop.
* [mruby][mruby] è un'implementazione molto leggera di Ruby che può essere
  collegata e incorporata all'interno di un'applicazione.
  Il suo sviluppo è guidato da Yukihiro “Matz” Matsumoto, creatore di Ruby.
* [IronRuby][26] è un'implementazione “strettamente integrata con il
  framework .NET”.
* [MagLev][27] è “un'implementazione di Ruby veloce, stabile con
  persistenza degli oggetti integrata e cache condivisa distribuita”.
* [Cardinal][24] è un “compilatore Ruby per la Virtual Machine [Parrot][25]”
  (Perl 6).

Alcune di queste implementazioni, inclusa MRI, seguono le linee guida di
[RubySpec][28], una “specifica esecutiva completa per il linguaggio
di programmazione Ruby”.

[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
[mirror-http-cdn]: http://cache.ruby-lang.org/pub/ruby/
[mirror-http-jp-ring-shibaura-it]: http://ring.shibaura-it.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-tohoku]: http://ring.tains.tohoku.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-u-toyama]: http://ring.u-toyama.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-yamanashi]: http://ring.yamanashi.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-airnet]: http://ring.airnet.ne.jp/archives/lang/ruby/
[mirror-http-jp-ring-maffin]: http://ring.maffin.ad.jp/archives/lang/ruby/
[mirror-https-jp]: https://ftp.ruby-lang.org/pub/ruby/
[mirror-http-uk]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-http-de]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[mirror-http-be]: http://ruby.mirror.easynet.be/
[mirror-http-dk]: http://mirrors.sunsite.dk/ruby/
[mirror-http-nl]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[mirror-http-us1]: http://www.ibiblio.org/pub/languages/ruby/
[mirror-http-us2]: http://xyz.lcs.mit.edu/ruby/
[mirror-http-us3]: http://www.binarycode.org/ruby/
[mirror-http-us4]: http://www.online-mirror.org/ruby/
[mirror-http-us5]: http://ruby.trexle.com/
[mirror-http-at]: http://gd.tuwien.ac.at/languages/ruby/
[mirror-http-tw1]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[mirror-http-tw2]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-http-cn]: http://ruby.taobao.org/mirrors/ruby/
[mirror-ftp-jp1]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-shibaura-it]: ftp://ring.shibaura-it.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-tohoku]: ftp://ring.tains.tohoku.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-u-toyama]: ftp://ring.u-toyama.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-yamanashi]: ftp://ring.yamanashi.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-airnet]: ftp://ring.airnet.ne.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-maffin]: ftp://ring.maffin.ad.jp/pub/lang/ruby/
[mirror-ftp-jp3]: ftp://ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-kr]: ftp://ftp.kr.freebsd.org/pub/ruby/
[mirror-ftp-de]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[mirror-ftp-uk]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-be]: ftp://ftp.easynet.be/ruby/ruby/
[mirror-ftp-ru]: ftp://ftp.chg.ru/pub/lang/ruby/
[mirror-ftp-gr]: ftp://ftp.ntua.gr/pub/lang/ruby/
[mirror-ftp-dk]: ftp://sunsite.dk/mirrors/ruby/
[mirror-ftp-us1]: ftp://www.ibiblio.org/pub/languages/ruby/
[mirror-ftp-us2]: ftp://xyz.lcs.mit.edu/pub/ruby/
[mirror-ftp-at]: ftp://gd.tuwien.ac.at/languages/ruby/
[mirror-ftp-tw1]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[mirror-ftp-tw2]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-ftp-ca]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
