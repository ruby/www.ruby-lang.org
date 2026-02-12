---
layout: news_post
title: "Rilasciato Ruby 1.9.2"
author: "Fabio Cevasco"
lang: it
---

Ruby 1.9.2 è stato rilasciato. Questa è la versione più nuova di Ruby per
la serie 1.9.

### Informazione Ruby 1.9.2

Ruby 1.9.2 sarà prevalentemente compatibile con la versione 1.9.1,
eccetto per i cambiamenti seguenti:

* molti nuovi metodi
* una nuova API per i socket (con supporto IPv6)
* nuovi encoding
* una classe \`Random\` che supporta vari generatori di numeri casuali
* la classe \`Time\` è stata reimplementata. Non è più presente alcun
  problema con l\'anno 2038.
* alcuni miglioramenti riguardanti le espressioni regolari
* \`$:\` non include più la cartella corrente
* \`dl\` è stata reimplementata sulla base di \`libffi\`
* una nuova libreria \`psych\` che wrappa \`libyaml\`.
  È possibile usare questa libreria invece di \`syck\`.

Vedere i file
[NEWS](https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc1) e
[ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc1)
per ulteriori dettagli.

Ruby 1.9.2 passa più del 99% della [RubySpec][1].

### Piattaforme Supportate

Ruby 1.9 ha quattro livelli di supporto.

Supportato
: Abbiamo verificato che Ruby 1.9.2 funziona perfettamente su queste
  piattaforme. Per questa ragione continuiamo a mantenere la versione
  1.9.2 per questi sistemi.

  * Debian GNU/Linux 5.0 on IA32.

Con i migliori sforzi
: Abbiamo verificato che Ruby 1.9.2 funziona bene, per la maggior parte,
  su queste piattaforme. Per questa ragione continuiamo a mantenere la
  versione 1.9.2 per questi sistemi.

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) e 10.6
  * FreeBSD 6 e successivo (amd64, IA32)
  * Solaris 10
  * Symbian OS

Forse
: Pensiamo che Ruby 1.9.2 possa funzionare bene su queste piattaforme,
  con qualche piccola modifica. Ciononostante, non è stato verificato e
  patch sono ben accette.

  * Altre distribuzioni di Linux
  * Altre versioni di MacOS X.
  * cygwin
  * AIX 5
  * Altri sistemi POSIX-compatibili
  * BeOS (Haiku)

Non Supportato
: Non pensiamo che Ruby 1.9.2 funzioni su queste piattaforme. Porting
  ben accetto.

  * Qualsiasi altro sistema

### Domande Frequenti

la standard library è installata in /usr/local/lib/ruby/1.9.1
: Il secondo numero numero di versione è la \"versione per la
  compatibilità con le librerie\". Ruby 1.9.2 è per la maggior parte
  compatibile con 1.9.1, per questo la sua libreria è installata in
  questa cartella.

Causa un LoadError
: `$:` non include più la directory corrente. Alcuni script hanno
  bisogno di essere modificati per funzionare correttamente. In ogni
  caso, uno script non dovrebbe dipendere dalla cartella corrente, nei
  limiti del possibile.

### Scarica

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][2]
  SIZE
  : 8495472 bytes

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][3]
  SIZE
  : 10787899 bytes

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][4]
  SIZE
  : 12159728 bytes

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://github.com/ruby/spec
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
