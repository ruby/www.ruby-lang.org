---
layout: news_post
title: "Rilasciato Ruby 1.9.1-p429"
author: "Fabio Cevasco"
lang: it
---

Ruby 1.9.1-p429 è stato appena rilasciato. Questa è un rilascio a
livello di patch per Ruby 1.9.1, che corregge molti bachi e include la
correzione per una vulnerabilità di sicurezza che permette l\'esecuzione
di un codice arbitrario.

## Vulnerabilità

### Descrizione

Una vulnerabilità di sicurezza che causa buffer overlow
nell\'assegnazione di un valore pericoloso a ARGF.implace\_mode, su
Windows. Questo rende possibile eseguire codice arbitrario.

Le versioni affette da questa vulnerabilità sono:

* Ruby 1.9.1 patchlevel 378 e precedenti;
* Ruby 1.9.2 preview 3 e precedenti;
* Versioni di sviluppo di ruby 1.9 (1.9.3dev).

è raccomandato l\'aggiornamento di Ruby 1.9 a 1.9.1-p429 o 1.9.2-rc1.

La vulnerabilità non riguarda direttamente Ruby 1.8.

### Crediti

Questa vulnerabilità è state scoperta e segnalata da Masaya TARUI.

## Scarica

* [ruby-1.9.1-p429.tar.bz2][1]
  * SIZE: 7300923 bytes
  * MD5: 09df32ae51b6337f7a2e3b1909b26213
  * SHA256: e0b9471d77354628a8041068f45734eb2d99f5b5df08fe5a76d785d989a47bfb

* [ruby-1.9.1-p429.tar.gz][2]
  * SIZE: 9078126 bytes
  * MD5: 0f6d7630f26042e00bc59875755cf879
  * SHA256: fdd97f52873b70f378ac73c76a1b2778e210582ce5fe1e1c241c37bd906b43b2

* [ruby-1.9.1-p429.zip][3]
  * SIZE: 10347659 bytes
  * MD5: fcd031414e5e4534f97aa195bb586d6c
  * SHA256: c9fe2364b477ad004030f4feeb89aeaa2a01675ff95db1bed31a932806f85680



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.zip
