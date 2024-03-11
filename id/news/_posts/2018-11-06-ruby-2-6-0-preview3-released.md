---
layout: news_post
title: "Ruby 2.6.0-preview3 Rilis"
author: "naruse"
translator: "meisyal"
date: 2018-11-06 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.6.0-preview3.

Ruby 2.6.0-preview3 ada *preview* ketiga menuju Ruby 2.6.0.
preview3 ini dirilis untuk mengetes fitur baru sebelum datang
*Release Candidate*.

## JIT

Ruby 2.6 memperkenalkan sebuah implementasi awal dari *compiler* JIT
(Just-in-time).

*Compiler* JIT bertujuan untuk memperbaiki performa dari program Ruby apapun
yang dieksekusi. Berbeda dengan JIT *compiler* biasanya pada bahasa pemrograman
lain, *compiler* JIT dari Ruby melakukan kompilasi JIT melalui sebuah jalan
unik, yang mencetak kode C ke sebuah *disk* dan mengeluarkan proses *compiler*
C untuk menghasilkan kode asli.
Lihat juga: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Bagaimana cara menggunakan: Tetapkan `--jit` pada *command line* atau `$RUBYOPT`
*environment variable*. Menetapkan `--jit-verbose=1` memperbolehkan untuk
mencetak informasi dasar dari kompilasi JIT yang berjalan. Lihat `ruby --help`
untuk pilihan lainnya.

Tujuan utama dari rilis JIT ini adalah untuk menyediakan sebuah kesempatan untuk
mengecek jika ini berjalan di *platform* Anda dan menemukan risiko keamanan
sebelum rilis 2.6. *Compiler* JIT didukung hanya ketika Ruby dibuat oleh GCC,
Clang, atau Microsoft VC++, yang mana dibutuhkan saat *runtime*. Jika
sebaliknya, Anda tidak dapat menggunakannya.

Sampai versi 2.6.0-preview3, kami telah meraih 1.7x performa lebih cepat
dibanding Ruby 2.5 pada CPU-*intensive non-trivial benchmark workload* yang
dikenal dengan Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>.
Kami akan memperbaiki performa pada *memory-intensive workload* seperti
aplikasi Rails.

Nantikan era baru dari performa Ruby.

## RubyVM::AST [Eksperimental]

Ruby 2.6 mengenalkan modul `RubyVM::AST`.

Modul ini memiliki *method* `parse` yang mem-*parse string* dari kode Ruby yang
diberikan dan mengembalikan AST (Abstract Syntax Tree) *node*, dan *method*
`parse_file` yang mem-*parse* berkas dan mengembalikan AST *node*.
Kelas `RubyVM::AST::Node` juga mengenalkan Anda agar mendapatkan informasi
lokasi dan *children node* dari objek `Node`. Fitur ini eksperimental.
Kesesuaian struktur dari AST *node* tidak dijamin.

## Fitur-fitur Baru

* Menambahkan sebuah alias baru `then` pada `Kernel#yield_self`. [[Fitur #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` tanpa `rescue` sekarang menyebabkan sebuah *syntax error*.  [EKSPERIMENTAL]

* penamaan konstan bisa dimulai dengan sebuah huruf kapital non-ASCII. [[Fitur #13770]](https://bugs.ruby-lang.org/issues/13770)

* endless range [[Fitur #12912]](https://bugs.ruby-lang.org/issues/12912)

  Sebuah endless range, `(1..)`, diperkenalkan. Ini berjalan tanpa ada akhirnya. Biasanya digunakan untuk kasus:

      ary[1..]                          # identik dengan ary[1..-1] tanpa magical -1
      (1..).each {|index| ... }         # infinite loop dari indeks 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Menambahkan `Binding#source_location`.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  *Method* ini mengembalikan sumber lokasi dari *binding*, sebuah *array* dua
elemen dari `__FILE__` dan `__LINE__`. Secara tradisi, informasi yang sama
mungkin dapat diambil dengan `eval("[__FILE__, __LINE__]", binding)`, tetapi
kami sedang merencanakan untuk mengubah perilaku ini sehingga `Kernel#eval`
mengabaikan sumber lokasi *binding* [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352).
Sehingga, pengguna seharusnya menggunakan *method* yang baru diperkenalkan ini
daripada `Kernel#eval`.

* Menambahkan pilihan `:exception` agar `Kernel#system` mengeluarkan *error*
daripada mengembalikan `false`.  [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

## Perbaikan performa

* Mempercepat `Proc#call` karena kami tidak peduli `$SAFE` lagi.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Dengan *benchmark* `lc_fizzbuzz` yang menggunakan `Proc#call` berkali-kali
  kami dapat mengukur x1.4 kemajuan [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Mempercepat `block.call` di mana `block` diterima parameter *block*. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 memperbaiki performa *block passing*. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
  Selain itu, Ruby 2.6 memperbaiki performa dari pemanggilan *passed block*.
  Dengan mikro *benchmark* kami dapat mengamati x2.6 kemajuan.

* Transient Heap (theap) dikenalkan. [Bug #14858] [Feature #14989]
  theap adalah *heap* yang diatur untuk *short-living memory object* yang
  diarahkan oleh kelas tertentu (Array, Hash, Object, dan Struct). Sebagai
  contoh, membuat objek Hash yang kecil dan *short-living* 2x lebih cepat.
  Dengan rdoc *benchmark*, kami mengamati 6-7% kemajuan.

## Perubahan penting lainnya sejak 2.5

* `$SAFE` adalah sebuah proses *state* global dan kita dapat mengatur ke `0` lagi.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Menempatkan parameter `safe_level` ke `ERB.new` tidak berlaku lagi. Argumen
`trim_mode` dan `eoutvar` diubah menjadi argumen kata kunci. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Menggabungkan RubyGems 3.0.0.beta2. Opsi `--ri` dan `--rdoc` dihapus. Mohon
  gunakan opsi `--document` dan `--no-document`.

* Menggabungkan [Bundler](https://github.com/bundler/bundler) sebagai gem
  *default*.

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
untuk detail.

Dengan perubahan tersebut,
[6474 berkas berubah, 171888 sisipan(+), 46617 terhapus(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
sejak Ruby 2.5.0!

Nikmati memprogram dengan Ruby 2.6.0-preview3!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
