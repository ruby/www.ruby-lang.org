---
layout: news_post
title: "Rilasciato Ruby 2.2.0"
author: "naruse"
translator: "alepore"
date: 2014-12-25 09:00:00 +0000
lang: it
---

Siamo lieti di annunciare il rilascio di Ruby 2.2.0.

Ruby 2.2 include numerose nuove feature e miglioramenti per le sempre più varie
esigenze di Ruby.

Ad esempio il Garbage Collector di Ruby è ora in grado di raccogliere gli
oggetti di tipo Symbol.
Questo riduce l'utilizzo di memoria dei Symbol.
Poiché Rails 5.0 richiederà il GC dei Symbol esso supporterà solamente Ruby 2.2
e successivi.
(Vedere il [post di release di Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)
per dettagli.)

La riduzione dei tempi di pausa grazie al nuovo Garbage Collector Incrementale
sarà inoltre utile all'esecuzione delle applicazioni Rails.
Recenti sviluppi menzionati nel [blog di Rails](http://weblog.rubyonrails.org/)
suggeriscono che Rails 5.0 trarrà vantaggio dal GC Incrementale oltre che dal GC
dei Symbol.

Un'altra feature relativa alla gestione della memoria è un'opzione aggiuntiva
per `configure.in` per usare jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Questa feature è ancora sperimentale e disabilitata di default finché non
raccoglieremo dati sulle performance e più casi di applicazione. Quando saremo
convinti dei benefici questa feature sarà abilitata di default.

È stato aggiunto il supporto sperimentale per usare vfork(2) con system() ed è
stato anche aggiunto spawn(). Potete leggere di più sul
[blog in giapponese di tanaka-san](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Questo può potenzialmente portare grandi benefici prestazionali quando un grosso
processo esegue molte volte dei comandi esterni.
vfork(2) non è comunque ancora molto conosciuto e potrebbe essere una system
call potenzialmente pericolosa. Ci piacerebbe fare esperimenti per capire quanti
benefici può portare, raccogliendo dati sulle performance e casi di
applicazione.

Provate e godetevi la programmazione con Ruby 2.2.0, e fateci sapere le vostre
scoperte!

## Principali modifiche dalla versione 2.1

* [GC incrementale](https://bugs.ruby-lang.org/issues/10137)
  ([presentazione RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [GC dei Symbol](https://bugs.ruby-lang.org/issues/9634)
  ([presentazione RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configurazione --with-jemalloc
  [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* librerie core:
  * Supporto Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Nuovi metodi:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* ibrerie incluse:
  * Aggiornamento Psych 2.0.8
  * Aggiornamento Rake 10.4.2
  * Aggiornamento RDoc 4.2.0
  * Aggiornamento RubyGems 2.4.5
  * Aggiornamento test-unit 3.0.8 (rimosso dal repository ma fornito in tarball)
  * Aggiornamento minitest 5.4.3 (rimosso dal repository ma fornito in tarball)
  * Deprecata mathn
* API C
  * Rimosse API deprecate

Si veda [NEWS sul repository Ruby](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
per dettagli.

1557 files modificati, 125039 aggiunte, 74376 rimozioni dalla v2.1.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
