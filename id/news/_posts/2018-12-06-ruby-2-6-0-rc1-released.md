---
layout: news_post
title: "Ruby 2.6.0-rc1 Rilis"
author: "naruse"
translator: "meisyal"
date: 2018-12-06 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.6.0-rc1.

Ruby 2.6.0-rc1 adalah kandidat rilis pertama dari Ruby 2.6.0.
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

Sampai versi 2.6.0-rc1, kami telah meraih 1.7x performa lebih cepat
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

* Menggabungkan RubyGems 3.0.0.beta2. Opsi `--ri` dan `--rdoc` dihapus. Mohon
  gunakan opsi `--document` dan `--no-document`.

* Menggabungkan [Bundler](https://github.com/bundler/bundler) sebagai gem
  *default*.

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
untuk detail.

Dengan perubahan tersebut,
[6376 berkas berubah, 227364 sisipan(+), 51599 terhapus(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
sejak Ruby 2.5.0!

Nikmati memprogram dengan Ruby 2.6.0-rc1!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
