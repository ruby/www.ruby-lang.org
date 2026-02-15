---
layout: news_post
title: "Ruby 2.0.0-p195 Diluncurkan"
author: "nagachika"
translator: "catcyborg"
date: 2013-05-14 13:00:01 +0000
lang: id
---

Ruby 2.0.0-p195 diluncurkan. Ini patchlevel pertama dari versi 2.0.0.

Rilis ini berisi perbaikan pada security dari extension Ruby DL / Fiddle.

* [Taint Object mem-bypass DL dan Fiddle pada Ruby
  (CVE-2013-2065)](/id/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/)

Ada juga berbagai bug, optimisasi, dan dokumentasi yang diperbaiki.

## Unduhan

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2)

      SIZE:   10807456 bytes
      MD5:    2f54faea6ee1ca500632ec3c0cb59cb6
      SHA256: 0be32aef7a7ab6e3708cc1d65cd3e0a99fa801597194bbedd5799c11d652eb5b

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz)

      SIZE:   13641558 bytes
      MD5:    0672e5af309ae99d1703d0e96eff8ea5
      SHA256: a2fe8d44eac3c27d191ca2d0ee2d871f9aed873c74491b2a8df229bfdc4e5a93

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip)

      SIZE:   15092199 bytes
      MD5:    924fe4bea72b1b258655211998631791
      SHA256: 81a4dc6cc09e491d417a51e5983c4584eff849e2a186ec3affdbe5bc15cd7db5

## Perubahan

Berikut ini beberapa perbaikan besar.
Lihat [changelog](https://github.com/ruby/ruby/blob//v2_0_0_195/ChangeLog)
atau [tiket](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&status_id=5)
untuk rinciannya.

Terima kasih banyak kepada semua committer dan kontributor.

### Core - prepend

      #7841 Module#prepend sekarang dapat mendeteksi prepend yang cyclic.
      #7843 me-remove method yang di-prepend menyebabkan exception.
      #8357 Module#prepend merusak operator perbandingan pada Module.
      #7983 Module#prepend tidak dapat meng-override method operator pada Fixnum.
      #8005 methods menjadi private/protected setelah definisi menjadi tidak dapat dipanggil pada class yang di-prepend.
      #8025 Module#included_modules meng-include class ketika di-prepend.

### Core - keyword arguments (argumen berkata kunci)

      #7922 argumen berkata kunci sisa yang tidak bernama menyebabkan SyntaxError.
      #7942 support definisi method hanya menerima argumen berkata kunci tanpa tanda kurung.
      #8008 perbaiki bug pada super dengan argumen berkata kunci.
      #8236 perbaiki cara kerja argumen sisa dan argumen kata-kunci melalui `super`.
      #8260 kunci non-symbol seharusnya tidak diperlakukan seperti argumen berkata kunci.

### Core - refinements

      #7925 perbaiki bug refinement pada panggilan method super pada block.

### Core - GC

      #8092 perbaiki akurasi GC.stat[:heap_live_num]
      #8146 hindari peningkatan heap yang tidak diperlukan.
      #8145 perbaiki peningkatan memory dengan nilai RUBY_FREE_MIN yang besar.

### Core - Regexp

      #7972 Regexp POSIX space class peka lokasi.
      #7974 grup Regexp yang tidak peka kapitalisasi tidak bekerja.
      #8023 penegasan Regexp lookbehind gagal bekerja dengan mode /m
      #8001 Regexp \Z cocok pada tempat yang seharusnya tidak cocok

### Core - lain-lain

      #8063 perbaiki pelanggaran memory potensial dan hindari abort pada environment _FORTIFY_SOURCE=2 (contoh: Ubuntu).
      #8175 ARGF#skip tidak bekerja seperti yang disebut pada dokumentasi
      #8069 File.expand_path('sesuatu', '~') sekarang mensupport home path pada Windows.
      #8220 perbaiki segmentation fault ketika defined? ().
      #8367 perbaiki regresi pada defined?(super).
      #8283 Dir.glob tidak merekursi directory yang tersembunyi.
      #8165 perbaiki bug dari banyak require file dengan memiliki file path yang tidak menggunakan karakter ascii.
      #8290 perbaiki cara kerja String#inspect yang tidak sesuai dengan karakter NUL.
      #8360 perbaiki segmentation fault Thread#join(Float::INFINITY) di beberapa platform.

### RubyGems

      Versi RubyGems yang dibundel diperbaharui menjadi 2.0.2+
      #7698 perbaiki ketidakcocokan rubygems tentang instalasi dari extension libraries.
      #8019 perbaiki bug pada gem list --remote yang tidak bekerja.

### Libraries

      #7911 File.fnmatch dengan pola US-ASCII dan UTF-8 path menyebabkan exception.
      #8240 perbaiki bug tentang OpenSSL::SSL::SSLSocket yang merusak koneksi lain atau file pada GC.
      #8183 CGI.unescapeHTML tidak dapat men-decode Numeric Character References dengan huruf kapital (&#Xnnnn).

### Build/Platform specific

      #7830 perbaiki kegagalan build karena warning pada compiler.
      #7950 perbaiki kegagalan build pada mswin/VC dengan --with-static-linked-ext.
