---
layout: news_post
title: "Rilasciato Ruby 2.3.0-preview1"
author: "naruse"
translator: "Arkham"
date: 2015-11-11 14:00:00 +0000
lang: it
---

Siamo lieti di annunciare il rilascio di Ruby 2.3.0-preview1.

Ruby 2.3.0-preview1 è la prima anteprima di Ruby 2.3.0.
Sono state aggiunte molte nuove funzionalità e miglioramenti.

E' stato aggiunto il [Frozen String Literal
Pragma](https://bugs.ruby-lang.org/issues/11473). Su Ruby 2.1 `"str".freeze` è
stato ottimizzato per ridurre il numero di oggetti allocati in memoria. Ruby 2.3
introduce un nuovo commento 'magico' e un'opzione da linea di comando che
permette di congelare tutte le stringhe nel codice sorgente.
Inoltre per poter debuggare le proprie applicazioni, potete individuare dove sia
stato creato l'oggetto che causa l'errore `"can't modify frozen String"` passando
l'opzione `--enable-frozen-string-literal-debug`.

Il [safe navigation operator](https://bugs.ruby-lang.org/issues/11537),
che esiste già in linguaggi come C#, Groovy e Swift, è stato introdotto per
rendere più semplice la gestione di oggetti che potrebbero essere `nil`,
scrivendo ad esempio `obj&.foo`. Inoltre sono stati aggiunti `Array#dig` e
`Hash#dig`.

E' stata anche aggiunta la gemma
[did_you_mean](https://bugs.ruby-lang.org/issues/11252), che mostra le possibili
alternative quando si incontrano `NameError` o `NoMethodError` per rendere più
semplice il debug delle nostre applicazioni.

Provate la nuova preview e fateci sapere cosa ne pensate!

## Modifiche importanti dalla versione 2.2

* Da definire

Potete leggere le [news](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS) e il
[changelog](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog) per
tutti i dettagli.

In tutto, 1036 file cambiati, 81312 aggiunte(+), 51322 rimozioni(-) da Ruby
2.2.0.

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2>

  * SIZE:   14174035 bytes
  * SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
  * SHA256: 42b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
  * SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz>

  * SIZE:   17560800 bytes
  * SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
  * SHA256: dc8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
  * SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz>

  * SIZE:   11225228 bytes
  * SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
  * SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
  * SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip>

  * SIZE:   19777010 bytes
  * SHA1:   3458666c250dd333ac4b537be25f1913dd311ea1
  * SHA256: 0fc1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
  * SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## Commenti

Potete leggere anche il programma delle release e altre informazioni qui:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
