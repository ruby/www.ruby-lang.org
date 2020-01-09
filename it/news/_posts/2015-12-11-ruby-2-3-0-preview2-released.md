---
layout: news_post
title: "Ruby 2.3.0-preview2 Released"
author: "naruse"
translator: "simo2409"
date: 2015-12-11 14:00:00 +0000
lang: it
---

Siamo lieti di annunciare il rilascio di Ruby 2.3.0-preview2.

Ruby 2.3.0-preview2 è la seconda anteprima di Ruby 2.3.0.
Sono state aggiunte molte nuove funzionalità e miglioramenti.

E' stato aggiunto il [Frozen String Literal Pragma](https://bugs.ruby-lang.org/issues/11473).
Su Ruby 2.1 `"str".freeze` è
stato ottimizzato per ridurre il numero di oggetti allocati in memoria. Ruby 2.3
introduce un nuovo commento 'magico' e un'opzione da linea di comando che
permette di congelare tutte le stringhe nel codice sorgente.
Inoltre per poter debuggare le proprie applicazioni, potete individuare dove sia
stato creato l'oggetto che causa l'errore `"can't modify frozen String"` passando
l'opzione `--debug=frozen-string-literal`.

Il [safe navigation operator](https://bugs.ruby-lang.org/issues/11537)
([chiamato anche lonely operator](https://instagram.com/p/-M9l6mRPLR/)) `&.`,
che esiste già in linguaggi come C#, Groovy e Swift, è stato introdotto per
rendere più semplice la gestione di oggetti che potrebbero essere `nil`,
scrivendo ad esempio `obj&.foo`. Inoltre sono stati aggiunti `Array#dig` e
`Hash#dig`.

E' stata anche aggiunta la gemma
[did_you_mean](https://bugs.ruby-lang.org/issues/11252), che mostra le possibili
alternative quando si incontrano `NameError` o `NoMethodError` per rendere più
semplice il debug delle nostre applicazioni.

Sono stati aggiunti [RubyVM::InstructionSequence#to_binary e .load_from_binary](https://bugs.ruby-lang.org/issues/11788)
come funzionalità sperimentali.
Con queste funzionalità, possiamo creare un sistema di pre-compilazione ISeq (bytecode).

Ruby 2.3 include molti fix per migliorare le performance.
Ad esempio,
[ottimizzazzione Proc#call](https://bugs.ruby-lang.org/issues/11569),
[reconsidering method entry data structure](https://bugs.ruby-lang.org/issues/11278),
[l'introduzione di una nuova struttura dati](https://bugs.ruby-lang.org/issues/11420),
a livello del codice macchina per ottimizzare l'allocazione degli oggetti e il codice relativo all'invocazione dei metodi, oltre ad altre molte ottimizzazioni.

Provate e godetevi Ruby 2.3.0-preview2 e fateci sapere cosa ne pensate!

## Modifiche importanti da 2.2

Vedi le [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS)
e il [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
per maggiori dettagli.

Con queste modifiche, [1097 file modificati, 97466 aggiunte(+), 58685 rimozioni(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2) a partire da Ruby 2.2.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Commento alla release

Potete leggere anche il programma delle release e altre informazioni qui:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
