---
layout: news_post
title: "Beberapa kerentanan pada RubyGems"
author: "hsbt"
translator: "meisyal"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: id
---

Ada beberapa kerentanan pada RubyGems yang dikemas dengan Ruby.
Ini [dilaporkan pada blog resmi RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Detail

Berikut ini adalah kerentanan yang telah dilaporkan.

* CVE-2019-8320: Delete directory using symlink when decompressing tar
* CVE-2019-8321: Escape sequence injection vulnerability in `verbose`
* CVE-2019-8322: Escape sequence injection vulnerability in `gem owner`
* CVE-2019-8323: Escape sequence injection vulnerability in API response handling
* CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
* CVE-2019-8325: Escape sequence injection vulnerability in errors

Ini sangat direkomendasikan kepada pengguna Ruby untuk memperbarui Ruby atau
mengambil salah satu solusi berikut segera mungkin.

## Versi Terimbas

* Rangkaian Ruby 2.3: semua
* Rangkaian Ruby 2.4: 2.4.5 dan sebelumnya
* Rangkaian Ruby 2.5: 2.5.3 dan sebelumnya
* Rangkaian Ruby 2.6: 2.6.1 dan sebelumnya
* sebelum revisi *trunk* 67168

## Solusi

Pada prinsipnya, Anda harus memperbarui Ruby ke versi terbaru.
RubyGems 3.0.3 atau setelahnya mencakup perbaikan dari kerentanan ini, sehingga
perbarui RubyGems ke versi terbaru jika Ada tidak dapat memperbarui
Ruby itu sendiri.

```
gem update --system
```

Jika Anda tidak dapat memperbarui RubyGems, Anda dapat mengaplikasikan *patch*
berikut sebagai sebuah solusi.

* [untuk Ruby 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [untuk Ruby 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [untuk Ruby 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

Terkait dengan *trunk*, perbarui ke revisi paling terbaru.

## Rujukan

Laporan ini didasarkan pada [blog resmi RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Riwayat

* Semula dipublikasikan pada 2019-03-05 00:00:00 UTC
* Menghubungkan ke *updated patches* pada 2019-03-06 05:26:27 UTC
* Sebut memperbarui Ruby pada 2019-04-01 06:00:00 UTC
