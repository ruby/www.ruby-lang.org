---
layout: page
title: "Tentang Ruby"
lang: id
---

Anda heran mengapa Ruby sangat populer? Penggemar Ruby menyebut Ruby
sebagai bahasa yang cantik dan artistik. Mereka juga menyebut Ruby
praktis dan mudah. Apa lagi?
{: .summary}

### Idealisme Pencipta Ruby

Ruby merupakan bahasa yang seimbang. Pencipta Ruby, [Yukihiro “Matz”
Matsumoto][matz], menggabungkan bagian-bagian dari bahasa-bahasa favorit
beliau (Perl, Smalltalk, Eiffel, Ada dan Lisp) untuk membentuk bahasa
baru yang seimbang antara pemrograman fungsional dengan pemrograman
imperatif.

Matz sering menyebutkan bahwa beliau sedang “mencoba membuat Ruby
natural, bukan sederhana,” dengan cara membuatnya mirip dengan kehidupan
nyata.

Berprinsip pada hal ini, Matz menambahkan:

> Penampilan Ruby dari luar sederhana, tetapi sangat rumit di bagian
> dalam, seperti badan manusia kita ini<sup>[1](#fn1)</sup>.

### Tentang Perkembangan Ruby

Sejak Ruby pertama kali dirilis ke publik pada tahun 1995, banyak
programmer profesional dari seluruh dunia serius ikut mengembangkan
Ruby. Pada tahun 2006, Ruby diterima oleh banyak orang. Dengan komunitas
pengguna Ruby yang aktif di banyak kota-kota di seluruh dunia dan
konferensi-konferensi beserta pertemuan Ruby terkait.

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=320&amp;height=160&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

Ruby-Talk, [milis](/id/community/mailing-lists/) utama untuk diskusi
Ruby (dalam bahasa Inggris) telah mencapai kisaran 200 email setiap
hari.

[TIOBE index][tiobe], yang menghitung perkembangan bahasa-bahasa pemrograman,
menempatkan Ruby pada peringkat ke 10 diantara bahasa-bahasa pemrograman
di seluruh dunia. Melihat pada perkembangan ini, mereka memperkirakan,
“Kesempatan Ruby memasuki peringkat atas 10 besar adalah dalam waktu
setengah tahun.” Kebanyakan dari perkembangan Ruby beratribut pada
terkenalnya software yang ditulis dengan Ruby, terutama framework web
[Ruby on Rails][ror].

Ruby juga [sepenuhnya bebas]({{ site.license.url }}). Tidak hanya gratis,
tetapi juga bebas untuk menggunakan, memodifikasi dan mendistribusikan
Ruby.

### Melihat Semua sebagai Obyek

Pertama kali, Matz melihat bahasa-bahasa lain untuk mencari sintaks yang
ideal. Terkenang pencariannya, Matz berkata, “Saya mau bahasa scripting
yang lebih hebat daripada Perl dan lebih berorientasi obyek daripada
Python<sup>[2](#fn2)</sup>.”

Di Ruby, semua adalah obyek. Setiap informasi dan kode bisa diberi
property dan action. Pemrograman berorientasi obyek memanggil property
dengan nama *variabel instan* dan action, yang disebut sebagai *metode*.
Pendekatan murni berorientasi obyek terutama terlihat pada demonstrasi
sedikit kode yang diberikan pada number.

{% highlight ruby %}
5.times { print "Kami *cinta* Ruby -- Ruby sungguh aduhai!" }
{% endhighlight %}

Di banyak bahasa-bahasa lain, number dan tipe primitif bukan obyek. Ruby
mengikuti pengaruh bahasa Smalltalk dengan memberikan metode dan
variabel instan pada semua tipe. Ini memudahkan menggunakan Ruby, karena
peraturan-peraturan mengenai obyek semua berlaku pada Ruby.

### Ruby Fleksibel

Ruby dianggap sebagai bahasa yang fleksibel, karena bagian-bagian dari
Ruby bisa diubah-ubah dengan bebas. Bagian-bagian yang esensi di Ruby
bisa dihapus maupun didefinisikan ulang. Bagian-bagian yang sudah ada
bisa ditambahkan. Ruby mencoba untuk tidak membatasi programmer.

Misalnya, penambahan dilakukan dengan operator plus (`+`). Tetapi, jika
Anda ingin menggunakan kata `plus` yang lebih mudah dibaca, maka Anda
dapat menambahkan metode tersebut pada kelas builtin `Numeric`.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y sekarang adalah 11
{% endhighlight %}

Demi kemudahan, operator-operator Ruby adalah juga metode. Anda juga
bisa mendefinisikan ulang operator.

### Blok, Fitur yang sungguh Ekspresif

Blok Ruby juga dianggap sebagai sumber kekuatan Ruby yang sangat
fleksibel. Programmer dapat menyertakan closure pada setiap metode,
menjelaskan bagaimana metode yang bersangkutan seharusnya berperilaku.
Closure disebut *blok* dan telah menjadi satu diantara banyak
fitur-fitur Ruby yang paling populer pada banyak pendatang baru Ruby
dari bahasa-bahasa imperatif lain seperti PHP atau Visual Basic.

Blok terinspirasi dari bahasa-bahasa fungsional. Matz berkata, “Saya
ingin menghormati kultur Lisp di closure Ruby<sup>[3](#fn3)</sup>.”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

Pada kode diatas, blok dijelaskan dalam bentuk `do ... end`. Metode
`map` memberlakukan blok agar menerima array kata-kata (Google, Yahoo
dan MSN). Banyak metode-metode lain di Ruby dibiarkan mempunyai hole
yang dibuka untuk programmer agar menulis blok mereka sendiri untuk
mengisi dengan lebih lengkap apa saja yang seharusnya sebuah metode
lakukan.

### Ruby dan Mixin

Tidak seperti banyak bahasa-bahasa berorientasi obyek lain, Ruby hanya
menyediakan single inheritance **dengan sengaja**. Tetapi Ruby
mengetahui konsep module (disebut sebagai Categories di Objective-C).
Module merupakan kumpulan dari metode-metode.

Kelas dapat me-mixin (menggabungkan) sebuah module dan menerima semua
metode-metode (dari module yang bersangkutan) dengan bebas. Contoh,
setiap kelas yang mengimplementasikan metode `each` bisa mixin module
`Enumerable`, yang menambahkan banyak metode-metode yang menggunakan
`each` untuk melakukan perulangan.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Secara umum, <abbr title="Matz telah mendeklarasikan pengguna Ruby
disebut Rubyist">Rubyist</abbr> menganggap ini sebagai cara yang lebih
jelas ketimbang multiple inheritance, yang rumit dan bahkan terlalu
membatasi.

### Tampilan Ruby secara Visual

Ruby jarang menggunakan tanda baca dan biasanya cenderung menggunakan
keyword berbahasa Inggris, biasanya beberapa tanda baca digunakan untuk
memperjelas kode Ruby

Ruby tidak perlu deklarasi variabel. Ruby menggunakan aturan penamaan
yang mudah untuk menyatakan scope suatu variabel.

* `var` adalah variabel lokal.
* `@var` adalah variabel instan.
* `$var` adalah variabel global.

[Sigil-sigil][sigil] tersebut bertujuan untuk memudahkan dan memperjelas
ketika dibaca bagi programmer untuk mengidentifikasi fungsi dari setiap
variabel. Sigil juga bisa menjadi hal yang tidak perlu bila harus
digunakan pada setiap member instan `self.`

### Langkah Selanjutnya

Ruby kaya fitur, antara lain sebagai berikut:

* Ruby memiliki fitur-fitur yang menangani exception, seperti Java atau
  Python, untuk mempermudah menangani error.

* Ruby menyediakan mark-and-sweep garbage collector untuk semua obyek
  Ruby. Tidak perlu me-maintain reference count pada library extension.
  Seperti yang Matz katakan, “Ini lebih baik untuk kesehatan Anda.”

* Menulis extension C di Ruby lebih mudah daripada di Perl ataupun di
  Python, dengan API yang elegan untuk memanggil Ruby dari C. Ini
  termasuk memanggil Ruby embedded di software, untuk digunakan sebagai
  bahasa scripting. Interface SWIG juga tersedia.

* Ruby bisa load library extension secara dinamis jika Sistem Operasi
  mengijinkan.

* Ruby menyediakan fitur OS threading yang independent. Maka, untuk
  semua platform dimana Ruby berjalan, Anda juga punya multithreading,
  terlepas dari apakah Sistem Operasi mendukung multithreading atau
  tidak, bahkan pada MS-DOS sekalipun!

* Ruby sangat portable: Ruby kebanyakan dikembangkan di GNU/Linux,
  tetapi juga berjalan di banyak tipe UNIX, Mac OS X, Windows
  95/98/Me/NT/2000/XP, DOS, BeOS, OS/2, dan lain-lain.

### Referensi

<sup>1</sup> Matz, berbicara di milis Ruby-Talk, [12 Mei 2000][blade].
{: #fn1}

<sup>2</sup> Matz, [An Interview with the Creator of Ruby][linuxdevcenter],
(Wawancara dengan Pencipta Ruby, dalam Bahasa Inggris), 29 November
2001.
{: #fn2}

<sup>3</sup> Matz, [Blocks and Closures in Ruby][artima], (Blok dan Closure
di Ruby, dalam Bahasa Inggris), 22 Desember 2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[sigil]: http://en.wikipedia.org/wiki/Sigil_%28computer_programming%29
