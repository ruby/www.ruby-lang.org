---
layout: page
title: "Scarica Ruby"
lang: it
---

Qui è possibile scaricare le distribuzioni di Ruby più recenti nel tuo
formato preferito. La versione stabile corrente è la
{{ site.downloads.stable.version }}. Ti preghiamo di leggere la
[Licenza di Ruby][1] prima di procedere con il download.

### Codice Sorgente

Installare a partire dal codice sorgente è la soluzione migliore se hai
confidenza con la tua piattaforma e magari hai bisogno di specificare
alcune opzioni avanzate. È anche una buona soluzione nel caso in cui non
siano disponibili pacchetti di installazione precompilati per il tuo
sistema operativo.

* [Ruby {{ site.downloads.stable.version }}][2]
  (md5:&nbsp;{{ site.downloads.stable.md5 }}) Versione Stabile (*raccomandato*)
* [Snaphot Stabile][3] Questo è un file compresso (tar.gz) dell’ultimo
  snapshot *stabile* in CVS. Dovrebbe essere migliore del rilascio
  ufficiale.
* [Snapshot Giornaliero][4] Questo è un file compresso (tar.gz)
  dell’ultimo snapshot in CVS. Dovrebbe essere migliore del rilascio
  ufficiale.

Per maggiori informazioni sul repository Subversion di Ruby, vedi la
pagine For information about the Ruby Subversion repository, vedi [Ruby
Core](/it/community/ruby-core/).

### Ruby su Windows

La piattaforma Windows offre varie possibilità per installare Ruby. La
prima possibilità consiste nell’usare [RubyInstaller][5], un programma
di installazione che contiene file binari compilati. La seconda
possibilità consiste nell’utilizzare pacchetti di file eseguibili o
binari. Se non sei sicuro di come installare Ruby, la prima possibilità
è probabilmente la migliore.

* [Ruby 1.8.6-p398 RubyInstaller][6]
  (md5:&nbsp;233d6b3ddc4c61436b075b51254cd138) Versione stabile
  (*raccomandato*)
* [Ruby 1.8.7-p330 RubyInstaller][7] (md5:&nbsp;
  18d688cfae6e60857cad24da6f9ee055) Versione stabile (*raccomandato*)
* [Ruby 1.9.1-p430 RubyInstaller][8]
  (md5:&nbsp;86ac589a955898c3163b161d81750a05) Versione stabile
  (*raccommandato*)
* [Ruby 1.9.2-p136 RubyInstaller][9] (md5:&nbsp;
  8e8843963dae29a98ce3e2ba2ee111f1) Versione stabile (*raccommandato*)
* [Ruby 1.8.7-p249 Binary][10] (md5:&nbsp;4fd37b0b4b21a042cae7f5f0a8daad16)
  Versione stabile
* [Ruby 1.9.1-p378 Binary][11] (md5:&nbsp;7d14a918cc8d243d3e2c409aff41f454)
  Versione stabile

Nota che l’uso dei file binari sopra indicati richiede scaricamento
manuale e installazione di componenti aggiuntivi, come descritto in
[questa pagina][12]. Assicurati di aver seguito attentamente le
procedure indicate prima di aprire dei bachi.

[RubyInstaller][5] non richiede operazioni aggiuntive.

Puoi anche considerare [pik][13], che rende il processo di installazione
e di aggiornamento di più versioni di Ruby e gemme su Windows ancora più
facile.

### Ruby su Linux

A seconda della distribuzione che stai utilizzando, ci sono diversi modi
per installare Ruby. La prima opzione consiste nello scaricare il codice
sorgente e compilarlo a mano. In ogni caso, su alcune piattaforme sono
normalmente installati dei programmi di gestione dei package che rendono
l’installazione di Ruby estremamente più facile.

Per esempio, In Debian e Ubuntu `apt-get` è una delle soluzioni più
eleganti:

    % sudo apt-get install ruby irb rdoc
{: .code .sh-code}

Per installare irb e rdoc devi abilitare il repository universale.

### Ruby su Mac OS X

Ruby 1.8.6 è completamente supportato in Mac OS X Leopart, incluso Ruby
on Rails, Mongrel, Capistrano e molte altre gemme. Per ulteriori
dettagli, vedere la pagina [la Wiki di Ruby su MacOS Forge][14].

