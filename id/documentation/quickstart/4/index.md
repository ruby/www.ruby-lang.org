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

Sekarang kita melihat lebih jelas lagi pada program baru kita,
perhatikan baris yang paling pertama, dimulai dengan tanda pagar (#). Di
Ruby, semua tulisan yang ada sesudah tanda pagar (#) merupakan komentar
(comment) dan tidak dipedulikan (di ignore) oleh interpreter. Baris
pertama file adalah hal khusus, dan untuk Sistem Operasi Unix biasanya
kita menentukan bagaimana menjalankan file. Kemudian komentar
selanjutnya untuk penjelasan.

Metode `say_hai` kita sudah punya trik sedikit:

{% highlight ruby %}
# Bilang Hai buat semua
def say_hai
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names adalah list, iterate!
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
{% endhighlight %}

Sekarang kelas memperhatikan parameter `@names` untuk menentukan
pilihan. Jika parameter nil, maka print tiga dot (...). Ya karena memang
tidak ada yang perlu disapa, khan?!

## Perulangan—a.k.a. Iteration

Jika obyek `@names` merespon metode `each`, berarti obyek ini merupakan
sesuatu yang bisa Anda iterate, jadi iterate lah dan sapalah orang-orang
bergantian. Kemudian, jika `@names` merupakan sesuatu yang lain,
biarkanlah obyek ini otomatis menjadi string dan melakukan sapaan secara
default.

Mari kita perhatikan iterator lebih dalam lagi:

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` merupakan metode yang menerima blok kode yang kemudian
menjalankan blok kode tersebut untuk setiap elemen dalam list, dan
diantara `do` dan `end` itulah yang dinamakan blok. Blok juga bisa
berupa function anonim atau `lambda`. Variabel diantara karakter pipa
itu adalah parameter untuk blok tersebut.

Yang terjadi disini adalah untuk setiap entri dalam list, `name` terkait
dengan elemen list, kemudian ekspresi `puts "Hello #{name}!"` dijalankan
dengan name tersebut.

Kebanyakan bahasa-bahasa pemrograman lain menangani list dengan
menggunakan perulangan `for`, kalau di C seperti ini:

{% highlight c %}
for (i=0; i<total_elemen; i++)
{
  lakukan_sesuatu_dengan(elemen[i]);
}
{% endhighlight %}

Kode diatas memang jalan, tetapi tidak begitu elegan. Anda perlu
variabel `i`, untuk mencari tahu berapa panjang/total list, dan juga
harus menjelaskan bagaimana menjalani perulangan lewat list tersebut.
Ruby way jauh lebih elegan, semua detil disembunyikan di metode `each`,
semua yang perlu Anda lakukan hanyalah memberitahukan apa yang perlu
dilakukan dengan elemen each. Secara internal, metode `each` akan
memanggil `yield "Steven"`, kemudian `yield "Anton"`, kemudian `yield
"Ridho"`, dan seterusnya.

## Blok, Kekuatan Ruby

Kekuatan sesungguhnya tentang blok adalah ketika berhadapan dengan yang
lebih rumit ketimbang list. Selain dari berhubungan dengan list, Anda
juga bisa menangani setup, teardown dan error (yang mana semua itu
diluar dari sepengatahuan user)

{% highlight ruby %}
# Bilang "sampai jumpa" buat semua
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Gabung (Join) elemen list dengan koma
    puts "Sampai jumpa #{@names.join(", ")}. Datang lagi ya!"
  else
    puts "Sampai jumpa #{@names}. Datang lagi ya!"
  end
end
{% endhighlight %}

Metode `say_bye` tidak menggunakan `each`, tetapi memeriksa apakah
`@names` merespon metode `join`, jika Ya, maka gunakan join. Tetapi jika
tidak, maka print variabel sebagai string. Metode tidak peduli terhadap
*type* aktual dari variabel, hanya bersandar pada metode-metode yang
didukung dikenal sebagai “Duck Typing”, jadi seperti “jalannya seperti
bebek dan berbunyi wek wek wek seperti bebek…”. Keuntungan dari cara
duck typing ini adalah kita tidak perlu membatasi tipe-tipe variabel apa
saja yang didukung. Kalau ada orang yang datang dengan kelas list baru,
sepanjang obyek tersebut mengimplementasikan metode `join` dengan
semantik yang sama seperti list, maka semua tetap berjalan sama persis
seperti yang sudah direncanakan sebelumnya.

## Script Ruby Mulai!

Begitulah akhir cerita kelas BosTukangSapa, akhir dari file hanya
memanggil metode-metode pada kelas tersebut. Ada satu trik yang perlu
diperhatikan di baris:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` adalah variabel magic yang berisi nama file saat ini. `$0`
adalah nama file yang dipakai ketika memulai program. Pemeriksaan ini
seolah berkata “Jika file ini merupakan file utama yang digunakan …”
Pemeriksaan ini dapat berguna untuk file yang digunakan sebagai library,
jadi bukan untuk mengeksekusi kode, tetapi jika file digunakan sebagai
executable (file yang bisa dieksekusi/execute) maka eksekusi kode
tersebut.

## Perdalamlah Kekuatan Ruby Anda

Demikianlah tutorial mini Ruby kita. Masih banyak lagi hal-hal yang bisa
dijelajahi, kontrol struktur berbeda yang Ruby tawarkan, penggunaan blok
dan `yield`, module sebagai mixin, dan banyak lagi yang lain. Saya harap
tutorial mini ini dapat membuat Anda untuk menjelajahi Ruby lebih
lanjut.

Jika Anda ingin menjelajahi Ruby lebih lanjut, silakan ke
[Dokumentasi](/en/documentation/) yang punya banyak link ke manual dan
tutorial, semua tersedia gratis secara online.

Atau, jika Anda benar-benar ingin buku, silakan ke [daftar buku][1]
(link eksternal) (dalam bahasa Inggris)



[1]: http://www.ruby-doc.org/bookstore
