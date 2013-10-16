---
layout: news_post
title: "Ruby 2.1.0-preview1 dirilis"
author: "nurse"
translator: "gozali"
date: 2013-09-23 07:00:00 UTC
lang: id
---

Kami sangat senang untuk mengumumkan rilis Ruby 2.1.0-preview1.
Silakan periksa fitur - fitur baru di Ruby 2.1 sebelum rilis akhir!

## Unduh

Kami merekomendasikan untuk menggunakan
[http://cache.ruby-lang.org/pub/ruby/2.1/](http://cache.ruby-lang.org/pub/ruby/2.1/)
melalui Fastly.

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

## Perubahan

Perubahan penting pada versi ini adalah:

* VM (metode cache)
* RGenGC (Lihat [presentasi ko1 di RubyKaigi](http://rubykaigi.org/2013/talk/S73) dan [presentasi EuRuKo](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* sintaks
* Decimal Literal
* Frozen String Literal
* def's return value
* Bignum
* 128bit
* GMP
* String#scrub
* Socket.getifaddrs
* new RubyGems

Lihat rincian lebih detail dari perubahan: [NEWS di Ruby repository (WIP)](https://github.com/ruby/ruby/blob/trunk/NEWS).

Presentasi ko1 di toruby: [Summary of Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) menulis sebuah ringkasan yang sangat bagus dalam sebuah artikel di blog pribadinya: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Komentar Rilis

Issue yang diketahui adalah:

[http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Lihat juga jadwal rilis dan informasi lainnya:

[http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210](http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210)
