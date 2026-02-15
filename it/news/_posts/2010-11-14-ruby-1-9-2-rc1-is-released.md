---
layout: news_post
title: "Rilasciato Ruby 1.9.2 RC1"
author: "Fabio Cevasco"
lang: it
---

Ruby 1.9.2 RC1 è stato appena rilasciato. Questo è un release candidate
per Ruby 1.9.2.

## Informazioni su Ruby 1.9.2

Ruby 1.9.2 sarà prevalentemente compatibile con la versione 1.9.1,
eccetto per i cambiamenti seguenti:

* molti nuovi metodi
* una nuova API per i socket (con supporto IPv6)
* nuovi encoding
* una classe `Random` che supporta vari generatori di numeri casuali
* la classe `Time` è stata reimplementata. Non è più presente alcun
  problema con l\'anno 2038.
* alcuni miglioramenti riguardanti le espressioni regolari
* `$:` non include più la cartella corrente
* `dl` è stata reimplementata sulla base di `libffi`
* una nuova libreria `psych` che wrappa `libyaml`. è possibile usare
  questa libreria invece di `syck`

Vedere i file [NEWS][1] e [ChangeLog][2] per ulteriori dettagli.

Circa 130 bachi sono stati corretti dalla release 1.9.2 preview 3. Tutti
i maggiori bachi conosciuti nella versione 1.9.2 sono stati messi a
posto, eccetto per [#3462][3].

Secondo la schedulazione, Ruby 1.9.2 sarà rilasciato ad Agosto 2010. La
schedulazione di Ruby 1.9.2 è stata ritardata per fare in modi che passi
la RubySpec. Al momento, Ruby 1.9.2 passa più del 99% della RubySpec.
Prova il nuovo Ruby e facci sapere tramite [il nostro issue tracker][4]
se trovi qualche problema.

## Scarica

* [ruby-1.9.2-rc1.tar.bz2][5]
  * SIZE: 8479087 bytes
  * MD5: 242dcfaed8359a6918941b55d0806bf0
  * SHA256: c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [ruby-1.9.2-rc1.tar.gz](URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz)
  * SIZE: 10779309 bytes
  * MD5: fdedd5b42ae89a9a46797823ad2d9acf
  * SHA256: 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [ruby-1.9.2-rc1.zip][6]
  * SIZE: 12158992 bytes
  * MD5: 3da59c5d3567f6e1f1697abbef71f507
  * SHA256: 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/ChangeLog
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
