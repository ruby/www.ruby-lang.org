---
layout: news_post
title: "Wydano Ruby 2.0.0-p247"
author: "nagachika"
translator: "crabonature"
date: 2013-06-27 11:00:03 +0000
lang: pl
---

Wydano Ruby 2.0.0-p247.

To wydanie zawiera łatkę bezpieczeństwa dotyczącą dołączonego OpenSSL.

* [Luka pozwalająca na ominięcie sprawdzenia nazwy hosta w kliencie SSL (CVE-2013-4073)
  (CVE-2013-4073)](/pl/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

Zawartych zostało też trochę poprawek błędów.

## Pobieranie

To wydanie można pobrać z:

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

## Zmiany

Większe poprawki są przedstawione poniżej.

Zobacz [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
i [ChangeLog](http://svn.ruby-lang.org/repos/ruby/tags/v2_0_0_247/ChangeLog).

### Argumenty z kluczem

* [#8040](https://bugs.ruby-lang.org/issues/8040) change priority between keyword arguments and mandatory arguments.
* [#8416](https://bugs.ruby-lang.org/issues/8416) super does not forward either named or anonymous `**`
* [#8463](https://bugs.ruby-lang.org/issues/8463) Proc auto-splat bug with named arguments

### VM/Przetwarzanie języka

* [#8424](https://bugs.ruby-lang.org/issues/8424) fix infinite loop when stack overflow with TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ not working in eval with binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: B_RETURN_EVENT not triggered when "next" used
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (and the actual block) persist between calls to a proc created from a method (using method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (and the actual block) persist between calls to a proc created by Symbol#to_proc.

### RubyGems

Dołączona wersja RubyGems została zaktualizowana do 2.0.3

### Kodowanie

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar returns wrong codepoints when converting encoding

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() crash on Win32SP3 32bit

### Biblioteki

* [#8467](https://bugs.ruby-lang.org/issues/8467) Rewinding and iterating through gzipped IO leads to segmentation fault
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response raises "Net::IMAP::ResponseParseError: unexpected token CRLF" for common CAPABILITY

## Komentarz do wydania

Wiele osób tworzących kod, testerów i użytkowników zgłaszających raporty
o błędach pomogło mi zrobić to wydanie. Podziękowania za ich zaangażowanie i pracę.
