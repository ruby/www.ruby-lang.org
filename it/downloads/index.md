---
layout: page
title: "Scarica Ruby"
lang: it
---

Tramite questa pagina è possibile scaricare le distribuzioni di Ruby più
recenti nel tuo formato preferito. La versione stabile corrente è la
{{ site.downloads.stable.version }}. Assicurati di aver letto
la [Licenza di Ruby][license].
{: .summary}

### Modi per installare Ruby

Per installare Ruby sulla maggiori piattaforme abbiamo a disposizione
diversi tool:

* Su Linux/UNIX, puoi usare il gestore di pacchetti della tua
  distribuzione o i tool di terze parti (rbenv e RVM).
* Su OS X, puoi usare i tool di terze parti (rbenv e RVM).
* Su Windows, puoi usare RubyInstaller.

Guarda la pagina [Installation][installation] per i dettagli su
come utilizzare i gestori di pacchetti o i tool di terze parti.

Ovviamente sulle maggiori piattaforme puoi installa Ruby direttamente
dai sorgenti.

### Compilare Ruby dal Codice Sorgente

Installare Ruby a partire dal codice sorgente è la soluzione migliore se hai
confidenza con la tua piattaforma e magari hai bisogno di specificare
alcune opzioni avanzate. È anche una buona soluzione nel caso in cui non
siano disponibili pacchetti di installazione precompilati per il tuo
sistema operativo.

Per i dettagli su come installare Ruby da sorgenti guarda la pagina
[Installation][installation].
Se hai problemi con la compilazione di Ruby considera l'utilizzo di uno
degli strumenti di terze parti presenti nella sezione successiva. Potrebbero
esserti di aiuto.

* **Stabile:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **Stabile Precedente:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **Vecchia Stabile:**
  [Ruby {{ site.downloads.previous19.version }}][old-gz]<br>
  sha256: {{ site.downloads.previous19.sha256.gz }}

* **Snapshots:**
  * [Stable Snapshot][stable-snapshot-gz]:
    Questo è il tarball dell'ultimo snapshot del branch stabile corrente.
  * [Nightly Snapshot][nightly-gz]:
    Questo è il tarball di ciò che c’è in svn, generato giornalmente.
    Potrebbe contenere bug o avere altri problemi,
    usalo a tuo rischio e pericolo!

Puoi trovare maggiori informazioni sui repository Subversion e Git di Ruby
nella pagina [Ruby Core](/it/community/ruby-core/).

Il codice sorgente di Ruby è disponibile tramite alcuni
[siti mirror][mirrors] in giro per il mondo.
Cerca di utilizzare il sito mirror più vicino a te.


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



[license]: {{ site.license.url }}
[installation]: /it/documentation/installation/
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[old-gz]:      {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: http://www.mruby.org/
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
