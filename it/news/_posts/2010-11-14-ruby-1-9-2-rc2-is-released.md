---
layout: news_post
title: "Rilasciato Ruby 1.9.2 RC2"
author: "Fabio Cevasco"
lang: it
---

Ruby 1.9.2 RC2 è stato appena rilasciato. Questo è il secondo release
candidate per Ruby 1.9.2.

La libreria psych è stata aggiornata dal rilascio del primo release
candidate, e alcuni problemi minori sono stati corretti.

Per ulteriori dettagli, vedi [NEWS][1] e [ChangeLog][2].

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

## Scarica

* [ruby-1.9.2-rc2.tar.bz2][3]
  * SIZE: 8480974 bytes
  * MD5: 4e4906d0aab711286b31f5a834860cc3
  * SHA256: 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [ruby-1.9.2-rc2.tar.gz][4]
  * SIZE: 10781884 bytes
  * MD5: d12cd39eee4d99bc54b52aba5a0ba4e1
  * SHA256: 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [ruby-1.9.2-rc2.zip][5]
  * SIZE: 12161233 bytes
  * MD5: 05229b43981e4e5ce58b5fb2e98eee52
  * SHA256: 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc2
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc2
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
