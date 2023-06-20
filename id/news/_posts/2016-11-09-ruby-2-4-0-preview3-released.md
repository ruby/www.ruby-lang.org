---
layout: news_post
title: "Ruby 2.4.0-preview3 Rilis"
author: "naruse"
translator: "meisyal"
date: 2016-11-09 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.4.0-preview3.

Ruby 2.4.0-preview3 adalah *preview* ketiga dari Ruby 2.4.0.
Preview3 ini dirilis untuk mendapatkan umpan balik dari komunitas.
Jangan ragu untuk
[mengirimkan umpan balik](https://github.com/ruby/ruby/wiki/How-To-Report)
karena Anda masih bisa mengubah fitur-fitur ini.

## [Memperkenalkan penyempurnaan hash table oleh Vladimir Makarov](https://bugs.ruby-lang.org/issues/12142)

Menyempurnakan struktur internal dari *hash table* (st_table) dengan
memperkenalkan *open addressing* dan *inclusion order array*.
Penyempurnaan ini didiskusikan oleh banyak orang, khususnya Yura Sokolov.

## Binding#irb: Memulai sebuah sesi REPL seperti `binding.pry`

Selama Anda melakukan *debugging*, Anda mungkin sering menggunakan `p` untuk
melihat nilai dari variabel-variabel. Dengan [pry](https://github.com/pry/pry)
dan Anda sudah menulis `binding.pry` pada aplikasi Anda, ini akan meluncurkan
REPL dan Anda dapat menjalakan kode Ruby apapun.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
memperkenalkan `binding.irb` yang memiliki perilaku seperti itu dengan irb.

## [Menyatukan Fixnum dan Bignum ke dalam Integer](https://bugs.ruby-lang.org/issues/12005)

Meskipun [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
tidak memerinci detail dari kelas Integer,
Ruby telah memiliki dua kelas Integer: Fixnum dan Bignum.
Ruby 2.4 menyatukan mereka ke dalam Integer.
Semua ekstensi C yang bersentuhan dengan kelas Fixnum atau Bignum perlu
diperbaiki.

Lihat juga [tiket](https://bugs.ruby-lang.org/issues/12005) dan [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String mendukung Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` sekarang menangani
Unicode *case mappings* selain hanya ASCII *case mappings*.

## Perbaikan performa

Ruby 2.4 juga mencakup perbaikan performa berikut termasuk
perubahan bahasa:

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
langung bergabung dengannya. Dengan `report_on_exception = true`,
Anda dapat memperhatikan jika sebuah *thread* telah mati karena *unhandled
exception*.

Kirimkan umpan balik apa yang seharusnya *default* untuk `report_on_exception`
dan tentang report-on-GC, yang menunjukkan sebuah laporan ketika sebuah
*thread* di-*garbage collected* tanpa *join*.

### [Thread deadlock detection sekarang menunjukkan thread-thread dengan backtrace dan dependency-nya](https://bugs.ruby-lang.org/issues/8214)

Ruby memiliki *deadlock detection* saat menunggu *thread*, tetapi laporannya
tidak mengandung cukup informasi untuk *debugging*.
*Detection deadlock* dari Ruby 2.4 menunjukkan *thread-thread* dengan
*backtrace* dan *dependency*-nya.

Coba dan nikmati memprogram dengan Ruby 2.4.0-preview3, dan
[kirimkan umpan balik ke kami](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Perubahan penting lainnya sejak 2.3

* Mendukung OpenSSL 1.1.0
* ext/tk sekarang dihapus dari stdlib [Fitur #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC sekarang dihapus dari stdlib [Fitur #12160](https://bugs.ruby-lang.org/issues/12160)

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
dan [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
untuk detail.

Dengan perubahan tersebut,
[2470 berkas berubah, 283051 sisipan(+), 64902 terhapus(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)
sejak Ruby 2.3.0!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Komentar Rilis

Lihat juga jadwal rilis dan informasi lainnya:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
