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

Ruby merupakan sebuah bahasa yang seimbang. Pencipta Ruby, [Yukihiro “Matz”
Matsumoto][matz], menggabungkan bagian-bagian dari bahasa-bahasa favorit
beliau (Perl, Smalltalk, Eiffel, Ada dan Lisp) untuk membentuk sebuah bahasa
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

Ruby-Talk, [milis](/id/community/mailing-lists/) utama untuk diskusi
Ruby (dalam bahasa Inggris), telah mencapai kisaran 200 email setiap
hari pada tahun 2006. Namun, telah menurun di beberapa tahun terakhir
karena ukuran diskusi komunitas dari satu tempat terpusat menjadi banyak
kelompok-kelompok lebih kecil.

Ruby berada di peringkat 10 teratas pada indeks yang menghitung
perkembangan dan popularitas bahasa-bahasa pemrograman di seluruh dunia
(seperti [TIOBE index][tiobe]). Kebanyakan dari perkembangan Ruby beratribut
pada terkenalnya *software* yang ditulis dengan Ruby, terutama *web framework*
[Ruby on Rails][ror].

Ruby juga [sepenuhnya bebas]({{ site.license.url }}). Tidak hanya gratis,
tetapi juga bebas untuk digunakan, dimodifikasi dan didistribusikan.

### Melihat Semua sebagai Sebuah Objek

