---
layout: news_post
title: "Ruby 3.3.0-preview1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2023-05-12 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview1" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.3. menambahkan sebuah *pure-Ruby* JIT *compiler* baru yang bernama RJIT,
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
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` dioptimisasi.
  * *Instant variable* tidak lagi keluar ke *intepreter* dengan *Object Shapes*
    yang sangat besar.
* *Metadata* dari kode yang dikompilasi menggunakan *memory* lebih sedikit.
* Peningkatan *code generation* pada ARM64
* Opsi untuk menjalankan YJIT pada *paused mode* dan mengaktifkan kembali secara manual
  * `--yjit-pause` dan `RubyVM::YJIT.resume`
  * Ini dapat digunakan untuk mengaktifkan YJIT ketika aplikasi Anda selesai *booting*
* Opsi *exit tracing* sekarang mendukung *sampling*
  * `--trace-exits-sample-rate=N`
* Perbaikan beberapa *bug*



## Fitur Penting Lainnya

### Bahasa



## Perbaikan performa

* `defined?(@ivar)` dioptimisasi dengan *Object Shapes*.

## Perubahan penting lainnya sejak 3.2



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



Berikut adalah *default gem* yang telah diperbarui.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.7
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.6.4
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.3
* stringio 3.0.7
* strscan 3.0.7
* syntax_suggest 1.0.4
* time 0.2.2
* timeout 0.3.2
* uri 0.12.1

Berikut adalah *bundled gem* yang telah diperbarui.

* minitest 5.18.0
* rbs 3.1.0
* typeprof 0.21.7
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