Mac OS X Tiger include la versione 1.8.2 di Ruby, tuttavia, per coloro
che non hanno aggiornato il loro sistema alla versione Leopard, ci sono
diverse opzioni per installare l’ultima versione di Ruby.
[Locomotive][15] è una scelta eccellente se cerchi qualcosa di facile e
veloce per incominciare a sviluppare con Rails. Alternativamente, c’è
anche un [Programma di installazione per Mac OS X][16]. Infine,
l’utilizzo di [MacPorts][17] o [Fink][18] può essere una soluzione più
elegante per coloro che hanno padronanza di questi strumenti.

Tramite MacPorts, è possibile installare Ruby con il comando seguente:

    % sudo port install ruby
{: .code .sh-code}

Fink invece offre un’interfaccia grafica (utilizzando Fink Commander)
per installare Ruby.

Inoltre, dal momento che Mac OS X è basato su Unix, è anche possibile
scaricare e compilare il codice sorgente di Ruby, una soluzione tanto
facile efficiente quanto le altre.

Per maggiori informazioni su come installare Ruby (e Rails),
l’eccellente articolo di Dan Benjamin [*Building Ruby, Rails,
Subversion, Mongrel, and MySQL on Mac OS X*][19] è proprio quello che fa
al caso tuo.

### Ruby per Solaris e OpenSolaris

Ruby 1.8.7 è disponibile per Solaris 8, 9 e 10 tramite [Sunfreeware][20]
e Ruby 1.8.6 è disponibile tramite [Blastwave][21]. Una versione
ottimizzata di Ruby on Rails per Solaris 10 è disponibile tramite
[Coolstack][22], parte del progetto Cooltools di Sun.

Per installare Ruby su [OpenSolaris][23], usa l’[Image Packaging System,
o IPS][24] client. Questo installerà l’ultima versione dei binari di
Ruby e Rubygems direttamente dal repository della rete di OpenSolaris.

È facile:

    % pfexec pkg install SUNWruby18
{: .code .sh-code}

Questo comando installerà Ruby, RubyGems, le estensioni comuni e le
relative librerie. Questo pacchetto contiene anche supporto per DTrace e
ottimizzazioni di performance. Per saperne di più, puoi leggerti il
[Ruby OpenSolaris ARC Case][25].

L’altra distribuzione per OpenSolaris, chiamata [Solaris Express
Community Edition or SXCE][26] include Ruby preinstallato. Ka versione,
locazione, etc. sono le stessedelle altre distribuzioni tradizionali di
OpenSolaris, e sono documentate nell’ARC case menzionato
precedentemente.

Per installare i pacchetti SRV4 manualmente, visita il [progetto
RubyOpenSolaris su Rubyforge][27].



[1]: http://www.ruby-lang.org/it/about/license.txt 
[2]: {{ site.downloads.stable.url }}
[3]: {{ site.downloads.stable_snapshot.url }}
[4]: {{ site.downloads.nightly_snapshot.url }}
[5]: http://rubyinstaller.org/ 
[6]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe 
[7]: http://rubyforge.org/frs/download.php/73719/rubyinstaller-1.8.7-p330.exe 
[8]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe 
[9]: http://rubyforge.org/frs/download.php/73722/rubyinstaller-1.9.2-p136.exe 
[10]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p249-i386-mswin32.zip 
[11]: ftp://ftp.ruby-lang.org:21/pub/ruby/binaries/mswin32/ruby-1.9.1-p378-i386-mswin32.zip 
[12]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html 
[13]: http://github.com/vertiginous/pik 
[14]: http://trac.macosforge.org/projects/ruby/wiki 
[15]: http://locomotive.raaum.org/ 
[16]: http://rubyosx.rubyforge.org/ 
[17]: http://www.macports.org/ 
[18]: http://fink.sourceforge.net/ 
[19]: http://hivelogic.com/narrative/articles/ruby-rails-mongrel-mysql-osx 
[20]: http://www.sunfreeware.com 
[21]: http://www.blastwave.org 
[22]: http://cooltools.sunsource.net/coolstack 
[23]: http://www.opensolaris.org 
[24]: http://opensolaris.org/os/project/pkg/ 
[25]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/ 
[26]: http://opensolaris.org/os/downloads 
[27]: http://rubyforge.org/projects/rubyopensolaris 
