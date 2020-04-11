---
layout: news_post
title: "Ruby 2.2.0-rc1 Rilis"
author: "naruse"
translator: "meisyal"
date: 2014-12-18 09:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.2.0-rc1.
Setelah RC1, semua perubahan akan dibatasi hanya untuk penanganan *bug*.
Rilis final dari Ruby 2.2.0 dijadwalkan pada 25 Desember 2014.

Ruby 2.2 mencakup banyak fitur baru dan perbaikan seiring dengan meningkatnya
perbedaan dan meluasnya tuntutan untuk Ruby.

Sebagai contoh, *Ruby's Garbage Collector* sekarang tersedia untuk mengumpulkan tipe objek *Symbol*.
Hal ini mengurangi penggunaan memori dari *Symbol*; karena *GC* sebelumnya tidak dapat mengumpulkan mereka sebelum 2.2.
Karena Rails 5.0 akan memerlukan *Symbol GC*, ini akan mendukung Ruby 2.2 atau yang lebih baru saja.
(Lihat [Rails 4.2 release post](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) untuk lebih detail.)

Selain itu, sebuah pengurangan waktu *pause* berkat *Incremental Garbage Collector* baru yang akan sangat membantu untuk menjalankan aplikasi Rails. Pengembangan akhir-akhir ini menyebutkan di [Rails blog](http://weblog.rubyonrails.org/) bahwa Rails 5.0 akan mengambil manfaat yang dihasilkan dari *Incremental GC* maupun *Symbol GC*.

Fitur lain yang berhubungan dengan manajemen memori adalah sebuah opsi tambahan `configure.in` untuk menggunakan jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Fitur ini masih bersifat percobaan dan saat ini dimatikan secara *default* hingga kami mengumpulkan data kinerja dan kasus penggunaan lebih banyak. Ketika kami yakin terhadap manfaat yang dihasilkan, fitur ini akan dihidupkan secara *default*.

Dukungan terhadap percobaan menggunakan vfork(2) dengan system() dan spawn() juga telah ditambahkan. Anda dapat membaca lebih detail di [tanaka-san's blog in japanese](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Hal ini bisa berpotensi mempercepat kecepatan ketika sebuah proses yang besar mengeksekusi perintah eksternal berkali-kali.
Namun demikian vrfork(2) masih tidak dipahami dengan baik dan berpotensi membahayakan *system call*. Kami ingin mencoba untuk mencari tahu seberapa banyak manfaat yang diperoleh dengan mengumpulkan data kinerja dan kasus penggunaan.

Coba dan nikmati memprogram dengan Ruby 2.2.0-rc1, dan laporkan ke kami temuan Anda!

## Perubahan Penting sejak 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* konfigurasi --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* *core libraries*:
  * Mendukung Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Metode-metode baru:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* *bundled libraries*:
  * Memperbarui Psych 2.0.8
  * Memperbarui Rake 10.4.0
  * Memperbarui RDoc 4.2.0.alpha (21b241a)
  * Memperbarui RubyGems 2.4.5
  * Memperbarui test-unit 3.0.8 (dihapus dari *repository* namun *bundled*
di dalam tarball)
  * Memperbarui minitest 5.4.3 (dihapus dari *repository* namun *bundled* di dalam tarball)
  * *Deprecate* mathn
* C API
  * Menghapus *deprecated* APIs

Lihat [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) untuk detail.

Dengan perubahan-perubahan di atas, 1548 berkas berubah, 123658 *insertions(+)*, 74306 *deletions(-)* dari v2.1.0!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Komentar Rilis

* [2.2.0 Known issues](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Lihat juga jadwal rilis dan informasi lain:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
