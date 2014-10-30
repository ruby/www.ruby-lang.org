---
layout: page
title: "Menguasai Ruby dalam 20 Menit"
lang: id

header: |
  <div class="multi-page">
    <a href="../" title="Bagian 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Bagian 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Bagian 4">4</a>
  </div>
  <h1>Menguasai Ruby dalam 20 Menit</h1>

---

Bagaimana jika kita ingin mengatakan “Hello” sekaligus banyak tanpa
membuat jari dan tangan kita semua kelelahan? Kita perlu mendefinisikan
metode!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1>   puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

Kode `def h` memulai definisi suatu metode. Kode tersebut berkata pada
Ruby bahwa kita sedang mendefinisikan sebuah metode, yang bernama `h`.
Baris selanjutnya adalah body (badan) metode, baris yang sama seperti
yang sudah kita lihat sebelumnya: `puts "Hello World"`. Baris terakhir
`end` memberitahu Ruby bahwa kita sudah selesai mendefinisikan metode.
Ruby merespon `=> nil` memberitahu kita bahwa Ruby sudah mengetahui
kalau kita sudah selesai mendefinisikan metode `h` tersebut.

## Ringkasan, Kehidupan Metode yang Berulang-ulang

Sekarang mari kita coba menjalankan metode tersebut berulang kali:

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

Nah, mudah khan?! Pemanggilan metode di Ruby memang semudah menyebut
nama metode yang bersangkutan ke Ruby. Jika metode tidak menerima
parameter berarti ya memang itu saja yang Anda butuhkan. Anda bisa
menambahkan buka dan tutup kurung jika Anda suka, tetapi buka dan tutup
kurung tersebut tidak diperlukan.

Bagaimana kalau kita ingin bilang hello ke orang, dan bukan bilang hello
ke seluruh dunia? Caranya, Anda tinggal mendefinisikan ulang metode `h`
agar menerima `name` sebagai parameter.

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1>   puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Sukses… tetapi coba kita lihat dulu sebentar apa yang terjadi disini.

## Variabel dalam String

Apa itu tadi artinya `#{name}` ? Tanda pagar dan kurung kurawal tadi
adalah cara Ruby untuk insert sesuatu ke dalam string. Jadi obyek
diantara kurung kurawal menjadi string (jika belum berbentuk String)
kemudian diganti dengan string di luar kurung kurawal tersebut. Anda
juga bisa menggunakan tanda pagar dan kurung kurawal ini untuk
memastikan nama seseorang tersebut telah diubah menjadi kapital huruf
depannya (singkatnya, dikapitalkan, bahasa Inggrisnya, di-capitalize):

{% highlight irb %}
irb(main):019:0> def h(name = "World")
irb(main):020:1>   puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "arie"
Hello Arie!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

Ada beberapa trik di metode barusan. Trik pertama, kita panggil metode
tanpa menggunakan buka dan tutup kurung lagi. Jika sudah jelas apa yang
Anda lakukan, maka buka dan tutup kurung boleh dihilangkan (opsional).
Trik lainnya adalah secara default parameter `World`. Jadi apa yang
metode `h` katakan adalah “Jika name tidak ada, maka gunakan name
default yaitu `"World"`”.

## Halo Dunia Menjadi TukangSapa

Bagaimana jika kita ingin membuat TukangSapa, jadi satu yang mengingat
nama Anda dan menyambut Anda dengan ucapan selamat datang dan juga yang
selalu memperlakukan Anda dengan hormat. Anda akan membutuhkan obyek
untuk keperluan itu. Maka, mari kita buat kelas “TukangSapa”.

{% highlight irb %}
irb(main):024:0> class TukangSapa
irb(main):025:1>   def initialize(name = "Dunia")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hai
irb(main):029:2>     puts "Hai #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, datang lagi ya."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

Keyword baru disini adalah `class`. Keyword ini mendifinisikan kelas
baru yang disebut TukangSapa dan beberapa metode untuk kelas TukangSapa
tersebut. Juga perhatikan `@name`. Ini adalah variabel instan, dan juga
tersedia di semua metode di kelas TukangSapa. Seperti yang bisa Anda
lihat variabel instan `@name` digunakan di metode `say_hai` dan metode
`say_bye`.

Lalu, bagaimana caranya kita menjalan kelas TukangSapa ? [Membuat
obyek.](../3/)

