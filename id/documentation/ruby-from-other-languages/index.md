---
layout: page
title: "Dari Bahasa Pemrograman Lain ke Ruby"
lang: id
---

Ketika pertama kali Anda melihat kode Ruby, Anda akan teringat pada
bahasa-bahasa pemrograman yang biasa Anda gunakan sebelumnya. Ini memang
sengaja. Banyak sintaks Ruby yang sudah biasa digunakan oleh pengguna
Perl, Python dan Java (juga termasuk bahasa-bahasa lain), jadi Jika Anda
telah menggunakan bahasa-bahasa tersebut, belajar Ruby menjadi sangat
mudah!
{: .summary}

Dokumen ini terdiri dari dua bagian utama. Bagian pertama dimaksudkan
sebagai ringkasan dari apa yang bisa Anda harapkan ketika melihat dari
bahasa *X* ke Ruby. Bagian kedua membahas fitur-fitur utama Ruby dan
bagaimana fitur-fitur ini dibandingkan dengan apa yang sudah terbiasa
Anda lakukan di bahasa lain.

## Apa yang Diharapkan: *Bahasa X* ke Ruby

* [Dari C dan C++ ke Ruby](to-ruby-from-c-and-cpp/)
* [Dari Java ke Ruby](to-ruby-from-java/)
* [Dari Perl ke Ruby](to-ruby-from-perl/)
* [Dari PHP ke Ruby](to-ruby-from-php/)
* [Dari Python ke Ruby](to-ruby-from-python/)

## Tabel Perbandingan

Tabel di bawah ini membandingkan fasilitas-fasilitas yang ada di
masing-masing bahasa pemrograman:

Catatan: N/A berarti fasilitas tersebut tidak relevan terhadap bahasa
yang dimaksud.

Perbandingan berdasarkan fitur-fitur pemrograman berorientasi objek
(<abbr title="Object Oriented Programming">OOP</abbr>):

Sumber: [Programming Language Comparison][1]

## Fitur-Fitur Penting dan Yang Perlu Diperhatikan

Berikut adalah beberapa penjelasan dan petunjuk pada fitur-fitur utama
Ruby yang akan Anda lihat ketika sedang mempelajari Ruby.

### Iteration

Dua fitur Ruby yang mungkin belum biasa Anda lihat sebelumnya adalah
“blok” dan iterator. Daripada melakukan perulangan dengan indeks
(seperti C, C++ ataupun Java sebelum versi 1.5), atau melakukan
perulangan lewat *list* (seperti `for (@a) {...}` di Perl
ataupun `for i in aList: ...` di Python). Anda akan **sangat
sering** melihat kode yang mirip seperti ini di Ruby:

{% highlight ruby %}
daftar_orang.each do |orang_ini|
  # Kita berada dalam blok
  # Kita sedang berurusan dengan orang_ini
  # orang_ini disebut parameter blok
  puts orang_ini.nama
end
{% endhighlight %}

Untuk info lebih lanjut tentang `each` (dan teman-temannya seperti
`collect`, `find`, `inject`, `sort`, dan lain-lain.), lihat
`ri Enumerable` (kemudian `ri Enumerable#some_method`).

### Semua Mempunyai Nilai

Tidak ada perbedaan antara ekspresi dan pernyataan. Semua punya *value*
(nilai), bahkan jika *value* tersebut adalah **nil** (maksudnya, `nil`
juga tetap punya *value*). Ini karena:

{% highlight ruby %}
x = 10
y = 11
z = if x < y
      true
    else
      false
    end
z # => true
{% endhighlight %}

### Symbol Bukan String

Banyak Rubyist pemula berjuang keras memahami apa itu Symbol dan untuk
apa Symbol itu ada.

Symbol dapat dijelaskan sebagai identitas. Symbol merupakan sebuah hal
tentang **siapa** ini, bukan **apa** ini. Buka `irb` dan perhatikan
perbedaan berikut ini:

{% highlight irb %}
irb(main):001:0> :joko.object_id == :joko.object_id
=> true
irb(main):002:0> "joko".object_id == "joko".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Metode `object_id` mengembalikan identitas dari sebuah `Object`. Jika
ada dua obyek memiliki `object_id` yang sama, maka mereka sebenarnya
adalah obyek yang sama (menunjuk ke `Object` yang sama di memori).

