---
layout: news_post
title: "Ruby 2.4.0-rc1 Rilis"
author: "naruse"
translator: "meisyal"
date: 2016-12-12 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.4.0-rc1.

Ruby 2.4.0-rc1 adalah kandidat rilis pertama dari Ruby 2.4.0.
rc1 ini dirilis untuk mendapatkan umpan balik dari komunitas.
Jangan ragu untuk
[mengirimkan umpan balik](https://github.com/ruby/ruby/wiki/How-To-Report)
karena Anda masih bisa memperbaiki fitur-fitur.

## [Memperkenalkan penyempurnaan hash table (oleh Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Menyempurnakan struktur internal dari *hash table* (st_table) dengan
memperkenalkan *open addressing* dan sebuah *inclusion order array*.
Penyempurnaan ini telah didiskusikan oleh banyak orang, khususnya Yura Sokolov.

## Binding#irb: Memulai sebuah sesi REPL mirip dengan `binding.pry`

Selama Anda melakukan *debugging*, Anda mungkin sering menggunakan `p` untuk
melihat nilai dari variabel-variabel. Dengan [pry](https://github.com/pry/pry)
Anda dapat menggunakan `binding.pry` pada aplikasi Anda untuk meluncurkan
sebuah REPL dan menjalankan kode Ruby apapun.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
memperkenalkan `binding.irb` yang memiliki perilaku seperti itu dengan irb.

## [Menyatukan Fixnum dan Bignum ke dalam Integer](https://bugs.ruby-lang.org/issues/12005)

Meskipun [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
tidak memerinci detail dari kelas Integer,
Ruby telah memiliki dua kelas Integer: Fixnum dan Bignum.
Ruby 2.4 menyatukan mereka ke dalam Integer,
Semua ekstensi C yang bersentuhan dengan kelas Fixnum atau Bignum perlu untuk
diperbaiki.

Lihat juga [tiket](https://bugs.ruby-lang.org/issues/12005) dan [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String mendukung Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` sekarang menangani
Unicode *case mappings* selain hanya ASCII *case mappings*.

## Perbaikan performa

Ruby 2.4 juga mencakup perbaikan performa berikut termasuk perubahan bahasa:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` dan `[x, y].min` dioptimalkan untuk tidak membuat sebuah *array*
sementara dalam kondisi tertentu.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Penambahan `Regexp#match?`, yang mengeksekusi sebuah *regexp match* tanpa
membuat sebuah objek referensi kembali dan mengubah `$~` untuk mengurangi
alokasi objek.

### Perbaikan performa lainnya

* [mempercepat akses *instance variable*](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception dan Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby mengabaikan *exception* pada *thread* kecuali jika *thread* lain secara
langsung bergabung dengannya. Dengan `report_on_exception = true`, Anda dapat
memperhatikan jika sebuah *thread* telah mati karena *unhandled exception*.

Kirimkan umpan balik apa yang seharusnya *default* untuk `report_on_exception`
dan tentang report-on-GC, yang menunjukkan sebuah laporan ketika sebuah
*thread* di-*garbage collected* tanpa *join*.

### [Thread deadlock detection sekarang menampilkan thread dengan backtrace dan dependency-nya](https://bugs.ruby-lang.org/issues/8214)

Ruby memiliki *deadlock detection* saat menunggu *thread-thread*, tetapi laporannya
tidak mengandung cukup informasi untuk *debugging*.
*Deadlock detection* dari Ruby 2.4 menunjukkan *thread-thread* dengan
*backtrace* dan *dependency*-nya.

Coba dan nikmati memprogram dengan Ruby 2.4.0-rc1, dan [kirimkan umpan balik ke
kami](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Perubahan penting lainnya sejak 2.3

* Mendukung OpenSSL 1.1.0 (memberhentikan dukungan untuk 0.9.7 atau sebelumnya)
* ext/tk sekarang dihapus dari stdlib [Fitur #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC sekarang dihapus dari stdlib [Fitur #12160](https://bugs.ruby-lang.org/issues/12160)

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS) atau riwayat
*commit* untuk detail.

Dengan perubahan tersebut,
[2519 berkas berubah, 288606 sisipan(+), 83896 terhapus(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
sejak Ruby 2.3.0!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Komentar Rilis

Lihat juga jadwal rilis dan informasi lainnya:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
