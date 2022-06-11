---
layout: news_post
title: "Ruby 3.1.0 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2021-12-25 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.1 menjaga kompatibilitas dengan Ruby 3.0 dan menambahkan banyak fitur.

## YJIT: Compiler JIT eksperimental baru

Ruby 3.1 menggabungkan YJIT, sebuah *compiler* JIT baru yang dikembangkan oleh
Shopify.

Sejak [Ruby 2.6 mengenalkan MJIT pada 2018](https://www.ruby-lang.org/id/news/2018/12/25/ruby-2-6-0-released/),
kinerjanya sangat meningkat dan akhirnya
[kami mecapai Ruby3x3 tahun lalu](https://www.ruby-lang.org/id/news/2020/12/25/ruby-3-0-0-released/).
Meskipun *Optcarrot* telah menunjukkan peningkatan luar biasa, JIT belum
memberikan manfaat untuk aplikasi dunia nyata.

Baru-baru ini Shopify berkontribusi banyak memperbaiki Ruby dengan meningkatkan
kinerja aplikasi *Rails* mereka. YJIT adalah sebuah kontribusi penting
dan bertujuan untuk memperbaiki kinerja dari aplikasi *Rails*.

Walaupun MJIT adalah sebuah *method-based compiler* JIT dan menggunakan sebuah
*compiler* C eksternal, YJIT menggunakan *Basic Block Versioning* dan memasukkan
*compiler* JIT ke dalamnya. Dengan *Lazy Basic Block Versioning* (LBBV),
pertama ini akan meng-*compile* awal dari sebuah *method* dan secara bertahap
meng-*compile* sisanya ketika *argument types* dan variabel ditentukan secara
dinamis. Lihat
[YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781)
untuk pengenalan.

Dengan teknologi ini, YJIT meraih waktu *warmup* cepat dan peningkatan kinerja
pada kebanyakan aplikasi dunia nyata hingga 22% pada *railsbench*
dan 39% pada *liquid-render*.

YJIT merupakan sebuah fitur yang masih eksperimental dan dinonaktifkan secara
*default*. Jika Anda ingin menggunakannya, tetapkan `--yjit` pada
opsi *command-line*. Fitur ini terbatas pada *Unix-like platform* dengan
arsitektur x86-64 saat ini.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Sebuah debugger baru

Sebuah *debugger* yang telah ditulis ulang dengan lengkap
[debug.gem](https://github.com/ruby/debug) di-*bundle* dengan Ruby. *debug.gem*
memiliki fitur-fitur berikut:

* Meningkatkan kinerja *debugging* (ini tidak memperlambat aplikasi meskipun dengan *debugger*).
* Mendukung *remote debugging*.
* Mendukung *rich debugging frontend* (*VS Code* dan *Chrome browser* yang didukung saat ini).
* Mendukung *multi-process/multi-thread debugging*.
* *Colorful* REPL.
* dan fitur bermanfaat lainnya, seperti *record* & *replay*, *tracing*, dan sebagainya.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby telah mem-*bundle* *lib/debug.rb*, tetapi pustaka ini tidak dipelihara dengan
baik karena memiliki masalah kinerja dan fitur. *debug.gem* menggantikan
*lib/debug.rb* secara keseluruhan.

## error_highlight: Lokasi fine-grained error pada backtrace

Sebuah *built-in gem*, *error_highlight*, diperkenalkan. *Gem* ini memberikan
lokasi *fine-grained error* pada *backtrace*:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Saat ini, hanya `NameError` yang didukung.

*Gem* ini diaktifkan secara *default*. Anda dapat menonaktikannya dengan
menggunakan opsi *command-line* `--disable-error_highlight`.
Lihat [repositori](https://github.com/ruby/error_highlight) untuk detail.

## IRB Autocomplete dan Documentation Display

IRB sekarang memiliki sebuah fitur *autocomplete* di mana Anda dapat mengetik
kode dan dialog kandidat *autocomplete* akan muncul. Anda bisa menggunakan
*Tab* dan *Shift+Tab* untuk memilih kandidat ke atas dan ke bawah.

Jika dokumentasi terpasang ketika Anda memilih sebuah kandidat *autocomplete*,
sebuah dialog akan muncul disamping dialog kandidat *autocomplete*, menampilkan
bagian dari dokumentasi. Anda dapat membaca dokumentasi sepenuhnya dengan
menekan *Alt+d*.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## Fitur penting lainnya

### Bahasa

* Nilai pada literal *Hash* dan *keyword argument* dapat diabaikan. [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}` adalah sebuah *syntax sugar* dari `{x: x, y: y}`.
  * `foo(x:, y:)` adalah sebuah *syntax sugar* dari `foo(x: x, y: y)`.

* *Pin operator* (`^`) pada *pattern matching* sekarang mengambil sebuah *expression*. [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

  ```ruby
  Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
  #=> [[3, 5], [5, 7], [11, 13]]
  ```

* Tanda kurung dapat diabaikan pada *one-line pattern matching*. [[Feature #16182]](https://bugs.ruby-lang.org/issues/16182)

  ```ruby
  [0, 1] => _, x
  {y: 2} => y:
  x #=> 1
  y #=> 2
  ```

### RBS

RBS adalah sebuah bahasa untuk mendeskripsikan struktur dari program Ruby.
Lihat [repositori](https://github.com/ruby/rbs) untuk detail.

Perubahan sejak Ruby 3.0.0:

* Parameter *generic type* dapat dibatasi. ([PR](https://github.com/ruby/rbs/pull/844))
* Alias pada *generic type* telah didukung. ([PR](https://github.com/ruby/rbs/pull/823))
* `rbs collection` diperkenalkan untuk mengatur *gem* dari RBS. ([doc](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* Banyak *signature* pada pustaka *built-in* dan standar ditambahkan/diperbarui.
* Selain itu, memuat banyak perbaikan *bug* dan peningkatan kinerja.

Lihat [RBS changelog](https://github.com/ruby/rbs/blob/master/CHANGELOG.md)
untuk lebih detail.

### TypeProf

*TypeProf* adalah sebuah *static type analyzer* untuk Ruby.
*TypeProf* menghasilkan sebuah prototipe RBS dari kode Ruby yang
*non-type-annotated*.
Lihat [dokumentasi](https://github.com/ruby/typeprof/blob/master/doc/doc.md)
untuk detail.

Perubahan utama sejak Ruby 3.0.0 adalah sebuah dukungan IDE eksperimental yang
dikenal dengan "TypeProf for IDE".

![Demo of TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

*VS Code extension* menampilkan sebuah perkiraan (atau secara langsung tertulis
pada sebuah berkas RBS) *method signature* di atas setiap definisi *method*,
menggarisbawahi kode yang mungkin menyebabkan *name error* atau *type error*
dengan garis merah, dan melengkapi nama *method* (seperti menampilkan kandidat
*method*).
Lihat [dokumentasi](https://github.com/ruby/typeprof/blob/master/doc/ide.md)
untuk detail.

Rilis ini juga berisi banyak perbaikan *bug* dan peningkatan kinerja.

## Peningkatan kinerja

* MJIT
  * Untuk beban kerja seperti *Rails*, *default* `--jit-max-cache` diubah dari
    100 menjadi 10000. *Compiler* JIT tidak lagi mengabaikan *compilation*
    dari *method* yang memiliki panjang lebih dari 1000 instruksi.
  * Untuk mendukung *Zeitwerk* dari *Rails*, *JIT-ed code* tidak lagi dibatalkan
    ketika sebuah *TracePoint* untuk *class event* diaktifkan.

## Perubahan penting lainnya sejak 3.0

* *One-line pattern matching*, seperti `ary => [x, y, z]` tidak lagi eksperimental.
* *Multiple assignment evaluation order* telah diubah sedikit. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` sebelumnya diproses dengan urutan `baz`, `qux`,
    `foo`, dan kemudian `bar` pada Ruby 3.0. Pada Ruby 3.1, ini diproses dengan
    urutan `foo`, `bar`, `baz`, dan kemudian `qux`.
* *Variable Width Allocation: Strings* (eksperimental) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

* *Psych* 4.0 mengubah `Psych.load` untuk menggunakan `safe_load` secara *default*.
  Anda mungkin perlu menggunakan *Psynch* 3.3.2 untuk menggunakan fitur ini.
  [[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

### Pembaruan pustaka standar

*   *Default gem* berikut telah diperbarui.
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
*   *Bundled gem* berikut telah diperbarui.
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
*   *Default gem* berikut sekarang adalah *bundled gem*. Anda perlu menambahkan
    pustaka berikut pada `Gemfile` yang terdapat pada *bundler environment*.
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0

Lihat [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
untuk lebih detail.

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
sejak Ruby 3.0.0!

Selamat natal, selamat berlibur, dan nikmati memprogram dengan Ruby 3.1!

## Unduh

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

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada tahun 1993
dan sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di berbagai
*platform* dan digunakan di seluruh dunia, khususnya pengembangan *web*.
