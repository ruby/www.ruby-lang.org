---
layout: page
title: "Library"
lang: id
---

Seperti bahasa pemrograman lain, Ruby memanfaatkan serangkaian luas
library pihak ketiga.
{: .summary}

Sebagian besar dari library tersebut dirilis dalam bentuk **gem**.
[**RubyGems**][1] adalah sistem packaging Ruby dirancang untuk
memfasilitasi penciptaan, berbagi dan instalasi library (dalam beberapa
hal, itu adalah sistem distribusi packaging yang mirip dengan, katakanlah,
`apt-get`, tetapi ditargetkan pada software Ruby). Sejak versi 1.9, Ruby
dilengkapi dengan RubyGems secara default, sementara pada versi sebelumnya
kita perlu [menginstalnya sendiri][2].

Beberapa library lain dirilis sebagai arsip (.zip atau .tar.gz)
direktori dari **kode**. Proses instalasi dapat bervariasi,
biasanya file `README` atau `INSTALL` menyediakan instruksi.

Mari kita lihat cara menemukan library dan menginstalnya
untuk penggunaan Anda sendiri.

### Menemukan Library

[**RubyGems.org**][1] adalah tempat utama dimana library dihost, menyediakan
library Ruby sebagai gem. Anda dapat browse situs webnya langsung, atau
menggunakan perintah `gem`.

Dengan menggunakan `gem search -r`, Anda dapat memeriksa repositori RubyGems.
Misalnya, `gem search -r rails` akan mengembalikan daftar gem yang terkait
dengan Rails. Dengan pilihan `--local` (`-l`), Anda akan melakukan pencarian lokal
melalui gem yang Anda instal. Untuk menginstal gem, gunakan `gem install
[gem]`. Browsing gem yang telah diinstal dilakukan dengan `gem list`. Untuk informasi
lebih jelas tentang perintah `gem`, lihat di bawah atau kunjungi [dokumentasi RubyGems][3].

Ada sumber lain untuk library juga. [RubyForge][4] dulu populer sebagai
tempat sumber library Ruby, tapi beberapa tahun terakhir [**GitHub**][5] bangkit
sebagai salah satu repositori utama untuk konten terkait dengan Ruby. Biasanya,
kode gem di-host di GitHub, dan dipublikasikan sebagai gem lengkap di RubyGems.org.

[Ruby Application Archive][6] (RAA) adalah direktori segala macam software Ruby
yang dikategorikan berdasarkan fungsi, tetapi tidak banyak digunakan lagi.
Anda mungkin tidak perlu pergi ke sana.

### Beberapa Kata tentang RubyGems

Berikut ini tinjauan singkat dari perintah `gem` untuk penggunaan sehari-hari Anda.
[Dokumentasi lebih rinci][7] tersedia, dan mencakup semua aspek sistem packaging ini.

#### Mencari di antara gem yang tersedia

Perintah **search** digunakan untuk mencari gem berdasarkan sebuah string.
Gem yang namanya mulai dengan string tertentu akan terdaftar sebagai hasil pencarian.
Sebagai contoh, untuk mencari gem terkait dengan "html":

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

Flag `--remote` / `-r` menunjukkan bahwa kita ingin memeriksa repositori
resmi RubyGems.org (default). Dengan flag `--local` / `-l` Anda akan
melakukan pencarian lokal pada gem yang telah Anda instal.

#### Menginstal sebuah gem

Setelah Anda tahu gem mana yang ingin Anda **install**, misalnya gem
Rails yang populer:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Anda bahkan dapat menginstal library versi tertentu menggunakan flag
`--version` / `-v`:

{% highlight sh %}
$ gem install rails --version 3.0
{% endhighlight %}

#### Daftar semua gem

Untuk **list** semua gem yang telah Anda instal:

{% highlight sh %}
$ gem list
{% endhighlight %}

Untuk mendapatkan daftar (sangat panjang) dari semua gem yang
tersedia di RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Tolong!

Dokumentasi tersedia pada terminal Anda:

{% highlight sh %}
$ gem help
{% endhighlight %}

Contohnya, `gem help commands` sangat berguna karena mengeluarkan
daftar semua perintah `gem`.

#### Membuat gem Anda sendiri

RubyGems.org memiliki [beberapa panduan][3] tentang topik ini. Anda juga
mungkin ingin untuk melihat [Bundler][9], alat generik yang membantu
Anda mengelola dependensi dan aplikasi dapat digunakan bersama RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: http://raa.ruby-lang.org/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
