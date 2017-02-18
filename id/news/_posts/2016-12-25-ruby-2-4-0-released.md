---
layout: news_post
title: "Ruby 2.4.0 Rilis"
author: "naruse"
translator: "meisyal"
date: 2016-12-25 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.4.0.

Ruby 2.4.0 adalah rilis *stable* pertama dari rangkaian Ruby 2.4.
Rilis ini memperkenalkan banyak fitur, sebagai contoh:

## [Memperkenalkan penyempurnaan hash table (oleh Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Menyempurnakan struktur internal dari *hash table* (st_table) dengan memperkenalkan
*open addressing* dan sebuah *inclusion order array*.
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

## Perubahan penting lainnya sejak 2.3

* Mendukung OpenSSL 1.1.0 (memberhentikan dukungan untuk 0.9.7 atau sebelumnya)
* ext/tk sekarang dihapus dari stdlib [Fitur #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC sekarang dihapus dari stdlib [Fitur #12160](https://bugs.ruby-lang.org/issues/12160)

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS) atau riwayat
*commit* untuk detail.

Dengan perubahan tersebut, [2523 berkas berubah, 289129 sisipan(+), 84670
terhapus (-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0) sejak Ruby
2.3.0!

Selamat Natal, Selamat berlibur, dan nikmati memprogram dengan Ruby 2.4!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
