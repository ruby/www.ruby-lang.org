---
layout: news_post
title: "Ruby 3.2.0 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2022-12-25 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.2 menambahkan banyak fitur dan memperbaiki kinerja.


## Dukungan WebAssembly berbasis WASI

Ini adalah sebuah *port* awal dari dukungan *WebAssembly* berbasis *WASI*.
*Port* ini memperbolehkan sebuah *CRuby binary* agar tersedia pada *web browser*,
*Serverless Edge environment*, atau *WebAssembly/WASI embedder* lainnya.
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
kasus penggunaan tersebut. Walaupun aplikasi perlu berkomunikasi dengan
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


## Production-ready YJIT

![](https://i.imgur.com/X9ulfac.png)

* YJIT tidak lagi eksperimental
    * Telah dites dengan beban *production* selama lebih dari satu tahun dan terbukti cukup stabil.
* YJIT sekarang mendukung baik CPU x86-64 maupun arm64/aarch64 pada Linux, MacOS, BSD, dan *platform* UNIX lainnya.
    * Rilis ini membawa dukungan untuk Apple M1/M2, AWS Graviton, Raspberry Pi 4, dan lebih banyak lagi.
* Membangun YJIT sekarang membutuhkan Rust 1.58.0+. [[Feature #18481]]
    * Untuk memastikan CRuby dibangun dengan YJIT, mohon pasang `rustc` >= 1.58.0 sebelum
      menjalankan skrip `./configure`.
    * Mohon hubungi tim YJIT jika Anda menemui masalah.
* YJIT 3.2 lebih cepat dibandingkan 3.1 dan memiliki sekitar 1/3 *memory overhead* lebih banyak.
  * Secara keseluruhan YJIT 41% lebih cepat (*geometric mean*) daripada Ruby *interpreter* pada [yjit-bench](https://github.com/Shopify/yjit-bench).
  * *Physical memory* untuk kode JIT dialokasikan dengan malas. Tidak seperti Ruby 3.1,
    RSS dari sebuah proses Ruby diminimalisasi karena *virtual memory page* dialokasikan
    oleh `--yjit-exec-mem-size` tidak akan dipetakan ke *physical memory page*
    hingga sepenuhnya dibutuhkan oleh kode JIT.
  * Mengenalkan Code GC yang membebaskan semua *code page* ketika memori yang
    dikonsumsi oleh kode JIT mencapai `--yjit-exec-mem-size`.
  * `RubyVM::YJIT.runtime_stats` mengembalikan metrik Code GC sebagai tambahan
    `inline_code_size` dan `outlined_code_size` keys:
    `code_gc_count`, `live_page_count`, `freed_page_count`, dan `freed_code_size`.
* Statistik yang diproduksi oleh `RubyVM::YJIT.runtime_stats` sekarang tersedia pada *release build*.
    * Jalankan ruby dengan `--yjit-stats` untuk menghitung dan menimbun statistik (menimbulkan
      sedikit *run-time overhead*).
* YJIT sekarang dioptimalkan untuk mengambil kelebihan dari *object shape*. [[Feature #18776]]
* Mengambil kelebihan dari *finer-grained constant invalidation* untuk tidak
  memvalidasi kode yang lebih sedikit ketika mendefinisikan konstanta baru. [[Feature #18589]]
* Nilai *default* dari `--yjit-exec-mem-size` diubah menjadi 64 (MiB).
* Nilai *default* dari `--yjit-call-threshold` diubah menjadi 30.

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

Peningkatan ini akan mengonsumsi memori sepadan dengan panjang masukan untuk
setiap *matching*. Kami mengharapkan tidak ada masalah yang muncul karena
alokasi memori biasanya tertunda dan sebuah *Regexp matching* biasa mengonsumsi
paling banyak 10 kali memori sepanjang masukan. Jika Anda kehabisan
memori ketika mengeksekusi pada sebuah aplikasi, mohon laporkan.

Proposal asli di <https://bugs.ruby-lang.org/issues/19104>

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

Proposal asli di <https://bugs.ruby-lang.org/issues/17837>.

## Fitur penting lainnya

### SyntaxSuggest

* Fitur `syntax_suggest` (dahulu `dead_end`) terintegrasi dengan Ruby. Ini
  membantu Anda untuk menemukan posisi *error*, seperti kelupaan atau kelebihan
  `end`, dengan cepat, seperti contoh berikut:

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

### MJIT

* MJIT *compiler* diimplementasikan kembali pada Ruby sebagai pustaka standar `ruby_vm/mjit/compiler`.
* MJIT *compiler* dieksekusi dalam sebuah *fork* dari proses Ruby ketimbang
  mengeksekusi dalam sebuah *native thread* yang dikenal MJIT *worker*. [[Feature #18968]]
    * Akibatnya, Microsoft Visual Studio (MSWIN) tidak lagi didukung.
* MinGW tidak lagi didukung. [[Feature #18824]]
* Mengganti nama `--mjit-min-calls` menjadi `--mjit-call-threshold`.
* Mengubah nilai *default* `--mjit-max-cache` dari 10000 ke 100.

### PubGrub

* Bundler 2.4 sekarang menggunakan [PubGrub](https://github.com/jhawthorn/pub_grub) *resolver*
  ketimbang [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub adalah algoritma generasi berikutnya yang digunakan oleh `pub` *package manager*
    untuk bahasa pemograman Dart.
  * Anda mungkin mendapatkan hasil yang berbeda setelah perubahan ini. Mohon laporkan
    masalah tersebut ke [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems masih menggunakan Molinillo *resolver* pada Ruby 3.2. Kami merencanakan untuk
  mengganti dengan PubGrub di masa yang akan datang.

## Perubahan penting lainnya sejak 3.1

* Data
    * Kelas inti baru untuk merepresentasikan nilai dari objek yang *immutable*.
      Kelas ini mirip dengan Struct dan sebagian berbagi sebuah implementasi, tetapi
      lebih memiliki API yang *lean* dan *strict*. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` sekarang selalu mengembalikan *nil* jika *hash* kosong ketimbang
      mengembalikan nilai *default* atau memanggil *default proc*. [[Bug #16908]]

* MatchData
    * `MatchData#byteoffset` telah ditambahkan. [[Feature #13110]]

* Module
    * `Module.used_refinements` telah ditambahkan. [[Feature #14332]]
    * `Module#refinements` telah ditambahkan. [[Feature #12737]]
    * `Module#const_added` telah ditambahkan. [[Feature #17881]]

* Proc
    * `Proc#dup` mengembalikan sebuah *instance* dari *subclass*. [[Bug #17545]]
    * `Proc#parameters` sekarang menerima kata kunci *lambda*. [[Feature #15357]]

* Refinement
    * `Refinement#refined_class` telah ditambahkan. [[Feature #12737]]

* RubyVM:AbstractSyntaxTree
    * Menambahkan opsi `error_tolerant` pada `parse`, `parse_file`, dan `of`. [[Feature #19013]]
      Dengan opsi ini
        1. SyntaxError disembunyikan
        2. AST dikembalikan untuk masukan yang tidak valid
        3. `end` disempurnakan ketika sebuah *parser* menjangkau akhir dari masukan, tetapi `end` tidak cukup
        4. `end` dianggap sebagai kata kunci berdasarkan lekukan baris

        ```ruby
        # Tanpa opsi error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # Dengan opsi error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` dianggap sebagai kata kunci berdasarkan lekukan baris
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Menambahkan opsi `keep_tokens` pada `parse`, `parse_file` dan `of`. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set sekarang tersedia sebagai sebuah *builtin class* tanpa membutuhkan `require "set"`. [[Feature #16989]]
      Ini dimuatkan secara otomatis melalui `Set` *constant* atau sebuah pemanggilan `Enumerable#to_set`.

* String
    * `String#byteindex` dan `String#byterindex` telah ditambahkan. [[Feature #13110]]
    * Memperbarui versi *Unicode* ke 15.0.0 dan *Emoji* ke 15.0. [[Feature #18639]]
      (juga diaplikasikan pada *Regexp*)
    * `String#bytesplice` telah ditambahkan. [[Feature #18598]]

* Struct
    * Sebuah *class* Struct juga dapat diinisialisasi dengan argumen *keyword*
      tanpa `keyword_init: true` pada `Struct.new` [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # Mulai Ruby 3.2, kode berikut bekerja tanpa keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

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
  * `rb_random_interface_t` diperbarui dan diberikan versi.
    Pustaka *extension* yang menggunakan *interface* ini dan untuk versi lama.
    `init_int32` juga perlu didefinisikan.

### C API terhapus

Berikut ini adalah API yang telah dihapus.

* Variabel `rb_cData`.
* *Function* "taintedness" dan "trustedness". [[Feature #16131]]

### Pembaruan pustaka standar

* Bundler

    * Menambahkan dukungan --ext=rust untuk membundel *gem* dengan ekstensi Rust.
      [[GH-rubygems-6149]]
    * Membuat salinan *git repo* lebih cepat [[GH-rubygems-4475]]

* RubyGems

    * Menambahkan dukungan mswin untuk *cargo builder*. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` dibuat lebih cepat dibandingkan `CGI.escapeHTML`.
        * Ini tidak lagi mengalokasikan sebuah objek String ketika tidak ada karakter yang perlu diloloskan.
        * Ini mengabaikan pemanggilan *method* `#to_s` jika sebuah argumen sudah berupa String.
        * `ERB::Escape.html_escape` ditambahkan sebagai sebuah alias untuk `ERB::Util.html_escape`,
          yang mana belum di-*monkey-patch* oleh Rails.

* IRB
    * Perintah integrasi debug.gem telah ditambahkan: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * Perintah ini bekerja walaupun Anda tidak memiliki `gem "debug"` pada Gemfile Anda.
        * Lihat juga: [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * Perintah dan fitur Pry-like lainnya telah ditambahkan.
        * `edit` dan `show_cmds` (seperti `help` pada Pry) ditambahkan.
        * `ls` mengambil opsi `-g` atau `-G` untuk menyaring keluaran.
        * `show_source` adalah alias dari `$` dan menerima masukan tanpa kutipan.
        * `whereami` adalah alias dari `@`.

*   Berikut ini adalah *default gem* yang telah diperbarui.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   Berikut ini adalah *bundled gem* yang telah diperbarui.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

Lihat rilis GitHub seperti [GitHub Releases of logger](https://github.com/ruby/logger/releases) atau *changelog* untuk detail dari *default* atau *bundled gem*.

Lihat [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
untuk lebih detail.

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
sejak Ruby 3.1.0!

Selamat natal, selamat berlibur, dan nikmati memprogram dengan Ruby 3.2!

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

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
