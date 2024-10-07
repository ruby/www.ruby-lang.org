---
layout: news_post
title: "Ruby 3.3.0-preview3 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2023-11-12 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview3" | first %}
Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.3 menambahkan sebuah *parser* baru yang bernama Prism, menggunakan Lrama
sebagai *parser generator*, menambahkan *pure-Ruby* JIT *compiler* baru
yang bernama RJIT, dan memperbaiki performa khususnya YJIT.

## Prism

* Memperkenalkan [the Prism parser](https://github.com/ruby/prism) sebagai *default gem*
    * Prism adalah sebuah *parser* yang *portable*, *error tolerant*, dan *maintainable recursive descent* untuk Ruby
* Prism siap digunakan di *production* dan aktif dirawat, Anda dapat menggunakannya sebagai pengganti Ripper
    * Ada [extensive documentation](https://ruby.github.io/prism/) untuk menggunakan Prism
    * Prism adalah sebuah pustaka bahasa C yang digunakan secara internal oleh CRuby dan sebuah Ruby *gem* yang digunakan untuk mem-*parse* kode Ruby
    * Beberapa *method* penting pada Prism API:
        * `Prism.parse(source)` yang mengembalikan AST sebagai bagian dari ParseResult
        * `Prism.dump(source)` yang mengembalikan *serialized* AST sebagai sebuah String
        * `Prism.parse_comments(source)` yang mengembalikan komentar pada kode
* Anda dapat membuat *pull request* atau melaporkan isu secara langsung pada [the Prism repository](https://github.com/ruby/prism) jika Anda tertarik untuk berkontribusi

## Menggunakan Lrama ketimbang Bison

* Mengganti Bison dengan [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * Jika Anda tertarik, silakan lihat [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * Internal *parser* dari Lrama digantikan dengan LR yang dihasilkan oleh Racc untuk *maintainability*
  * *Parameterizing Rule* `(?, *, +)` didukung, ini akan digunakan di Ruby parse.y

## RJIT

* Memperkenalkan sebuah *pure-Ruby* JIT *compiler* dan menggantikan MJIT.
  * RJIT hanya mendukung arsitektur x86-64 pada *platform Unix*.
  * Berbeda dengan MJIT, RJIT tidak memerlukan sebuah *compiler* C saat *runtime*.
* RJIT ada hanya untuk tujuan eksperimen.
  * Anda seharusnya tetap menggunakan YJIT pada *production*.
* Jika Anda tertarik untuk mengembangkan JIT pada Ruby, silakan cek [k0kubun's presentation on Day 3 of RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## YJIT

* Peningkatan performa yang signifikan dibanding Ruby 3.2
  * Dukungan *splat* dan *rest argument* telah ditingkatkan.
  * *Register* dialokasikan untuk operasi *stack* dari *virtual machine*.
  * Pemanggilan dengan *optional argument* dikompilasi.
  * *Exception handler* juga dikompilasi.
  * *Instant variable* tidak lagi keluar ke *intepreter* dengan *Object Shapes*
    yang sangat besar.
  * *Call type* yang tidak didukung tidak lagi keluar ke *interpreter*.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` dioptimisasi.
  * Sekarang 3x lebih cepat dibanding *interpreter* pada optcarrot!
* Peningkatan penggunakan *memory* secara signifikan
  * *Metadata* dari kode yang dikompilasi menggunakan *memory* lebih sedikit.
  * Peningkatan *code generation* pada ARM64
* Kecepatan kompilasi sedikit lebih cepat dibanding Ruby 3.2
* Menambahkan `RubyVM::YJIT.enable` untuk mengaktifkan YJIT saat *run-time*
  * Anda dapat menjalankan YJIT tanpa memodifikasi argumen *command-line* atau *environment variable*
  * Ini dapat digunakan untuk mengaktifkan YJIT saat aplikasi Anda selesai *booting*.
    `--yjit-disable` dapat digunakan jika Anda tidak ingin mengaktifkan YJIT
    ketika aplikasi *booting*.
* Opsi untuk menonaktifkan kode GC dan memperlakukan `--yjit-exec-mem-size` sebagai sebuah batas keras
  * Dapat menghasilkan perilaku *copy-on-write* lebih baik pada *server* yang menggunakan unicorn dan *forking*
* `ratio_in_yjit` yang dihasilkan oleh `--yjit-stats` sekarang tersedia pada
  rilis *build*, data khusus atau dev *build* tidak lagi diperlukan.
* Opsi *exit tracing* sekarang mendukung *sampling*
  * `--trace-exits-sample-rate=N`
* `--yjit-perf` ditambahkan untuk memfasilitasi *profiling* dengan Linux perf.
* Pengujian lebih saksama dan perbaikan beberapa *bug*

### M:N thread scheduler

* M:N *thread scheduler* diperkenalkan. [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M Ruby *thread* diatur oleh N *native thread* (OS *thread*) sehingga pembuatan *thread* dan
    manajemen berkurang.
  * Ini dapat merusak kompatibilitas dengan C-*extension* sehingga M:N *thread* dinonaktifkan
    pada *main* dari Ractor secara *default*.
        * *Environment variable* `RUBY_MN_THREADS=1` mengaktifkan M:N *thread* pada *main* dari Ractor.
        * M:N *thread* diaktifkan pada selain *main* dari Ractor.
  * *Environment variable* `RUBY_MAX_CPU=n` menetapkan jumlah maksimum dari `N` (jumlah maksimum dari *native thread*). Nilai *default* adalah 8.
        * Karena hanya ada satu Ruby *thread* untuk setiap Ractor yang dapat berjalan bersamaan,
          jumlah *native thread* yang digunakan, yang mana lebih kecil dari jumlah yang dispesifikasikan pada
          `RUBY_MAX_CPU` dan jumlah dari Ractor yang sedang berjalan. Sehingga, aplikasi Ractor tunggal (mayoritas aplikasi)
          akan menggunakan satu *native thread*.
        * Untuk mendukung operasi *blocking*, lebih dari `N` *native thread* dapat digunakan.

## Fitur Penting Lainnya



### Bahasa



## Perbaikan performa

* `defined?(@ivar)` dioptimisasi dengan *Object Shapes*.
* *Name resolution* seperti `Socket.getaddrinfo` sekarang dapat diinterupsi (pada *environment* di mana pthread tersedia). [Feature #19965](https://bugs.ruby-lang.org/issues/19965)
  * Untuk tujuan ini, sebuah pthread sekarang dibuat setiap kali ada pemanggilan getaddrinfo atau getnameinfo.
    Ini menimbulkan *overhead* pada *name resolution* (sekitar 2.5x pada eksperimen kami).
    Kami tidak mengharapkan *overhead* menjadi sebuah masalah pada kebanyakan aplikasi, namun jika Anda menemui atau
    melihat hasil yang tidak diharapkan karena perubahan tersebut, mohon laporkan.
* *Environment variable* `RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO` telah ditambahkan. [Feature #19571](https://bugs.ruby-lang.org/issues/19571)
* *Children* dari *object* lama tidak lagi dipromosikan ke generasi lama pada *garbage collector*. [Feature #19678](https://bugs.ruby-lang.org/issues/19678)
* Dukungan untuk *weak reference* telah ditambahkan pada *garbage collector*. [Feature #19783](https://bugs.ruby-lang.org/issues/19783)

## Perubahan penting lainnya sejak 3.2

### IRB

IRB mendapatkan beberapa peningkatan berikut, namun tidak terbatas pada:

- Integrasi `irb:rdbg` yang menyediakan pengalaman *deugging* setara dengan `pry-byebug` ([doc](https://github.com/ruby/irb#debugging-with-irb)).
- Dukungan *pager* untuk perintah, seperti `ls`, `show_source`, dan `show_cmds`.
- Menyediakan informasi yang lebih akurat dan membantu dengan perintah `ls` dan `show_source`.
- Eksperimen *autocompletion* menggunakan *type analysis* ([doc](https://github.com/ruby/irb#type-based-completion)).
- Sekarang memungkinkan untuk mengubah warna dan gaya *font* pada *completion dialog* dengan mengenalkan *class* Reline::Face ([doc](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

Sebagai tambahan, IRB telah menjalani *refactoring* yang ekstensif dan menerima
perbaikan *bug* untuk memfasilitasi peningkatan ke depan dengan lebih mudah.

## Isu kompatibilitas

Catatan: Tidak termasuk perbaikan *bug* dari fitur.

### Constant terhapus

Berikut ini adalah *constant* yang telah dihapus.



### Method terhapus

Berikut ini adalah *method* yang telah dihapus.

### Environment variable terhapus

Berikut adalah *environment variable* yang telah dihapus.

* *Environment variable* `RUBY_GC_HEAP_INIT_SLOTS` tidak digunakan lagi. Mohon gunakan `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS`. [Feature #19785](https://bugs.ruby-lang.org/issues/19785)

## Isu kompatibilitas Stdlib

### `ext/readline` dipensiunkan

* Kami memiliki `reline` yang merupakan implementasi Ruby murni dan kompatibel
  dengan `ext/readline` API. Kami bergantung pada `reline` di masa depan. Jika
  Anda perlu untuk menggunakan `ext/readline`, Anda dapat memasang `ext/readline`
  melalui rubygems.org dengan `gem install readline-ext`.
* Kami tidak lagi memasang pustaka, seperti `libreadline` atau `libedit`.

## Pembaruan C API

### C API diperbarui

Berikut adalah API yang telah diperbarui.



### C API terhapus

Berikut adalah API yang telah dihapus.



## Pembaruan pustaka standar

RubyGems dan Bundler memperingatkan jika pengguna membutuhkan *gem* yang dijadwalkan
akan menjadi *bundled gem* pada Ruby versi berikutnya.

Pustaka yang ditargetkan:
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog

Berikut adalah *default gem* yang telah ditambahkan.

* prism 0.15.1

Berikut adalah *default gem* yang telah diperbarui.

* RubyGems 3.5.0.dev
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.0.dev
* cgi 0.4.0
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* etc 1.4.3.dev.1
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.6.1.dev
* irb 1.8.3
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.0
* open3 0.2.0
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.1.1
* rdoc 6.6.0
* reline 0.3.9
* rinda 0.2.0
* securerandom 0.3.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* tempfile 0.2.0
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

Berikut adalah *bundled gem* yang dipromosikan dari *default gem*.

* racc 1.7.3

Berikut adalah *bundled gem* yang telah diperbarui.

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.4.4
* net-smtp 0.4.0
* rbs 3.2.2
* typeprof 0.21.8
* debug 1.8.0

Lihat rilis GitHub, seperti [Logger](https://github.com/ruby/logger/releases)
atau *changelog* untuk detail dari *default gem* atau *bundled gem*.

Lihat [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
untuk lebih detail.

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
sejak Ruby 3.2.0!

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
