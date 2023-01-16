---
layout: page
title: "Ruby Core"
lang: it
---

Questo è un momento fantastico per partecipare a quello che avviene nel
mondo Ruby. Data la crescente attenzione che Ruby ha ricevuto nel corso
degli ultimi anni, è aumentato il bisogno di persone con talento per
aiutare a migliorare Ruby e a documentare le parti che lo compongono.
Allora, da dove vuoi cominciare?
{: .summary}

I temi principali riguardanti lo sviluppo di Ruby sono:

* [Usare Subversion per seguire lo sviluppo di Ruby](#following-ruby)
* [Come usare Git con il principale Ruby Repository](#git-ruby)
* [Migliorare Ruby, patch dopo patch](#patching-ruby)
* [Regole per i Core Developer](#coding-standards)

### Usare Subversion per seguire lo sviluppo di Ruby
{: #following-ruby}

Per fare checkout del più recente codice Ruby, devi semplicemente fare
il login usando l’account anonimo di [Subversion][1]. Dalla linea di comando:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

La directory `ruby` contiene ora il codice sorgente più recente per la
versione di sviluppo di Ruby (ruby-trunk). Attualmente le patch
applicate al trunk verranno effettivamente applicate ai branch
stabili 2.0.0 e 1.9.3 (vedi sotto).

Se sei interessato a seguire il patching di Ruby 2.0.0, devi fare checkout
del branch `ruby_2_0_0`\:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_2_0_0
{% endhighlight %}

Se sei interessato a seguire il patching di Ruby 1.9.3, devi fare checkout
del branch `ruby_1_9_3`\:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_3
{% endhighlight %}

Questo comando effettua il checkout del development tree su una
directory `ruby_1_9_3`. Ai programmatori che lavorano su Ruby 1.9.3 viene
richiesto di migrare le loro modifiche sul ramo principale (Ruby trunk),
con frequenza tale che i due rami restino molti simili, con l’eccezione
dei miglioramenti fatti da Matz e Nobu sul linguaggio stesso.

Se preferisci, puoi anche seguire [Ruby’s Subversion repository via the web][2].

Per informazioni su Subversion, fai riferimento a [Subversion FAQ][3] e
a [the Subversion book][4]. Come alternativa, un eccellente testo
introduttivo è il [Pragmatic Version Control with Subversion][5].

### Come usare Git con il principale Ruby Repository
{: #git-ruby}

Coloro che preferissero usare [Git][6] al posto di Subversion possono
trovare istruzioni con [il mirror su GitHub][7], sia per quelli con
[il commit access][8] sia per [tutti gli altri][9].

### Migliorare Ruby, patch dopo patch
{: #patching-ruby}

Rubyforge mantiene un [issue tracker][10] per notificare patch e
segnalazioni di errori a Matz e al resto del gruppo. Questi rapporti
vengono anche notificati alla [Ruby-Core mailing list][mailing-lists]
per discussione, e quindi puoi essere sicuro che la tua richiesta non sarà ignorata.
Puoi anche inviare le tue patch alla mailing list. In ogni caso, non
esitare a prendere parte alla discussione che ne seguirà.

Per favore dai un occhiata alla [Patch Writer’s Guide][11] per ricevere qualche consiglio,
direttamente da Matz, su come fare in modo che le tue patch vengano considerate.

In sintesi, i passi per costruire un patch sono:

1.  Fai il check out di una copia del sorgente di Ruby da Subversion.
    Di solito le patch per correggere i bug o introdurre nuove feature
    devono essere sottoposte al ramo principale (‘trunk’) del Ruby source.
    Persino se vuoi aggiungere una feature a Ruby 1.9.3, deve essere
    provata prima nel trunk.

        $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

    Se stai correngendo un bug che è specifico di un solo branch
    di manuntenzione, fai il check out di una copia del rispettivo
    branch, ad esempio `ruby_1_9.3`.

        $ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_3

2.  Aggiungi le tue modifiche al codice.

3.  Crea una patch.

        $ svn diff > ruby-changes.patch

4.  Crea un ticket nel [issue tracker][10] o manda via mail la tua patch
    [Ruby-Core mailing list][mailing-lists] con una entry sul
    ChangeLog che descrive la patch.

5.  Se non ci sono obiezioni alla patch, i committer daranno
    l’approvazione per applicarla.

**Per favore, fai attenzione a quanto segue:** le patch devono essere
notificate come un [unified diff][12]. Per ulteriori informazioni sulla
procedura di merge dei patch , vedi [the diffutils reference][13].

La discussione sullo sviluppo di Ruby converge sulla
[Ruby-Core mailing list][mailing-lists]. Quindi, se hai curiosità
di sapere se il tuo patch è utile oppure se vuoi innescare una
discussione sul futuro di Ruby, non esitare ad entrare nella mischia.
Tuttavia, tieni presente che: discussioni fuori soggetto non sono
tollerate in questa lista; il livello di distrazione (‘noise’) deve
essere al minimo; e ogni soggetto presentato deve essere identificato e
descritto con estrema chiarezza. Siccome ti stai rivolgendo al Creatore
di Ruby, non stona esprimere una certa riverenza.

Tieni presente che gli sviluppatori di Ruby Core vivono in Giappone e
che, anche se molti parlano un ottimo inglese, c’è una notevole
differenza di fuso orario. Essi hanno inoltre un insieme di liste di
sviluppo in giapponese insieme a quelle in inglese. Sii paziente;
se la tua richiesta non è stata presa in gestione prova di nuovo qualche
giorno più tardi.

### Regole per i Core Developer
{: #coding-standards}

In generale, gli sviluppatori di Ruby devono avere familiarità con il
codice source e lo stile di sviluppo usato dal team. Per chiarezza, le
seguenti norme devono essere osservate al momento del checkin in
Subversion:

* Ogni checkin deve essere descritto nel `ChangeLog`, seguendo le [GNU
  conventions][14]. (Molti core developers di Ruby usano Emacs `add-log`
  mode, che può essere attivato col comando `C-x 4 a`.)
* Le date di checkin devono essere espresse nello Standard Time del
  Giappone (UTC+9).
* I “bulleted points” del tuo ChangeLog devono essere anche copiati nel
  messaggio di commit di Subversion commit message. Questo messaggio
  sarà automaticamente inviato alla lista Ruby-CVS dopo il commit.
* lo stile ANSI per le dichiarazioni di funzioni è usato nel codice
  source di Ruby e nei suoi package di estensione.
* Per favore, non usare lo stile di commento per C++ (`//`); coloro che
  mantengono Ruby preferiscono invece lo stile di commento multilinea
  di C (`/* .. */`).

Guarda anche le informazioni su [Ruby’s issue tracker][10].



[mailing-lists]: /it/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: https://github.com/ruby/ruby
[8]: https://github.com/shyouhei/ruby/wiki/committerhowto
[9]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: https://blade.ruby-lang.org/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
