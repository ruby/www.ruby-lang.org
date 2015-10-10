---
layout: news_post
title: "Ruby 1.9.3-p551 Telah Rilis"
author: "usa"
translator: "meisyal"
date: 2014-11-13 12:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis Ruby 1.9.3-p551.

Rilis ini mencakup perbaikan celah keamanan *DoS* REXML.
Hal ini sama halnya dengan
[perbaikan celah](https://www.ruby-lang.org/en/news/2014/10/27/rexml-dos-cve-2014-8080/)
yang ada di [rilis sebelumnya](https://www.ruby-lang.org/en/news/2014/10/27/ruby-1-9-3-p550-is-released/),
tetapi perbaikan ini menangani kasus lain dari ekspansi entitas.
Mohon untuk melihat topik berikut untuk lebih detil.

* [CVE-2014-8090: Another Denial of Service XML Expansion](https://www.ruby-lang.org/en/news/2014/11/13/rexml-dos-cve-2014-8090/)


## Perhatian

Ruby 1.9.3 dalam tahap perawatan keamanan saat ini.
Ini berarti kamu tidak akan pernah memperbaiki *bugs* tanpa adanya permasalahan keamanan.
Dan, saat ini, akhir perawatan 1.9.3 juga telah dijadwalkan hingga Februari tahun depan.
Kami merekomendasikan pengguna Ruby 1.9.3 untuk migrasi ke versi yang lebih baru segera mungkin.


## Unduh

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2)

      SIZE:   10049332 bytes
      MD5:    0d8b272b05c3449dc848bb7570f65bfe
      SHA256: b0c5e37e3431d58613a160504b39542ec687d473de1d4da983dabcf3c5de771e
      SHA512: 5ea40f8c40cf116030ffdedbe436c1fdbf9a50b7bb44bc890845c9c2a885c34da711bc1a9e9694788c2f4710f7e6e0adc4410aec1ab18a25a27168f25ac3d68c

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz)

      SIZE:   12605119 bytes
      MD5:    0d8212f7bc89bab8ef521b04cd9df278
      SHA256: bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8
      SHA512: be12adf581ee76af70db117b44c6647c1df3d28fffa1b3379c6067e4aa1fb523dae7c9b130a51dcdcff268a8ee21a3d74f6f946135fb3ac6b90664f0a9df4a08

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.xz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.xz)

      SIZE:   7704072 bytes
      MD5:    7367b1dfb2ba1d6abf6fd7db70e765f5
      SHA256: 44228297861f4dfdf23a47372a3e3c4c5116fbf5b0e10883417f2379874b55c6
      SHA512: 2dd4cd7494d0d9b1cc2a5c3710a2c771617a367d1ba6f5099adc2785e37efcb668c6508780562359a4a4c83733e349aa5cb4f8532e1f334f9f96543670d35729

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.zip)

      SIZE:   13987275 bytes
      MD5:    14a394b1d7b7031b34d4d1af64ee657e
      SHA256: cf468ccabd5cdef5047b8f02f4f71052fd3a9c87c12aba314f04748a451a63ec
      SHA512: 6ee550c7e435622114e3669393220a90946652eade0a83dab74970fff7088d5c2051bee9c272e2e6eccc36885b4f64928fc2d27c36584c1cc8dac91ce730d3ea

## Komentar Rilis

Maaf atas ketidaknyamanan terhadap rilis yang berkelanjutan.
Terima kasih kepada semua yang telah membantu rilis ini.
