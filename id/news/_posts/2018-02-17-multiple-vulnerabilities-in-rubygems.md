---
layout: news_post
title: "Beberapa kerentanan pada RubyGems"
author: "usa"
translator: "meisyal"
date: 2018-02-17 03:00:00 +0000
tags: security
lang: id
---

Ada beberapa kerentanan pada RubyGems yang dikemas dengan Ruby.
Ini [dilaporkan pada blog resmi RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Detail

Kerentanan berikut ini telah dilaporkan.

* Mencegah *path traversal* ketika menulis sebuah *symlinked basedir* di luar *root*.
* Memperbaiki kemungkinan *Unsafe Object Deserialization Vulnerability* pada pemilik gem.
* Menafsirkan *octal fields* pada *tar headers* dengan ketat.
* Memunculkan sebuah kesalahan keamanan ketika ada beberapa duplikat berkas dalam satu paket.
* Melakukan validasi URL pada atribut halaman utama *spec*.
* Menangani kerentanan XSS pada halaman awal atribut ketika ditampilkan melalui gem *server*.
* Mencegah *Path Traversal* selama pemasangan gem.

Ini sangat direkomendasikan kepada pengguna Ruby untuk memperbarui Ruby atau
mengambil salah satu solusi berikut segera mungkin.

## Versi Terimbas

* Rangkaian Ruby 2.2: 2.2.9 dan sebelumnya
* Rangkaian Ruby 2.3: 2.3.6 dan sebelumnya
* Rangkaian Ruby 2.4: 2.4.3 dan sebelumnya
* Rangkaian Ruby 2.5: 2.5.0 dan sebelumnya
* sebelum revisi *trunk* 62422

## Solusi

Pada prinsipnya, Anda harus memperbarui Ruby ke versi terbaru.
RubyGems 2.7.6 atau setelahnya berisi perbaikan dari kerentanan di atas,
sehingga perbarui RubyGems ke versi terbaru jika Anda tidak dapat memperbarui
Ruby itu sendiri.

```
gem update --system
```

Jika Anda tidak dapat memperbarui RubyGems, Anda dapat mengaplikasikan *patch* berikut sebagai solusi.

* [untuk Ruby 2.2.9](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [untuk Ruby 2.3.6](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [untuk Ruby 2.4.3](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [untuk Ruby 2.5.0](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

Tentang *trunk*, perbarui ke revisi terbaru.

## Rujukan

Laporan ini didasarkan pada [blog resmi RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Riwayat

* Semula dipublikasikan pada 2018-02-17 03:00:00 UTC
* Sebut memperbarui Ruby pada 2018-03-29 01:00:00 UTC
