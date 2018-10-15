---
layout: page
title: "Scarica Ruby"
lang: it
---

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
* Su OS X puoi usare i tool di terze parti ([rbenv][rbenv] e [RVM][rvm]).
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

* **Versioni stabili:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **Versioni di preview:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **Nella fase di manutenzione di sicurezza (sono giunti a fine vita!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Non più mantenute (finevita):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshot.url.gz }}):
    Un file compresso dell'ultimo snapshot della branch stabile corrente.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Questo è un file compresso di tutto quello che c'è nell'SVN, generato ogni notte.
    Potrebbe contenere bug ed errori, usalo a tuo rischio e pericolo!

  Per ulteriori informazioni su relase specifiche, release particolarmente vecchie o previews, dai un'occhiata alla [pagina delle relase][releases].
  Informazioni sullo stato di manutenzione attuale delle varie branch di Ruby possono essere trovate sulla [pagina delle branch][branches].

  Per ulteriori informazioni sulle nostre repository SVN e Git, dai un'occhiata al nostra pagina sul
  [Ruby Core](/en/community/ruby-core/).

  I sorgenti di Ruby sono disponibili su molti altri
  [siti mirror][mirrors].
  Usa un mirror che è vicino a te.



[license]: {{ site.license.url }}
[installation]: /it/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[releases]: /en/downloads/releases/
[branches]: /en/downloads/branches/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
