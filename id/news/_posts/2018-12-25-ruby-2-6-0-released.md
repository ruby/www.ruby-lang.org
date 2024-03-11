---
layout: news_post
title: "Ruby 2.6.0 Rilis"
author: "naruse"
translator: "meisyal"
date: 2018-12-25 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.6.0.

Rilis ini memperkenalkan sejumlah fitur baru dan perbaikan performa, paling
utama:

* Sebuah *compiler* JIT baru.
* Modul `RubyVM::AbstractSyntaxTree`.

## JIT [Eksperimental]

Ruby 2.6 memperkenalkan sebuah implementasi awal dari *compiler* JIT
(Just-in-time).

*Compiler* JIT bertujuan untuk memperbaiki performa dari program Ruby apapun
yang dieksekusi. Berbeda dengan JIT *compiler* biasanya yang beroperasi dalam
proses, *compiler* JIT dari Ruby mencetak kode C ke sebuah *disk* dan
mengeluarkan proses *compiler* C untuk menghasilkan kode asli. Untuk lebih
detail, lihat [MJIT organization by Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization).

Untuk menggunakan *compiler* JIT, tetapkan `--jit` pada *command line* atau
`$RUBYOPT` *environment variable*. Menetapkan `--jit-verbose=1` akan membuat
*compiler* JIT mencetak informasi tambahan. Baca keluaran dari `ruby --help`
atau [documentation](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage)
untuk pilihan lainnya.

*Compiler* JIT didukung ketika Ruby dibangun oleh GCC, Clang, atau Microsoft
VC++, yang mana dibutuhkan saat *runtime*.

