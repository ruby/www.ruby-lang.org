---
layout: news_post
title: "FileUtils vulnerabile ad attacchi dovuti a symlink race conditions"
author: "Fabio Cevasco"
lang: it
---

Una vulnerabilità dovuta a una race condition nei symlink è stata
trovata in FileUtils.remove\_entry\_secure. Tale vulnerabilità permette
ad utenti locali di cancellare file e directory arbitrari.

### Versioni di Ruby soggette a questa vulnerabilità

* Ruby 1.8.6 patchlevel 420 e tutte le precedenti versioni
* Ruby 1.8.7 patchlevel 330 e tutte le precedenti versioni
* Versioni in sviluppo di Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 430 e tutte le precedenti versioni
* Ruby 1.9.2 patchlevel 136 e tutte le precedenti versioni
* Versioni in sviluppo di Ruby 1.9 (1.9.3dev)

### Soluzioni

Questa vulnerabilità è stata corretta. Si raccomanda a tutti gli utenti affetti
di aggiornare la loro installazione di Ruby. Tuttavia, nota che questi attacchi
di race condition sui symlinknon possono essere evitati quando una qualsiasi
delle directory di livello superiore da dove si vogliono cancellare dei file
sono di proprietà di qualcuno di cui non puoi fidare, quindi, per essere
sicuro, devi verificare che **TUTTE** le directory di livello superiore non
possano essere rimosse da utenti non fidati, e che non siano scrivibili da
tutti tranne quando lo sticky bit è settato.

### Aggiornamenti

* 1.8.7-334 è stato rilasciato per correggere questo problema.
  Utenti che fanno uso di Ruby 1.8.7 sono pregati di aggiornare la loro
  installazione.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz)
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2)
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip](https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip)

* 1.9.1-p431 è stato rilasciato per correggere questo problema.
  Utenti che fanno uso di Ruby 1.9.1 sono pregati di aggiornare la loro
  installazione.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz)
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2)
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip)

* 1.9.2-p180 è stato rilasciato per correggere questo problema.
  Utenti che fanno uso di Ruby 1.9.2 sono pregati di aggiornare la loro
  installazione.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz)
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2)
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip)

* Corrette le versioni soggette a questa vulnerabilità per la serie 1.9.
