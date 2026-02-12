---
layout: news_post
title: "Ruby 2.0.0-p247 Dirilis"
author: "nagachika"
translator: "catcyborg"
date: 2013-06-27 11:00:03 +0000
lang: id
---

Sekarang Ruby 2.0.0-p247 dirilis.

Rilis ini mencakup perbaikan keamanan tentang OpenSSL yang dibundel.

* [Kerentanan terlewatinya pemeriksaan hostname pada klien SSL
  (CVE-2013-4073)](/id/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

Dan beberapa perbaikan bug lain juga termasuk dalam rilis ini.

## Unduhan

Anda dapat mengunduh rilis ini dari:

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      SIZE:   10804581 bytes
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      SIZE:   13652782 bytes
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      SIZE:   15100206 bytes
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## Perubahan

Berikut ini daftar perbaikan besar.

Lihat [tiket](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
dan [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_0_0_247) untuk rinciannya.

### Keyword Arguments (argumen berkata kunci)

* [#8040](https://bugs.ruby-lang.org/issues/8040) ganti prioritas antara argumen berkata kunci dan argumen wajib.
* [#8416](https://bugs.ruby-lang.org/issues/8416) super tidak mem-forward `**` bernama atau anonim
* [#8463](https://bugs.ruby-lang.org/issues/8463) bug pada auto-splat Proc dengan argumen bernama

### VM/Pemrosesan Bahasa

* [#8424](https://bugs.ruby-lang.org/issues/8424) perbaikan loop tak berhingga pada saat stack overflow dengan TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ tidak bekerja pada eval dengan binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: B_RETURN_EVENT tidak terpicu saat "next" digunakan
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (dan block sebenarnya) ter-persist antara panggilan ke proc yang dibuat dari sebuah method (menggunakan method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (dan block sebenarnya) ter-persist antara panggilan ke proc yang dibuat oleh Symbol#to_proc.

### RubyGems

Versi RubyGems yang dibundel diperbaharui ke 2.0.3

### Encoding

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar mengembalikan codepoints yang salah ketika mengkonversi encoding

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() crash pada Win32SP3 32bit

### Library

* [#8467](https://bugs.ruby-lang.org/issues/8467) Rewinding dan mengiterasi IO yang di-gzip IO menyebabkan segmentation fault (kesalahan segmentasi)
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response me-raise "Net::IMAP::ResponseParseError: unexpected token CRLF" untuk CAPABILITY common

## Komentar Rilis

Banyak committer, penguji dan pengguna yang memberi laporan bug membantu saya untuk membuat rilis ini.
Terima kasih atas kontribusi mereka.
