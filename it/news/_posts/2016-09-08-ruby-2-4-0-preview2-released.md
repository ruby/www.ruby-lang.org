---
layout: news_post
title: "Rilasciato Ruby 2.4.0-preview2"
author: "naruse"
translator: "alepore"
date: 2016-09-08 09:00:00 +0000
lang: it
---

Siamo lieti di annunciare la release di Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 è la prima anteprima di Ruby 2.4.0.
Questa preview2 è rilasciata per avere dei feedback dalla community.
[Mandate pure feedback](https://github.com/ruby/ruby/wiki/How-To-Report)
poiché potete ancora influenzare le features.

## [Fixnum e Bignum unificati in Integer](https://bugs.ruby-lang.org/issues/12005)

Anche se [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
non specifica i dettagli della classe Integer, Ruby ha due classi Integer:
Fixnum e Bignum.
Ruby 2.4 le unisce in Integer.
Tutte le estensioni C che usano le classi Fixnum o Bignum devono essere
modificate.

Si vedano inoltre [il ticket](https://bugs.ruby-lang.org/issues/12005) e
[le slide di akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String supporta i case mapping Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` ora gestiscono i case
mapping Unicode invede dei soli case mapping ASCII.

## Miglioramenti di Performance

Ruby 2.4 include anche le seguenti migliorie prestazionali:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` e `[x, y].min` in alcuni casi sono ottimizzati per non creare un
array temporaneo.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

È stato aggiunto `Regexp#match?`, che esegue un match regexp senza creare un
back reference object e cambiando `$~` per ridurre l'allocazione di oggetti.

### Altre migliorie di performance

* [accesso delle variabili di istanza più veloce](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception e Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignora le eccezioni nei threads a meno che un altro thread non le acceda
esplicitamente.
Con `report_on_exception = true`, vi potete accorgere se un thread è morto per
un'eccezione non gestita.

Mandateci feedback su quale dovrebbe essere il default di `report_on_exception`
e riguardo report-on-GC, che mostra un report quando un thread è
garbage collected without join.

### [La Deadlock detection di Thread ora mostra i thread con backtrace e dipendenze](https://bugs.ruby-lang.org/issues/8214)

Ruby ha una deadlock detection sui thread in attesa, ma il suo report non
include abbasta informazioni per il debug.
La deadlock detection di Ruby 2.4's mostra i thread con il loro backtrace e i
thread dipendenti.

Dilettatevi nella programmazione con Ruby 2.4.0-preview2 e
[mandateci feedback](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Modifiche importanti dalla 2.3

* Supporta OpenSSL 1.1.0
* ext/tk rimosso dalla stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

Vedere le [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
e il [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
per i dettagli.

Con queste modifiche abbiamo
[2353 file modificati, 289057 inserimenti(+), 73847 rimozioni(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
da Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Commento alla release

Per il release schedule e altre informazioni vedere anche:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
