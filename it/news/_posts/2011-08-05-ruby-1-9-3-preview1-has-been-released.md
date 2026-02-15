---
layout: news_post
title: "Rilasciato Ruby 1.9.3 preview1"
author: "Fabio Cevasco"
lang: it
---

Ruby 1.9.3 preview1 è stato rilasciato. Questa è una prima preview della
prossima versione, e contiene ancora qualche piccolo baco, che sarà
tuttavia corretto nel prossimo rilascio, Ruby 1.9.3-p0.

Vedi i [ChangeLog][1] e [Notizie][2] per le descrizioni.

Ruby Inside ha pubblicato [una recensione di questa versione][3].

## Download

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2&gt;][4]
  SIZE: 9507455 bytes
  MD5: 7d93dc773c5824f05c6e6630d8c4bf9b
  SHA256: a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz&gt;][5]
  SIZE: 12186410 bytes
  MD5: 0f0220be4cc7c51a82c1bd8f6a0969f3
  SHA256: 75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip&gt;][6]
  SIZE: 13696708 bytes
  MD5: 960e08b2dc866c9987f17d0480de63a1
  SHA256: 249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

## Differenze rispetto alle versioni precedenti

Le versioni precedenti di Ruby sono state rilasciate con licenza
\"GPLv2\" e \"Ruby\", ma questa versione è rilasciata con una licenza
\"BSDL a due clausule\" (Licenza BSD semplificata) e \"Ruby\".

### Encoding

SJIS è ora un alias per Windows-31J, invece di Shift\_JIS.

### Librerie standard

* io/console: aggiunge funzionalità alle istanze di IO.
* openssl
* test/unit: supporta test paralleli

### Ulteriori cambiamenti

* Pathname e Date sono state re-implementate.
* Cambiata la strategia di VM locking.



[1]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/ChangeLog
[2]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/NEWS
[3]: http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