Seperti yang dapat Anda lihat, sekali Anda pernah menggunakan `Symbol`,
setiap `Symbol` dengan karakter yang sama menunjuk ke `Object` yang sama
di *memori*. Untuk setiap dua Symbol yang merepresentasikan karakter
yang sama, maka `object_id` cocok.

Sekarang perhatikan `String` (“joko”). `object_id` tidak cocok. Artinya
dua obyek tersebut menunjuk ke dua obyek yang berbeda di memori,
meskipun isi kedua obyek `String` tersebut sama persis. Kapanpun Anda
menggunakan String baru, Ruby selalu mengalokasikan memory untuk string
baru tersebut.

Jika Anda ragu-ragu apakah menggunakan `Symbol` atau `String`,
pertimbangkanlah apa saja yang lebih penting: identitas obyek (contoh:
key `Hash`), atau isi (seperti contoh di atas, “joko”).

### Semua adalah Obyek

“Semua adalah obyek” bukan sekedar hiperbola. Bahkan kelas (`Class`) dan
`integer` juga obyek, dan Anda dapat melakukan hal yang sama seperti
perlakuan Anda terhadap obyek-obyek lain:

{% highlight ruby %}
# Ini sama saja dengan
# class KelasSaya
#   attr_accessor :variabel_instan
# end
KelasSaya = Class.new do
  attr_accessor :variabel_instan
end
{% endhighlight %}

### Konstanta

Konstanta bisa diubah. Jika Anda mengubah konstanta yang sudah
diinisialisasi, maka akan menyebabkan *warning*, tetapi tidak sampai
menghentikan program Anda. Jadi maksudnya Anda **seharusnya** tidak
mendefinisikan ulang konstanta.

### Pengaturan Penamaan

Ruby memiliki pengaturan penamaan. Jika sebuah *identifier* diawali
dengan huruf kapital, maka *identifier* tersebut merupakan konstanta.
Jika *identifier* diawali dengan tanda dolar (`$`), maka *identifier*
tersebut adalah variabel global. Jika identifier diawali dengan tanda
`@`, maka identifier tersebut adalah *instance variable*. Jika
identifier diawali dengan `@@`, maka identifier tersebut adalah variabel
kelas.

Tetapi, nama-nama metode boleh diawali dengan huruf kapital. Ini bisa
membingungkan, seperti ditunjukkan pada contoh berikut:

{% highlight ruby %}
Konstanta = 10
def Konstanta
  11
end
{% endhighlight %}

Sekarang `Konstanta` adalah 10, tetapi `Konstanta()` adalah 11.

### Argumen Keyword

Seperti Python, metode pada Ruby 2.0 dapat didefinisikan
menggunakan argumen keyword:

{% highlight ruby %}
def menyampaikan(dari: "A", ke: nil, lewat: "mail")
  "Mengirimkan dari #{dari} ke #{ke} lewat #{lewat}."
end

menyampaikan(ke: "B")
# => "Mengirimkan dari A ke B lewat mail."
menyampaikan(lewat: "Pony Express", dari: "B", ke: "A")
# => "Mengirimkan dari B ke A lewat Pony Express."
{% endhighlight %}

### Nilai True bersifat Universal

Di Ruby, semua (kecuali **nil** dan **false**) dianggap true. Di C,
Python dan banyak bahasa lain, 0 dan mungkin juga nilai-nilai lain,
seperti list yang kosong, dianggap false. Perhatikan kode Python berikut
(contoh berikut juga berguna untuk bahasa-bahasa lain):

{% highlight python %}
# di Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

Ini akan print “0 is false”. Kode yang sama di Ruby:

{% highlight ruby %}
# di Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

Print “0 is true”.

### Access Modifier Berlaku Sampai Akhir Scope

Pada kode Ruby berikut ini,

{% highlight ruby %}
class KelasSaya
  private
  def metode; true; end
  def metode_lain; false; end
end
{% endhighlight %}

Anda mungkin berharap `metode_lain` adalah `public`. Tetapi tidak
demikian. *Access modifier* `private` bersambung terus sampai akhir
*scope*, atau sampai *access modifier* lain muncul, apapun yang muncul
lebih awal. Secara default, metode bersifat `public`\:

