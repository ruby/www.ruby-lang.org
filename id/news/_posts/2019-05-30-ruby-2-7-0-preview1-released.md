---
layout: news_post
title: "Ruby 2.7.0-preview1 Rilis"
author: "naruse"
translator: "meisyal"
date: 2019-05-30 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.7.0-preview1.

Sebuah versi *preview* dirilis untuk mengumpulkan umpan balik rilis final yang
direncanakan rilis pada bulan Desember. Versi ini memperkenalkan sejumlah
fitur baru dan perbaikan performa, terutama:

* Compaction GC
* Pattern Matching
* REPL improvement

## Compaction GC

Rilis ini memperkenalkan *Compaction* GC yang dapat *defragment* sebuah
*fragmented memory space*.

Beberapa *multithread* dari program Ruby dapat menyebabkan *memory fragmentation*,
mengarah ke penggunaan *memory* tinggi dan penurunan kecepatan.

*Method* `GC.compact` dikenalkan untuk me-*compact heap*. Fungsi ini *compact*
objek di dalam *heap* sehingga sedikit *page* yang akan digunakan dan *heap*
bisa jadi lebih CoW bersahabat. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Experimental]

*Pattern matching*, fitur yang banyak digunakan dalam bahasa pemrograman
fungsional, dikenalkan sebagai sebuah fitur eksperimental. [#14912](https://bugs.ruby-lang.org/issues/14912)
Ini dapat melewati sebuah objek dan menetapkan nilanya jika cocok dengan sebuah
pola.

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
`readline` yang sesuai dengan implementasi Ruby murni. Ini juga menyediakan
integrasi rdoc. Di dalam `irb` Anda dapat menampilkan referensi sebuah *class*,
*module*, atau *method*. [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Selain itu, baris kode yang tampil pada `binding.irb` dan hasil pemeriksaan
objek *core-class* sekarang berwarna.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Fitur Baru Penting Lainnya

* Sebuah *method operator* referensi, <code>.:</code>, dikenalkan sebagai sebuah fitur eksperimental.  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* *Numbered parameter* sebagai *default block parameter* is dikenalkan sebagai sebuah fitur eksperimental.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Sebuah *beginless range* secara eksperimental dikenalkan. Ini mungkin tidak
  berguna seperti *endless range*, tetapi sangat baik untuk DSL. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identik dengan ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` ditambahkan. Ini menghitung banyak tiap elemen.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Perbaikan performa

* JIT [Eksperimental]

  * Kode JIT-ed di-*recompile* untuk kode *less-optimized* ketika sebuah asumsi optimisasi dibatalkan.

  * Metode *inlining* dilakukan ketika sebuah *method* dianggap murni. Optimisasi ini masih eksperimental dan banyak *method* dianggap tidak murni.

  * Nilai *default* dari `--jit-min-calls` diubah dari 5 menjadi 10,000

  * Nilai *default* dari `--jit-max-cache` diubah dari 1,000 menjadi 100

## Perubahan penting lainnya sejak 2.6

* `Proc.new` and `proc` tanpa *block* dalam sebuah *method* yang dipanggil dengan sebuah *block* diperingatkan sekarang.

* `lambda` tanpa *block* di dalam sebuah method yang dipanggil dengan sebuah *block errs*.

* Memperbarui versi Unicode dan Emoji dari 11.0.0 menjadi 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Memperbarui versi Unicode menjadi 12.1.0, menambahkan dukungan untuk U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, dan `Date.parse` untuk sementara waktu mendukung *new Japanese era* sebagai sebuah *informal extension*, sampai JIS X 0301 yang baru dikeluarkan.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Membutuhkan *compiler* untuk mendukung C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detail dari dialek kami: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) atau
[commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)
untuk lebih detail.

Dengan perubahan tersebut, [1727 berkas berubah, 76022 sisispan(+), 60286 terhapus(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)
sejak Ruby 2.6.0!

Nikmati memprogram dengan Ruby 2.7!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Apa itu Ruby

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993 dan
sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di banyak *platform*
dan dikeluarkan ke seluruh dunia khususnya untuk pengembangan *web*.
