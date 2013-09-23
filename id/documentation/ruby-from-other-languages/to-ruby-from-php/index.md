---
layout: page
title: "Dari PHP ke Ruby"
lang: id
---

PHP digunakan di banyak aplikasi web, tetapi jika Anda ingin menggunakan
Ruby on Rails atau hanya menggunakan bahasa yang secara umum lebih mudah
disesuaikan, maka ada baiknya Anda mempertimbangkan menggunakan Ruby.

### Contoh Source Code

Berikut ini adalah contoh program untuk menjumlahkan dua angka
(diinputkan dari keyboard) di PHP:

{% highlight php %}
<?php
$fp = fopen('php://stdin', 'r');
$a = fgets($fp);
$b = fgets($fp);
echo $a + $b . "\n";
?>
{% endhighlight %}

Anda dapat menuliskan program tersebut di Ruby sebagai berikut:

{% highlight ruby %}
a = gets.to_i
b = gets.to_i
c = a + b
puts c
{% endhighlight %}

### Kemiripan Ruby dan PHP

Seperti di PHP, kalau di Ruby…

* Ruby *dynamically typed*, sama seperti di PHP, jadi Anda tidak perlu
  khawatir akan kewajiban untuk mendeklarasikan variabel.
* Ada *class*, dan Anda dapat mengatur akses kontrol ke setiap *member*
  sama seperti di PHP 5 (`public`, `protected`, dan `private`)
* Beberapa variabel dan variabel global dimulai dengan tanda dolar ($),
  seperti di PHP (tetapi sebagian besar variabel yang Anda gunakan
  sehari-hari **tidak** diawali dengan tanda $)
* Ada `eval` juga.
* Anda bisa menggunakan interpolasi string. Daripada melakukan
  `"$foo is a $bar"`, Anda bisa melakukan `"#{foo} is a #{bar}"`,
  sama seperti di PHP, ini tidak berlaku untuk string yang menggunakan
  petik tunggal (harus petik ganda).
* Ada heredocs untuk mengisi string lebih dari satu baris dengan mudah.
  Ruby juga mempunyai beberapa cara lain untuk mengisi string misalnya
  dengan sintaks `%q{ string }` dan `%Q{ string #{foo} }`
* Ruby punya fitur *exception*, seperti PHP 5
* Ada library standar yang lumayan besar. Plus ribuan *library* lain di
  [Rubygems][1], [Ruby Application Archive][2] dan [plugins untuk Ruby
  on Rails][3].
* Array dan hash bekerja sebagaimana mestinya, jadi Anda tinggal
  mengganti kebiasaan `array('a' => 'b')` menjadi `{'a' => 'b'}`.
* `true` dan `false` berperilaku sama seperti di PHP, tetapi `null`
  disebut `nil`

### Perbedaan Ruby dan PHP

Tidak seperti di PHP, di Ruby…

* Ruby menggunakan *strong typing*. Anda perlu memanggil `to_s`, `to_i`
  dan seterusnya untuk mengkonversi antara `string`, `integer` dan
  seterusnya, daripada bergantung pada bahasa untuk melakukannya. Ini
  memastikan bahwa program tidak akan melakukan kesalahan yang tidak
  Anda inginkan, dan mempermudah *debugging*.
* String, number, array, hash, dan seterusnya adalah obyek. Dalam
  pemrograman berorientasi obyek sebenarnya, yang digunakan adalah
  `-1.abs`, bukan `abs(-1)`
* Ketika memanggil metode, tidak ada keharusan untuk memakai tanda
  kurung, kecuali kalau ingin mengklarifikasikan parameter yang mana
  yang masuk ke pemanggilan metode tertentu yang mana (agar tidak
  ambigu). Contoh: `puts "Ruby keren"` adalah sama persis dengan
  `puts("Ruby keren")`.
* Library standar dan extension dikelompokkan di *module* atau *mixin*
  dan *class* (kelas).
* Ruby tidak menggunakan penamaan berbasis *underscore* untuk memisahkan
  bagian-bagian *library* seperti di PHP (Contoh: `mysql_connect`). Ruby
  mengorganisasi *library* ke dalam struktur *module* dan *class* yang
  lebih mudah diingat. ([penjelasan][4])
* *Reflection* sudah merupakan fasilitas bawaan setiap obyek. Anda tidak
  perlu menggunakan kelas `Reflection` seperti di PHP 5.
* Variabel merupakan *reference*.
* Tidak ada *class* bersifat `abstract` atau deklarasi `interface`
* Hash dan array tidak boleh ditukar-tukar, karena keduanya termasuk dua
  kelas yang berbeda.
* Hanya `false` dan `nil` yang bernilai false, semua nilai selain itu
  mengembalikan nilai `true` dalam conditional (`0`, `array()`, dan `""`
  dianggap bernilai `true`)
* Hampir semua statemen di Ruby adalah pemanggilan metode, bahkan
  `raise` juga merupakan pemanggilan metode (kalau di PHP ekivalen
  dengan `throw`).



[1]: http://www.rubyforge.org
[2]: http://raa.ruby-lang.org
[3]: http://agilewebdevelopment.com/plugins
[4]: http://tech.groups.yahoo.com/group/id-ruby/message/2032
