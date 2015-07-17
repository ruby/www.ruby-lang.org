---
layout: news_post
title: "Rilasciato Ruby 2.0.0-p0"
author: "Fabio Cevasco"
date: 2013-03-03 15:10:16 +0000
lang: it
---

Siamo lieti di annunciare l\'uscita di Ruby 2.0.0-p0.

Ruby 2.0.0 è il primo rilascio stabile della serie Ruby 2.0, con molte
nuove funzionalità e miglioramenti in risposta alle crescenti e diverse
richieste per Ruby.

Buon divertimento con Ruby 2.0.0!

## Download

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## Cos\'è Ruby 2.0.0

### Nuove Funzionalità

In evidenza:

* Nuove funzionalità del linguaggio
  * Argomenti con parole chiave, che danno maggiore flessibilità al
    design di API
  * Module#prepend, un nuovo modo per estendere una classe
  * L\'espressione letterale %i, che può essere usata per creare
    facilmente un array di simboli
  * \_\_dir\_\_, che ritorna il nome della directory che contiene il
    file che eseguito correntemente
  * L\'encoding UTF-8 è ora il default, quindi è ora possibile omettere
    i \"commenti magici\" per configurare l\'encoding di un file
    sorgente

* Librerie incluse
  * Enumerable#lazy e Enumerator::Lazy, per creare (anche infiniti) lazy
    stream
  * Enumerator#size e Range#size, per ottenere una lazy size evaluation
  * \#to\_h, una nuova convenzione per la conversione a Hash
  * Onigmo, un nuovo motore per le espressioni regolari (un fork di
    Oniguruma)
  * API per la gestione asincrona delle eccezioni

* Supporto per il debug
  * Supporto di DTrace, che permette la diagnosi a runtime in produzione
  * TracePoint, un\'api per la tracciabilità migliorata

* Miglioramenti di prestazioni
  * Ottimizzazione del Garbage Collector tramite bitmap marking
  * Ottimizzazione di Kernel#require che rende molto veloce lo startup
    di Rails
  * Ottimizzazione della VM, per esempio sul dispatch dei metodi
  * Ottimizzazione delle operazioni con Float

In aggiunta, sebbene sia una funzionalità sperimentale, la versione
2.0.0 include i Raffinamenti (Refinements), che aggiungono un nuovo
concetto alla modularità di Ruby.

### Compatibilità

La versione 2.0.0 è stata progettata affinchè sia compatibile con la
versione 1.9. Sarà molto più facile migrare dalla 1.9 alla 2.0 di quanto
è stato migrare dalla versione 1.8 a 1.9. (Alcune incompatibilità degne
di nota sono descritte di seguito.)

Infatti, grazie alla dedizione e al lavoro di terzi, alcune popolari
applicazioni quali Rails e tDiary sembrano funzionare già con la release
candidate di Ruby 2.0.0.

### Documentazione

Abbiamo inoltre migliorato la documentazione, cosa che è stata richiesta
da molti utenti di Ruby. Abbiamo aggiunto tantissimo codice RDoc per
moduli e metodi. La versione 2.0.0 sarà documentata al 75%, mentre la
versione 1.9.3 era documentata circa al 60%. Inoltre, abbiamo anche
aggiunto una descrizione della sintassi di Ruby, come puoi vedere
eseguendo:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### Stabilità

Nota che al contrario della versione 1.9.0, la versione 2.0.0 è una
versione stabile, sebbene l\'ultimo numero sia uno 0. Tutti gli autori
di librerie sono fortemente invitati a supportare la versione 2.0.0.
Come menzionato in precedenza, la migrazione da 1.9 a 2.0 sarà
comparativamente facile.

Ruby 2.0.0 è pronto per essere utilizzato in produzione, e migliorerà
assolutamente il tuo modo di programmare in Ruby.

## Note

### Articoli introduttivi

Questi sono alcuni articoli introduttivi scritti da terze parti sulle
nuove funzionalità di Ruby 2.0.0:

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (completo, raccomandato)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (completo, raccomandato)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (breve, in Giapponese)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (solo su Enumerator::Lazy, in Giapponese)

I seguenti articoli sono inoltre utili, ma non aggiornati in materia di
Raffinamenti:

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

Inoltre, la recente edizione di \"Rubyist Magazine\" include alcuni
articoli che sono scritti dagli stessi autori delle nuove funzionalità,
per introdurre alcune nuove funzionalità rilasciate con Ruby 2.0.0.

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

Sebbene siano scritti in Giapponese, delle traduzioni in inglese saranno
disponibili in futuro.

### Incompatibilità

Ci sono cinque incompatibilità degne di nota di cui siamo a conoscenza:

* L\'encoding di default per gli script Ruby è ora UTF-8 \[#6679\].
  Alcune persone ci hanno notificato che questo ha impatto su programmi
  esistenti; per esempio alcuni programmi di benchark sembrano diventare
  più lenti \[ruby-dev:46547\].
* Iconv è stato rimosso, dal momento che era già stato deprecato quando
  M17N è stato introdotto in Ruby 1.9. Utilizza String#encode, ecc. al
  suo posto.
* Rottura di ABI (Application Binary Interface) \[ruby-core:48984\].
  Normalmente, gli utenti dovrebbero solamente reinstallare le
  estensioni. Ricordati di NON COPIARE file .so o .bundle dalla versione
  1.9.
* \#lines, #chars, #codepoints, #bytes ora ritornano un Array invece di
  un Enumerator \[#6670\]. Questo cambiamento permette di evitare il
  comune idioma \"lines.to\_a\". Per ritornare un Enumerator, utilizza
  #each\_line, ecc.
* Object#inspect ritorna sempre una stringa quale
  #&lt;ClassName:0x...&gt; invece di delegare a #to\_s. \[#2152\]

Ci sono inoltre altre incompatibilità minori. \[ruby-core:49119\]

### Stato dei Raffinamenti

La versione 2.0.0 includerà i raffinamenti (refinements) come una
\"funzionalità sperimentale\", siccome non siamo ancora tutti d\'accordo
su alcuni dettagli riguardanti le specifiche. Il comportamento di questa
funzionalità potrà cambiare in future versioni di Ruby. Malgrado ciò,
vorremmo che incominciassi ad utilizzare questa funzionalità e che ci
facessi pervenire le tue impressioni. Il tuo feedback aiuterà a forgiare
questa interessante funzionalità.

## Ringraziamenti

Moltissime persone hanno contribuito a Ruby 2.0.0.

Anche una lista incompleta con solo alcune parti dei contributi è troppo
lunga per essere inserita in questo annuncio, quindi, ecco qui un link
alla pagina che contiene i ringraziamenti speciali:

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

Grazie a tutti!



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
