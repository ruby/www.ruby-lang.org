---
layout: page
title: "Dari Python ke Ruby"
lang: id
---

Python merupakan bahasa pemrograman untuk kegunaan umum yang juga bagus.
Dari Python ke Ruby, Anda secara umum hanya perlu mempelajari perbedaan
sintaks antara Ruby dengan Python.

### Contoh Source Code

Berikut ini adalah contoh program untuk menjumlahkan dua angka
(diinputkan dari keyboard) di Python:

{% highlight python %}
import sys

a = sys.stdin.readline()
b = sys.stdin.readline()
c = int(a) + int(b)
print c
{% endhighlight %}

Anda dapat menuliskan program tersebut di Ruby sebagai berikut:

{% highlight ruby %}
a = gets.to_i
b = gets.to_i
c = a + b
puts c
{% endhighlight %}

Sumber: [A Very Quick Comparison of Popular Languages for Teaching
Computer Programming][1]

### Kemiripan Ruby dan Python

Sama dengan Python, di Ruby…

* Ada Ruby Interaktif (dinamakan `irb`).
* Anda bisa membaca dokumentasi di command line (dengan `ri`, setara
  dengan `pydoc` di Python).
* Tidak ada karakter khusus untuk akhir baris (*newline* biasa atau
  biasa kita sebut “enter”).
* Isi string bisa dipisah ke banyak baris seperti string *triple-quoted*
  di Python. Di Ruby hal ini tidak membutuhkan sintaks khusus, cukup
  menggunakan petik tunggal atau petik ganda seperti biasanya, tapi Anda
  juga bisa menggunakan *heredoc* dan sintaks lain (misalnya `%q{ halo
  }`) jika Anda suka.
* Buka kurung dan tutup kurung siku (`[]`) untuk list, buka kurung dan
  tutup kurung kurawal (`{}`) untuk hash (istilah Ruby untuk *dict*.)
* Array mempunyai fungsionalitas yang sama. Menambahkan array
  menghasilkan array gabungan. Memasukkan array ke dalam array lain
  menghasilkan array bersarang atau *nested array*\: `a3 = [ a1, a2 ]`
* Obyek bersifat dinamis dan *strongly typed*.
* Semua adalah obyek, dan variabel hanya merupakan *reference* ke obyek.
* Meskipun *keyword* yang digunakan berbeda (Ruby menggunakan `raise`
  dan `rescue`), fitur *exception* setara dengan Python.
* Anda mendapatkan fitur dokumentasi dalam kode (di Ruby disebut
  `rdoc`).

### Perbedaan Ruby dan Python

Tidak seperti di Python, di Ruby…

* String dapat diubah isinya (*mutable*.)
* Anda dapat membuat konstanta (variabel yang nilainya tidak akan
  diubah).
* Ada aturan penamaan (misalnya: nama kelas diawali dengan huruf
  kapital, nama variabel lokal diawali dengan huruf kecil).
* Hanya ada satu jenis tipe kontainer yang berisi daftar data, yaitu
  Array. Array bersifat *mutable* yaitu dapat diubah-ubah.
* Interpolasi string didukung menggunakan sintaks petik ganda.
  Interpolasi yang didukung adalah *escape sequence* (misalnya `\t`
  untuk tab) dan substitusi ekspresi: `"Selamat Datang, #{nama}!"` akan
  menghasilkan string yang juga disisipkan isi variabel `nama`. Di Ruby,
  string berpetik tunggal (misalnya: `'halo semua'`) berfungsi persis
  seperti *raw string* di Python (tanpa interpolasi.)
* Tidak ada kelas “new style” dan “old style”. Cuma ada satu macam
  kelas.
* Anda tidak akan pernah langsung mengakses atribut. Di Ruby, semua
  menggunakan pemanggilan metode. Cara praktisnya adalah dengan
  menggunakan `attr_reader`, `attr_writer`, maupun `attr_accessor`.
* Buka dan tutup kurung untuk pemanggilan metode biasanya dihilangkan
  (opsional / boleh dipakai boleh juga tidak).
* Ada `public`, `private`, dan `protected` untuk mengatur akses ke
  *instance member*, yang biasanya di Python diakali menggunakan aturan
  penamaan `_seperti_` `__ini__`.
* Menggunakan “mixin”, bukan *multiple inheritance*.
* Anda bisa “membuka” sebuah kelas kapan saja untuk mengubah atau
  menambahkan metode-metode ke kelas tersebut.
* Ruby menggunakan `true`, `false`, dan `nil`, sedangkan Python
  menggunakan `True` dan `False`, dan `None`.
* Kalau dites logika untuk `true`, hanya `false` dan `nil` yang dianggap
  bernilai `false`. Semua nilai lain dianggap `true` (termasuk `0`,
  `0.0`, `""`, dan `[]`).
* Menggunakan `elsif` sebagai ganti `elif`.
* Menggunakan `require` sebagai ganti `import`. Cara penggunaannya sama.
* Penggunaan komentar biasanya *di atas* yang ingin didokumentasikan
  (jadi bukan di bawahnya.) Biasa digunakan untuk menghasilkan
  dokumentasi secara otomatis dari *source code*.
* Ada banyak *shortcut* yang bisa dapat Anda pelajari untuk melakukan
  hal-hal yang sering digunakan dengan lebih cepat. Shortcut tersebut
  membuat Ruby menyenangkan (*fun!*) dan membuat Anda sangat produktif.



[1]: http://www.ariel.com.au/a/teaching-programming.html
