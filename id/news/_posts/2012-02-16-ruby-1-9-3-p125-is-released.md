---
layout: news_post
title: "Ruby 1.9.3-p125 Dirilis"
author: "NARUSE, Yui"
translator: "catcyborg"
lang: id
---

Ruby 1.9.3-p125 dirilis.

Rilis ini termasuk [perbaikan keamanan dari ekstensi OpenSSL Ruby OpenSSL][1].
Dan banyak bug yang diperbaiki pada rilis ini.

== Perbaikan

* [Perbaikan untuk modul OpenSSL Ruby: Izinkan \"0/n splitting\" untuk pencegahan
  serangan TLS BEAST][1]
* Diperbaiki: Dukungan LLVM/clang [\[Bug #5076\]][2]
* Diperbaiki: Dukungan GCC 4.7 [\[Bug #5851\]][3]
* Perbaikan bug lain

Lihat [tiket][4] dan [ChangeLog][5] untuk rinciannya.

== Unduhan

Catatan: Dipackage ulang pada on 2012-02-17 02:04:00 UTC untuk memperbaiki [\[Bug #6040\]][6].

* [http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2][7]

  * SIZE: 9733962 bytes
  * MD5: 702529a7f8417ed79f628b77d8061aa5
  * SHA256:
    c67a59443052b5a9219eb4cee3892bdfbc6f250f0c8e214e02256a4cc7ef5526

* [http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz][8]

  * SIZE: 12278584 bytes
  * MD5: e3ea86b9d3fc2d3ec867f66969ae3b92
  * SHA256:
    8b3c035cf4f0ad6420f447d6a48e8817e5384d0504514939aeb156e251d44cce

* [http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.zip][9]

  * SIZE: 13742164 bytes
  * MD5: 2cff031a8801d91a0a0ca8e9a83e2ec8
  * SHA256:
    c16423182227c765398723da2419e4e962076778ec5e39417fad564e413fde1d



[1]: {{ site.url }}/id/news/2012/02/16/security-fix-for-ruby-openssl-module-allow-0n-splitting-as-a-prevention-for-the-tls-beast-attack-/
[2]: https://bugs.ruby-lang.org/issues/show/5076
[3]: https://bugs.ruby-lang.org/issues/show/5851
[4]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[5]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_125/ChangeLog
[6]: https://bugs.ruby-lang.org/issues/6040
[7]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2
[8]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
[9]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.zip
