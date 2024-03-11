---
layout: news_post
title: "Ruby 2.6.0-rc2 Rilis"
author: "naruse"
translator: "meisyal"
date: 2018-12-15 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.6.0-rc2.

Ruby 2.6.0-rc2 adalah kandidat rilis kedua dari Ruby 2.6.0.
RC2 dirilis untuk mengetes *Bundler* 1.17 daripada 2.0 yang di-*bundle*.
Kandidat ini memperkenalkan beberapa fitur baru dan perbaikan performa,
sebagai contoh:

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

Sampai versi 2.6.0-rc2, kami telah meraih 1.7x performa lebih cepat
dibanding Ruby 2.5 pada CPU-*intensive non-trivial benchmark workload* yang
dikenal dengan Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>.
Kami akan memperbaiki performa pada *memory-intensive workload*, seperti
aplikasi Rails.

Nantikan era baru dari performa Ruby.

## RubyVM::AbstractSyntaxTree [Eksperimental]

Ruby 2.6 mengenalkan modul `RubyVM::AbstractSyntaxTree`.

Modul ini memiliki *method* `parse` yang mem-*parse string* dari kode Ruby yang
diberikan dan mengembalikan AST (Abstract Syntax Tree) *node*, dan *method*
`parse_file` yang mem-*parse* berkas dan mengembalikan AST *node*.
Kelas `RubyVM::AbstractSyntaxTree::Node` juga diperkenalkan. Anda bisa
mendapatkan informasi lokasi dan *children node* dari objek `Node`. Fitur ini
eksperimental. Kesesuaian struktur dari AST *node* tidak dijamin.

## Fitur-fitur Baru

* Menambahkan sebuah alias baru `then` pada `Kernel#yield_self`. [[Fitur #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` tanpa `rescue` sekarang menyebabkan sebuah *syntax error*.  [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

* penamaan konstan bisa dimulai dengan sebuah huruf kapital non-ASCII. [[Fitur #13770]](https://bugs.ruby-lang.org/issues/13770)

* Memperkenalkan endless range. [[Fitur #12912]](https://bugs.ruby-lang.org/issues/12912)

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

* Menambahkan mode *oneshot* [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

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

* `FileUtils#cp_lr`.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Perbaikan performa

* Mempercepat `Proc#call` karena kami tidak peduli `$SAFE` lagi.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Dengan *benchmark* `lc_fizzbuzz` yang menggunakan `Proc#call` berkali-kali
  kami dapat mengukur x1.4 kemajuan [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Mempercepat `block.call` di mana `block` diterima parameter *block*. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 memperbaiki performa *block passing*. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

  Selain itu, Ruby 2.6 memperbaiki performa dari pemanggilan *passed block*.
  Dengan mikro *benchmark* kami dapat mengamati x2.6 kemajuan.

* Transient Heap (theap) diperkenalkan. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  theap adalah *heap* yang diatur untuk *short-living memory object* yang
  diarahkan oleh kelas tertentu (Array, Hash, Object, dan Struct). Sebagai
  contoh, membuat objek Hash yang kecil dan *short-living* 2x lebih cepat.
  Dengan rdoc *benchmark*, kami mengamati 6-7% kemajuan.

## Perubahan penting lainnya sejak 2.5

* `$SAFE` adalah sebuah proses *state* global dan kita dapat mengatur ke `0` lagi.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Menempatkan parameter `safe_level` ke `ERB.new` tidak berlaku lagi. Argumen
`trim_mode` dan `eoutvar` diubah menjadi argumen kata kunci. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Mendukung versi Unicode 11. Ini akan direncanakan untuk mendukung versi 12
  dan 12.1 pada rilis TEENY dari Ruby 2.6.

* Menggabungkan RubyGems 3.0.0.beta3. Opsi `--ri` dan `--rdoc` dihapus. Mohon
  gunakan opsi `--document` dan `--no-document`.

* Menggabungkan [Bundler](https://github.com/bundler/bundler) sebagai gem
  *default*.

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
untuk detail.

Dengan perubahan tersebut,
[6411 berkas berubah, 228864 sisipan(+), 97600 terhapus(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
sejak Ruby 2.5.0!

Nikmati memprogram dengan Ruby 2.6.0-rc2!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
