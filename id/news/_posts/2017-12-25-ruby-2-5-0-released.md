---
layout: news_post
title: "Ruby 2.5.0 Rilis"
author: "naruse"
translator: "meisyal"
date: 2017-12-25 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.5.0.

Ruby 2.5.0 adalah rilis pertama yang *stable* dari rangkaian Ruby 2.5.
Versi ini mengenalkan banyak fitur baru dan perbaikan performa.
Perubahan-perubahan penting tersebut di antaranya sebagai berikut:

## Fitur Baru

* `rescue`/`else`/`ensure` sekarang diperbolehkan untuk digunakan langsung dengan
  blok `do`/`end`.
  [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
* Menambahkan `yield_self` untuk menghasilkan blok yang diberikan dalam konteksnya.
  Tidak seperti `tap`, yang mengembalikan hasil dari blok.
  [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
* Mendukung pengukuran *branch coverage* dan *method coverage*.
  *Branch coverage* mengindikasikan *branch* mana yang dieksekusi dan yang tidak.
  *Method coverage* mengindikasikan *method* mana yang dipanggil dan yang tidak.
  Dengan menjalankan sebuah *test suite* dengan fitur baru ini, Anda akan tahu
  *branch* dan *method* mana yang dieksekusi, dan menilai jumlah *coverage* dari
  *test suite* lebih ketat.
  [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)
  dan Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new dapat membuat kelas-kelas yang menerima *keyword argument*.
  [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none?, and one? menerima sebuah *pattern argument*.
  [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
* *Top-level constant look-up* tidak lagi ada.
  [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
* Salah satu pustaka yang kami sayangi, pp.rb, is sekarang dimuat secara otomatis.
  Anda tidak perlu lagi menulis `require "pp"`.
  [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
* Mencetak *backtrace* dan pesan error dengan urutan terbalik (paling akhir dipanggil pertama,
  paling awal dipaggil terakhir). Ketika sebuah *backtrace* panjang muncul di terminal Anda (TTY),
  Anda dapat dengan mudah menemukan penyebabnya pada baris paling bawah dari *backtrace*.
  Perhatikan bahwa urutan dibalik jika *backtrace* dicetak
  ke terminal langsung.
  [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [experimental]

## Perbaikan performa

* Sekitar 5-10% perbaikan performa dengan menghilangkan semua instruksi `trace`
  dari keseluruhan *bytecode* (urutan instruksi).
  Instruksi `trace` ditambahkan untuk mendukung `TracePoint`.
  Namun, pada umumnya, `TracePoint` tidak digunakan dan instruksi `trace`
  adalah murni *overhead*. Sebagai gantinya, sekarang kami menggunakan sebuah teknik
  instrumentasi yang dinamis.
  Lihat [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104) untuk lebih detail.
* *Block passing* oleh sebuah *block parameter* (misal `def foo(&b); bar(&b); end`)
  sekitar 3 kali lebih cepat dibanding Ruby 2.4 dengan teknik "Lazy Proc allocation".
  [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
* *Mutex* ditulis kembali menjadi lebih kecil dan cepat.
  [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB sekarang menghasilkan kode dari sebuah *template* dua kali secepat Ruby 2.4.
* Memperbaiki performa dari beberapa *built-in method* di antaranya `Array#concat`,
  `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+`, dan lainnya.
* IO.copy_stream menggunakan copy_file_range(2) untuk menyalin *offload*.
  [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## Perubahan penting lainnya sejak 2.4

* SecureRandom sekarang menggunakan sumber yang disediakan oleh OS ketimbang OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* Mengubah cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib dari pustaka standar
  menjadi *default gem*.
* Memperbarui [Onigmo](https://github.com/k-takata/Onigmo/) ke 6.1.3.
  * Ini menambahkan [absence operator](https://github.com/k-takata/Onigmo/issues/87).
  * Perhatikan bahwa [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/) juga mengandung perubahan ini.
* Memperbarui Psych ke 3.0.2.
* Memperbarui RubyGems ke 2.7.3.
* Memperbarui RDoc ke 6.0.1
  * [Switch the lexer from IRB based one to Ripper](https://github.com/ruby/rdoc/pull/512).
    Ini memperbaiki performasi dari *document generation* secara dramatis.
  * Memperbaiki *bug* signifikan yang ada selama sepuluh tahun.
  * Menambahkan dukungan sintaks Ruby baru dari versi terbaru.
* Memperbarui versi Unicode ke 10.0.0.
* `Thread.report_on_exception` sekaran diatur menjadi *true* secara *default*.
  Perubahan ini membantu *debugging* dari program yang *multi-threaded*.
  [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#Write sekarang menerima banyak argumen.
  [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
untuk detail.

Dengan perubahan-perubahan tersebut,
[6158 berkas berubah, 348484 sisipan(+), 82747 terhapus(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
sejak Ruby 2.4.0!

Selamat Natal, Selamat Berlibur, dan nikmati memprogram dengan Ruby 2.5!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
