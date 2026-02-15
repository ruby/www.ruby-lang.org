---
layout: news_post
title: "Ruby 1.9.3-p194 Dirilis"
author: "NARUSE, Yui"
translator: "catcyborg"
lang: id
---

Ruby 1.9.3-p194 dirilis.

Rilis ini mencakup perbaikan keamanan untuk RubyGem: kegagalan verifikasi server SSL
untuk repositori remote. Dan banyak bug diperbaiki pada rilis ini.

## Perbaikan Keamanan untuk RubyGem: Kegagalan Verifikasi Server SSL untuk Repositori Remote

Rilis ini mencakup 2 perbaikan keamanan pada RubyGems.

* Aktifkan verifikasi dari sertifikat SSL server
* Larang pengalihan dari https ke http

Para pengguna yang menggunakan sumber https pada .gemrc atau /etc/gemrc disarankan
untuk meng-upgrade ke 1.9.3-p194.

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

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;][4]
  * SIZE: 9841223 bytes
  * MD5: 2278eff4cfed3cbc0653bc73085caa34
  * SHA256: a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;][5]
  * SIZE: 12432239 bytes
  * MD5: bc0c715c69da4d1d8bd57069c19f6c0e
  * SHA256: 46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;][6]
  * SIZE: 13898712 bytes
  * MD5: 77e67b15234e442d4a3dcc450bc70fea
  * SHA256: 77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://github.com/ruby/ruby/blob//v1_9_3_194/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
