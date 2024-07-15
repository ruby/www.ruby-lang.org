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
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Bagian 4">4</a>
  </div>
  <h1>Menguasai Ruby dalam 20 Menit</h1>

---

Sekarang, mari kita buat sebuah objek Greeter dan kita pakai:

{% highlight irb %}
irb(main):035:0> greeter = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> greeter.say_hi
Hi Pat!
=> nil
irb(main):037:0> greeter.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Saat objek `greeter` dibuat, maka objek tersebut mengingat bahwa nama adalah
Pat. Hmm, bagaimana jika kita ingin mendapatkan nama secara langsung?

{% highlight irb %}
irb(main):038:0> greeter.@name
SyntaxError: (irb):38: syntax error, unexpected tIVAR, expecting '('
{% endhighlight %}

Tidak, caranya tidak bisa seperti itu.

## Di Bawah Naungan Objek yang Sama

Variabel objek tersembunyi dalam sebuah objek. Variabel objek tidak
benar-benar tersembunyi sepenuhnya, Anda bisa melihat variabel objek
kapan saja Anda menginspeksi obyek tersebut, dan ada lagi cara lain untuk
mengakses variabel objek, tetapi Ruby menggunakan pendekatan
berorientasi objek yang bagus untuk menjaga data supaya seperti
tersembunyi.

Jadi *method* apa yang sebetulnya ada pada obyek TukangSapa?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> [:say_hi, :say_bye, :instance_of?, :public_send,
    :instance_variable_get, :instance_variable_set,
    :instance_variable_defined?, :remove_instance_variable,
    :private_methods, :kind_of?, :instance_variables, :tap,
    :is_a?, :extend, :define_singleton_method, :to_enum,
    :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?,
    :freeze, :inspect, :display, :send, :object_id, :to_s,
    :method, :public_method, :singleton_method, :nil?, :hash,
    :class, :singleton_class, :clone, :dup, :itself, :taint,
    :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods,
    :protected_methods, :frozen?, :public_methods, :singleton_methods,
    :!, :==, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

Wah, ada banyak *method*. Padahal kita hanya mendefinisikan dua *method*.
Apa yang sebenarnya terjadi di sini? Jadi, ini adalah **semua** *method*
objek Greeter, sebuah daftar yang lengkap, termasuk *method* yang
didefinisikan oleh kelas induk (*ancestor*). Jika kita hanya ingin menampilkan
*method* yang didefinisikan oleh kelas Greeter kita cukup memberi tahu kelas
tersebut agar tidak memasukkannya dengan melewatkan parameter `false`,
artinya kita tidak menginginkan *method* yang didefinisikan oleh kelas induk.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> [:say_hi, :say_bye]
{% endhighlight %}

Nah, seperti itu. Sekarang coba kita lihat *method* mana dari objek Greeter
yang memberikan respons:

{% highlight irb %}
irb(main):041:0> greeter.respond_to?("name")
=> false
irb(main):042:0> greeter.respond_to?("say_hi")
=> true
irb(main):043:0> greeter.respond_to?("to_s")
=> true
{% endhighlight %}

Jadi, objek mengetahui *method* `say_hi` dan `to_s` (artinya
mengubah suatu objek ke *string*, sebuah *method* yang didefinisikan secara
*default* pada semua objek), tetapi objek tidak mengetahui tentang
`name`.

## Mengubah Kelas—Tidak Ada yang Tidak Mungkin

Tetapi bagaimana jika Anda ingin melihat atau mengubah name?
Ruby menyediakan cara yang mudah untuk mengakses variabel objek.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

Di Ruby, Anda dapat membuka lagi sebuah kelas dan memodifikasi kelas tersebut.
Modifikasi tersebut akan muncul pada obyek baru yang Anda buat
dan bahkan tersedia juga pada obyek yang sudah ada dari kelas yang
bersangkutan. Jadi, mari kita coba buat sebuah objek baru dan bermain dengan
*property* `@name`.

{% highlight irb %}
irb(main):047:0> greeter = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> greeter.respond_to?("name")
=> true
irb(main):049:0> greeter.respond_to?("name=")
=> true
irb(main):050:0> greeter.say_hi
Hi Andy!
=> nil
irb(main):051:0> greeter.name="Betty"
=> "Betty"
irb(main):052:0> greeter
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> greeter.name
=> "Betty"
irb(main):054:0> greeter.say_hi
Hi Betty!
=> nil
{% endhighlight %}

Menggunakan `attr_accessor` kita sudah mendefinisikan dua *method* baru,
`name` untuk mendapatkan (*get*) nilai dan `name=` untuk mengatur (*set*) nilai.

## Menyapa Apa Saja dan Apapun, MegaGreeter Tidak Mengabaikan Sama Sekali!

Penyapa kita sebenarnya tidaklah terlalu menarik, penyapa hanya bisa menyapa
satu orang di saat yang sama. Bagaimana seandainya kita memiliki MegaGreeter
yang bisa menyapa dunia, satu orang, atau bahkan seluruh daftar orang?

Kali ini, mari kita langsung tulis ke berkas saja daripada menggunakan
*interactive* Ruby *interpreter* IRB.

Untuk keluar dari IRB, ketik “quit”, “exit” atau tekan saja Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Buat objek
  def initialize(names = "World")
    @names = names
  end

  # Katakan hai kepada semua orang
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Katakan selamat tinggal kepada semua orang
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Gabungkan element list dengan tanda koma
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end
end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Ubah nama menjadi "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Ubah nama menjadi array dari nama
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Ubah nama menjadi nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Simpan berkas dengan nama “ri20min.rb” dan jalankan dengan perintah “ruby ri20min.rb”.
Keluaran seharusnya muncul sebagai berikut:

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

Ada banyak hal baru pada contoh terakhir kali ini yang
[bisa kita lihat lebih lanjut](../4/).
