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

Ini adalah sebuah tutorial mini Ruby yang bisa diselesaikan tidak lebih dari
20 menit. Dengan asumsi Anda sudah menginstal Ruby. (Jika Anda belum menginstal
Ruby pada komputer Anda, [instalasi][installation] terlebih dahulu
sebelum Anda memulai.

## Ruby Interaktif

Ruby datang dengan sebuah program yang akan menampilkan hasil dari *statement*
Ruby apapun saat Anda memasukkannya. Bermain dengan kode Ruby pada sesi interaktif
seperti ini adalah salah satu cara terbaik untuk belajar bahasa pemograman.

Buka IRB (singkatan dari *Interactive Ruby*).

* Jika Anda menggunakan **macOS** buka `Terminal` dan ketik `irb`,
  kemudian tekan *enter*.
* Jika Anda menggunakan **Linux**, buka *shell* dan ketik `irb`,
  kemudian tekan *enter*.
* Jika Anda menggunakan **Windows**, buka `Interactive Ruby` dari
  bagian Ruby pada *Start Menu*.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Baik, sekarang irb sudah dibuka. Lalu selanjutnya?

Ketik ini: `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby Mematuhi Anda!

Apa yang baru saja terjadi? Apakah kita baru saja menulis program
tersingkat di dunia berupa “Hello World”? Tidak persis begitu. Baris
kedua hanya sekedar cara IRB memberitahu hasil dari ekspresi terakhir
yang dievaluasi/dijalankan. Jika kita ingin mencetak “Hello World”
kita perlu tambahkan sedikit:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` merupakan perintah dasar untuk mencetak sesuatu pada Ruby.
Kemudian apa artinya `=> nil`? Artinya adalah hasil dari ekspresi.
`puts` selalu mengembalikan nil, yang merupakan
*absolutely-positively-nothing value* pada Ruby.

## Kalkulator Gratis Anda Di Sini

Dengan IRB kita sudah cukup mempunyai kalkulator dasar:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Tiga tambah dua. Cukup mudah. Bagaimana dengan tiga *kali* dua? Anda
bisa mencoba dengan langsung mengetikkannya, cukup pendek, tetapi Anda
juga bisa mengganti apa saja yang baru saja Anda perintahkan di IRB.
Coba tekan **panah-atas** pada *keyboard* Anda dan lihatlah apakah IRB
memunculkan baris `3+2` lagi. Jika Ya, Anda dapat menggunakan panah-kiri
untuk berpindah ke setelah tanda `+` kemudian gunakan *backspace* untuk
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

Di Ruby, `**` merupakan cara Anda mengatakan “pangkat dari”.
Tetapi bagaimana jika Anda ingin melakukannya dengan cara lain dan
mendapatkan akar dari suatu bilangan?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Baik, tunggu dulu, bagaimana yang terakhir itu? Jika Anda menebak, “Kode
tersebut mencari sqrt (akar) dari 9”, berarti Anda benar. Tetapi mari
kita lihat lebih dekat. Pertama, apa itu `Math`?

## Module, Pengelompokan Kode Menurut Topik

`Math` merupakan *built-in* (bawaan) *module* untuk matematika. *Module* memiliki
dua tugas pada Ruby. Pertama, mengelompokkan *method* yang memiliki kemiripan
fungsi ke dalam sebuah nama yang sama. `Math` juga punya *method*, seperti `sin()`
dan `tan()`.

Selanjutnya adalah *dot* (titik). Apa yang *dot* lakukan? Dengan *dot*-lah,
Anda bisa mengidentifikasi *receiver* dari suatu *message*. Nah, kalau
*message* apa? Dalam hal ini, *message* adalah `sqrt(9)`, yang artinya
pemanggilan *method* `sqrt`, kependekan dari “square root” dengan
parameter `9`.

Hasil dari pemanggilan *method* ini adalah nilai `3.0`. Anda bisa perhatikan
nilai bukan cuma `3` (tanpa `.0`). Itu karena akar dari sebuah bilangan sering
bukan berupa bilangan bulat (*integer*), sehingga *method* ini selalu mengembalikan
bilangan desimal (*floating-point number*).

Bagaimana jika kita ingin mengingat hasil dari beberapa operasi
matematika ini? Caranya simpan hasilnya ke sebuah variabel.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Sehebat kalkulator, kita sudah pergi dari pesan  `Hello World` yang biasanya
selalu saja kalau ada tutorial untuk pemula berfokus di sana…
[jadi mari kita kembali ke sana](2/).

[installation]: /id/documentation/installation/
