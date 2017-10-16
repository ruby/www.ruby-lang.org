---
layout: news_post
title: "Ruby 2.2.8 Rilis"
author: "usa"
translator: "meisyal"
date: 2017-09-14 12:00:00 +0000
lang: id
---

Ruby 2.2.8 telah dirilis.
Rilis ini mencakup beberapa perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk detail.

* [CVE-2017-0898: Kerentanan buffer underrun pada Kernel.sprintf](/id/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: Kerentanan escape sequence injection pada Basic authentication WEBrick](/id/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: Kerentanan buffer underrun pada OpenSSL ASN1 decode](/id/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: Kerentanan tereksposnya heap saat menghasilkan JSON](/id/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [Beberapa Kerentanan di RubyGems](/id/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* Memperbarui libyaml yang di-*bundle* ke versi 0.1.7

Ruby 2.2 saat ini dalam fase perawatan keamanan, hingga akhir Maret 2018.
Setelah tanggal tersebut, perawatan Ruby 2.2 akan berakhir.
Kami merekomendasikan Anda untuk mulai merencanakan migrasi ke versi Ruby yang terbaru, seperti 2.4 atau 2.3.

## Unduh

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2)

      SIZE:   13374522 bytes
      SHA1:   d851324bf783221108ce79343fabbcd559b9e60b
      SHA256: b19085587d859baf9d7763f92e34a84632fceac5cc593ca2c0efa28ed8c6e44e
      SHA512: aa1c65f76a51a57d9059a38a13a823112b53850a9e7d6f72c3f3e38d381412014521049f7065c1b00877501b3b554235135d0f308045c2a9da133c766f5b9e46

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz)

      SIZE:   16681654 bytes
      SHA1:   15a6fca1bfe0488b24a204708a287904028aa367
      SHA256: 8f37b9d8538bf8e50ad098db2a716ea49585ad1601bbd347ef84ca0662d9268a
      SHA512: b9d355232c1ca3e17b5d4dcb70f0720da75b82787e45eb4ede281290bf42643665385e55428495eb55c17f744395130b4d64ef78ca66c5a5ecb9f4c3b732fdea

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz)

      SIZE:   10520648 bytes
      SHA1:   3a25914aafedc81952899298a18f9c3a4881d2d1
      SHA256: 37eafc15037396c26870f6a6c5bcd0658d14b46cd5e191a3b56d89dd22d561b0
      SHA512: e21004bee537f0c706f4ac9526507b414ddb6a8d721e8fad8d7fe88992a4f048eb5eb79f8d8b8af2a8b331dcfa74b560490218a1acb3532c2cdb4fb4909da3c9

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip)

      SIZE:   18521461 bytes
      SHA1:   3b0142bad47e29f429903f6c4ca84540764b5e93
      SHA256: 58bf98b62d21d6cc622e6ef5c7d024db0458c6860199ab4c1bf68cdc4b36fa9d
      SHA512: 08cadfa72713f9e3348093c96af4c53f06f681bc29ada2d80f1c55faca6a59a3b2913aa2443bf645fea6f3840b32ce8ce894b358f972b1a295ee0860b656eb02

## Komentar Rilis

Terima kasih kepada semua yang telah membantu rilis ini, khususnya, laporan kerentanan.
