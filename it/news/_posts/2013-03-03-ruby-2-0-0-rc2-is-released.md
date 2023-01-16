---
layout: news_post
title: "Rilasciato Ruby 2.0.0-rc2"
author: "Fabio Cevasco"
date: 2013-03-03 13:45:00 +0000
lang: it
---

Ruby 2.0.0-rc2 è stato rilasciato. Questa sarà l\'ultima release
candidate di Ruby 2.0.0.

Provalo e notificaci in merito a qualsiasi problema.

## Download

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## Nuove funzionalità della versione 2.0.0

* Argomenti con parole chiave
* Enumerable#lazy
* Module#prepend
* \#to\_h: Convenzione per convertire ad Hash
* %i: un espressione letterale per un array di simboli
* Aggiornato il motore delle espressioni regolari: Onigmo (un fork di
  Oniguruma)
* Introduzione di Enumerator#size e Range#size
* Supporto DTrace
* TracePoint
* Ottimizzazione di require (specialmente su Windows)
* Supporto NativeClient
* Miglioramenti alla documentazione
* Migliorata gestione degli interrupt asincroni
* Tuning dei parametri di stack size a launch-time
* Raffinamenti \[sperimentale\]

... e molti altri miglioramenti. Vedi le notizie per i dettagli.

Qui ci sono alcuni articoli introduttivi scritti da terze parti:

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Raffinamenti)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (in Giapponese)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, in Giapponese)

(Se vuoi fornirci altri articoli, li potremo citare o menzionare nel
prossimo annuncio)

## Note

### Incompatibilità

Ci sono alcune incompatibilità degne di nota di cui siamo a conoscenza:

* L\'encoding di default per gli script Ruby è ora UTF-8
  [\[#6679\]][10]. Alcune persone riportano che questo può creare
  qualche problema a programmi già esistenti, per esempio alcuni
  programmi di benchmark potrebbero diventare più lenti
  [\[ruby-dev:46547\]][11]. Questa specifica potrebbe cambiare con la
  versione ufficiale.
* iconv è stato rimosso, dal momento che era già stato deprecato quando
  M17N è stato introdotto in Ruby 1.9. Utilizza String#encode, ecc. al
  suo posto.
* Rottura di ABI (Application Binary Interface)
  [\[ruby-core:48984\]][12]. Normalmente, gli utenti dovrebbero
  solamente reinstallare le estensioni. Ricordati di NON COPIARE file
  .so o .bundle dalla versione 1.9.

Altre incompatibilità minori. [\[ruby-core:49119\]][13] Se trovi altre
incompatibilità, per favore notificacele.

Stiamo inoltre creando delle note per l\'aggiornamento, ma alcune parti
non sono più aggiornate.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### Stato dei Raffinamenti

La versione 2.0.0 includerà i raffinamenti (refinements) come una
\"funzionalità sperimentale\", siccome non siamo ancora tutti d\'accordo
su alcuni dettagli riguardanti le specifiche. Il comportamento di questa
funzionalità potrà cambiare in future versioni di Ruby.

### Ringraziamenti speciali

L\'autore ringrazia tutti coloro che hanno provato le versioni preview e
rc1!

Grazie a tutti i collaboratori, che con il loro duro lavoro hanno
corretto molti bachi, e grazie a tutti le persone che hanno aiutato
l\'autore a preparare questa versione.



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
