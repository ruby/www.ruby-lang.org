---
layout: page
title: "Dari C dan C++ ke Ruby"
lang: id
---

Sulit menguraikan perubahan kode C atau C++ jika ditulis dalam Ruby
karena perbedaan diantara mereka besar. Satu alasannya adalah Ruby
melakukan banyak hal untuk anda. Ini berbeda dengan kenyataan bahwa di
dalam C anda harus melakukan segalanya sendiri. Tujuan Ruby adalah untuk
membuat pekerjaan programmer lebih gampang dengan cara melakukan hal-hal
yang bisa diotomatisasi.

Ruby disebut *dynamically typed language*, berbeda dengan C yang
*statically typed*. Perbedaan paling terlihat adalah: pada *dynamically
typed language* sebuah variable bisa menunjuk ke obyek-obyek dengan
tipe-tipe berlainan.

Misalnya, kalau pada bahasa C++ variabel `siapa` hanya bisa merujuk pada
obyek bertipe `Manusia` (dan turunannya), pada bahasa Ruby variabel
tersebut (dan variabel apa pun) bisa merujuk pada obyek bertipe
`Manusia`, `Pegawai`, `Perempuan`, atau obyek yang lain, meski pun objek
tersebut bukan turunan dari obyek `Manusia`.

Implementasi Ruby yang sekarang menjalankan kode Ruby lebih lambat
daripada implementasi C atau C++ menjalankan C atau C++ code yang
setara. Tetapi, Anda akan terkejut betapa cepat dan gampangnya
menyelesaikan sebuah program dengan Ruby dan juga betapa sedikitnya kode
yang Anda harus tulis. Ruby jauh lebih jelas daripada C++—anda pasti
akan suka.

Lagipula, Anda bisa menulis *extension module* untuk Ruby dengan C.
Module tersebut bisa dipakai dari Ruby code sama seperti module-module
lainnya. Dengan cara ini, bagian kode Ruby Anda yang sensitif terhadap
kecepatan eksekusi bisa diganti dengan C.

Dan tentu saja Ruby sendiri ditulis dengan C.

### Contoh Source Code

Berikut ini adalah contoh program untuk menjumlahkan dua angka
(diinputkan dari keyboard) di C:

{% highlight c %}
#include <stdio.h>

int main(int argc, char *argv[])
{
    int a, b, c;

    scanf("%d", &a);
    scanf("%d", &b);

    c = a + b;
    printf("%d\n", c);
}
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

### Kemiripan Ruby dengan C

Seperti di C, di Ruby,...

* Anda bisa memprogram secara prosedural jika Anda suka (tetapi di balik
  layar sebenarnya kode Ruby Anda tetap berorientasi obyek).
* Kebanyakan operator sama (termasuk operator *compound assignment* dan
  *bitwise*). Tetapi Ruby tidak punya `++` atau `--`.
* Anda punya `__FILE__` dan `__LINE__`.
* Anda juga punya konstanta, tetapi tidak ada keyword khusus `const`.
  Konstanta menggunakan pengaturan penamaan, yaitu variabel yang diawali
  dengan huruf kapital adalah untuk konstanta. Misalnya
  `NAMA_PERUSAHAAN`.
* String dapat menggunakan petik tunggal (tanpa interpolasi) maupun
  petik ganda (dengan interpolasi).
* String bersifat *mutable* yaitu isinya bisa berubah meskipun objeknya
  sendiri tidak berubah.
* Sama seperti `man`, Anda juga bisa membaca dokumentasi langsung di
  terminal Anda dengan menggunakan perintah `ri`.
* Tersedia *command-line debugger*.

### Kemiripan Ruby dengan C++

Sama seperti di C++, di Ruby,...

* Anda punya banyak operator-operator yang sama (bahkan `::`). Operator
  `<<` juga sering digunakan untuk append elemen ke list. Tetapi perlu
  dicatat: di Ruby Anda tidak akan pernah menggunakan `->`, di Ruby
  selalu menggunakan `.`.
* Ada `public`, `private` dan `protected`. Namun perlu diperhatikan
  bahwa arti semantiknya mirip, namun tidak sepenuhnya sama dengan
  penggunaan C++.
* Sintaks *inheritance* (penurunan kelas) sama satu karakter juga,
  tetapi menggunakan `<` bukan `:`.
* Anda bisa menaruh kode Anda dalam “module”, mirip kalau di C++ Anda
  menggunakan `namespace`.
* Ada juga Exception yang kurang lebih sama tetapi berbeda keyword.

### Perbedaan-Perbedaan Ruby dengan C

Tidak seperti C, di Ruby,...

* Obyek bersifat *strongly typed* (dan nama-nama variabel tidak punya
  type sama sekali). Obyek bisa berubah *type*, tapi Ruby akan selalu
  mengecek *type* obyek pada saat melakukan sesuatu. Bila Anda memanggil
  *method* atau *instance variable* yang tidak ada, Ruby akan memberikan
  pesan kesalahan.
* Tidak ada *macro* ataupun *preprocessor*. Tidak ada cast. Tidak ada
  pointer (juga tidak ada pointer arithmetic). Tidak ada `typedef@s,
  @sizeof`, maupun `enum`.
* Tidak ada file-file *header*. Anda cukup definisikan *function* Anda
  (biasanya disebut *method* di Ruby) dan kelas pada file *source code*
  utama.
