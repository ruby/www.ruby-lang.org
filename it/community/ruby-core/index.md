---
layout: page
title: "Ruby Core"
lang: it
---

Questo è un momento fantastico per partecipare in quello che avviene nel
mondo Ruby, ora che la versione Ruby 2.0 è in fase di sviluppo. Data la
crescente attenzione che Ruby ha ricevuto nel corso degli ultimi anni, è
aumentato il bisogno di persone con talento per aiutare a migliorare
Ruby e a documentare le parti che lo compongono. Allora, da dove puoi
cominciare?

I temi principali riguardanti lo sviluppo di Ruby sono:

* [Usanre Subversion per seguire lo sviluppo di Ruby](#following-ruby)
* [Migliorare Ruby, patch dopo patch](#patching-ruby)
* [Regole per i Core Developer](#coding-standards)

### Usare Subversion per seguire lo sviluppo di Ruby
{: #following-ruby}

Per fare checkout del più recente codice Ruby, devi semplicemente fare
il login usando l’account anonimo di Subversion. Dalla linea di comando:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

La directory `ruby` contiene il codice più recente per Ruby 1.9
(“trunk”), il quale è la versione di sviluppo di Ruby, da essere
rilasciata come versione 1.9.1 alla fine del 2008.

Se sei interessato a seguire il patching di Ruby 1.8, devi fare checkout
del branch `ruby_1_8`\:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8
{% endhighlight %}

Questo comando effettua il checkout del development tree su una
directory `ruby_1_8`. Ai programmatori che lavorano su Ruby 1.8 viene
richiesto di migrare le loro modifiche sul ramo principale (Ruby trunk),
con frequenza tale che i due rami restino molti simili, con l’eccezione
dei miglioramenti fatti da Matz e Nobu sul linguaggio stesso.

Se preferisci, puoi anche seguire [Ruby’s repository via the web][1].

Per informazioni su Subversion, fai riferimento a [Subversion FAQ][2] e
a [the Subversion book][3]. Come alternativa, un eccellente testo
introduttivo è il [Pragmatic Version Control with Subversion][4].

### Migliorare Ruby, patch dopo patch
{: #patching-ruby}

Rubyforge mantiene un [bug tracker][5] per notificare patch e
segnalazioni di errori a Matz e al resto del gruppo. Questi rapporti
vengono anche notificati alla Ruby-Core mailing
list”:/en/community/mailing-lists/ per discussione, e quindi
puoi essere sicuro che la tua richiesta non sarà ignorata. Puoi anche
inviare le tue patch alla mailing list. In ogni caso, non esitare a
prendere parte alla discussione che ne seguirà.

In sintesi, i passi per costruire un patch sono:

1.  Se stai correggendo un bug in Ruby 1.8, fai il check out di una
    copia di Ruby 1.8 da Subversion usando il ramo `ruby_1_8`.

         $ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8

    Se desideri aggiungere una feature a Ruby, fai un check out del ramo
    principale (‘trunk’) del Ruby source. Ricorda che perfino quando
    vuoi aggiungere una feature a Ruby 1.8, deve prima essere provata
    nel trunk.

         $ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby

2.  Aggiungi le tue modifiche al codice.
3.  Crea una patch.

         $ svn diff > ruby-changes.patch

4.  Invia per email la tua patch alla [Ruby-Core mailing
    list](/en/community/mailing-lists/)” con una entry sul
    CHANGELOG che descrive la patch.
5.  Se non ci sono obiezioni alla patch, i committer daranno
    l’approvazione per applicarla.

**Per favore, fai attenzione a quanto segue:** le patch devono essere
notificate come un [unified diff][6]. Per ulteriori informazioni sulla
procedura di merge dei patch , vedi [the diffutils reference][7].

La discussione sullo sviluppo di Ruby converge sulla [Ruby-Core mailing
list](/en/community/mailing-lists/). Quindi, se hai curiosità
di sapere se il tuo patch è utile oppure se vuoi innescare una
discussione sul futuro di Ruby, non esitare ad entrare nella mischia.
Tuttavia, tieni presente che: discussioni fuori soggetto non sono
tollerate in questa lista; il livello di distrazione (‘noise’) deve
essere al minimo; e ogni soggetto presentato deve essere identificato e
descritto con estrema chiarezza. Siccome ti stai rivolgendo al Creatore
di Ruby, non stona esprimere una certa riverenza :-).

Tieni presente che gli sviluppatori di Ruby Core vivono in Giappone e
che, anche se molti parlano un ottimo inglese, c’è una notevole
differenza di fuso orario. Essi hanno inoltre un insieme di liste di
sviluppo in giapponese insieme a quelle in Inglese. Sii paziente; se la
tua richiesta non è risolta prova di nuovo qualche giorno più tardi.

### Regole per i Core Developer
{: #coding-standards}

In generale, gli sviluppatori di Ruby devono avere familiarità con il
codice source e lo stile di sviluppo usato dal team. Per chiarezza, le
seguenti norme devono essere osservate al momento del checkin in
Subversion:

* Ogni checkin deve essere descritto nel `ChangeLog`, seguendo le [GNU
  conventions][8]. (Molti core developers di Ruby usano Emacs `add-log`
  mode, che può essere attivato col comando `C-x 4 a`.)
^

* Le date di checkin devono essere espresse nello Standard Time del
  Giappone (UTC+9).
* I “bulleted points” del tuo ChangeLog devono essere anche copiati nel
  messaggio di commit di Subversion commit message. Questo messaggio
  sarà automaticamente inviato alla lista Ruby-CVS dopo il commit.
* lo stile K&amp;R per le dichiarazioni di funzioni è usato nel codice
  source di Ruby e nei suoi package di estensione.
* Per favore, non usare lo stile di commento per C++ (`//`); coloro che
  mantengono Ruby preferiscono invece lo stile di commento multilinea di
  C. (`/* .. */`)



[1]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[2]: http://subversion.apache.org/faq.html
[3]: http://svnbook.org
[4]: http://www.pragmaticprogrammer.com/titles/svn/
[5]: http://rubyforge.org/tracker/?func=browse&amp;group_id=426&amp;atid=1698
[6]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[7]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[8]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
