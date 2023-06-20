---
layout: news_post
title: "Ruby 2.4.0-preview1 Rilis"
author: "naruse"
translator: "meisyal"
date: 2016-06-20 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.4.0-preview1.

Ruby 2.4.0-preview1 adalah *preview* pertama dari Ruby 2.4.0.
Preview1 ini dirilis lebih awal dari biasanya karena versi ini mencakup
banyak fitur baru dan perbaikan.
Jangan ragu untuk
[mengirimkan umpan balik](https://github.com/ruby/ruby/wiki/How-To-Report)
karena Anda masih bisa mengubah fitur-fitur ini.

## [Menyatukan Fixnum dan Bignum ke dalam Integer](https://bugs.ruby-lang.org/issues/12005)

Meskipun [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
tidak memerinci detail dari kelas Integer,
CRuby memiliki dua variable kelas Integer: Fixnum dan Bignum.
Ruby 2.4 menyatukannya ke dalam Integer.

## [String mendukung Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` sekarang menangani
Unicode *case mappings* selain hanya ASCII *case mappings*.

## Perbaikan Performa

Ruby 2.4 juga mencakup perbaikan performa berikut termasuk
perubahan bahasa:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` dan `[x, y].min` dioptimalkan untuk tidak membuat sebuah *array* sementara
dalam kondisi tertentu.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Penambahan `Regexp#match?`, yang mengeksekusi sebuah *regexp match* tanpa pembuatan
sebuah objek referensi kembali dan pengubahan `$~` untuk mengurangi alokasi objek.

### Perbaikan performa lainnya

* [mempercepat akses *instance variable*](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception dan Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby mengabaikan *exception* pada *thread* kecuali jika *thread* lain secara langsung
bergabung dengannya.
Dengan `report_on_exception = true`,
Anda dapat memperhatikan jika sebuah *thread* telah mati karena *unhandled exception*.

Kirimkan umpan balik apa yang seharusnya *default* untuk `report_on_exception`
dan tentang *report-on-GC* ke kami.

### [Thread deadlock detection sekarang menunjukkan thread-thread dengan backtrace dan dependency-nya](https://bugs.ruby-lang.org/issues/8214)

Ruby memiliki *deadlock detection* saat menunggu *thread*, tetapi dilaporkan tidak
mencakup informasi yang cukup untuk *debugging*.
*Detection deadlock* dari Ruby 2.4 menunjukkan *thread-thread* dengan *backtrace* dan
*dependency*-nya.

Coba dan nikmati memprogram dengan Ruby 2.4.0-preview1, dan
[kirimkan umpan balik ke kami](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Perubahan Penting sejak 2.3

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
dan [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
untuk detail.

Dengan perubahan ini,
[1140 berkas berubah, 33126 sisipan(+), 50993 terhapus(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)
sejak Ruby 2.3.0!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Komentar Rilis

Lihat juga jadwal rilis dan informasi lainnya:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
