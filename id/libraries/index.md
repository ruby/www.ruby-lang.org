---
layout: page
title: "Pustaka"
lang: id
---

Seperti bahasa pemrograman lain, Ruby memanfaatkan serangkaian luas
pustaka pihak ketiga.
{: .summary}

Sebagian besar dari pustaka tersebut dirilis dalam bentuk **gem**.
[**RubyGems**][1] adalah sistem *packaging* Ruby yang dirancang untuk
memfasilitasi penciptaan, berbagi dan pemasangan pustaka (dalam beberapa hal,
itu adalah sistem distribusi *packaging* yang mirip dengan, katakanlah,
`apt-get`, tetapi ditargetkan pada aplikasi Ruby). Sejak versi 1.9, Ruby
dilengkapi dengan RubyGems secara *default*, sementara pada versi sebelumnya
kita perlu [memasangnya sendiri][2].

Beberapa pustaka lain dirilis sebagai arsip (.zip atau .tar.gz)
direktori dari **kode sumber**. Proses instalasi dapat bervariasi,
biasanya berkas `README` atau `INSTALL` menyediakan instruksi.

Mari kita lihat cara menemukan pustaka dan memasangnya
untuk penggunaan Anda sendiri.

### Menemukan pustaka

[**RubyGems.org**][1] adalah tempat utama dimana pustaka di-*host*,
menyediakan pustaka Ruby sebagai gem. Anda dapat menelusuri langsung situs
tersebut, atau menggunakan perintah `gem`.

Dengan menggunakan `gem search -r`, Anda dapat memeriksa repositori RubyGems.
Misalnya, `gem search -r rails` akan mengembalikan daftar gem yang terkait
dengan Rails. Dengan pilihan `--local` (`-l`), Anda akan melakukan pencarian
lokal melalui gem yang Anda pasang. Untuk memasang gem,
gunakan `gem install [gem]`. Menelusuri gem yang telah dipasang dilakukan
dengan `gem list`. Untuk informasi lebih jelas tentang perintah `gem`,
lihat di bawah atau kunjungi [dokumentasi RubyGems][3].

Ada sumber lain dari pustaka.
[**GitHub**][5] sebagai repositori utama untuk konten terkait dengan Ruby.
Biasanya, kode sumber gem akan di-*host* di GitHub, dan dipublikasikan sebagai
gem lengkap di RubyGems.org.

[**Ruby Toolbox**][6] adalah sebuah proyek yang memudahkan penelusuran proyek
*open source* Ruby. Ruby Toolbox memiliki kategori untuk berbagai tugas
pengembangan, pengumpulan banyak informasi tentang proyek seperti rilis dan
aktivitas *commit* atau *dependency*, dan penilaian proyek berdasarkan
popularitasnya di RubyGems.org dan GitHub. Pencarian memudahkan untuk
menemukan apa yang sedang Anda cari.

### Beberapa kata tentang RubyGems

Berikut ini tinjauan singkat dari perintah `gem` untuk penggunaan sehari-hari
Anda. [Dokumentasi lebih rinci][7] tersedia, dan mencakup semua aspek sistem
*packaging* ini.

#### Mencari di antara gem yang tersedia

Perintah **search** dapat digunakan untuk mencari gem berdasarkan sebuah
string. Gem yang namanya mulai dengan string tertentu akan terdaftar sebagai
hasil pencarian.
Sebagai contoh, untuk mencari gem terkait dengan "html":

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

Penanda `--remote` / `-r` menunjukkan bahwa kita ingin memeriksa
repositori resmi RubyGems.org (*default*).
Dengan penanda `--local` / `-l` Anda akan melakukan pencarian lokal
pada gem yang telah Anda pasang.

#### Memasang sebuah gem

Setelah Anda tahu gem mana yang ingin Anda pasang, misalnya gem
Rails yang populer:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Anda bahkan dapat memasang pustaka versi tertentu menggunakan penanda
`--version` / `-v`:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Daftar semua gem

Untuk **list** semua gem yang telah Anda pasang:

{% highlight sh %}
$ gem list
{% endhighlight %}

Untuk mendapatkan daftar (sangat panjang) dari semua gem yang tersedia di
RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Tolong!

Dokumentasi tersedia pada terminal Anda:

{% highlight sh %}
$ gem help
{% endhighlight %}

Contohnya, `gem help commands` sangat berguna karena mengeluarkan daftar dari
semua perintah `gem`.

#### Membuat gem Anda sendiri

RubyGems.org memiliki [beberapa panduan][3] terkait topik ini. Anda juga
mungkin ingin untuk melihat [Bundler][9], alat generik yang membantu
Anda mengelola *dependency* dan aplikasi dapat digunakan bersama RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
