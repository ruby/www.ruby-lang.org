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
* [Giappone 1][63] (Master) - HTTPS
* [Giappone 2][50] e [mirror][32] (RingServer)
* [Gran Bretagna][49] (The Mirror Service)
* [Germania][51] (AmbiWeb GmbH)
* [Belgio][52] (Easynet)
* [Danimarca][53] (sunsite.dk)
* [Olanda][54] (XS4ALL) - solo release
* [USA 1][55] (ibiblio.org)
* [USA 2][56] (lcs.mit.edu)
* [USA 3][57] (binarycode.org)
* [USA 4][58] (online-mirror.org)
* [USA 5][59] (trexle.com)
* [Austria][60] (tuwien.ac.at)
* [Taiwan 1][61] (cdpa.nsysu.edu.tw)
* [Taiwan 2][62] (ftp.cs.pu.edu.tw)
* [China 1][65] (ruby.taobao.org)

#### Siti mirror via FTP

* [Giappone 1][35] (Master: ruby-lang.org)
* [Giappone 2][31] e [mirror][32] (RingServer)
* [Giappone 3][33] (IIJ)
* [Corea del Sud][36] (Korea FreeBSD Users Group)
* [Germania][37] (FU Berlin)
* [Gran Bretagna][38] (The Mirror Service)
* [Belgio][39] (Easynet)
* [Russia][40] (ChgNet)
* [Grecia][41] (ntua.gr)
* [Danimarca][42] (sunsite.dk)
* [USA 1][43] (ibiblio.org)
* [USA 2][44] (lcs.mit.edu)
* [Austria][45] (tuwien.ac.at)
* [Taiwan 1][46] (cdpa.nsysu.edu.tw)
* [Taiwan 2][47] (ftp.cs.pu.edu.tw)
* [Canada][48] (mirror.cs.mun.ca)

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
* [Cardinal][24] è un “compilatore Ruby per la Virtual Machine [Parrot][25]”
  (Perl 6).
* [IronRuby][26] è un'implementazione “strettamente integrata con il
  framework .NET”.
* [MagLev][27] è “un'implementazione di Ruby veloce, stabile con
  persistenza degli oggetti integrata e cache condivisa distribuita”.

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
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
[31]: ftp://core.ring.gr.jp/pub/lang/ruby/
[32]: http://www.t.ring.gr.jp/
[33]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[35]: ftp://ftp.ruby-lang.org/pub/ruby/
[36]: ftp://ftp.kr.freebsd.org/pub/ruby/
[37]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[38]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[39]: ftp://ftp.easynet.be/ruby/ruby/
[40]: ftp://ftp.chg.ru/pub/lang/ruby/
[41]: ftp://ftp.ntua.gr/pub/lang/ruby/
[42]: ftp://sunsite.dk/mirrors/ruby/
[43]: ftp://www.ibiblio.org/pub/languages/ruby/
[44]: ftp://xyz.lcs.mit.edu/pub/ruby/
[45]: ftp://gd.tuwien.ac.at/languages/ruby/
[46]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[47]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[48]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
[49]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[50]: http://www.dnsbalance.ring.gr.jp/archives/lang/ruby/
[51]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[52]: http://ruby.mirror.easynet.be/
[53]: http://mirrors.sunsite.dk/ruby/
[54]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[55]: http://www.ibiblio.org/pub/languages/ruby/
[56]: http://xyz.lcs.mit.edu/ruby/
[57]: http://www.binarycode.org/ruby/
[58]: http://www.online-mirror.org/ruby/
[59]: http://ruby.trexle.com/
[60]: http://gd.tuwien.ac.at/languages/ruby/
[61]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[62]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[63]: https://ftp.ruby-lang.org/pub/ruby/
[64]: http://cache.ruby-lang.org/pub/ruby/
[65]: http://ruby.taobao.org/mirrors/ruby/
