---
layout: news_post
title: "I metodi della classe Exception possono bypassare $SAFE"
author: "Fabio Cevasco"
lang: it
---

Il metodo Exception#to\_s può essere usato per bypassare il controllo
$SAFE, e ciò rende possibile la modifica di stringhe arbitrarie tramite
codice **untrusted**.

### Descrizione dettagliata

Secondo le semantiche della variabile $SAFE, un safe level di 4 è usato
per eseguire codice *untrusted* (come ad esempio un plugin). In questo
modo, per i livelli superiori, alcune operazioni sono proibite per
prevenire codice *untrusted* dall\'attaccare dati *trusted*.

Il metodo Exception#to\_s si è rivelato problematico in questo ambito.
Il metodo può bypassare il meccanismo dei safe level e modificare in
maniera distruttiva una stringa *untained* in modo che diventi
*tainted*. In questo modo, un utente con cattive intenzioni può
modificare stringhe *untainted* arbitrarie, così:

    $secret_path = "foo"

    proc do
        $SAFE = 4
        Exception.new($secret_path).to_s
        $secret_path.replace "/etc/passwd"
    end.call

    open($secret_path) do
      ...
    end

### Versioni soggette a questa vulnerabilità

Fortunatamente questo tipo di attacco non ha effetto per le versioni
1.9.x di Ruby. Le versioni affette sono ristrette alle seguenti:

* Ruby 1.8.6 patchlevel 420 e tutte le versioni precedenti
* Ruby 1.8.7 patchlevel 330 e tutte le versioni precedenti
* Versioni di sviluppo di Ruby 1.8 (1.8.8dev)

### Soluzioni

Aggiornamento ad una nuova versione.

### Aggiornamenti

* 1\.8.7-334 è stato rilasciato per correggere questo problema. Tutti gli
  utenti d Ruby 1.8.7 sono pregati di aggiornare la propria
  installazione.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
