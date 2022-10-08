---
layout: news_post
title: "Ruby 3.2.0 Preview 2 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2022-09-09 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview2" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.2 menambahkan banyak fitur dan memperbaiki performa.


## Dukungan WebAssembly berbasis WASI

Ini adalah sebuah *port* awal dari dukungan *WebAssembly* berbasis *WASI*.
*Port* ini memperbolehkan sebuah *CRuby binary* untuk tersedia pada *web browser*,
*Serverless Edge environment*, dan *WebAssembly/WASI embedder* lainnya.
Saat ini, *port* melewatkan rangkaian tes dasar dan *bootstrap* dengan
tidak menggunakan *Thread* API.

![](https://i.imgur.com/opCgKy2.png)

### Latar Belakang

[WebAssembly (Wasm)](https://webassembly.org/) semula diperkenalkan untuk
menjalankan program dengan aman dan cepat pada *web browser*. Tetapi sasarannya
- menjalankan program secara efisien dengan keamanan pada berbagai macam
*environment* - diinginkan sejak lama tidak hanya oleh *web*, akan tetapi oleh
aplikasi umum.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) didesain untuk
berbagai macam kasus penggunaan. Walaupun aplikasi perlu berkomunikasi dengan
sistem operasi, *WebAssembly* berjalan pada sebuah *virtual machine* yang mana
tidak memiliki sebuah *system interface*. *WASI* menstandarkannya.

Dukungan *WebAssembly/WASI* pada Ruby bermaksud untuk memanfaatkan proyek-proyek
tersebut. Ini memperbolehkan pengembang Ruby untuk memprogram aplikasi yang
berjalan pada *platform* yang menjanjikan.

### Kasus penggunaan

Dukungan ini mendorong pengembang untuk memanfaatkan *CRuby* pada
*WebAssembly environment*. Sebuah contoh kasus penggunaan adalah dukungan
*CRuby* pada [TryRuby playground](https://try.ruby-lang.org/playground/).
Sekarang Anda bisa mencoba *CRuby* pada *web browser*.

### Poin teknis

*WASI* dan *WebAssembly* saat ini memiliki beberapa fitur yang tidak didukung,
seperti mengimplementasikan *Fiber*, *exception*, dan *GC* karena ini masih
 terus berkembang dan juga untuk alasan keamanan. Oleh sebab itu, *CRuby* mengisi
gap tersebut dengan menggunakan *Asyncify*, yang mana adalah sebuah teknik
transformasi *binary* untuk mengendalikan eksekusi pada lingkungan pengguna.

Sebagai tambahan, kami membangun sebuah
[VFS di atas WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)
sehingga kami dapat mengemas aplikasi Ruby ke dalam sebuah berkas .wasm dengan
mudah. Ini membuat distribusi aplikasi Ruby sedikit lebih mudah.


### Tautan terkait

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Regexp timeout

Sebuah fitur *timeout* pada *Regexp matching* diperkenalkan.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Diketahui bahwa *Regexp matching* mungkin membutuhkan waktu yang lama. Jika
kode Anda mencoba untuk mencocokkan sebuah *Regexp* yang tidak efisien dengan
sebuah masukan yang tidak terpercaya, seorang penyerang bisa mengeksploitasi
ini untuk *Denial of Service* (disebut *Regular expression DoS* atau *ReDoS*)
yang efisien.

Risiko dari *DoS* dapat dicegah atau dikurangi secara signifikan dengan mengatur
`Regexp.timeout` berdasarkan kebutuhan dari aplikasi Ruby Anda. Mohon coba fitur
ini pada aplikasi Anda. Kami menerima umpan balik Anda.

Catat bahwa `Regexp.timeout` adalah sebuah pengaturan global. Jika Anda ingin
menggunakan pengaturan yang berbeda untuk *Regexp* tertentu, Anda bisa
menggunakan kata kunci `timeout` pada `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

Proposal asli https://bugs.ruby-lang.org/issues/17837


## Fitur penting lainnya

### Tidak lagi membundel sumber pihak ketiga

* Kami tidak lagi membundel sumber pihak ketiga, seperti `libyaml`, `libffi`.

    * libyaml telah dihapus dari *psych*. Anda mungkin butuh untuk memasang
`libyaml-dev` pada *platform Ubuntu/Debian*. Nama *package* bisa berbeda pada
*platform* lain.

    * libffi akan dihapus dari `fiddle` pada preview2

### Bahasa

* Argumen dari *anonymous rest* dan *keyword rest* sekarang dapat dilewatkan
  sebagai argumen daripada sekadar digunakan pada parameter *method*.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Sebuah *proc* yang menerima sebuah *positional argument* dan *keyword*
  tidak akan lagi *autosplat*. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* Urutan evaluasi dari *constant assignment* pada objek eksplisit telah dibuat
  konsisten dengan urutan evaluasi tunggal. Pada kode berikut:

    ```ruby
    foo::BAR = baz
    ```

  `foo` sekarang dipanggil sebelum `baz`. Demikian pula, untuk *multiple assignment*
  pada *constant*, urutan evaluasi *left-to-right* digunakan. Pada kode berikut:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Urutan evaluasi berikut sekarang digunakan:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Pencarian *pattern* tidak lagi eksperimental.
  [[Feature #18585]]

* *Method* mengambil sebuah parameter lain (seperti `*args`) dan mengharapkan
  untuk mendelegasikan *keyword argument* melalui `foo(*args)` sekarang harus
  ditandai dengan `ruby2_keywords` (jika belum terjadi). Dengan kata lain, semua
  *method* mengharapkan untuk mendelegasikan *keyword argument* melalui `*args`
  sekarang harus ditandai dengan `ruby2_keywords`, tanpa kecuali. Ini akan membuat
  transisi lebih mudah ke bentuk delegasi lain saat sebuah pustaka memerlukan
  Ruby 3+. Sebelumnya, penanda `ruby2_keywords` dijaga jika *method* penerima
  mengambil `*args`, tetapi ini adalah sebuah bug dan ketidakkonsistenan.
  Sebuah teknik yang bagus untuk menemukan potensi hilang dari `ruby2_keywords`
  adalah menjalankan rangkaian tes, menggunakan `puts nil, caller, nil`, dan
  mengecek setiap *method/block* pada rantai pemanggilan yang harus mendelegasikan
  *keyword* ditandai dengan benar sebagai `ruby2_keywords`.
  [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentally worked without ruby2_keywords in Ruby 2.7-3.1, ruby2_keywords
    # needed in 3.2+. Just like (*args, **kwargs) or (...) would be needed on
    # both #foo and #bar when migrating away from ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Perbaikan performa

### YJIT

* Dukungan arm64 / aarch64 pada *platform UNIX*.
* Membangun YJIT memerlukan Rust 1.58.1+. [[Feature #18481]]

## Perubahan penting lainnya sejak 3.1

* Hash
    * Hash#shift sekarang selalu mengembalikan *nil* jika *hash* kosong dibandingkan
      mengembalikan nilai *default* atau memanggil *default proc*. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset telah ditambakan. [[Feature #13110]]

* Module
    * Module.used_refinements telah ditambakan. [[Feature #14332]]
    * Module#refinements telah ditambakan. [[Feature #12737]]
    * Module#const_added telah ditambakan. [[Feature #17881]]

* Proc
    * Proc#dup mengembalikan sebuah *instance* dari *subclass*. [[Bug #17545]]
    * Proc#parameters sekarang menerima kata kunci *lambda*. [[Feature #15357]]

* Refinement
    * Refinement#refined_class telah ditambakan. [[Feature #12737]]

* Set
    * Set sekarang tersedia sebagai sebuah *builtin class* tanpa membutuhkan `require "set"`. [[Feature #16989]]
      Ini dimuatkan secara otomatis melalui *constant* `Set` atau sebuah pemanggilan `Enumerable#to_set`.

* String
    * String#byteindex dan String#byterindex telah ditambakan. [[Feature #13110]]
    * Memperbarui versi *Unicode* ke 14.0.0 dan *Emoji* ke 14.0. [[Feature #18037]]
      (juga diterapkan pada *Regexp*)
    * String#bytesplice telah ditambahkan. [[Feature #18598]]

* Struct
    * Sebuah *class* Struct juga dapat diinisialisasi dengan argumen *keyword*
      tanpa `keyword_init: true` pada `Struct.new` [[Feature #16806]]

## Isu kompatibilitas

Catatan: tidak termasuk perbaikan *bug*.

### Removed constant

Berikut ini adalah *constant* yang telah dihapus.

* `Fixnum` dan `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Removed method

Berikut ini adalah *method* yang telah dihapus.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Isu kompatibilitas Stdlib

* `Psych` tidak lagi membundel libyaml.
  Pengguna perlu memasang pustakan libyaml sendiri melalui *package system*.
  [[Feature #18571]]

## Pembaruan C API

### Removed C APIs

Berikut ini adalah API yang telah dihapus.

* Variabel `rb_cData`.
* *Function* "taintedness" dan "trustedness". [[Feature #16131]]

### Pembaruan pustaka standar

* Berikut ini adalah *default gem* yang telah diperbarui.

  * TBD

* Berikut ini adalah *bundled gem* yang telah diperbarui.

  * TBD

* Berikut ini adalah *default gem* yang sekarang menjadi *bundled gem*.
  Anda perlu menambahkan pustaka berikut ke `Gemfile` pada *bundler environment*.

  * TBD

Lihat [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
untuk lebih detail.

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
sejak Ruby 3.1.0!

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

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993
dan sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di berbagai
*platform* dan digunakan di seluruh dunia, khususnya untuk pengembangan *web*.



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
