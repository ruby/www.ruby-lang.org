---
layout: page
title: "Scarica Ruby"
lang: it
---

{% include warnings/out-of-date.html %}

Tramite questa pagina è possibile scaricare le distribuzioni di Ruby più
recenti nel tuo formato preferito. La versione stabile corrente è la
{{ site.data.downloads.stable[0] }}. Assicurati di aver letto
la [Licenza di Ruby][license].
{: .summary}

### Modi per installare Ruby

Per installare Ruby sulla maggiori piattaforme abbiamo a disposizione
diversi tool:

* Su Linux/UNIX puoi usare il gestore di pacchetti della tua
  distribuzione o i tool di terze parti ([rbenv][rbenv] e [RVM][rvm]).
* Su macOS puoi usare i tool di terze parti ([rbenv][rbenv] e [RVM][rvm]).
* Su Windows puoi usare [RubyInstaller][rubyinstaller].

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
  Ruby {{ site.data.downloads.stable[0] }}

* **Snapshots:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshots[0].url.gz }}):
    Questo è il tarball dell'ultimo snapshot del branch stabile corrente.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Questo è il tarball di ciò che c’è in Git, generato giornalmente.
    Potrebbe contenere bug o avere altri problemi, usalo a tuo rischio e
    pericolo!

Puoi trovare maggiori informazioni sui repository Subversion e Git di Ruby
nella pagina [Ruby Core](/it/community/ruby-core/).

Il codice sorgente di Ruby è disponibile tramite alcuni
[siti mirror][mirrors] in giro per il mondo.
Cerca di utilizzare il sito mirror più vicino a te.



[license]: {{ site.license.url }}
[installation]: /it/documentation/installation/
[mirrors]: /en/downloads/mirrors/
