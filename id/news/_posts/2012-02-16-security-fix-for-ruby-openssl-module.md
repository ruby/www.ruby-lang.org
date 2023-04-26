---
layout: news_post
title: "Perbaikan Keamanan untuk Modul OpenSSL Ruby: Izinkan \"0/n splitting\" untuk pencegahan serangan TLS BEAST."
author: "Urabe Shyouhei"
translator: "catcyborg"
lang: id
---

Pada OpenSSL, pilihan `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS` untuk koneksi SSL
digunakan untuk mencegah kerentanan TLS-CBC-IV dijelaskan pada [\[1\]][1]. Itu
merupakan masalah yang diketahui pada TLSv1/SSLv3 tetapi itu menarik banyak
perhatian akhir-akhir ini karena serangan BEAST attack [\[2\]][2] (CVE-2011-3389).
Topik yang terkait dengan Ruby terdapat pada pelacak masalah kami [\[3\]][3].

Hingga sekarang ekstensi OpenSSL Ruby menggunakan pilihan `SSL_OP_ALL`, yang
merupakan pilihan tergabung dari OpenSSL untuk bebagai macam solusi lain yang
seharusnya tidak berbahaya bagi semua koneksi SSL secara default. Dan itu hanya
mengizinkan para pengguna untuk menambah pilihan lain, jadi Anda tidak dapat
menghapus fitur yang tercakup pada pilihan `SSL_OP_ALL`, seperti
`SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`. Itu sengaja dilakukan karena itu tidak
mengekspos konstanta seperti `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`, tetapi kita
harus mengizinkan untuk meng-unset pilihan supaya ekstensi OpenSSL Ruby memasukkan
fragmen kosong di awal koneksi SSL (disebut juga \"0/n splitting\") untuk mencegah
serangan TLS BEAST.

[Rilis ini][4] mendefinisikan konstanta tambahan dan mengizinkan para penggunanya
untuk meng-unset pilihan pada `SSL_OP_ALL`. Pilihan default tetap `SSL_OP_ALL` tetapi
Anda dapat mensetup SSLSocket dengan melakukan \"0/n splitting\" untuk pencegahan BEAST
seperti ini.

    ctx = SSLContext.new
    ctx.options = OP_ALL & ~OP_DONT_INSERT_EMPTY_FRAGMENTS
    ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER
    SSLSocket.new(socket, ctx)

Terima kasih kepada Apple untuk melaporkan masalah ini.

Catatan: Beberapa endpoint SSL diketahui untuk memiliki bug yang tidak dapat menangani
\"0/n splitting\" dengan benar, maka kami (dan OpenSSL) tidak mengeset ini sebagai
pilihan default. Harap uji konektifitas SSL sebelum mencoba ini pada environment
production. Jika endpoint lain yang Anda hubungi tidak dapat menangani \"0/n splitting\",
Anda harus menggunakan solusi lain untuk mencegah serangan TLS BEAST, seperti memaksa
ciphersuite untuk menggunakan RC4. Untuk rinciannya, temukan diskusi dan sumber-sumber
seputar CVE-2011-3389.



[1]: http://www.openssl.org/~bodo/tls-cbc.txt
[2]: https://www.cve.org/CVERecord?id=CVE-2011-3389
[3]: https://bugs.ruby-lang.org/5353
[4]: http://mla.n-z.jp/?ruby-talk=393484
