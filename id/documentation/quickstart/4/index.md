---
layout: page
title: "Menguasai Ruby dalam 20 Menit"
lang: id

header: |
  <div class="multi-page">
    <a href="../" title="Bagian 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Bagian 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Bagian 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Menguasai Ruby dalam 20 Menit</h1>

---

Kita lihat lebih dalam program baru kita, perhatikan baris awal,
dimulai dengan tanda pagar (#). Di Ruby, baris apapun setelah
tanda pagar merupakan sebuah komentar (*comment*) dan
diabaikan (*ignore*) oleh *interpreter*. Baris pertama dari
program tersebut adalah kasus khusus dari komentar yang dijalankan pada
sistem operasi *Unix-like* untuk memberi tahu bagaimana menjalankan program.
Kemudian komentar berikutnya merupakan penjelasan.

*Method* `say_hi` sekarang menjadi sedikit lebih rumit:

{% highlight ruby %}
# Katakan hai kepada semua orang
def say_hi
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names adalah sebuah list dari elemen sejenis, lakukan perulangan!
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
{% endhighlight %}

Sekarang perhatikan variable objek `@names` yang menentukan pilihan.
Jika memiliki nilai nil, maka cetak tiga titik (...). Tidak ada yang perlu
disapa, bukan?

## Perputaran dan Perulangan—alias Iteration

Jika objek `@names` memberikan respons kepada *method* `each`, berarti
objek ini mendukung perulangan, jadi lakukan perulangan dan sapalah
setiap orang secara bergantian. Kemudian, jika `@names` merupakan sesuatu
yang lain, biarkanlah objek ini secara otomatis menjadi sebuah *string* dan
menyapa secara *default*.

Mari kita lihat pengulangan lebih dalam lagi:

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` merupakan sebuah *method* yang menerima blok kode yang kemudian
menjalankan blok kode tersebut untuk setiap elemen dalam *list* dan
di antara `do` dan `end` itulah yang dinamakan blok. Sebuah blok juga bisa
berupa *anonymous function* atau `lambda`. Variabel di antara karakter pipa
adalah parameter untuk blok tersebut.

Apa yang terjadi di sini adalah untuk setiap entri dalam *list*, `name` terikat
pada elemen *list*, kemudian ekspresi `puts "Hello #{name}!"` dijalankan
dengan name tersebut.

Kebanyakan bahasa pemrograman lain menangani perulangan dengan
menggunakan `for`, kalau di bahasa pemograman C seperti ini:

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

Kode di atas memang jalan, tetapi tidak begitu elegan. Anda perlu
variabel `i`, untuk mencari tahu berapa jumlah elemen *list* dan juga
harus menjelaskan bagaimana menjalankan perulangan terhadap *list* tersebut.
Cara Ruby jauh lebih elegan, semua detail disembunyikan pada *method* `each`,
semua yang perlu Anda lakukan hanyalah memberitahukan apa yang perlu
dilakukan terhadap setiap elemen. Secara internal, *method* `each` akan
memanggil `yield "Albert"`, kemudian `yield "Brenda"`, kemudian `yield
"Charles"`, dan seterusnya.

## Blok, Kekuatan Ruby

Kekuatan sesungguhnya tentang blok adalah ketika berhadapan dengan hal yang
lebih rumit ketimbang *list*. Di luar penanganan detail dari sebuah *method*,
Anda juga bisa menangani *setup*, *teardown*, dan *error*—semua ini disembunyikan
dari pengguna.

{% highlight ruby %}
# Katakan selamat tinggal kepada semua orang
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Gabungkan elemen list dengan tanda koma
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
{% endhighlight %}

*Method* `say_bye` tidak menggunakan `each`, tetapi memeriksa apakah
`@names` merespons *method* `join`, jika Ya, maka *method* digunakan. Apabila
tidak, maka cetak variabel sebagai sebuah *string*. *Method* ini tidak peduli
dengan tipe variabel sebenarnya, hanya bersandar pada *method* yang
didukung dikenal sebagai “Duck Typing”, jadi seperti “jalannya seperti
seekor bebek dan berbunyi wek wek wek seperti bebek…”. Keuntungan dari
*duck typing* adalah kita tidak perlu membatasi tipe-tipe variabel apa
saja yang didukung. Kalau seseorang datang dengan kelas *list* baru,
selama objek tersebut mengimplementasikan *method* `join` dengan
semantik yang sama seperti *list*, maka semua tetap berjalan sama seperti
yang diharapkan.

## Memulai Script Ruby!

Begitulah akhir cerita dari kelas MegaGreeter, program hanya memanggil
*method* pada kelas tersebut. Ada satu trik yang perlu diperhatikan
pada baris berikut:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` adalah *magic variable* yang berisi nama dari berkas saat ini.
`$0` adalah nama berkas yang digunakan ketika memulai program. Pemeriksaan
ini seolah berkata “Jika berkas ini merupakan berkas utama yang digunakan…”
Pemeriksaan ini dapat berguna untuk berkas yang digunakan sebagai pustaka,
jadi bukan untuk mengeksekusi kode, tetapi jika berkas digunakan sebagai
*executable* (berkas yang bisa dieksekusi) maka eksekusi kode tersebut.

## Perdalamlah Kekuatan Ruby Anda

Demikianlah tutorial mini Ruby ini. Masih banyak hal-hal yang bisa
dijelajahi, kontrol struktur berbeda yang Ruby tawarkan, penggunaan blok
dan `yield`, *module* sebagai *mixin*, dan banyak lagi. Saya harap
tutorial mini ini dapat membuat Anda untuk menjelajahi Ruby lebih
lanjut.

Jika Anda ingin menjelajahi Ruby lebih lanjut, silakan ke
[Dokumentasi](/id/documentation/) yang memiliki banyak tautan ke manual dan
tutorial, semua tersedia gratis secara *online*.
