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
sebuah *method*!

{% highlight irb %}
irb(main):010:0> def hi
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> :hi
{% endhighlight %}

Kode `def hi` memulai definisi suatu *method*. Kode tersebut berkata pada
Ruby bahwa kita sedang mendefinisikan sebuah *method*, yang bernama `hi`.
Baris selanjutnya adalah *body* (badan) *method*, baris yang sama seperti
yang sudah kita lihat sebelumnya: `puts "Hello World"`. Baris terakhir
`end` memberi tahu Ruby bahwa kita sudah selesai mendefinisikan metode.
Ruby merespons `=> :hi` yang mana memberi tahu kita bahwa kita sudah selesai
mendefinisikan *method*. Respons bisa jadi `=> nil` pada Ruby 2.0 dan versi
sebelumnya. Tetapi, ini bukanlah hal yang penting di sini. Mari kita lanjut.

## Ringkasan, Kehidupan Berulang-ulang dari Sebuah Method

Sekarang mari kita coba menjalankan *method* tersebut berulang kali:

{% highlight irb %}
irb(main):013:0> hi
Hello World!
=> nil
irb(main):014:0> hi()
Hello World!
=> nil
{% endhighlight %}

Nah, mudah bukan? Pemanggilan *method* di Ruby memang semudah menyebut
nama *method* yang bersangkutan. Jika *method* tidak menerima
parameter berarti memang itu saja yang Anda butuhkan. Anda bisa
menambahkan tanda kurung jika Anda suka, tetapi tanda kurung tersebut
tidak diperlukan.

Bagaimana kalau kita ingin mengatakan *hello* ke satu orang, tetapi bukan
ke seluruh dunia? Caranya, Anda tinggal mendefinisikan ulang *method* `hi`
agar menerima `name` sebagai parameter.

{% highlight irb %}
irb(main):015:0> def hi(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> :hi
irb(main):018:0> hi("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Sukses… tetapi coba kita lihat dulu sebentar apa yang terjadi disini.

## Variabel dalam Sebuah String

Apa itu tadi artinya `#{name}`? Tanda pagar dan kurung kurawal tadi
adalah cara Ruby untuk menyisipkan sesuatu ke dalam sebuah *string*.
Jadi objek di antara kurung kurawal menjadi sebuah *string*
(jika belum berbentuk String) kemudian diganti dengan string di luar
kurung kurawal tersebut. Anda juga bisa menggunakan tanda pagar dan
kurung kurawal ini untuk memastikan nama seseorang telah diubah menjadi
kapital huruf depannya (*capitalized*):

{% highlight irb %}
irb(main):019:0> def hi(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> :hi
irb(main):022:0> hi "chris"
Hello Chris!
=> nil
irb(main):023:0> hi
Hello World!
=> nil
{% endhighlight %}

Ada beberapa trik yang bisa dilihat di sini. Trik pertama, kita panggil *method*
tanpa menggunakan tanda kurung lagi. Jika sudah jelas apa yang Anda lakukan,
maka tanda kurung boleh dihilangkan (opsional). Trik lainnya adalah
menggunakan *default parameter* `World`. Jadi apa yang *method* `hi` katakan
adalah “Jika parameter name tidak ada, maka gunakan default name
yaitu `"World"`”.

## Hello World Berkembang Menjadi Penyapa

Bagaimana jika kita ingin membuat penyapa, yang mengingat nama Anda dan
menyambut serta selalu memperlakukan Anda dengan hormat. Anda akan membutuhkan
sebuah objek untuk ini. Mari kita buat sebuah kelas “Greeter”.

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> :say_bye
{% endhighlight %}

*Keyword* baru di sini adalah `class`. *Keyword* ini mendefinisikan kelas
baru yang disebut Greeter dan beberapa *method* untuk kelas tersebut.
Perhatikan juga `@name`. Ini adalah variabel objek, yang tersedia
di semua *method*. Seperti yang bisa Anda lihat, variabel objek `@name`
digunakan pada *method* `say_hai` dan `say_bye`.

Lalu, bagaimana cara menjalankan kelas Greeter? [Membuat sebuah objek](../3/).
