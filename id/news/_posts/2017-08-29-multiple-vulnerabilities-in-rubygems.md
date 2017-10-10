---
layout: news_post
title: "Beberapa Kerentanan di RubyGems"
author: "usa"
translator: "meisyal"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: id
---

Ada beberapa kerentanan di RubyGems yang dibungkus oleh Ruby.
Ini [dilaporkan pada blog resmi RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Detail

Kerentanan berikut ini telah dilaporkan.

* kerentanan pembajakan pada *request* DNS. (CVE-2017-0902)
* kerentanan ANSI *escape sequence*. (CVE-2017-0899)
* kerentanan DoS pada perintah *query*. (CVE-2017-0900)
* kerentanan pada *gem installer* yang memperbolehkan *malicious gem* untuk menimpa *arbitrary files*. (CVE-2017-0901)

Pengguna Ruby sangat disarankan untuk memperbarui atau mengambil salah satu solusi berikut segera mungkin.

## Versi Terimbas

* rangkaian Ruby 2.2: 2.2.7 dan sebelumnya
* rangkaian Ruby 2.3: 2.3.4 dan sebelumnya
* rangkaian Ruby 2.4: 2.4.1 dan sebelumnya
* sebelum revisi *trunk* 59672

## Solusi

Jika Anda tidak dapat memperbarui Ruby itu sendiri, perbarui RubyGems ke versi terbaru.
RubyGems 2.6.13 atau setelahnya berisi perbaikan untuk kerentanan-kerentanan di atas.

```
gem update --system
```

Jika Anda tidak dapat memperbarui RubyGems, Anda dapat melakukan perbaikan berikut sebagai sebuah solusi.

* [untuk Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [untuk Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* untuk Ruby 2.4.1: membutuhkan 2 solusi. Terapkan secara berurutan sebagai berikut:
  1. [RubyGems 2.6.11 sampai 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 sampai 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

Mengenai *trunk*, perbarui ke revisi terbaru.

## Rujukan

Laporan ini didasarkan pada [blog resmi RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Riwayat

* Semula dipublikasikan pada 2017-08-29 12:00:00 UTC
* Penambahan angka CVE pada 2017-08-31 2:00:00 UTC
* Sebut memperbarui Ruby pada 2017-09-15 12:00:00 UTC
