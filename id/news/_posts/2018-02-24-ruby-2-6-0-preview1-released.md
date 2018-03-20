---
layout: news_post
title: "Ruby 2.6.0-preview1 Rilis"
author: "naruse"
translator: "meisyal"
date: 2018-02-24 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.6.0-preview1.

Ruby 2.6.0-preview1 adalah *preview* pertama menuju Ruby 2.6.0.
preview1 ini dirilis lebih awal daripada biasanya karena rilis ini mengandung
sebuah fitur baru yang penting, JIT.

## JIT

Ruby 2.6 memperkenalkan sebuah implementasi awal dari *compiler* JIT (Just-in-time).

*Compiler* JIT bertujuan untuk memperbaiki performa dari program Ruby apapun
yang dieksekusi. Berbeda dengan JIT *compiler* biasanya pada bahasa pemrograman
lain, *compiler* JIT dari Ruby melakukan kompilasi JIT melalui sebuah jalan
unik, yang mencetak kode C ke sebuah *disk* dan mengeluarkan proses *compiler*
C untuk menghasilkan kode asli.
Lihat juga: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Bagaimana cara menggunakan: Tetapkan `--jit` pada *command line* atau `$RUBYOPT`
*environment variable*. Menetapkan `--jit-verbose=1` memperbolehkan untuk
mencetak informasi dasar dari kompilasi JIT yang berjalan. Lihat `ruby --help`
untuk pilihan lainnya.

Tujuan utama dari rilis JIT ini adalah untuk menyediakan sebuah kesempatan untuk
mengecek jika ini berjalan di *platform* Anda dan menemukan risiko keamanan
sebelum rilis 2.6. Saat ini, *compiler* JIT didukung hanya ketika Ruby dibuat
oleh gcc atau clang dan *compiler* tersedia saat *runtime*. Jika sebaliknya,
Anda tidak dapat menggunakannya.

Sampai versi 2.6.0-preview1, kami hanya menyiapkan infrastruktur untuk JIT dan
sangat sedikit optimasi yang diimplementasikan. Anda dapat mengukur beberapa
potensi perbaikan ke dalam mikro *benchmark* melalui rilis ini, tetapi
ini tidak siap untuk proses final *benchmark* performa dari *compiler* JIT-nya
Ruby, khususnya untuk program yang besar seperti aplikasi Rail.

Kami akan mengimplementasikan *method inlining* di *compiler* JIT, yang mana
diharapkan meningkatkan performa Ruby secara signifikan.

Begitu juga, kami sedang merencanakan untuk menambah *platform* yang didukung,
dan rencana selanjutnya adalah mendukung Visual Studio.

Nantikan era baru dari performa Ruby.

## Fitur Baru

* Menambahkan `Random.bytes`. [Feature #4938]
* Menambahkan `Binding#source_location`. [Feature #14230]

  *Method* ini mengembalikan lokasi sumber *binding*, sebuah *array* dua elemen dari `__FILE__` dan `__LINE__`. Secara tradisional, informasi yang sama mungkin dapat diambil dengan `eval("[__FILE__, __LINE__]")`, tetapi kami sedang merencanakan untuk mengubah perilaku ini sehingga `Kernel#eval` mengabaikan sumber lokasi `binding` [Bug #4352]. Sehingga, pengguna menggunakan *method* baru yang dikenalkan daripada `Kernel#eval`.

* Menambahkan opsi `:exception` agar membiarkan `Kernel.#system` menampilkan *error* daripada mengembalikan `false`. [Feature #14386]

## Perbaikan performa

* Mempercepat `Proc#call` karena kami tidak peduli dengan `$SAFE` lagi.
  [Feature #14318]

  Dengan *benchmark* `lc_fizzbuzz` yang menggunakan `Proc#call` berkali-kali,
  kita dapat mengukur x1.4 kemajuan [Bug #10212].

* Mempercepat `block.call` di mana `block` diterima parameter *block*. [Feature #14330]

  Ruby 2.5 memperbaiki performa *block passing*. [Feature #14045]
  Selain itu, Ruby 2.6 memperbaiki performa dari pemanggilan *passed block*.
  Dengan mikro *benchmark* kita dapat mengamati 2.6x kemajuan.

## Perubahan penting lainnya sejak 2.5

* `$SAFE` adala sebuah proses *state* global dan kita dapat mengatur ke `0` lagi. [Feature #14250]

* Menempatkan parameter `safe_level` ke `ERB.new` tidak berlaku lagi. Argumen
  `trim_mode` dan `eoutvar` diubah menjadi argumen kata kunci. [Feature #14256]

* Menggabungkan RubyGems 2.7.6

Lihat [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
untuk detail.

Dengan perubahan tersebut,
[1115 berkas berubah, 23023 sisipan(+), 14748 terhapus(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
sejak Ruby 2.5.0!

Hari ini, 24 Februari, adalah ulang tahun Ruby ke-25.
Selamat ulang tahun Ruby, dan nikmati memprogram dengan Ruby 2.6.0-preview1!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
