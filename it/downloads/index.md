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

* Su Linux/UNIX puoi usare il gestore di pacchetti della tua
  distribuzione o i tool di terze parti (rbenv e RVM).
* Su OS X puoi usare i tool di terze parti (rbenv e RVM).
* Su Windows puoi usare RubyInstaller.

Guarda la pagina [Installation][installation] per i dettagli su
come utilizzare i gestori di pacchetti o i tool di terze parti.

Ovviamente sulle maggiori piattaforme puoi anche installare Ruby direttamente
dal codice sorgente.

### Compilare Ruby dal Codice Sorgente

Installare Ruby a partire dal codice sorgente è la soluzione migliore se hai
confidenza con la tua piattaforma e hai magari bisogno di specificare
alcune opzioni avanzate. È anche una buona soluzione nel caso in cui non
siano disponibili pacchetti di installazione precompilati per il tuo
sistema operativo.

Per i dettagli su come installare Ruby da sorgenti guarda la pagina
[Installazione][installation].
Se hai problemi con la compilazione di Ruby considera l'utilizzo di uno
degli strumenti di terze parti presenti nella sezione successiva. Potrebbero
esserti di aiuto.

* **Stabile Corrente:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **Stabile Precedente:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **Stabile Vecchia (serie 2.0.0):**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **Stabile Vecchia (serie 1.9.3):**
  [Ruby {{ site.downloads.previous19.version }}][previous19-gz]<br>
  sha256: {{ site.downloads.previous19.sha256.gz }}

* **Snapshots:**
  * [Stable Snapshot][stable-snapshot-gz]:
    Questo è il tarball dell'ultimo snapshot del branch stabile corrente.
  * [Nightly Snapshot][nightly-gz]:
    Questo è il tarball di ciò che c’è in SVN, generato giornalmente.
    Potrebbe contenere bug o avere altri problemi, usalo a tuo rischio e
    pericolo!

Puoi trovare maggiori informazioni sui repository Subversion e Git di Ruby
nella pagina [Ruby Core](/it/community/ruby-core/).

Il codice sorgente di Ruby è disponibile tramite alcuni
[siti mirror][mirrors] in giro per il mondo.
Cerca di utilizzare il sito mirror più vicino a te.



[license]: {{ site.license.url }}
[installation]: /it/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[previous19-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
