---
layout: news_post
title: "Ruby 3.2.0 Preview 1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2022-04-03 00:00:00 +0000
lang: id
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

Kami dengan senang hati mengumumkan rilis dari Ruby {{ release.version }}.
Ruby 3.2 menambahkan banyak fitur dan perbaikan performa.


## Dukungan WebAssembly berbasis WASI

Ini adalah sebuah *port* awal dari dukungan *WebAssembly* berbasis *WASI*.
*Port* ini memperbolehkan sebuah *CRuby binary* untuk tersedia pada *web browser*,
*Serverless Edge environment*, dan *WebAssembly/WASI embedder* lainnya.
Saat ini, *port* melewatkan rangkaian tes dasar dan *bootstrap* dengan
tidak menggunakan *Thread* API.

![](https://i.imgur.com/opCgKy2.png)

### Latar belakang

[WebAssembly (Wasm)](https://webassembly.org/) semula diperkenalkan untuk
menjalankan program dengan aman dan cepat pada *web browser*. Tetapi sasarannya
- menjalankan program secara efisien dengan keamanan pada berbagai macam
*environment* - diinginkan sejak lama tidak hanya oleh *web*, akan tetapi oleh
aplikasi umum.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) didesain untuk
berbagai macam kasus penggunaan. Walaupun aplikasi perlu berkomunikasi dengan
sistem operasi, *WebAssembly* berjalan pada sebuah *virtual machine* yang mana
tidak memiliki sebuah *system interface*. *WASI* menstandarkan.

Dukungan *WebAssembly/WASI* pada Ruby bermaksud untuk memanfaatkan proyek-proyek
tersebut. Ini memperbolehkan pengembang Ruby untuk memprogram aplikasi yang
berjalan pada *platform* yang menjanjikan.

### Kasus penggunaan

Dukungan ini memperbolehkan pengembang untuk memanfaatkan *CRuby* pada sebuah
*WebAssembly environment*. Sebuah contoh kasus penggunaan adalah dukungan
*CRuby* pada [TryRuby playground](https://try.ruby-lang.org/playground/).
Sekarang Anda bisa mencoba *CRuby* pada *web browser*.

### Poin teknis

*WASI* dan *WebAssembly* saat ini memiliki beberapa fitur yang tidak didukung,
seperti mengimplementasikan *Fiber*, *exception*, dan *GC* karena ini masih
berkembang dan juga untuk alasan keamanan. Oleh sebab itu, *CRuby* mengisi gap
tersebut dengan menggunakan *Asyncify*, yang mana adalah sebuah teknik
transformasi *binary* untuk mengendalikan eksekusi pada lingkungan pengguna.

Sebagai tambahan, kami membangun sebuah
[VFS di atas WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)
sehingga kami dapat membungkus aplikasi Ruby dengan mudah ke dalam satu berkas
.wasm. Teknik ini membuat distribusi aplikasi Ruby sedikit lebih mudah.


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

* Pencarian *pattern* tidak lagi eksperimental.


### Perbaikan performa



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
    * Sebuah *class* Struct juga dapat diinisialisasi dengan argumen kata kunci
      tanpa `keyword_init: true` pada `Struct.new` [[Feature #16806]]


### Pembaruan pustaka standar

* Berikut adalah *default gem* yang diperbarui.

    * TBD

* Berikut adalah *bundled gem* yang diperbarui.

    * TBD

* Berikut adalah *default gem* yang sekarang *bundled gem*. Anda perlu untuk menambahkan pustaka ini pada `Gemfile` dalam *bundler environment*.

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

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993 dan
sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di berbagai *platform*
dan digunakan di seluruh dunia, khususnya untuk pengembangan *web*.
