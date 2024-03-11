---
layout: news_post
title: "Ruby 2.6.0-preview2 Rilis"
author: "naruse"
translator: "meisyal"
date: 2018-05-31 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.6.0-preview2.

Ruby 2.6.0-preview2 adalah *preview* kedua menuju Ruby 2.6.0.
preview2 ini dirilis lebih awal dari biasanya karena mencakup sebuah fitur
baru yang penting, JIT.

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
sebelum rilis 2.6. Saat ini, *compiler* JIT didukung hanya ketika Ruby dibuat
oleh gcc atau clang dan *compiler* tersedia saat *runtime*. Jika sebaliknya,
Anda tidak dapat menggunakannya.

Sampai versi 2.6.0-preview1, kami hanya menyiapkan infrastruktur untuk JIT dan
sangat sedikit optimasi yang diimplementasikan. Anda dapat mengukur beberapa
potensi perbaikan ke dalam mikro *benchmark* melalui rilis ini, tetapi
ini tidak siap untuk proses final *benchmark* performa dari *compiler* JIT-nya
Ruby, khususnya untuk program yang besar seperti aplikasi Rail.

Kami akan mengimplementasikan *method inlining* di *compiler* JIT, yang mana
diharapkan meningkatkan performa Ruby secara signifikan.

Begitu juga, kami sedang merencanakan untuk menambah *platform* yang didukung,
dan rencana selanjutnya adalah mendukung Visual Studio.

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

## Perubahan penting lainnya sejak 2.5

* `$SAFE` adalah sebuah proses *state* global dan kita dapat mengatur ke `0` lagi.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Menempatkan parameter `safe_level` ke `ERB.new` tidak berlaku lagi. Argumen
`trim_mode` dan `eoutvar` diubah menjadi argumen kata kunci. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Menggabungkan RubyGems 3.0.0.beta1

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
untuk detail.

Dengan perubahan tersebut,
[4699 berkas berubah, 45744 sisipan(+), 30885 terhapus(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
sejak Ruby 2.5.0!

Nikmati memprogram dengan Ruby 2.6.0-preview2!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