{% highlight ruby %}
class KelasSaya
  # Sekarang metode adalah public
  def metode; true; end

  private

  # metode_lain adalah private
  def metode_lain; false; end
end
{% endhighlight %}

`public`, `private` dan `protected` benar-benar merupakan metode, sehingga mereka bisa menerima parameter. Jika Anda melewatkan `Symbol` pada satu dari parameter, maka *visibility* metode diubah.

### Akses Metode

Di Java, `public` berarti metode bisa diakses oleh siapa saja.
`protected` berarti *instance* kelas, *instance* dari kelas-kelas
turunan, dan *instance* dari kelas-kelas package yang sama dapat
mengakses, tetapi tidak untuk yang lain, dan `private` berarti tidak ada
yang dapat mengakses metode kecuali *instance* kelas.

Di Ruby, `public` secara natural adalah `public`. `private` berarti
metode hanya bisa diakses ketika metode bisa dipanggil tanpa obyek
penerima yang eksplisit. Hanya **self** yang boleh menjadi receiver
pemanggilan metode private.

`protected` perlu diperhatikan lebih lanjut. Metode `protected` bisa dipanggil dari kelas ataupun *instance* kelas turunan, tetapi juga dengan *instance* lain sebagai penerima. Contoh, diadaptasi dari [Ruby Language FAQ][faq]:

{% highlight ruby %}
class Test
  # metode berikut secara default adalah public
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# sekarang atur `identifier' menjadi protected,
# masih jalan karena protected bisa reference ke lain

class Test
  protected :identifier
end

t1 == t2  # => true

# sekarang atur `identifier' menjadi private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Kelas Bersifat Terbuka

Kelas Ruby bersifat terbuka. Anda bisa membuka `Class`, lalu menambahkan
ke dalam `Class`, dan menggantinya kapan saja. Bahkan kelas yang
termasuk class inti, seperti kelas `Integer` atau bahkan kelas `Object`,
induk dari semua obyek di Ruby. Ruby on Rails mendefinisikan banyak
metode yang berhubungan dengan waktu ke dalam kelas `Integer`. Perhatikan
kode berikut:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # total detik dalam satu jam adalah 3600
  end
  alias hour hours
end

