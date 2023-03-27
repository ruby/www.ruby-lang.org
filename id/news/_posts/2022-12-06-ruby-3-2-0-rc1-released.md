---
layout: news_post
title: "Ruby 3.2.0 RC 1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2022-12-06 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.2.0-rc1" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.2 menambahkan banyak fitur dan memperbaiki kinerja.


## Dukungan WebAssembly berbasis WASI

Ini adalah sebuah *port* awal dari dukungan *WebAssembly* berbasis *WASI*.
*Port* ini memperbolehkan sebuah *CRuby binary* agar tersedia pada *web browser*,
*Serverless Edge environment*, dan *WebAssembly/WASI embedder* lainnya.
Saat ini, *port* melewatkan rangkaian tes dasar dan *bootstrap* dengan
tidak menggunakan *Thread* API.

![](https://i.imgur.com/opCgKy2.png)

### Latar Belakang

[WebAssembly (Wasm)](https://webassembly.org/) semula diperkenalkan untuk
menjalankan program dengan aman dan cepat pada *web browser*. Sasaran -
menjalankan program secara efisien dengan keamanan pada berbagai macam
*environment* - diinginkan sejak lama tidak hanya oleh *web*, akan tetapi oleh
aplikasi umum.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) didesain untuk
berbagai macam kasus penggunaan. Walaupun aplikasi perlu berkomunikasi dengan
sistem operasi, *WebAssembly* berjalan pada sebuah *virtual machine* yang mana
tidak memiliki sebuah *system interface*. *WASI* menstandarkannya.

Dukungan *WebAssembly/WASI* pada Ruby bermaksud untuk memanfaatkan proyek
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

## Peningkatan Regexp melawan ReDoS

Diketahui bahwa *Regexp matching* mungkin membutuhkan waktu yang lama. Jika
kode Anda mencoba untuk mencocokkan sebuah *Regexp* yang tidak efisien dengan
sebuah masukan yang tidak terpercaya, seorang penyerang bisa mengeksploitasi
ini untuk *Denial of Service* yang efisien (disebut *Regular expression DoS*
atau *ReDoS*).

Kami telah memperkenalkan dua peningkatan untuk memitigasi ReDoS secara
signifikan.

### Peningkatan algoritma Regexp matching

Sejak Ruby 3.2, algoritma *Regexp matching* telah ditingkatkan dengan
menggunakan teknik *memoization*.

```
# Regexp matching ini membutuhkan waktu 10 detik pada Ruby 3.1 dan 0.003 detik pada Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

Peningkatan algoritma *matching* memperbolehkan eksekusi (sekitar 90% dari eksperimen kami)
selesai dalam waktu linier.

(Untuk *preview user*: peningkatan ini mungkin akan mengonsumsi memori sebanding
dengan panjang masukan untuk setiap *matching*. Kami mengharapkan tidak ada
masalah yang muncul karena alokasi memori biasanya terlambat dan sebuah *Regexp matching*
biasa mengonsumsi paling banyak 10 kali memori sepanjang masukan. Jika Anda kehabisan
memori ketika mengeksekusi pada sebuah aplikasi, mohon laporkan).

Proposal asli di https://bugs.ruby-lang.org/issues/19104

### Regexp timeout

Peningkatan di atas tidak dapat diterapkan pada *regular expression* tertentu,
seperti mengandung fitur lanjutan (contoh, *back-references* atau *look-around*),
atau dengan pengulangan dalam jumlah tetap yang sangat besar. Sebagai penanganan,
Sebuah fitur *timeout* pada *Regexp matching* juga diperkenalkan.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError akan muncul dalam waktu satu detik
```

Catat bahwa `Regexp.timeout` adalah sebuah pengaturan global. Jika Anda ingin
menggunakan pengaturan yang berbeda untuk *Regexp* tertentu, Anda bisa
menggunakan kata kunci `timeout` pada `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# regexp ini tidak memiliki timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # tidak pernah diinterupsi
```

Proposal asli di https://bugs.ruby-lang.org/issues/17837

## Fitur penting lainnya

### SyntaxSuggest

* Fitur `syntax_suggest` (dahulu `dead_end`) terintegrasi dengan Ruby. Ini
  membantu Anda untuk menemukan posisi *error*, seperti kelupaan atau kelebihan
  `end`, untuk kembali dengan cepat, seperti contoh berikut:

  ```
  Ketidakcocokan `end', kata kunci hilang (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 4    end
    5  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* Saat ini, fitur menunjuk pada argumen yang relevan pada TypeError dan ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

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
  # Ruby 3.1 dan sebelumnya
  # => 1
  # Ruby 3.2 dan setelahnya
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
  adalah menjalankan rangkaian tes, dimana pun tes gagal cari *method* terakhir
  yang harus menerima *keyword argument*, menggunakan `puts nil, caller, nil`, dan
  mengecek setiap *method/block* pada rantai pemanggilan yang harus mendelegasikan
  *keyword* ditandai dengan benar sebagai `ruby2_keywords`.
  [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Secara tidak sengaja, berjalan tanpa ruby2_keywords pada Ruby 2.7-3.1,
    # ruby2_keywords dibutuhkan pada 3.2+. Sama halnya dengan (*args, **kwargs)
    # atau (...) yang juga dibutuhkan baik #foo maupun #bar ketika migrasi
    # dari ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Perbaikan kinerja

### YJIT

* YJIT sekarang mendukung baik CPU x86-64 maupun arm64/aarch64 pada Linux, MacOS, BSD, dan *platform* UNIX lainnya.
    * Rilis ini memberi dukungan kepada Mac M1/M2, AWS Graviton, dan Raspberry Pi 4 ARM64 *processor*.
* Membangun YJIT memerlukan Rust 1.58.0+. [[Feature #18481]]
    * Untuk memastikan CRuby dibangun dengan YJIT, mohon pasang rustc >= 1.58.0 dan
      jalankan `./configure` dengan `--enable-yjit`.
    * Mohon hubungi tim YJIT jika Anda menemui masalah.
* *Physical memory* untuk kode JIT dialokasikan dengan malas. Tidak seperti Ruby 3.1,
  RSS dari sebuah proses Ruby diminimalisasi karena *virtual memory page* dialokasikan
  oleh `--yjit-exec-mem-size` tidak akan dipetakan ke *physical memory page*
  hingga sepenuhnya dibutuhkan oleh kode JIT.
* Mengenalkan Code GC yang membebaskan semua *code page* ketika memori yang
  dikonsumsi oleh kode JIT mencapai `--yjit-exec-mem-size`.
    * RubyVM::YJIT.runtime_stats mengembalikan metrik Code GC sebagai tambahan
      `inline_code_size` dan `outlined_code_size` keys:
      `code_gc_count`, `live_page_count`, `freed_page_count`, dan `freed_code_size`.
* Statistik yang diproduksi oleh RubyVM::YJIT.runtime_stats sekarang mayoritas
  tersedia pada *release build*.
    * Jalankan ruby dengan `--yjit-stats` untuk menghitung statistik (menimbulkan
      sedikit *run-time overhead*).
* YJIT sekarang dioptimalkan untuk mengambil kelebihan dari *object shape*. [[Feature #18776]]
* Mengambil kelebihan dari *finer-grained constant invalidation* untuk tidak
  memvalidasi kode yang lebih sedikit ketika mendefinisikan konstanta baru. [[Feature #18589]]

### MJIT

* MJIT *compiler* diimplementasikan kembali pada Ruby sebagai pustaka standar `mjit`.
* MJIT *compiler* dieksekusi dalam sebuah *fork* dari proses Ruby ketimbang
  mengeksekusi dalam sebuah *native thread* yang dikenal MJIT *worker*. [[Feature #18968]]
    * Sebagai hasilnya, Microsoft Visual Studio (MSWIN) tidak lagi didukung.
* MinGW tidak lagi didukung. [[Feature #18824]]
* Mengganti nama `--mjit-min-calls` menjadi `--mjit-call-threshold`.
* Mengubah nilai `--mjit-max-cache` dari 10000 ke 100.

### PubGrub

* Bundler 2.4 sekarang menggunakan [PubGrub](https://github.com/jhawthorn/pub_grub) *resolver*
  ketimbang [Molinillo](https://github.com/CocoaPods/Molinillo).

    * PubGrub adalah algoritma generasi berikutnya yang digunakan oleh `pub`
      *package manager* untuk bahasa pemograman Dart.
    * Anda mungkin mendapatkan hasil yang berbeda setelah perubahan ini. Mohon laporkan
      masalah tersebut ke [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems masih menggunakan Molinillo *resolver* pada Ruby 3.2. Kami merencanakan untuk
  mengganti dengan PubGrub di masa yang akan datang.

## Perubahan penting lainnya sejak 3.1

* Hash
    * Hash#shift sekarang selalu mengembalikan *nil* jika *hash* kosong ketimbang
      mengembalikan nilai *default* atau memanggil *default proc*. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset telah ditambahkan. [[Feature #13110]]

* Module
    * Module.used_refinements telah ditambahkan. [[Feature #14332]]
    * Module#refinements telah ditambahkan. [[Feature #12737]]
    * Module#const_added telah ditambahkan. [[Feature #17881]]

* Proc
    * Proc#dup mengembalikan sebuah *instance* dari *subclass*. [[Bug #17545]]
    * Proc#parameters sekarang menerima kata kunci *lambda*. [[Feature #15357]]

* Refinement
    * Refinement#refined_class telah ditambahkan. [[Feature #12737]]

* Set
    * Set sekarang tersedia sebagai sebuah *builtin class* tanpa membutuhkan `require "set"`. [[Feature #16989]]
      Ini dimuatkan secara otomatis melalui konstanta `Set` atau sebuah pemanggilan `Enumerable#to_set`.

* String
    * String#byteindex dan String#byterindex telah ditambahkan. [[Feature #13110]]
    * Memperbarui versi *Unicode* ke 15.0.0 dan *Emoji* ke 15.0. [[Feature #18639]]
      (juga diaplikasikan pada *Regexp*)
    * String#bytesplice telah ditambahkan. [[Feature #18598]]

* Struct
    * Sebuah *class* Struct juga dapat diinisialisasi dengan argumen *keyword*
      tanpa `keyword_init: true` pada `Struct.new` [[Feature #16806]]

## Isu kompatibilitas

Catatan: tidak termasuk perbaikan *bug*.

### Constant terhapus

Berikut ini adalah *constant* yang telah dihapus.

* `Fixnum` dan `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Method terhapus

Berikut ini adalah *method* yang telah dihapus.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Isu kompatibilitas Stdlib

### Tidak lagi membundel sumber pihak ketiga

* Kami tidak lagi membundel sumber dari pihak ketiga, seperti `libyaml`, `libffi`.

    * libyaml telah dihapus dari psych. Anda mungkin membutuhkan untuk memasang
      `libyaml-dev` dengan *Ubuntu/Debian platform*. Nama *package* berbeda untuk setiap *platform*.

    * libffi juga telah dihapus dari `fiddle`

* Psych dan fiddle mendukung *static build* dengan versi spesifik dari libyaml dan libffi.
  Anda dapat membangun psych dengan libyaml-0.2.5 seperti ini:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    Dan Anda dapat membangun fiddle dengan libffi-3.4.4:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Pembaruan C API

### C API diperbarui

Berikut ini adalah API yang telah diperbarui.

* Pembaruan PRNG
  `rb_random_interface_t` diperbarui dan diberikan versi.
  Pustaka *extension* yang menggunakan *interface* ini dan untuk versi lama.
  `init_int32` juga perlu didefinisikan.

### C API terhapus

Berikut ini adalah API yang telah dihapus.

* Variabel `rb_cData`.
* *Function* "taintedness" dan "trustedness". [[Feature #16131]]

### Pembaruan pustaka standar

*   Berikut ini adalah *default gem* yang telah diperbarui.
    * RubyGems 3.4.0.dev
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.0.dev
    * cgi 0.3.6
    * date 3.3.0
    * delegate 0.3.0
    * did_you_mean 1.6.2
    * digest 3.1.1
    * drb 2.1.1
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.1
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.5.11
    * io-nonblock 0.2.0
    * io-wait 0.3.0.pre
    * ipaddr 1.2.5
    * irb 1.5.1
    * json 2.6.2
    * logger 1.5.2
    * mutex_m 0.1.2
    * net-http 0.3.1
    * net-protocol 0.2.0
    * nkf 0.1.2
    * open-uri 0.3.0
    * openssl 3.1.0.pre
    * optparse 0.3.0
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.0
    * racc 1.6.1
    * rdoc 6.5.0
    * reline 0.3.1
    * resolv 0.2.2
    * securerandom 0.2.1
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 1.0.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * win32ole 1.8.9
    * zlib 3.0.0
*   Berikut ini adalah *bundled gem* yang telah diperbarui.
    * minitest 5.16.3
    * power_assert 2.0.2
    * test-unit 3.5.5
    * net-ftp 0.2.0
    * net-imap 0.3.1
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.1
    * typeprof 0.21.3
    * debug 1.7.0

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
dan sekarang dikembangkan sebagai *Open Source*. Ruby berjalan pada berbagai
*platform* dan digunakan di seluruh dunia, khususnya pengembangan *web*.



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
[Feature #18639]: https://bugs.ruby-lang.org/issues/18639
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18589]: https://bugs.ruby-lang.org/issues/18589
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Feature #18776]: https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Bug #19013]:     https://bugs.ruby-lang.org/issues/19013
