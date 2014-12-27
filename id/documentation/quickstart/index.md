---
layout: page
title: "Menguasai Ruby dalam 20 Menit"
lang: id

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Bagian 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Bagian 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Bagian 4">4</a>
  </div>
  <h1>Menguasai Ruby dalam 20 Menit</h1>

---

## Pengantar

Tutorial mini Ruby ini seharusnya bisa diselesaikan dalam waktu kurang
dari 20 menit. Dengan asumsi Anda sudah menginstal Ruby. (Jika Anda
belum menginstal Ruby di komputer Anda, [download](/id/downloads/) dan
silakan instal Ruby terlebih dahulu sebelum Anda mengikuti tutorial ini)

## irb, Ruby Interaktif

Buka IRB.

* Jika Anda menggunakan **Mac OS X** buka `Terminal` dan ketik `irb`,
  kemudian tekan enter.
* Jika Anda menggunakan **Linux**, buka shell dan ketik `irb`, kemudian
  tekan enter.
* Jika Anda menggunakan **Windows**, buka `Interactive Ruby` dari
  bagian Ruby di Menu Start Anda.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Ok, sekarang irb sudah dibuka. Sekarang mau apa?

Ketik ini: `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby Mematuhi Anda!

Apa yang baru saja terjadi? Apakah kita baru saja menulis program
tersingkat di dunia berupa “Hello World” ? Tidak persis begitu. Baris
kedua hanya sekedar cara IRB memberitahu hasil (result) dari ekspresi
terakhir yang dievaluasi/dijalankan. Jika kita ingin print “Hello World”
kita perlu tambahkan sedikit:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` merupakan perintah dasar untuk mencetak (print) sesuatu di Ruby.
Tetapi kemudian apa artinya `=> nil` ? Artinya adalah result dari
ekspresi. `puts` selalu return nil, yang merupakan value absolut
ketiadaan di Ruby.

## Kalkulator Gratis Anda Di Sini

Dengan IRB kita sudah cukup mempunyai kalkulator dasar:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Tiga tambah dua. Cukup mudah. Bagaimana dengan tiga *kali* dua? Anda
bisa mencoba dengan langsung mengetikkannya, cukup pendek, tetapi Anda
juga bisa mengganti apa saja yang baru saja Anda perintahkan di IRB.
Coba tekan **panah-atas** pada keyboard Anda dan lihatlah apakah IRB
memunculkan baris `3+2` lagi. Jika Ya, Anda dapat menggunakan panah-kiri
untuk berpindah ke setelah tanda `+` kemudian gunakan backspace untuk
menggantinya dengan tanda `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Lanjut, mari kita coba tiga kuadrat:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Di Ruby, `**` merupakan cara Anda mengatakan “kepada kekuatan dari”.
Tetapi bagaimana jika Anda ingin melakukannya dengan cara lain dan
mendapatkan akar dari suatu bilangan?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Ok, tunggu dulu, bagaimana yang terakhir itu? Jika Anda menebak, “Kode
tersebut mencari sqrt (akar) dari 9”, berarti Anda benar. Tetapi mari
kita lihat lebih dekat. Pertama, apa itu `Math` ?

## Module, Pengelompokan Kode Menurut Topik

`Math` merupakan module built-in (bawaan) untuk matematika. Module punya
dua pengaturan di Ruby. Pertama, mengelompokkan metode-metode yang
berfungsi mirip di bawah satu nama yang terkenal. `Math` juga punya
metode-metode seperti `sin()` dan `tan()`.

Selanjutnya adalah dot (titik). Apa yang dot lakukan? Dengan dot-lah,
Anda bisa mengidentifikasi receiver dari suatu message. Nah, kalau
message apa? Dalam hal ini, message adalah `sqrt(9)`, yang artinya
pemanggilan metode `sqrt`, kependekan dari “square root” dengan
parameter `9`.

Hasil dari pemanggilan metode sqrt ini adalah value `3.0`. Anda bisa
perhatikan value bukan cuma `3` (tanpa `.0`). Itu karena sering angka
sqrt tidak akan berupa integer, jadi metode sqrt selalu return angka
floating-point.

Bagaimana jika kita ingin mengingat hasil dari beberapa perhitungan
matematika ini? Caranya assign hasilnya ke variabel.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Sehebat kalkulator, kita sudah pergi dari message tradisional `Hello
World` yang biasanya selalu saja kalau ada tutorial untuk pemula
berfokus disana… [jadi mari kita kembali kesana.](2/)

