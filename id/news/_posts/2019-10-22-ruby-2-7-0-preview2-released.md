---
layout: news_post
title: "Ruby 2.7.0-preview2 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2019-10-22 12:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.7.0-preview2.

Sebuah versi *preview* dirilis untuk mengumpulkan umpan balik rilis final
yang direncanakan rilis pada bulan Desember. Versi ini memperkenalkan
sejumlah fitur baru dan perbaikan performa, terutama:

* Compaction GC
* Pattern Matching
* REPL improvement
* Separation of positional and keyword arguments

## Compaction GC

Rilis ini memperkenalkan *Compaction* GC yang dapat *defragment* sebuah
*fragmented memory space*.

Beberapa *multi-threaded* dari program Ruby dapat menyebabkan *memory
fragmentation*, menyebabkan penggunaan *memory* tinggi dan penurunan kecepatan.

*Method* `GC.compact` dikenalkan untuk me-*compact heap*. Fungsi ini
me-*compact* objek di dalam *heap* sehingga sedikit *page* yang akan digunakan
dan *heap* bisa jadi lebih CoW bersahabat. [[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Experimental]

*Pattern matching*, fitur yang banyak digunakan dalam bahasa pemrograman
fungsional, dikenalkan sebagai sebuah fitur eksperimental. [[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)
Ini dapat melewati sebuah objek dan menetapkan nilainya jika cocok dengan
sebuah pola.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Untuk lebih detail, mohon lihat [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## REPL improvement

`irb`, membungkus *interactive development* (REPL; Read-Eval-Print-Loop),
sekarang mendukung suntingan *multi-line*. Ini didukung oleh `reline`,
`readline` yang sesuai dengan implementasi murni dari Ruby. Ini juga
menyediakan integrasi rdoc. Di dalam `irb` Anda dapat menampilkan referensi
sebuah *class*, *module*, atau *method*.  [[Feature #14683]](https://bugs.ruby-lang.org/issues/14683), [[Feature #14787]](https://bugs.ruby-lang.org/issues/14787), [[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)
Selain itu, baris kode ditampilkan pada `binding.irb` dan hasil pemeriksaan
objek *core-class* sekarang berwarna.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Separation of positional and keyword arguments

Konversi otomatis dari *keyword argument* dan *positional argument* sudah
usang dan akan dihapus di Ruby 3.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* Ketika sebuah pemanggilan *method* melewati sebuah *Hash* pada *argument*
  terakhir, ketika melewati *keyword* kosong, dan ketika *method* yang
  dipanggil menerima *keyword*, sebuah peringatan dikeluarkan. Untuk
  melanjutkan sebagai *keyword*, menambahkan sebuah *double splat operator*
  untuk menghindari peringatan dan memastikan perilaku yang benar pada Ruby 3.


  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Ketika sebuah pemanggilan *method* melewati *keyword* ke sebuah *method*
  yang menerima *keyword*, tetapi tidak memenuhi *positional argument* yang
  diperlukan, *keyword* akan dianggap sebagai sebuah *required positional
  argument* final dan sebuah peringatan dikeluarkan. Melewati *argument*
  sebagai sebuah *hash* ketimbang *keyword* untuk menghindari peringatan dan
  memastikan perilaku yang benar pada Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Ketika sebuah *method* menerima *keyword* tertentu, tetapi bukan sebuah
  *keyword splat* dan sebuah *hash* atau *keyword splat* dilewatkan *method*
  yang memasukkan *key* Symbol dan non-Symbol, *hash* akan lanjut dengan
  memisahkan dan sebuah peringatan dikeluarkan. Anda akan butuh pemanggilan
  kode untuk melewati hash yang terpisah untuk memastikan perilaku yang benar
  pada Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* Jika sebuah *method* tidak menerima *keyword* dan dipanggil dengan *keyword*,
  *keyword* akan dianggap sebagai sebuah *positional hash* tanpa peringatan.
  Perilaku ini akan berlanjut pada Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* Non-symbol diperbolehkan sebagai sebuah *keyword argument* jika *method*
  menerima *arbitrary keyword*.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> diperbolehkan pada definisi *method* sebagai penanda
  langsung bahwa *method* menerima *keyword* kosong. Memanggil *method*
  seperti itu dengan *keyword* akan menyebabkan ArgumentError.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Melewatkan sebuah *keyword splat* kosong pada sebuah *method* yang tidak
  menerima *keyword* tidak akan lagi melewati sebuah *hash* kosong, kecuali
  *hash* kosong dibutuhkan sebagai sebuah *required parameter*, di mana kasus
  sebuah peringatan akan dikelurkan. Hilangkan *double splat* untuk melanjutkan
  sebuah *positional hash*.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

## Fitur Baru Penting Lainnya

* Sebuah *method reference operator*, <code>.:</code>, dikenalkan sebagai
  sebuah fitur eksperimental.
  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125),
  [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581)

* *Numbered parameter* sebagai *default block parameter* dikenalkan sebagai
  sebuah fitur eksperimental.
  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* Sebuah *beginless range* secara eksperimental dikenalkan. Ini mungkin tidak
  berguna seperti *endless range*, tetapi sangat baik untuk penggunan DSL.
  [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` ditambahkan. Ini menghitung banyak elemen dari setiap
  elemen.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Pemanggilan sebuah *private method* pada `self` sekarang diperbolehkan.
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297)
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` ditambahkan. Ini menghasilkan sebuah *non-lazy
  enumerator* dari sebuah *lazy enumerator*.
  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Perbaikan performa

* JIT [Eksperimental]

  * Kode JIT-*ed* di-*recompile* untuk kode *less-optimized* ketika sebuah
    asumsi optimisasi dibatalkan.

  * *Method inlining* dilakukan ketika sebuah *method* dianggap murni.
    Optimisasi ini masih eksperimental dan banyak *method* dianggap tidak
    murni.

  * Nilai default dari `--jit-min-calls` diubah dari 5 ke 10,000

  * Nilai default dari `--jit-max-cache` diubah dari 1,000 ke 100

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s`, dan `nil.to_s`
  sekarang selalu mengembalikan sebuah *frozen string*. *String* yang
  dikembalikan selalu sama untuk sebuah objek. [Eksperimental]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Performa dari `CGI.escapeHTML` ditingkatkan. [GH-2226](https://github.com/ruby/ruby/pull/2226)

## Perubahan penting lainnya sejak 2.6

* Beberapa pustaka standar diperbarui.
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Beberapa pustaka lainnya yang tidak memiliki versi asli juga diperbarui.

* `Proc.new` dan `proc` tanpa *block* dalam sebuah *method* dipanggil dengan
  sebuah *block* akan diperingatkan sekarang.

* `lambda` tanpa *block* dalam sebuah *method* dipanggil dengan sebuah
  *block errs*.

* Memperbarui versi Unicode dan Emoji dari 11.0.0 ke 12.0.0. [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Memperbarui versi Unicode ke 12.1.0, menambahkan dukungan U+32FF SQUARE
  ERA NAME REIWA. [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, dan `Date.parse` mendukung *Japanese era*
  yang baru. [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Membutuhkan *compiler* untuk mendukung C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detail dialek kami: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS) atau
[commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)
untuk lebih detail.

Dengan perubahan tersebut, [3670 berkas berubah, 201242 sisipan(+),
88066 terhapus(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)
sejak Ruby 2.6.0!

Nikmati memprogram dengan Ruby 2.7!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Apa itu Ruby

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993
dan sekarang dikembangkan sebagai *open source*. Ruby berjalan di berbagai
jenis *platform* dan digunakan di seluruh dunia khususnya pengembangan *web*.