# 14 hours from 00:00 January 1st
# jadi 14 jam dari jam 00:00 pada tanggal 1 Januari
Time.mktime(2007, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Nama Metode Deskriptif dan Menarik

Di Ruby, metode boleh diakhiri dengan tanda tanya ataupun tanda seru.
Pengaturan nama adalah, metode-metode yang menjawab pertanyaan (seperti
`Array#empty?` mengembalikan nilai **true** jika obyek penerima
yaitu Array ternyata kosong) diakhiri dengan tanda tanya. Kemudian,
metode-metode yang berpotensi untuk “membahayakan” (seperti metode yang
mengganti **self** atau argumen, `exit!` dan lain sebagainya) maka
pengaturannya diakhiri dengan tanda seru.

Tetapi, semua metode yang mengganti argument tidak diakhiri dengan tanda
seru. `Array#replace` mengganti isi array dengan isi array lain.
Karena tidak masuk akal kalau ada metode sedemikian rupa **tidak**
mengganti self.

### Metode Singleton

Metode *singleton* merupakan metode-metode yang basisnya per obyek.
*Singleton* hanya tersedia pada obyek yang Anda definisikan, jadi metode
tersebut tidak tersedia pada obyek-obyek yang lain dari kelas yang sama.

{% highlight ruby %}
class Mobil
  def inspect
    "Mobil murah"
  end
end

porsche = Mobil.new
porsche.inspect # => Mobil murah
def porsche.inspect
  "Mobil mahal"
end

porsche.inspect # => Mobil mahal

# Sementara obyek-obyek yang lain tidak terpengaruh
mobil_lain = Mobil.new
mobil_lain.inspect # => Mobil murah
{% endhighlight %}

### Metode `method_missing`

Ruby tidak menyerah kalau Ruby tidak mendapatkan metode yang bisa
menanggapi *message* tertentu. Ruby akan memanggil metode
`method_missing` dengan nama metode yang Ruby tidak ditemukan beserta
daftar parameternya. Secara *default*, `method_missing` membangkitkan
*exception* `NameError`, tetapi Anda bisa mendefinisikan ulang
`Exception` tersebut supaya lebih sesuai dengan aplikasi yang Anda buat,
dan banyak *library* yang melakukan hal yang sama. Contoh:

{% highlight ruby %}
# id adalah nama metode yang dipanggil,
# sintaks * mengumpulkan semua arguments
# dalam array yang bernama 'arguments'
def method_missing(id, *arguments)
  puts "Metode #{id} telah dipanggil, " +
    "tetapi tidak ditemukan. " +
    "Metode ini punya arguments sebagai berikut: " +
    arguments.join(", ")
end

__ :a, :b, 10

# => Metode __ telah dipanggil, tetapi metode __
# tidak berhasil ditemukan. Metode tersebut
# memiliki argument sebagai berikut: a, b, 10
{% endhighlight %}

Kode diatas hanya print detil tentang pemanggilan (call), tetapi Anda
bisa dengan bebas menangani message dengan cara ini.

### Melewatkan Message, Bukan Pemanggilan function

Pemanggilan metode adalah sungguh-sungguh merupakan **message** ke obyek
lain:

{% highlight ruby %}
# Penambahan ini
1 + 2
# adalah sama dengan penambahan ini ...
1.+(2)
# juga sebetulnya sama dengan penambahan ini :
1.send "+", 2
{% endhighlight %}

### Blok Bisa Diubah Menjadi Sebuah Object

Blok (*closure*) banyak digunakan oleh *library* Ruby standar. Untuk
memanggil blok, Anda bisa menggunakan `yield`, atau membuat sebuah obyek
`Proc` dengan menambahkan argumen khusus pada list argument, seperti
contoh berikut:

{% highlight ruby %}
def blok(&the_block)
  # Di dalam sini, the_block adalah blok yang dilewatkan ke metode blok
  the_block # return the block
end
adder = blok { |a, b| a + b }
# adder sekarang merupakan obyek Proc
adder.class # => Proc
{% endhighlight %}

Anda juga dapat membuat blok diluar pemanggilan metode dengan memanggil
`Proc.new` dengan blok atau pemanggilan metode `lambda`.

Ketika dibuat metode juga merupakan Object.

{% highlight ruby %}
method(:puts).call "puts adalah obyek!"
# => puts adalah obyek!
{% endhighlight %}

### Operator adalah *Syntactic Sugar*

Kebanyakan operator di Ruby hanyalah *syntactic sugar*. Maksudnya
*syntactic sugar* adalah penyingkatan penulisan kode. Dalam hal
operator-operator itu, mereka sebenarnya hanyalah pemanggilan metode
saja, tentunya dengan peraturan tertentu supaya jenjang *precedence*
tetap dituruti. Contohnya, Anda bisa meng-*override* metode + milik
kelas Integer:

{% highlight ruby %}
class Integer
  # Sebenarnya Anda bisa melakukan ini,
  # tetapi tolong jangan lakukan ini
  def +(other)
    self - other
  end
end
{% endhighlight %}

Anda tidak membutuhkan `operator+` C++, dan seterusnya.

Anda bahkan juga bisa mempunyai akses style array jika Anda
mendefinisikan metode `[]` dan `[]=`. Untuk mendefinisikan unary + dan –
(bayangkan +1 dan -2), Anda harus mendefinisikan metode `+@` dan `-@`.

Tetapi operator-operator dibawah ini bukan syntactic sugar.
Operator-operator dibawah ini bukan metode dan tidak dapat didefinisikan
ulang:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Tambahan, `+=`, `*=` dan lain sebagainya hanyalah singkatan untuk
`var = var + var_lain`, `var = var * var_lain`, dan seterusnya tidak dapat
didefinisikan ulang.

## Ingin mengetahui Ruby lebih lanjut?

Ketika Anda siap dengan pengetahuan Ruby yang lebih lagi, lihat bagian
[Dokumentasi](/id/documentation/)



[1]: http://www.jvoegele.com/software/langcomp.html
[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
