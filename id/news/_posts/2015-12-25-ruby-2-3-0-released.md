---
layout: news_post
title: "Ruby 2.3.0 Rilis"
author: "naruse"
translator: "meisyal"
date: 2015-12-25 17:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 2.3.0.

Ini adalah rilis *stable* pertama dari rangkaian Ruby 2.3.
Rilis ini memperkenalkan banyak fitur sebagai contoh:

Sebuah [*frozen string literal pragma*](https://bugs.ruby-lang.org/issues/11473)
diperkenalkan.
Dengan Ruby 2.1, `"str".freeze` telah dioptimalkan untuk mengurangi alokasi objek.
Ruby 2.3 memperkenalkan sebuah *magic comment* dan opsi *command line* baru untuk
membekukan semua *string literal* di dalam berkas sumber.
Adapun tambahan untuk *debugging*, Anda bisa memperoleh di mana objek dibuat
eror `"can't modify frozen String"` dengan
opsi *command line* `--debug=frozen-string-literal`.

Sebuah [*safe navigation operator*](https://bugs.ruby-lang.org/issues/11537)
([disebut *lonely operator*](https://instagram.com/p/-M9l6mRPLR/)) `&.`,
yang telah ada di C#, Groovy, dan Swift, diperkenalkan untuk memudahkan
penanganan `nil` sebagai `obj&.foo`. `Array#dig` dan `Hash#dig` juga ditambahkan.
Catat bahwa ini berperilaku sebagai [*try! of Active Support*](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
yang khusus menangani *nil*.

[*Gem did_you_mean* dibundel](https://bugs.ruby-lang.org/issues/11252).
*Gem did_you_mean*
menunjukkan calon `NameError` dan `NoMethodError` untuk mempermudah
*debugging*.

[*RubyVM::InstructionSequence#to_binary and .load_from_binary*](https://bugs.ruby-lang.org/issues/11788) diperkenalkan sebagai fitur percobaan. Dengan fitur ini, kita dapat membuat sebuah sistem prakompilasi ISeq (*bytecode*).

Rilis ini juga mencakup banyak perbaikan performa sebagai contoh,
[*reconsider method entry data structure*](https://bugs.ruby-lang.org/issues/11278),
[*introducing new table data structure*](https://bugs.ruby-lang.org/issues/11420),
[*optimize Proc#call*](https://bugs.ruby-lang.org/issues/11569),
*machine code level tuning* untuk alokasi objek dan *method calling code*,
[*smarter instance variable data structure*](https://bugs.ruby-lang.org/issues/11170),
[`exception: false` *keyword argument support on Socket#*_nonblock methods*](https://bugs.ruby-lang.org/issues/11229)
dan sebagainya. Cek bagian "Implementation improvements" di dalam berkas NEWS.

Untuk daftar lengkap fitur baru dan catatan *compatibility*, silakan lihat
[NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) dan
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Dengan perubahan tersebut, [2946 berkas berubah, 104057 sisipan(+), 59478 terhapus(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0) sejak Ruby 2.2.0!

Selamat Hari Natal, selamat berlibur, dan nikmati memprogram dengan Ruby 2.3!

## Unduh

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
