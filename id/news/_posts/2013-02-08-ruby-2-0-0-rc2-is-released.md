---
layout: news_post
title: "Ruby 2.0.0-rc2 Diluncurkan"
author: "Yusuke Endoh"
translator: "catcyborg"
date: 2013-02-08 14:34:17 +0000
lang: id
---

Ruby 2.0.0-rc2 diluncurkan. Versi ini akan menjadi kandidat rilis terakhir
dari Ruby 2.0.0.

Harap dicoba, dan laporkan masalah apapun jika Anda menemukannya.

## Lokasi Unduh

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## Fitur-Fitur Baru di 2.0.0

* Argumen berkata kunci (keyword arguments)
* Enumerable#lazy
* Module#prepend
* \#to\_h: Konvensi untuk mengkonversi ke Hash
* %i: Sebuah literal untuk Array dari simbol
* Engine regexp diupdate: Onigmo (fork dari Oniguruma)
* Enumerator#size dan Range#size diperkenalkan
* Support untuk DTrace
* TracePoint
* Optimisasi performance dari require (terutama, pada Windows)
* Support untuk NativeClient
* Peningkatan dokumentasi
* Peningkatan handling interrupt secara asynchronous
* Parameter untuk tuning ukuran stack saat launch-time
* Refinements \[experimental\]

... dan banyak lagi perbaikan lain. Harap lihat NEWS untuk detilnya.

Berikut ini beberapa artikel pengantar dari pihak ketiga.

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (dalam Bahasa Jepang)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, dalam Bahasa Jepang)

(Jika Anda sukarelawan untuk memberikan artikel tambahan, kita dapat mengutip atau merujuknya dalam pengumuman rilis berikutnya.)

## Catatan

### Inkompatibilitas

Ada tiga ketidakcocokan yang perlu diperhatikan:

* Encoding default untuk skrip Ruby sekarang UTF-8 [\[#6679\]][10]. Beberapa orang
  melaporkan bahwa hal itu mempengaruhi program yang ada, seperti beberapa
  program benchmark menjadi sangat lambat [\[ruby-dev:46547\]][11]. Specnya
  mungkin berubah untuk rilis official.
* Iconv telah dihapus, yang sudah tidak didukung lagi sejak M17N sudah
  diperkenalkan di Ruby 1.9. Gunakan String#encode, dll. sebagai penggantinya.
* Ada kerusakan ABI [\[ruby-core:48984\]][12]. Kami berpikir bahwa pengguna normal
  dapat/sebaiknya menginstal ulang library extension. Anda harus
  menyadari: JANGAN MENGKOPI FILE .so ATAU .bundle dari 1.9.

Ada beberapa inkompatibilitas yang relatif kecil
[\[ruby-core:49119\]][13]. Harap laporkan ketidakcocokan lain yang Anda temukan.

Sebagai informasi, kami sedang membuat catatan untuk meng-upgrade, tetapi
beberapa bagian sudah tidak berlaku lagi.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### Status Refinement

2\.0.0 akan mencakup Refinement sebagai \"fitur eksperimental\" karena kami
belum dapat menyetujui spesifikasi rincinya. Perhatikan bahwa perilaku Refinement
dapat berubah dalam versi mendatang Ruby.

### Ucapan Terima Kasih

Saya menghargai semua yang mencoba rilis preview dan RC1! Saya berterima kasih kepada
semua kontributor untuk kerja keras mereka memperbaiki banyak bug. Saya juga
sangat berterima kasih kepada semua orang yang membantu saya untuk melakukan rilis ini.



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
