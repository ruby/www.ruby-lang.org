---
layout: news_post
title: "Ruby 2.3.0 Released"
author: "naruse"
translator: "simo2409"
date: 2015-12-25 17:00:00 +0000
lang: it
---

Siamo lieti di annunciare la release di Ruby 2.3.0.

Questa è la prima release stabile della serie Ruby 2.3.
Questa versione introduce nuove funzionalità, ad esempio:

Il [frozen string literal pragma](https://bugs.ruby-lang.org/issues/11473).
Su Ruby 2.1 `"str".freeze` è stato ottimizzato per ridurre il numero di oggetti allocati in memoria.
Ruby 2.3 introduce un nuovo commento 'magico' e un'opzione da linea di comando che
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
Da notare che si comporta come [try! di Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
che tratta in maniera particolare solo `nil`.

La gemma [did_you_mean](https://bugs.ruby-lang.org/issues/11252),
che mostra le possibili alternative quando si incontrano `NameError` o
`NoMethodError` per rendere più semplice il debug delle nostre applicazioni.

[RubyVM::InstructionSequence#to_binary e .load_from_binary](https://bugs.ruby-lang.org/issues/11788) sono stati aggiunte come funzionalità sperimentali.
Con queste funzionalità, possiamo creare un sistema di pre-compilazione ISeq (bytecode).

Questa release include anche molti miglioramenti alle performance, come ad esempio:
[reconsidering method entry data structure](https://bugs.ruby-lang.org/issues/11278),
[introducing new table data structure](https://bugs.ruby-lang.org/issues/11420),
[ottimizzazione di Proc#call](https://bugs.ruby-lang.org/issues/11569),
un'ottimizzazione a livello di codice macchina per ottimizzare l'allocazione
degli oggetti e l'invocazione dei metodi,
[smarter instance variable data structure](https://bugs.ruby-lang.org/issues/11170),
[`exception: false` keyword argument support on Socket#*_nonblock methods](https://bugs.ruby-lang.org/issues/11229)
e così via. Controllare la sezione "Implementation improvements" nel file NEWS.

Per una lista completa delle nuove funzionalità e le note sulla compatibilità, vedere il file
[NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) e il
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Con queste modifiche, [2946 files modificati, 104057 aggiunte(+), 59478 rimozioni(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0) da Ruby 2.2.0!

Buon natale, Buone feste e buon divertimento con Ruby 2.3!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
