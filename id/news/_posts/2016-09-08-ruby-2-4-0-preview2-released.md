---
layout: news_post
title: "Ruby 2.4.0-preview2 Rilis"
author: "naruse"
translator: "meisyal"
date: 2016-09-08 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 adalah *preview* kedua dari Ruby 2.4.0.
Preview2 ini dirilis untuk mendapatkan umpan balik dari komunitas.
Jangan ragu untuk
[mengirimkan umpan balik](https://github.com/ruby/ruby/wiki/How-To-Report)
karena Anda masih dapat mengubah fitur-fitur ini.

## [Menyatukan Fixnum dan Bignum ke dalam Integer](https://bugs.ruby-lang.org/issues/12005)

Meskipun [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
tidak memerinci detail dari kelas Integer,
Ruby telah memiliki dua kelas Integer yang jelas: Fixnum dan Bignum.
Ruby 2.4 menyatukan mereka ke dalam Integer.
Semua ekstensi C yang mempergunakan kelas Fixnum atau Bignum perlu diperbaiki.

Lihat juga [ticket](https://bugs.ruby-lang.org/issues/12005) dan [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String mendukung Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` sekarang menangani
Unicode case mappings selain hanya ASCII case mappings.

## Perbaikan performa

Ruby 2.4 juga mencakup perbaikan performa berikut termasuk
perubahan bahasa:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` dan `[x, y].min` dioptimalkan untuk tidak membuat sebuah *array* sementara
pada kondisi tertentu.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Penambahan `Regexp#match?`, yang mengeksekusi sebuah *regexp match* tanpa membuat
objek referensi kembali dan mengubah `$~` untuk mengurangi alokasi objek.

### Perbaikan performa lainnya

* [mempercepat akses *instance variable*](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception dan Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby mengabaikan *exception* pada *thread* kecuali *thread* lain secara langsung bergabung dengannya.
Dengan `report_on_exception = true`,
Anda dapat memperhatikan jika sebuah *thread* telah mati karena *unhandled exception*.

Kirimkan umpan balik apa yang seharusnya *default* untuk `report_on_exception`
dan tentang report-on-GC, yang menunjukkan sebuah laporan ketika sebuah *thread* adalah
*garbage collected* tanpa *join*, ke kami.

### [Deteksi thread deadlock sekarang menunjukkan thread dengan backtrace dan dependency-nya](https://bugs.ruby-lang.org/issues/8214)

Ruby memiliki pendeteksi *deadlock* selama menunggu *thread*, tetapi laporannya tidak
mencakup informasi yang cukup  untuk *debugging*.
Pendeteksi *deadlock* Ruby 2.4 menunjukkan *thread* dengan *backtrace* dan
*dependency thread*.

Coba dan nikmati memprogram dengan Ruby 2.4.0-preview2, dan
[kirim umpan balik ke kami](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Perubahan Penting sejak 2.3

* Mendukung OpenSSL 1.1.0
* ext/tk sekarang dihapus dari stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
dan [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
untuk detail.

Dengan perubahan tersebut,
[2353 berkas berubah, 289057 sisipan(+), 73847 terhapus(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
sejak Ruby 2.3.0!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Komentar Rilis

Lihat juga jadwal rilis dan informasi lainnya:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
