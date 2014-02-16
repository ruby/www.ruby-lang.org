---
layout: news_post
title: "Ruby 2.1.0-preview1 veröffentlicht"
author: "nurse"
translator: "Marcus Stollsteimer"
date: 2013-09-23 07:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.1.0-preview1 bekannt geben
zu können. Bitte testen Sie die neuen Features von Ruby 2.1 vor dem
endgültigen Release!

## Download

Wir empfehlen die Verwendung von
[http://cache.ruby-lang.org/pub/ruby/2.1/](http://cache.ruby-lang.org/pub/ruby/2.1/)
via Fastly.

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      SIZE:   11475553 bytes
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      SIZE:   14449544 bytes
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      SIZE:   16124069 bytes
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## Änderungen

Die wichtigsten Änderungen sind:

* VM (method cache)
* RGenGC (Siehe ko1s [RubyKaigi-](http://rubykaigi.org/2013/talk/S73) und [EuRuKo-Präsentation](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* syntax
* Decimal Literal
* Frozen String Literal
* def's return value
* Bignum
* 128bit
* GMP
* String#scrub
* Socket.getifaddrs
* new RubyGems

Siehe [NEWS im Ruby-Repository (in Arbeit)](https://github.com/ruby/ruby/blob/trunk/NEWS) für weitere Details.

ko1s toruby-Präsentation: [Summary of Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) hat in seinem Blog eine gute Zusammenfassung veröffentlicht:
[What’s new in Ruby 2.1](http://rkh.im/ruby-2.1)

## Weiteres

Bekannte Probleme finden Sie hier:

[http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Den Release-Plan und weitere Informationen finden Sie hier:

[http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210](http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210)
