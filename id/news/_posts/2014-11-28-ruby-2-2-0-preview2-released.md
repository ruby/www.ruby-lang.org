---
layout: news_post
title: "Ruby 2.2.0-preview2 Telah Rilis"
author: "naruse"
translator: "meisyal"
date: 2014-11-28 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis Ruby 2.2.0-preview2.

Ruby 2.2.0-preview2 adalah *preview* kedua dari Ruby 2.2.0.
Banyak fitur baru dan penyempurnaan dimasukkan seiring dengan meningkatnya
tuntunan dan perkembangan Ruby.

Sebagai contoh, *Symbol GC* membuat *Symbols garbage collectable*.
Hal ini mengurangi penggunaan memori dari simbol; karena GC tidak dapat mengumpulkan simbol sebelum
Ruby 2.2. Karena Rails 5.0 akan memerlukan *Symbol GC*, hal tersebut hanya didukung oleg Ruby 2.2
atau terbaru. (Lihat [Rails' blog post](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/) untuk lebih detil.)

Juga, *Incremental GC* baru mengurangi waktu jeda dari *garbage collection*, di mana sangat membantu untuk menjalankan aplikasi Rails.

Fitur lain yang berkaitan dengan manajemen memori adalah penambahan sebuah opsi *configure.in* untuk menggunakan *jemalloc*
[Fitur #9113](https://bugs.ruby-lang.org/issues/9113).
Ini merupakan fitur percobaan, dan dimatikan secara *default*.
Kami butuh untuk mengumpulkan studi kasus dan data performa.
Ketika kami yakin mendapatkan keberhasilan, fitur ini akan diaktifkan secara *default*.

Satu topik lagi [menggunakan vfork(2) di system() dan spawn() (Japanese)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Hal tersebut di atas diharapkan dapat membawa kecepatan tinggi ketika sebuah proses yang sangat besar mengeksekusi perintah eksternal berulang kali.
Tetapi *vfork(2)* adalah sebuah pemanggil sistem yang berisiko.
Kami ingin tahu berapa keberhasilan yang akan didapatkan melalui pengumpulan studi kasus dan data performa.

Coba dan nikmati memprogram dengan Ruby 2.2.0-preview2, dan laporkan sejauh mana Anda ke kami!

##  Perubahan Penting sejak 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([*slide* presentasi di RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Fitur #9113](https://bugs.ruby-lang.org/issues/9113)
* *core libraries*:
  * Mendukung Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * *New methods*:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* *bundled libraries*:
  * Memperbarui Psych 2.0.6
  * Memperbarui Rake 10.4.0
  * Memperbarui RDoc 4.2.0.alpha (21b241a)
  * Memperbarui RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * Memperbarui test-unit 3.0.7 (dihapus dari *repository* tetapi dibundel
di dalam *tarball*)
  * Memperbarui minitest 5.4.3 (dihapus dari *repository* tetapi dibundel di dalam *tarball*)
  * *Deprecate* mathn
* C API
  * Menghapus *APIs* yang usang

Lihat [NEWS di dalam *repository* Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) untuk lebih detil.

Dengan perubahan tersebut, 1239 berkas berubah, 98343 Penambahan(+), 61858 penghapusan(-).

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## Komentar Rilis

* [Isu 2.2.0 yang diketahui](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Lihat juga jadwal rilis dan informasi lainnya:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