Pertama kali, Matz melihat bahasa-bahasa lain untuk mencari sintaks yang
ideal. Terkenang pencariannya, Matz berkata, “Saya mau bahasa *scripting*
yang lebih hebat daripada Perl dan lebih berorientasi objek daripada
Python<sup>[2](#fn2)</sup>.”

Di Ruby, semua adalah sebuah objek. Setiap informasi dan kode bisa diberi
*property* dan *action*. Pemrograman berorientasi objek memanggil *property*
dengan nama *variabel instan* dan *action*, yang disebut sebagai *metode*.
Pendekatan murni berorientasi objek terutama terlihat pada demonstrasi
sedikit kode yang diberikan pada sebuah *number*.

{% highlight ruby %}
5.times { print "Kami *cinta* Ruby -- Ruby sungguh aduhai!" }
{% endhighlight %}

Di banyak bahasa-bahasa lain, *number* dan tipe primitif bukan objek. Ruby
mengikuti pengaruh bahasa Smalltalk dengan memberikan metode dan
variabel instan pada semua tipe. Ini memudahkan menggunakan Ruby, karena
peraturan-peraturan mengenai objek semua berlaku pada Ruby.

### Fleksibilitas Ruby

Ruby dianggap sebagai sebuah bahasa yang fleksibel, karena bagian-bagian
dari Ruby bisa diubah-ubah dengan bebas. Bagian-bagian penting di Ruby
bisa dihapus maupun didefinisikan ulang. Bagian-bagian yang sudah ada
bisa ditambahkan. Ruby mencoba untuk tidak membatasi *programmer*.

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

### Blok: Sebuah Fitur yang sungguh Ekspresif

Blok Ruby juga dianggap sebagai sumber kekuatan Ruby yang sangat
fleksibel. *Programmer* dapat menyertakan *closure* pada setiap metode,
menjelaskan bagaimana metode yang bersangkutan seharusnya berperilaku.
*Closure* disebut *blok* dan telah menjadi satu diantara banyak
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
yang dibuka untuk *programmer* agar menulis blok mereka sendiri untuk
mengisi dengan lebih lengkap apa saja yang seharusnya sebuah metode
lakukan.

### Ruby dan Mixin

Tidak seperti banyak bahasa-bahasa berorientasi objek lain, Ruby hanya
menyediakan *single inheritance* **dengan sengaja**. Tetapi Ruby
mengetahui konsep *module* (disebut sebagai Categories di Objective-C).
*Module* merupakan kumpulan dari metode-metode.

Kelas dapat me-*mixin* (menggabungkan) sebuah *module* dan menerima semua
metode-metode (dari *module* yang bersangkutan) dengan bebas. Contoh,
setiap kelas yang mengimplementasikan metode `each` bisa *mixin module*
`Enumerable`, yang menambahkan banyak metode-metode yang menggunakan
`each` untuk melakukan perulangan.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Secara umum, <abbr title="Matz telah mendeklarasikan pengguna Ruby
disebut Rubyist">Rubyist</abbr> menganggap ini sebagai cara yang lebih
jelas ketimbang *multiple inheritance*, yang rumit dan bahkan terlalu
membatasi.

### Tampilan Ruby secara Visual

Ruby jarang menggunakan tanda baca dan biasanya cenderung menggunakan
kata kunci berbahasa Inggris, beberapa tanda baca digunakan untuk
memperjelas kode Ruby. Ruby tidak perlu deklarasi variabel. Ruby
menggunakan aturan penamaan yang mudah untuk menyatakan *scope*
dari variabel-variabel.

* `var` adalah variabel lokal.
* `@var` adalah variabel instan.
* `$var` adalah variabel global.

[Sigil-sigil][sigil] tersebut bertujuan untuk memudahkan dan memperjelas
ketika dibaca bagi programmer untuk mengidentifikasi fungsi dari setiap
variabel. Sigil juga bisa menjadi hal yang tidak perlu bila harus
digunakan pada setiap member instan `self.`

### Langkah Selanjutnya

Ruby kaya fitur, antara lain sebagai berikut:

* Ruby memiliki fitur-fitur yang menangani *exception*, seperti Java atau
  Python, untuk mempermudah menangani *error*.

* Ruby menyediakan *mark-and-sweep garbage collector* untuk semua objek
  Ruby. Tidak perlu menjaga *reference count* pada *extension*.
  Seperti yang Matz katakan, “Ini lebih baik untuk kesehatan Anda.”

* Menulis *extension* C di Ruby lebih mudah daripada di Perl ataupun di
  Python, dengan API yang elegan untuk memanggil Ruby dari C. Ini
  termasuk memanggil Ruby *embedded* di *software*, untuk digunakan sebagai
  bahasa *scripting*. *Interface* SWIG juga tersedia.

* Ruby bisa memuat *extension library* secara dinamis jika sistem operasi
  mengizinkan.

* Ruby sangat *portable*: Ruby kebanyakan dikembangkan di GNU/Linux,
  tetapi juga berjalan di banyak tipe UNIX, macOS, dan Windows.

### Implementasi Lain dari Ruby

Ruby, sebagai sebuah bahasa, memiliki beberapa implementasi yang berbeda.
Halaman ini telah mendiskusikan referensi implementasi, di dalam
komunitas sering disebut sebagai **MRI** (“Matz’s Ruby Interpreter”)
atau **CRuby** (karena ditulis dalam bahasa C), tetapi ada juga bahasa lainnya.
Mereka sangat bermanfaat pada situasi tertentu, menyediakan integrasi
dengan bahasa atau lingkungan lainnya, atau memiliki fitur khusus
yang tidak dimiliki oleh MRI.

Berikut ini daftarnya:

* [JRuby][jruby] adalah Ruby yang berjalan di atas JVM (Java Virtual Machine),
  memanfaatkan optimisasi JIT *compiler*-nya JVM, *garbage collector*,
  *concurrent thread*, *tool ecosystem*, dan kumpulan pustaka yang luas.
* [Rubinius][rubinius] adalah ‘Ruby written in Ruby’. Dibuat di atas LLVM,
  Rubinius memakai sebuah *virtual machine* yang bagus yang bahasa lainnya
  sedang dibuat di atasnya, juga.
* [TruffleRuby][truffleruby] adalah sebuah implementasi Ruby di atas GraalVM
  yang memiliki performa tinggi.
* [mruby][mruby] adalah sebuah implementasi *lightweight* dari bahasa Ruby
  yang dapat dihubungkan dan ditanamkan dengan sebuah aplikasi.

Untuk daftar lebih lengkapnya, lihat [Awesome Rubies][awesome-rubies].

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
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[sigil]: http://en.wikipedia.org/wiki/Sigil_%28computer_programming%29
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[truffleruby]: https://github.com/oracle/truffleruby
[mruby]: http://www.mruby.org/
[awesome-rubies]: https://github.com/planetruby/awesome-rubies
