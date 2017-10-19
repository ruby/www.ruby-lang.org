---
layout: news_post
title: "Ruby 2.4.2 Rilis"
author: "nagachika"
translator: "meisyal"
date: 2017-09-14 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.4.2.
Rilis ini mencakup beberapa perbaikan keamanan.

* [CVE-2017-0898: Kerentanan buffer underrun pada Kernel.sprintf](/id/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: Kerentanan escape sequence injection pada Basic authentication WEBrick](/id/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: Kerentanan buffer underrun pada OpenSSL ASN1 decode](/id/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: Kerentanan tereksposnya heap saat menghasilkan JSON](/id/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [Beberapa Kerentanan di RubyGems](/id/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* Memperbarui libyaml yang di-*bundle* ke versi 0.1.7.

Ada juga perbaikan *bug* lainnya.
Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_4_1...v2_4_2) untuk lebih detail.

## Masalah Umum

_(Bagian ini ditambahkan pada 15 September 2017.)_

Sebuah *incompatibility* telah ditemukan pada Ruby 2.4.2.
Ruby 2.4.2 tidak dapat terhubung dengan libgmp maupun jemalloc.
Kami akan memperbaiki masalah ini pada rilis berikutnya, tetapi jika Anda menghadapi masalah ini sekarang dan membutuhkan perbaikan segera, gunakan *patch* pada tautan berikut:

* [Ruby 2.4.2 and 2.3.5 cannot link with libgmp nor jemalloc](https://bugs.ruby-lang.org/issues/13899)

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.bz2>

      SIZE:   12607283 bytes
      SHA1:   a8a50a9297ff656e5230bf0f945acd69cc02a097
      SHA256: 08e72d0cbe870ed1317493600fbbad5995ea3af2d0166585e7ecc85d04cc50dc
      SHA512: 1a5302d2558089a6b91b815fff9b75a29e690f10861de5fdd48211f3f45025a70dad7495f216e6af9c62d72e69ed316f1a52fada704bdc7e6d8c094d141ea77c

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz>

      SIZE:   14187859 bytes
      SHA1:   b096124469e31e4fc3d00d2b61b11d36992e6bbd
      SHA256: 93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c
      SHA512: 96c236bdcd09b2e7cf429da631a487fc00f1255443751c03c8abeb4c2ce57079ad60ef566fecc0bf2c7beb2f080e2b8c4d30f321664547b2dc7d2a62aa1075ef

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.xz>

      SIZE:   10046412 bytes
      SHA1:   8373e32c63bba2180799da091b572664aa9faf6f
      SHA256: 748a8980d30141bd1a4124e11745bb105b436fb1890826e0d2b9ea31af27f735
      SHA512: c1d42272fb0d94b693452e703b0ea4942bf59cbd4b08ba83bf039f54be97ebc88511632413da0164970b4cf97bc302bccb88aab48edfa8fa147498e7ee741595

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.zip>

      SIZE:   15645325 bytes
      SHA1:   861b51de9db0d822ef141ad04383c76aa3cd2fff
      SHA256: 37d7cb27d8abd4b143556260506306659930548652343076f7f8470f07818824
      SHA512: 234765091528be1310ac315868f84ae6c505aa696672929df2f00828c1bbdc7cbcb2fc690eab4e73efde6be9104584ba7b6944853861f6d05e775b124ce8dfd5

## Komentar Rilis

Banyak *commiter*, pengembang, dan pengguna yang melaporkan *bug* telah membantu
kami untuk membuat rilis ini.
Terima kasih atas kontribusinya.
