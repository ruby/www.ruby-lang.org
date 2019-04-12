---
layout: page
title: "Dari Java ke Ruby"
lang: id
---

Java merupakan bahasa yang matang. Java sudah teruji. Java mempunyai
kecepatan yang tinggi (terlepas dari apa yang diklaim oleh kebanyakan
developer anti-Java). Kode Java juga cenderung panjang. Dari Java ke
Ruby, bisa dipastikan *source code* Anda akan menciut/mengecil. Dan
sangat besar kemungkinan bahwa untuk membuat *prototype* di Ruby Anda
membutuhkan waktu yang jauh lebih singkat daripada membuatnya di bahasa
Java.

### Contoh Source Code

Berikut ini adalah contoh program untuk menjumlahkan dua angka
(diinputkan dari keyboard) di Java:

{% highlight java %}
import java.io.*;
public class Addup
{
   static public void main(String args[]) throws Exception {
       InputStreamReader stdin = new InputStreamReader(System.in);
       BufferedReader console = new BufferedReader(stdin);
       int i1 = Integer.parseInt(console.readLine());
       int i2 = Integer.parseInt(console.readLine());
       System.out.println(i1 + i2);
   }
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
Computer Programming][8], dengan modifikasi dari Yohanes Santoso

### Kemiripan Ruby dan Java

Sama seperti Java, di Ruby…

* Memory diatur secara otomatis melalui *garbage collector*.
* Obyek diperlakukan secara *strongly typed*.
* Metode bersifat `public`, `private`, atau `protected`.
* Ada tool untuk dokumentasi dalam kode (di Ruby dikenal dengan sebutan
  **RDoc**). Dokumentasi yang dihasilkan oleh `rdoc` kelihatan sangat
  mirip dengan yang dihasilkan oleh JavaDoc.

### Perbedaan Ruby dan Java

Tidak seperti Java, di Ruby,...

* Anda tidak perlu meng-*compile* kode Anda. Anda cukup menjalankan saja
  langsung melalui *interpreter* Anda.
* Ada perbedaan toolkit GUI. <abbr title="Matz telah mendeklarasikan
  Pengguna Ruby disebut dengan sebutan Rubyist">Rubyist</abbr> dapat
  mencoba [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3], [Qt][4],
  atau yang sudah disertakan dengan Ruby seperti Tk.
* Anda menggunakan keyword `end` setelah mendefinisikan macam-macam hal
  di Ruby seperti `class`, sebagai pengganti kurawal buka dan kurawal
  tutup di sekitar blok kode.
* Anda menggunakan `require` di Ruby, bukan `import`.
* Semua anggota variabel adalah `private`. Dari luar, Anda mengakses
  semua variabel tersebut lewat bantuan metode. Anda bisa
  mengotomatisasi proses ini menggunakan bantuan `attr_reader`,
  `attr_writer`, maupun `attr_accessor`.
* Buka dan tutup kurung di saat pemanggilan metode biasanya opsional
  (boleh dipakai boleh juga tidak) dan biasanya tidak dipakai.
* Semua adalah obyek, termasuk angka (obyek bertipe `Fixnum`) seperti 2
  dan 3.14159.
* Tidak ada *static type checking*. Semua pengecekan tipe bersifat
  dinamis tapi tetap *strongly typed*.
* Nama-nama variabel hanya label. Nama variabel tidak punya type yang
  terkait dengan keberadaan variabel.
* Tidak ada deklarasi tipe. Anda cukup assign ke nama variabel baru jika
  diperlukan dan sudah otomatis dibuatkan oleh Ruby (contoh `a =
  [1,2,3]` sudah cukup di Ruby, tidak membutuhkan deklarasi eksplisit
  misalnya `int [] a = {1,2,3};`).
* Tidak ada *casting*. Solusinya, cukup panggil metode yang diinginkan.
  Anda dapat menggunakan *unit test* untuk mengecek kesalahan pada kode
  atau adanya *exception*.
* Di Ruby, `foo = Foo.new("hi")`, bukan `Foo foo = new Foo("hi")`.
* Konstruktor selalu dinamakan `initialize`, bukan sama nama kelas
  tersebut seperti di Java.
* Anda punya “mixin” yang bisa menggantikan `interface`.
* YAML lebih banyak digunakan ketimbang XML.
* `null` disebut `nil` di bahasa Ruby.
* Penanganan untuk `==` berbeda dengan `equals()` di Ruby. Gunakan `==`
  kalau Anda ingin test ekivalensi di Ruby (kalau di Java pakai
  `equals()`). Di Ruby, gunakan `equal?()` kalau Anda ingin mengetahui
  apakah dua obyek sama atau tidak (di Java pakai `==`).

### Bahasa Pemrograman Ruby di Platform Java

Perkembangan terbaru memungkinkan menjalankan kode Ruby pada platform
Java.

[**JRuby**][5] adalah *interpreter* Ruby yang dikembangkan menggunakan
platform Java. Dengan JRuby, Anda dapat menjalankan secara langsung kode
Ruby (bahkan Rails!) pada sebuah Java Runtime Environment. Anda juga
dapat mengakses *library* Java dan juga sebaliknya. JRuby sudah cukup
matang dan dapat digunakan untuk menjalankan sebagian besar kode Ruby
tanpa perubahan apapun. [Thoughtworks][6] menggunakan JRuby dalam
pengembangan aplikasi-aplikasi mereka.

[**XRuby**][7] meng-*compile* kode Ruby ke dalam *bytecode* Java. Proyek
ini semakin berkembang dari hari ke hari.



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
[5]: http://jruby.codehaus.org/
[6]: http://www.thoughtworks.com/
[7]: http://xruby.com/
[8]: http://www.ariel.com.au/a/teaching-programming.html
