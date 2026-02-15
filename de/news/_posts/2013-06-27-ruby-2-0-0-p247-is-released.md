---
layout: news_post
title: "Ruby 2.0.0-p247 veröffentlicht"
author: "nagachika"
translator: "Marvin Gülker"
date: 2013-06-27 11:00:03 +0000
lang: de
---

Ruby 2.0.0-p247 ist veröffentlicht worden.

Dieses Release schließt eine Sicherheitslücke im mitgelieferten
OpenSSL:

* [Umgehung von Hostname-Check im SSL-Client
  (CVE-2013-4073)](/de/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

Diese Version enthält auch einige Bugfixes.

## Download

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      SIZE:   10804581 bytes
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      SIZE:   13652782 bytes
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      SIZE:   15100206 bytes
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## Änderungen

Größere Fixes sind unten aufgeführt.

Siehe die [Tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
und das [Changelog](https://github.com/ruby/ruby/blob//v2_0_0_247/ChangeLog)
für nähere Informationen.

### Benannte Argumente

* [#8040](https://bugs.ruby-lang.org/issues/8040) Priorität zwischen benannten Argumenten und erforderlichen Argumenten verändert
* [#8416](https://bugs.ruby-lang.org/issues/8416) `super` gibt weder benannte noch anonyme Argumente mittels `**` weiter
* [#8463](https://bugs.ruby-lang.org/issues/8463) Auto-Splat-Bug mit Procs und benannten Argumenten

### VM/Sprachverarbeitung

* [#8424](https://bugs.ruby-lang.org/issues/8424) Korrigiere Endlosschleife bei Stackoverflow mit `TM_PUSH_TAG()`
* [#8436](https://bugs.ruby-lang.org/issues/8436) `__dir__` funktioniert nicht in `eval` mit binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: `B_RETURN_EVENT` wird nicht ausgelöst, wenn "next" benutzt wird
* [#8341](https://bugs.ruby-lang.org/issues/8341) `block_given?` (und der tatsächliche Block) werden zwischen Aufrufen an einen Proc, der aus einer Methode erzeugt wurde, gespeichert (mithilfe von `method().to_proc()`)
* [#8531](https://bugs.ruby-lang.org/issues/8531) `block_given?` (und der tatsächliche Block) werden zwischen Aufrufen an einen Proc, der durch Symbol#to_proc erzeugt wurde, gespeichert

### RubyGems

Die mitgelieferte RubyGems-Version wurde auf 2.0.3 aktualisiert.

### Encoding

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar gibt bei der Konvertierung von Encodings die falschen Codepoints zurück

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) `File.read()`-Absturz auf 32-Bit-Windows mit SP3

### Programmbibliotheken

* [#8467](https://bugs.ruby-lang.org/issues/8467) Zurückspulen und Neuiterieren durch ein gzipptes IO erzeugt einen Segmentation Fault
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response wirft "Net::IMAP::ResponseParseError: unexpected token CRLF" für gleiche `CAPABILITY`

## Danksagung

Viele Committer, Tester und Nutzer, die Bugreports machten, halfen mir
bei dieser Veröffentlichung. Ich danke ihnen für ihre Beiträge.
