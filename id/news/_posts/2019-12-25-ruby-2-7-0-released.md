---
layout: news_post
title: "Ruby 2.7.0 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2019-12-25 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.7.0.

Rilis ini memperkenalkan sejumlah fitur baru dan perbaikan performa,
terutama:

* Pattern Matching
* REPL improvement
* Compaction GC
* Separation of positional and keyword arguments

## Pattern Matching [Experimental]

*Pattern matching*, fitur yang banyak digunakan dalam bahasa pemrograman
fungsional, dikenalkan sebagai sebuah fitur eksperimental.
[[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)

Ini dapat melewati sebuah objek dan menetapkan nilainya jika cocok dengan
sebuah pola.

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

Untuk lebih detail, mohon lihat
[Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## REPL improvement

`irb`, membungkus *interactive development* (REPL; Read-Eval-Print-Loop),
sekarang mendukung suntingan *multi-line*. Ini didukung oleh `reline`,
pustaka `readline` yang sesuai dengan implementasi murni dari Ruby. Ini juga
menyediakan integrasi rdoc. Di dalam `irb` Anda dapat menampilkan referensi
sebuah *class*, *module*, atau *method*.
[[Feature #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Feature #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)

Selain itu, baris kode ditampilkan oleh `Binding#irb` dan hasil pemeriksaan
objek *core-class* sekarang berwarna.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259" poster="https://cache.ruby-lang.org/pub/media/irb-reline-screenshot.png">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take3.mp4" type="video/mp4">
</video>

## Compaction GC

Rilis ini memperkenalkan *Compaction* GC yang dapat *defragment* sebuah
*fragmented memory space*.

Beberapa *multi-threaded* dari program Ruby dapat menyebabkan *memory
fragmentation*, menyebabkan penggunaan *memory* tinggi dan penurunan kecepatan.

*Method* `GC.compact` dikenalkan untuk me-*compact heap*. Fungsi ini
me-*compact* objek di dalam *heap* sehingga sedikit *page* yang akan digunakan
dan *heap* bisa jadi lebih CoW (copy-on-write) bersahabat.
[[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Separation of positional and keyword arguments

Konversi otomatis dari *keyword argument* dan *positional argument* sudah
usang dan akan dihapus di Ruby 3.
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

Lihat artikel "[Pemisahan positional dan keyword argument pada Ruby 3.0](https://www.ruby-lang.org/id/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)" untuk detail.
Hanya perubahan-perubahan sebagai berikut.

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
  menerima *arbitrary keyword*.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* `**nil` diperbolehkan pada definisi *method* sebagai penanda
  langsung bahwa *method* menerima *keyword* kosong. Memanggil *method*
  seperti itu dengan *keyword* akan menyebabkan ArgumentError.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

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
  sebuah *positional hash*.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

Jika Anda ingin menonaktifkan peringatan *deprecation*, mohon gunakan sebuah
*command-line argument* `-W:no-deprecated` atau
tambahkan `Warning[:deprecated] = false` pada kode Anda.

## Fitur Baru Penting Lainnya

* *Numbered parameter* sebagai *default block parameter* dikenalkan.
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

* Pemanggilan sebuah *private method* dengan sebuah `self` *literal*
  sebagai penerima sekarang diperbolehkan.
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` ditambahkan.
  Ini menghasilkan sebuah *non-lazy enumerator* dari sebuah *lazy enumerator*.
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

  * Nilai default dari `--jit-min-calls` diubah dari 5 ke 10,000.

  * Nilai default dari `--jit-max-cache` diubah dari 1,000 ke 100.

* `Module#name`, `true.to_s`, `false.to_s`,
  dan `nil.to_s` sekarang selalu mengembalikan sebuah *frozen string*.
  *String* yang dikembalikan selalu sama untuk sebuah objek.
  [Eksperimental]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Performa dari `CGI.escapeHTML` ditingkatkan.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Performa dari Monitor dan MonitorMixin ditingkatkan.
  [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

* *Per-call-site method cache*, yang mana telah ada sejak Ruby 1.9,
  telah ditingkatkan: *cache hit rate* meningkat dari 89% ke 94%.
  Lihat [GH-2583](https://github.com/ruby/ruby/pull/2583)

* RubyVM::InstructionSequence#to_binary *method* menghasilkan *compiled binary*.
  Ukuran *binary* berkurang. [Feature #16163]

## Perubahan penting lainnya sejak 2.6

* Beberapa pustaka standar diperbarui.
  * Bundler 2.1.2
    ([Release note](https://github.com/bundler/bundler/releases/tag/v2.1.2))
  * RubyGems 3.1.2
    * ([Release note for 3.1.0](https://github.com/rubygems/rubygems/releases/tag/v3.1.0))
    * ([Release note for 3.1.1](https://github.com/rubygems/rubygems/releases/tag/v3.1.1))
    * ([Release note for 3.1.2](https://github.com/rubygems/rubygems/releases/tag/v3.1.2))
  * Racc 1.4.15
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Beberapa pustaka lainnya yang tidak memiliki versi asli juga diperbarui.

* Pustaka-pustaka berikut tidak lagi sebagai *bundled gem*.
  Pasang *gem* yang sesuai untuk menggunakan fitur-fitur ini.
  * CMath (cmath gem)
  * Scanf (scanf gem)
  * Shell (shell gem)
  * Synchronizer (sync gem)
  * ThreadsWait (thwait gem)
  * E2MM (e2mmap gem)

* `profile.rb` telah dihapus dari pustaka standar.

* Memasukkan stdlib sebagai *default gem*
  * *default gem* di bawah ini telah dipublikasikan ke rubygems.org
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * *default gem* di bawah ini hanya dimasukkan ke ruby-core,
    tetapi belum dipublikasikan ke rubygems.org.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* `Proc.new` dan `proc` tanpa *block* dalam sebuah *method* dipanggil dengan
  sebuah *block* akan diperingatkan sekarang.

* `lambda` tanpa *block* dalam sebuah *method* dipanggil dengan sebuah
  *block* yang mengeluarkan *exception*.

* Memperbarui versi Unicode dan Emoji dari 11.0.0 ke 12.0.0.
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Memperbarui versi Unicode ke 12.1.0,
  menambahkan dukungan U+32FF SQUARE ERA NAME REIWA.
  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, dan `Date.parse` mendukung
  *Japanese era* yang baru.
  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Membutuhkan *compiler* untuk mendukung C99.
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detail dialek kami:
    <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_7_0/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)
untuk lebih detail.

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)
sejak Ruby 2.6.0!

Selamat Natal, selamat berlibur, dan nikmati memprogram dengan Ruby 2.7!

## Unduh

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Apa itu Ruby

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993
dan sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di berbagai
jenis *platform* dan digunakan di seluruh dunia khususnya pengembangan *web*.
