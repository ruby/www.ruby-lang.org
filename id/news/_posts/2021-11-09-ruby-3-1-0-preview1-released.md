---
layout: news_post
title: "Ruby 3.1.0 Preview 1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2021-11-09 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.

## YJIT: Compiler JIT eksperimental baru


Ruby 3.1 menggabungkan YJIT, sebuah *compiler* JIT baru yang dikembangkan oleh
Shopify.

Sejak [Ruby 2.6 mengenalkan MJIT pada 2018](https://www.ruby-lang.org/id/news/2018/12/25/ruby-2-6-0-released/),
kinerjanya sangat meningkat dan akhirnya
[kami mecapai Ruby3x3 tahun lalu](https://www.ruby-lang.org/id/news/2020/12/25/ruby-3-0-0-released/).
Meskipun *Optcarrot* telah menunjukkan peningkatan luar biasa, JIT belum
memberikan manfaat untuk aplikasi dunia nyata.

Baru-baru ini Shopify berkontribusi banyak memperbaiki Ruby dengan meningkatkan
kinerja aplikasi *Rails* mereka. YJIT adalah sebuah kontribusi penting dan
bertujuan untuk memperbaiki kinerja dari aplikasi *Rails*.

Walaupun MJIT adalah sebuah *method-based compiler* JIT dan menggunakan sebuah
*compiler* C eksternal, YJIT menggunakan *Basic Block Versioning* dan
memasukkan *compiler* JIT ke dalamnya. Dengan *Lazy Basic Block Versioning*
(LBBV), pertama ini akan meng-*compile* awal dari sebuah *method* dan secara
bertahap meng-*compile* sisanya ketika *argument types* dan variabel ditentukan
secara dinamis. Lihat
[YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781)
untuk pengenalan.

Dengan teknologi ini, YJIT meraih waktu *warmup* cepat dan peningkatan kinerja
pada kebanyakan aplikasi dunia nyata hingga 22% pada railsbench dan 39% pada
liquid-render.

<!-- 試す人向けのお知らせ -->

YJIT merupakan sebuah fitur yang masih eksperimental dan dinonaktifkan secara
*default*. Jika Anda ingin menggunakannya, tetapkan `--yjit` pada opsi
*command-line*. Fitur ini terbatas pada macOS & Linux dengan arsitektur x86-64
saat ini.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Sebuah debugger baru

Sebuah *debugger* baru [debug.gem](https://github.com/ruby/debug) di-*bundle*
dalam Ruby. debug.gem adalah implementasi *debugger* cepat dan menyediakan
banyak fitur, seperti *remote debugging*, *colorful* REPL, dan integrasi IDE
(VSCode). *Gem* ini menggantikan pustaka standar `lib/debug.rb`.

## error_highlight: Lokasi fine-grained error pada backtrace

Sebuah *built-in gem*, error_highlight, diperkenalkan. *Gem* ini memberikan
lokasi *fine-grained error* pada *backtrace*:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

*Gem* ini diaktifkan secara *default*. Anda dapat menonaktikannya dengan
menggunakan opsi *command-line* `--disable-error_highlight`. Lihat
[repositori](https://github.com/ruby/error_highlight) untuk detail.

## Perbaikan Irb

Akan dijelaskan pada *preview* berikutnya.

## Fitur penting lainnya

### Bahasa

* Nilai pada literal *Hash* dan *keyword argument* dapat diabaikan. [Feature #14579]
  * `{x:, y:}` adalah sebuah *syntax sugar* dari `{x: x, y: y}`.
  * `foo(x:, y:)` adalah sebuah *syntax sugar* dari `foo(x: x, y: y)`.

* *Pin operator* pada *pattern matching* sekarang mengambil sebuah *expression*. [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```


### RBS

RBS adalah sebuah bahasa untuk mendeskripsikan struktur dari program Ruby. Lihat
[repositori](https://github.com/ruby/rbs) untuk detail.

Perubahan sejak Ruby 3.0.0:

* `rbs collection` diperkenalkan untuk mengatur *gem* dari RBS. [dokumen](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Banyak *signature* pada pustaka *built-in* dan standar ditambahkan/diperbarui.
* Selain itu, memuat banyak perbaikan *bug* dan peningkatan kinerja.

Lihat [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md)
untuk informasi lebih lanjut.

### TypeProf

*TypeProf* adalah sebuah *static type analyzer* untuk Ruby. *TypeProf*
menghasilkan sebuah prototipe RBS dari kode Ruby yang *non-type-annotated*.
Lihat [dokumen](https://github.com/ruby/typeprof/blob/master/doc/doc.md)
untuk detail.

Perubahan sejak Ruby 3.0.0:

* [Dukungan IDE eksperimental](https://github.com/ruby/typeprof/blob/master/doc/ide.md)
  telah diimplementasikan.
* Banyak perbaikan bug dan peningkatan kinerja.

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
  * `foo[0], bar[0] = baz, qux` sebelumnya diproses dengan urutan `baz`, `qux`
    `foo`, dan kemudian `bar` pada Ruby 3.0. Pada Ruby 3.1, ini diproses dengan
    urutan `foo`, `bar`, `baz`, dan kemudian `qux`.
* *Variable Width Allocation: Strings* (eksperimental) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### Pembaruan pustaka standar

* Beberapa pustaka standar diperbarui.
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* *Bundled gem* berikut diperbarui.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* *Default gem* berikut sekarang adalah *bundled gem*.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

Lihat [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
untuk lebih detail.

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
