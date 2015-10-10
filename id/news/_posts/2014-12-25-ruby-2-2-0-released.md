---
layout: news_post
title: "Ruby 2.2.0 Rilis"
author: "naruse"
translator: "meisyal"
date: 2014-12-25 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.2.0.

Ruby 2.2 mencakup banyak fitur baru dan perbaikan seiring dengan meningkatnya
perbedaan dan meluasnya tuntutan untuk Ruby.

Sebagai contoh, *Ruby's Garbage Collector* sekarang tersedia untuk mengumpulkan tipe objek *Symbol*.
Hal ini mengurangi penggunaan memori dari *Symbol*; karena *GC* sebelumnya tidak dapat
mengumpulkan mereka sebelum 2.2.
Karena Rails 5.0 akan memerlukan *Symbol GC*, ini akan mendukung Ruby 2.2 atau yang lebih baru saja.
(Lihat [Rails 4.2 release post](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) untuk lebih detail.)

Selain itu, sebuah pengurangan waktu *pause* berkat *Incremental Garbage Collector* baru yang akan
sangat membantu untuk menjalankan aplikasi Rails. Pengembangan akhir-akhir ini menyebutkan di
[Rails blog](http://weblog.rubyonrails.org/)
bahwa Rails 5.0 akan mengambil manfaat yang dihasilkan dari *Incremental GC* maupun
*Symbol GC*.

Fitur lain yang berhubungan dengan manajemen memori adalah sebuah opsi tambahan
`configure.in` untuk menggunakan jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Fitur ini masih bersifat percobaan dan saat ini dimatikan secara *default* hingga kami
mengumpulkan data kinerja dan kasus penggunaan lebih banyak. Ketika kami yakin terhadap
manfaat yang dihasilkan, fitur ini akan dihidupkan secara *default*.

Dukungan terhadap percobaan menggunakan vfork(2) dengan system() dan spawn() juga
telah ditambahkan. Anda dapat membaca lebih detail di
[tanaka-san's blog in japanese](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Hal ini bisa berpotensi mempercepat kecepatan ketika sebuah proses yang besar mengeksekusi
perintah eksternal berkali-kali.
Namun demikian vrfork(2) masih tidak dipahami dengan baik dan berpotensi membahayakan
*system call*. Kami ingin mencoba untuk mencari tahu seberapa banyak manfaat yang
diperoleh dengan mengumpulkan data kinerja dan kasus penggunaan.

Coba dan nikmati memprogram dengan Ruby 2.2.0, dan laporkan ke kami temuan Anda!

## Perubahan Penting sejak 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([presentation at RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* konfigurasi --with-jemalloc
  [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* *core libraries*:
  * Mendukung Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Metode-metode baru:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* *bundled libraries*:
  * Memperbarui Psych 2.0.8
  * Memperbarui Rake 10.4.2
  * Memperbarui RDoc 4.2.0
  * Memperbarui RubyGems 2.4.5
  * Memperbarui test-unit 3.0.8 (dihapus dari *repository* namun *bundled* di dalam tarball)
  * Memperbarui minitest 5.4.3 (dihapus dari *repository* namun *bundled* di dalam tarball)
  * *Deprecate* mathn
* C API
  * Menghapus *deprecated* APIs

Lihat [NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
untuk detail.

Dengan perubahan-perubahan di atas, 1557 berkas berubah, 125039 *insertions(+)*, 74376 *deletions(-)*
dari v2.1.0!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