* Tidak ada <tt>#define</tt>. Cukup gunakan konstanta.
* Di Ruby 1.8, kode diinterpretasi pada saat *run-time* daripada
  di\_compile\_ ke *machine-code* ataupun ke *byte-code*.
* Semua variabel ada di heap. Lebih jauh, Anda tidak perlu membebaskan
  variabel, sudah ada garbage collector untuk itu.
* Argument-argument di metode (atau function) di pass by reference,
  bukan by value.
* `require 'foo'` bukan `#include <foo>` atau `#include "foo"`.
* Anda tidak bisa drop down ke assembly.
* Tidak pakai semicolon (titik koma `;`) di tiap akhir baris kode.
* Tidak perlu pakai buka dan tutup kurung untuk `if` dan `while` untuk
  ekspresi kondisi.
* Buka dan tutup kurung untuk pemanggilan metode (atau function) boleh
  dipakai boleh juga tidak (opsional).
* Biasanya Anda tidak menggunakan kurung kurawal (brace) untuk
  mengakhiri banyak baris (seperti perulangan `while`), karena Anda
  menggunakan keyword `end`.
* Keyword `do` digunakan untuk “blok”. Jadi tidak ada “do statement”
  seperti di C.
* Istilah “blok” berbeda dengan C. Blok adalah untuk blok kode yang Anda
  asosiasikan dengan pemanggilan metode sehingga body metode bisa
  memanggil blok saat kode dijalankan.
* Tidak ada deklarasi variabel. Anda langsung bisa assign nama baru ke
  variabel disaat Anda memerlukan variabel.
* Ketika dites, hanya `false` dan `nil` yang dianggap value false.
  Semuanya selain itu adalah true (termasuk `0`, `0.0` dan `"0"`).
* Tidak ada `char`, yang ada string 1-letter.
* String tidak diakhiri dengan *null byte*. Pada Ruby 1.8 elemen
  pembentuk String merupakan byte, dan Ruby belum membedakan antara
  string single-byte dan multibyte (misalnya encoding Unicode, dsb.),
  namun ada beberapa *library* yang berguna untuk mendukung aplikasi
  internasional di Ruby.
* Array literal masuk dalam kurung kotak (*bracket*), bukan dalam kurung
  kurawal (*brace*).
* Array secara otomatis membesar dan semakin membesar ketika Anda
  menambahkan elemen-elemen lagi ke array.
* Jika Anda menambahkan dua array, Anda kembali dengan array baru yang
  membesar (tentu, dialokasikan di *heap*) daripada melakukan aritmetik
  pointer.
* Pada sebagian besar kasus, semua hal adalah berupa *expression*
  (misalnya, statemen `while` sebenarnya menghasilkan sebuah *rvalue*).

### Perbedaan-perbedaan Ruby dengan C++

Tidak seperti C++, di Ruby,...

* Tidak ada *reference* secara eksplisit. Jadi setiap variabel di Ruby
  sudah otomatis *dereference* obyek tersebut. Apabila di C++ ada
  perbedaan antara `orang.nama` dengan `orang->nama`, di Ruby hanya ada
  `orang.nama`. Sintaks `&orang` juga tidak diperlukan di Ruby.
* Obyek strongly tetapi *dynamically* typed. Jadi *runtime*-lah yang
  menentukan *at runtime* (disaat runtime) bahwa suatu pemanggilan
  metode berjalan atau tidak.
* Konstruktor dinamakan `initialize` ketimbang nama kelas.
* Semua metode selalu virtual.
* Nama variabel (static) kelas selalu diawali dengan `@`
  (seperti `@total_widget`).
* Anda tidak bisa langsung mengakses variabel member, semua akses ke
  variabel member public (kalau di Ruby dikenal sebagai atribut)
  dipanggil lewat metode.
* Pakai `self`, bukan `this`.
* Beberapa metode diakhiri dengan ’?’ atau ’!’. Sebetulnya tanda tanya
  dan tanda seru tersebut juga merupakan bagian dari nama metode.
* Tidak ada multiple inheritance. Tetapi Ruby punya “mixin” (jadi Anda
  bisa “inherit” / menurunkan semua metode instan dari module).
* Ada pengaturan penamaan (mis. nama kelas selalu diawali dengan huruf
  kapital, nama variabel lokal diawali dengan huruf kecil).
* Buka dan tutup kurung untuk pemanggilan metode boleh dipakai boleh
  juga tidak (opsional).
* Anda bisa membuka lagi kelas kapan saja dan menambahkan metode-metode
  ke kelas tersebut.
* Tidak perlu C++ template (karena Anda bisa assign obyek apa saja ke
  suatu variabel, dan type akan diketahui ketika runtime). Juga tidak
  ada casting.
* Iterasi dilakukan dengan sedikit berbeda. Di Ruby, Anda tidak
  menggunakan obyek iterator terpisah (seperti
  `vector<T>::const_iterator iter`) tetapi obyek Anda cukup melakukan
  *mixin* module `Enumerator` dan memanggil metode seperti
  `obyek_saya.each`.
* Hanya ada dua container type, yaitu `Array` dan `Hash`.
* Tidak ada konversi tipe dan *typecasting*. Dengan Ruby, Anda akan
  mengetahui kenapa hal tersebut tidak diperlukan.
* Mendukung *multithreading*, tetapi di Ruby 1.8 masih “green thread”
  (diimplementasikan hanya dengan interpreter) yang didukung.
* Library *unit testing* sudah standar bawaan di Ruby.



[1]: http://www.ariel.com.au/a/teaching-programming.html
