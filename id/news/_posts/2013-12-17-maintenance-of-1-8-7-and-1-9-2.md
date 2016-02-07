---
layout: news_post
title: "Ekstensi Pemeliharaan Keamanan dari Ruby 1.8.7 dan 1.9.2"
author: "zzak"
translator: "kuntoaji"
date: 2013-12-17 20:49:03 +0000
lang: id
---

Efektif dengan segera, 1.8.7 dan 1.9.2 hanya akan didukung untuk patch keamanan
sampai Juni 2014.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  dan Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  akan bertindak sebagai maintainership.
* Setelah periode pemiliharaan selama 6 bulan, kami dapat menambah jumlah committers untuk memperpanjang
  6 bulan selanjutnya.

Ekstensi pemeliharaan ini dimungkinkan oleh [Heroku][heroku],
lihat postingan blog mereka [A Patch in Time: Securing Ruby][securing-ruby]
untuk informasi lebih lanjut.

### Pelaporan issue

Dalam masa periode ektensi pemeliharaan ini kama _hanya_ akan menerapkan patch keamanan
ke repositori source code untuk [1.8.7][source-187] dan [1.9.2][source-192].

Kami menangani keamanan dengan serius, jadi jika anda menemukan celah keamanan harap laporakan
ke security@ruby-lang.org dengan segera. Mailing list ini privat dan
masalah yang dilaporkan hanya akan dimuat setelah sebuah perbaikan telah dirilis.

Harap lihat [ruby-lang.org/id/security][security-id] untuk informasi lebih lanjut.

### Manajemen Rilis

Seperti yang telah saya sebutkan diatas, kami hanya akan menerapkan patch keamanan
dan menaikkan level patch.

Kami tidak akan merilis versi patch dari 1.8.7 atau 1.9.2 ke ruby-lang.org.
Akan tetapi, anda bebas untuk melakukan rapackage binari dari source.

Alasannya, kami tidak ingin ada tiket baru, bila dibuat sebagai rilis resmi akan membuat
tanggung jawab dari ruby-core terus berlanjut untuk menindaklanjuti pemeliharaan. Sumber daya
tim kami sudah rendah, dan kami ingin menggalakkan upgrade, tidak mendukung
versi yang lama.

### Mengapa menghidupkan kembali 1.8.7?

Anda mungkin masih ingat sebuah pengumuman sekitar 6 bulan yang lalu tentang
[pemberhentian 1.8.7][sunset-187-id].

Ketika ruby-core tidak akan melanjutkan pemeliharaan dari of 1.8.7 atau 1.9.2, Terence
dan Zachary akan memberikan dukungan terhadap kedua versi ini untuk tujuan pemeliharaan keamanan
sebagai bagian dari pemberian sponsor korporasi.

Sebelumnya kami memberikan dukungan terhadap vendor - vendor yang ingin melakukan pemeliharaan
versi - versi lama. Pada tahun 2009 pemeliharaan dari Ruby 1.8.6 dipindahkan ke Engine Yard
ketika mereka mirilis 1.8.6-p369.

### Kata - kata dorongan

Kami ingin mengambil kesempatan ini untuk sangat mendorong Anda melakukan upgrade
ke versi dari Ruby yang didukung secepat mungkin. Banyak anggota ruby-core yang telah
mengerahkan waktu berjam - jam untuk melakukan peningkatan performa dan fitur dari Ruby pada 2.0+ dan
kami harap Anda mengambil kelebihan tersebut.

Terima kasih telah mendukung kami tiada henti dan mari buat Ruby lebih baik!


[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-id]:   https://www.ruby-lang.org/id/security/
[sunset-187-id]: https://www.ruby-lang.org/id/news/2013/06/30/we-retire-1-8-7/