Sampai versi 2.6.0, kami telah [1.7x faster performance](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)
dibanding Ruby 2.5 pada CPU-*intensive non-trivial benchmark workload* yang
dikenal dengan [Optcarrot](https://github.com/mame/optcarrot). Namun demikian,
ini masih eksperimental dan banyak *memory-intensive workload*, seperti
aplikasi Rails yang mungkin tidak mendapatkan manfaat tersebut saat ini.
Untuk lebih detail, lihat [Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Nantikan era baru dari performa Ruby.

## `RubyVM::AbstractSyntaxTree` [Eksperimental]

Ruby 2.6 memperkenalkan modul `RubyVM::AbstractSyntaxTree`. **Future compatibility dari modul ini tidak dijamin**.

Modul ini memiliki *method* `parse` yang mem-*parse string* dari kode Ruby yang
diberikan dan mengembalikan AST (Abstract Syntax Tree) *node* dari kode.
*Method* `parse_file` membuka dan mem-*parse* berkas dan mengembalikan AST
*node*.

Kelas `RubyVM::AbstractSyntaxTree::Node` juga diperkenalkan. Anda bisa
mendapatkan informasi lokasi dan *children node* dari objek `Node`. Fitur ini
eksperimental.

## Fitur-fitur Penting yang Baru Lainnya

* Menambahkan sebuah alias baru dari `Kernel#yield_self` yang diberi nama `#then`. [[Fitur #14594]](https://bugs.ruby-lang.org/issues/14594)

* Nama konstan bisa dimulai dengan sebuah huruf kapital non-ASCII. [[Fitur #13770]](https://bugs.ruby-lang.org/issues/13770)

* Memperkenalkan endless range. [[Fitur #12912]](https://bugs.ruby-lang.org/issues/12912)

  Sebuah endless range, `(1..)`, berjalan tanpa ada akhirnya. Biasanya digunakan untuk kasus:

      ary[1..]                          # identik dengan ary[1..-1] tanpa magical -1
      (1..).each {|index| ... }         # infinite loop dari indeks 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Menambahkan `Enumerable#chain` dan `Enumerator#+`. [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Menambahkan operator komposisi fungsi `<<` dan `>>` menjadi `Proc` dan `Method`. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; sama dengan f(g(3))
      (f >> g).call(3) # -> 15; sama dengan g(f(3))

* Menambahkan `Binding#source_location`.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  *Method* ini mengembalikan sumber lokasi dari *binding*, sebuah *array* dua
  elemen dari `__FILE__` dan `__LINE__`. Berbicara teknikal, ini sama dengan
  `eval("[__FILE__, __LINE__]", binding)`. Namun, kami sedang merencanakan untuk
  mengubah perilaku ini sehingga `Kernel#eval` mengabaikan sumber lokasi *binding*
  [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). Dengan demikian,
  pengguna direkomendasikan untuk menggunakan `Binding#source_location` daripada
  `Kernel#eval`.

* Menambahkan pilihan `:exception` pada `Kernel#system` agar mengeluarkan
  sebuah *exception* kegagalan daripada mengembalikan `false`.  [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Menambahkan sebuah mode *oneshot* pada `Coverage`. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * Mode ini mengecek "apakah setiap baris dieksekusi minimal sekali atau tidak",
    daripada "berapa banyak setiap baris dieksekusi". Sebuah *hook* untuk setiap
    baris ditembakan paling banyak sekali dan setelah itu penanda *hook* dihapus,
    sebagai contoh ini berjalan dengan *zero overhead*.
  * Menambahkan argumen kata kunci `:oneshot_lines` pada Coverage.start.
  * Menambahkan argumen kata kunci `:stop` dan `:clear` pada Coverage.result.
    Jika `clear` *true* maka mengubah *counter* menjadi nol. Jika `stop` *true*
    maka nonaktifkan pengukuran  *coverage*.
  * Coverage.line_stub, yang mana adalah sebuah fungsi pembantu yang sederhana
    yang dapat membuat "stub" dari baris *coverage* dari sebuah kode sumber yang
    diberikan.

* Menambahkan `FileUtils#cp_lr`. Ini bekerja seperti `cp_r`, tetapi *link*
  bukan salinan.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Perbaikan performa

* Mempercepat `Proc#call` dengan menghilangkan alokasi sementara untuk `$SAFE`.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Kami telah mengukur x1.4x perbaikan performa pada *benchmark* `lc_fizzbuzz`
  yang memanggil `Proc#call` berkali-kali. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Mempercepat `block.call` ketika `block` diterima sebagai sebuah parameter *block*. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Dikombinasikan dengan perbaikan *block handling* yang diperkenalkan pada
  Ruby 2.5, *block evaluation* sekarang berjalan 2.6x lebih cepat pada sebuah
  *micro-benchmark* Ruby 2.6. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

* Transient Heap (`theap`) diperkenalkan. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap` adalah *heap* yang diatur untuk *short-living memory object* yang
  diarahkan oleh kelas tertentu (`Array`, `Hash`, `Object`, dan `Struct`).
  Membuat objek Hash yang kecil dan *short-living* 2x lebih cepat.
  Dengan rdoc *benchmark*, kami mengamati 6-7% kemajuan.

* Implementasi asli (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) dari *coroutine* untuk memperbaiki performa *context switching* dari Fiber secara signifikan. [[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

* `Fiber.yield` dan `Fiber#resume` sekitar 5x lebih cepat pada Linux 64-bit. Program-program Fiber yang intensif dapat diharapkan hingga 5% perbaikan secara keseluruhan.

## Perubahan penting lainnya sejak 2.5

* `$SAFE` adalah sebuah proses *state* global dan kita dapat mengatur ke `0` lagi.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Menempatkan parameter `safe_level` ke `ERB.new` tidak berlaku lagi. Argumen
  `trim_mode` dan `eoutvar` diubah menjadi argumen kata kunci. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Mendukung versi Unicode 11. Kami memiliki rencana untuk menambah dukungan
  Unicode versi 12 dan 12.1 pada rilis TEENY dari Ruby 2.6. Ini termasuk
  dukungan [new Japanese era](http://blog.unicode.org/2018/09/new-japanese-era.html).

* Menggabungkan RubyGems 3.0.1. Opsi `--ri` dan `--rdoc` dihapus. Mohon
  gunakan opsi `--document` dan `--no-document`.

* [Bundler](https://github.com/bundler/bundler) sekarang sebagai sebuah gem
  *default*.

* Pada blok *exception handling*, `else` tanpa `rescue` sekarang menyebabkan
  sebuah sintaks *error*. [EKSPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)
untuk lebih detail.

Dengan perubahan tersebut,
[6437 berkas berubah, 231471 sisipan(+), 98498 terhapus(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)
sejak Ruby 2.5.0!

Selamat Natal, selamat berlibur, dan nikmati memprogram dengan Ruby 2.6.0!

## Masalah yang Diketahui

_(Bagian ini ditambahkan pada 28 Januari 2019.)_

* [Net::Protocol::BufferedIO#write raises NoMethodError when sending large multi-byte string](https://github.com/ruby/ruby/pull/2058)

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
