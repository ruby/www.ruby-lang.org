---
layout: news_post
title: "Ruby 3.3.0-preview2 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2023-09-14 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview2" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.3 menambahkan sebuah *pure-Ruby* JIT *compiler* baru yang bernama RJIT,
menggunakan Lrama sebagai *parser generator*, dan memperbaiki performa khususnya
YJIT.

## RJIT

* Memperkenalkan sebuah *pure-Ruby* JIT *compiler* dan menggantikan MJIT.
  * RJIT hanya mendukung arsitektur x86\_64 pada *platform Unix*.
  * Berbeda dengan MJIT, RJIT tidak membutuhkan sebuah C *compiler* saat *runtime*.
* RJIT ada untuk tujuan eksperimen.
  * Anda harus tetap menggunakan YJIT pada *production*.
* Jika Anda tertarik untuk mengembangkan JIT pada Ruby, mohon cek
  [k0kubun's presentation on Day 3 of RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Menggunakan Lrama ketimbang Bison

* Mengganti Bison dengan [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * Jika Anda tertarik, silakan lihat [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)

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
* *Metadata* dari kode yang dikompilasi menggunakan *memory* lebih sedikit.
* Peningkatan *code generation* pada ARM64
* Opsi untuk menjalankan YJIT pada *paused mode* dan mengaktifkan kembali secara manual
  * `--yjit-pause` dan `RubyVM::YJIT.resume`
  * Ini dapat digunakan untuk mengaktifkan YJIT ketika aplikasi Anda selesai *booting*
* `ratio_in_yjit` yang dihasilkan oleh `--yjit-stats` sekarang tersedia pada
  rilis *build*, data khusus atau dev *build* tidak lagi diperlukan.
* Opsi *exit tracing* sekarang mendukung *sampling*
  * `--trace-exits-sample-rate=N`
* Pengujian lebih saksama dan perbaikan beberapa *bug*



## Fitur Penting Lainnya

### Bahasa



## Perbaikan performa

* `defined?(@ivar)` dioptimisasi dengan *Object Shapes*.

## Perubahan penting lainnya sejak 3.2

### IRB

IRB mendapatkan beberapa peningkatan berikut, namun tidak terbatas pada:

- Integrasi `irb:rdbg` yang menyediakan pengalaman *deugging* setara dengan `pry-byebug` ([doc](https://github.com/ruby/irb#debugging-with-irb)).
- Dukungan *pager* untuk perintah, seperti `ls` dan `show_cmds`.
- Menyediakan informasi yang lebih akurat dan membantu dengan perintah `ls` dan `show_source`.

Sebagai tambahan, IRB telah menjalani *refactoring* yang ekstensif dan menerima
perbaikan *bug* untuk memfasilitasi peningkatan ke depan dengan lebih mudah.

## Isu kompatibilitas

Catatan: Tidak termasuk perbaikan *bug* dari fitur.

### Constant terhapus

Berikut ini adalah *constant* yang telah dihapus.



### Method terhapus

Berikut ini adalah *method* yang telah dihapus.



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

Berikut adalah *default gem* yang telah diperbarui.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.8
* erb 4.0.3
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.7.4
* nkf 0.1.3
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.8
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* time 0.2.2
* timeout 0.4.0
* uri 0.12.2
* yarp 0.9.0

Berikut adalah *bundled gem* yang telah diperbarui.

* minitest 5.19.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.3.7
* rbs 3.2.1
* typeprof 0.21.8
* debug 1.8.0

Berikut adalah *default gem* yang sekarang menjadi *bundled gem*.

* racc 1.7.1

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
