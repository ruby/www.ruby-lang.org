---
layout: news_post
title: "Ruby 1.9.2-p320 Dirilis"
author: "NARUSE, Yui"
translator: "catcyborg"
lang: id
---

Ruby 1.9.2-p320 Dirilis.

Rilis ini mencakup perbaikan keamanan untuk RubyGem: kegagalan verifikasi server SSL
untuk repositori remote. Dan banyak bug diperbaiki pada rilis ini.

## Perbaikan Keamanan untuk RubyGem: Kegagalan Verifikasi Server SSL untuk Repositori Remote

Rilis ini mencakup 2 perbaikan keamanan pada RubyGems.

* Aktifkan verifikasi dari sertifikat SSL server
* Larang pengalihan dari https ke http

Para pengguna yang menggunakan sumber https pada .gemrc atau /etc/gemrc disarankan
untuk meng-upgrade ke 1.9.2-p320 atau 1.9.3-p194.

Berikut ini cuplikan dari catatan rilis RubyGem 1.8.23 \[1\].

\"Rilis ini meningkatkan keamanan yang digunakan saat RubyGem berkomunikasi dengan
sebuah server https. Jika Anda menggunakan RubyGems Anda sendiri melalui SSL, rilis ini
akan menyebabkan RubyGems untuk tidak melakukan koneksi lagi, kecuali sertifikat SSL
Anda sah secara global.

Anda dapat mengkonfigurasi penggunaan sertifikat SSL pada RubyGem melalui pilihan
:ssl\_ca\_cert dan :ssl\_verify\_mode di ~/.gemrc dan
/etc/gemrc. Cara yang disarankan adalah mengeset :ssl\_ca\_cert ke sertifikat CA
untuk server Anda atau bundel sertifikat yang mengandung sertifikat CA Anda.

Anda boleh juga mengeset :ssl\_verify\_mode ke 0 untuk menonaktifkan pengecekan
sertifikat SSL, tetapi ini tidak disarankan.\"

Terima kasih kepada John Firebaugh untuk melaporkan masalah ini.

\[1\]
[&lt;URL:https://github.com/rubygems/rubygems/blob/1.8/History.txt&gt;][1]

## Perbaikan

* Perbaikan Keamanan untuk RubyGem: Kegagalan verifikasi server SSL untuk repositori
  remote
* Perbaikan bug-bug lain

Lihat [tiket][2] dan [ChangeLog][3] untuk rinciannya.

## Unduhan

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2&gt;][4]
  * SIZE: 8981382 bytes
  * MD5: b226dfe95d92750ee7163e899b33af00
  * SHA256: 6777f865cfa21ffdc167fcc4a7da05cb13aab1bd9e59bfcda82c4b32f75e6b51

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz&gt;][5]
  * SIZE: 11338691 bytes
  * MD5: 5ef5d9c07af207710bd9c2ad1cef4b42
  * SHA256: 39a1f046e8756c1885cde42b234bc608196e50feadf1d0f202f7634f4a4b1245

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip&gt;][6]
  * SIZE: 12730896 bytes
  * MD5: 0bdfd04bfeb0933c0bdcd00e4ea94c49
  * SHA256: 83db9c86d5cf20bb91e625c3c9c1da8e61d941e1bc8ff4a1b9ea70c12f2972d3



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-192/issues?set_filter=1&amp;status_id=5
[3]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_320
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip
