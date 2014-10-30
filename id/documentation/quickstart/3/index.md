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

Mari kita bikin obyek TukangSapa dan kita pakai:

{% highlight irb %}
irb(main):013:0> t = TukangSapa.new("Arie")
=> #<TukangSapa:0x6b274 @name="Arie">
irb(main):014:0> t.say_hai
Hai Arie!
=> nil
irb(main):015:0> t.say_bye
Bye Arie, datang lagi ya.
=> nil
{% endhighlight %}

Sekali obyek `t` dibuat, maka obyek `t` mengingat name adalah Arie. Hmm,
bagaimana jika kita ingin mendapatkan nama saja langsung?

{% highlight irb %}
irb(main):017:0> t.@name
SyntaxError: compile error
(irb):17: syntax error, unexpected tIVAR
        from (irb):17
        from :0
{% endhighlight %}

Tidak, caranya tidak bisa begitu.

## Di Bawah Naungan Object yang Sama

Variabel instan tersembunyi dalam obyek. Variabel instan tidak
benar-benar tersembunyi sepenuhnya, Anda bisa melihat variabel instan
kapan saja Anda menginspeksi obyek, dan ada lagi cara-cara lain untuk
mengakses variabel instan, tetapi Ruby menggunakan pendekatan
berorientasi obyek yang bagus untuk menjaga data supaya agak
tersembunyi.

Jadi metode-metode apa yang sebetulnya ada pada obyek TukangSapa?

{% highlight irb %}
irb(main):018:0> TukangSapa.instance_methods
=> ["inspect", "clone", "method", "public_methods",
"instance_variable_defined?", "equal?", "freeze", "methods",
"respond_to?", "dup", "instance_variables", "__id__",
"object_id", "eql?", "id", "singleton_methods",
"send", "taint", "frozen?", "instance_variable_get",
"__send__", "instance_of?", "to_a", "say_hai",
"type", "protected_methods", "instance_eval", "==",
"display", "===", "instance_variable_set", "kind_of?",
"extend", "to_s", "say_bye", "hash", "class",
"tainted?", "=~", "private_methods", "nil?",
"untaint", "is_a?"]
{% endhighlight %}

Wih. Metode-metodenya banyak ya. Padahal kita hanya mendefinisikan dua
metode. Apa yang sebenarnya terjadi? Jadi ini barusan adalah **semua**
metode obyek TukangSapa, list yang lengkap, termasuk metode-metode yang
didefinisikan oleh kelas induk TukangSapa. Jika kita hanya ingin list
metode-metode yang didefinisikan untuk kelas TukangSapa kita cukup
beritahu agar tidak memasukkan induk (ancestor) dengan melewatkan
parameter `false`, artinya kita tidak menginginkan metode-metode yang
didefinisikan kelas induk (ancestor).

{% highlight irb %}
irb(main):019:0> TukangSapa.instance_methods(false)
=> ["say_bye", "say_hai"]
{% endhighlight %}

Nah, begitu. Sekarang coba kita lihat metode yang mana dari obyek
TukangSapa kita yang merespon siapa saja:

{% highlight irb %}
irb(main):020:0> t.respond_to?('name')
=> false
irb(main):021:0> t.respond_to?('say_hai')
=> true
irb(main):022:0> t.respond_to?('say_bye')
=> true
irb(main):023:0> t.respond_to?('to_s')
=> true
{% endhighlight %}

Hm, jadi obyek mengetahui metode `say_hai`, dan metode `to_s` (artinya
mengkonversi suatu obyek ke string, metode yang didefinisikan secara
default untuk semua obyek), tetapi obyek tidak mengetahui tentang
`name`.

## Mengubah-ubah Kelas—Tidak Ada yang Pernah Terlalu Terlambat

Tetapi bagaimana jika Anda ingin bisa melihat atau mengganti name? Ruby
menyediakan cara yang mudah untuk mengakses variabel obyek.

{% highlight irb %}
irb(main):024:0> class TukangSapa
irb(main):025:1>   attr_accessor :name
irb(main):026:1> end
=> nil
{% endhighlight %}

Di Ruby, Anda dapat membuka kelas lagi dan memodifikasi kelas tersebut.
Perubahan-perubahan tersebut akan hadir pada obyek baru yang Anda buat
dan bahkan tersedia/hadir juga pada obyek yang sudah ada dari kelas yang
bersangkutan. Jadi, coba kita buat satu obyek baru dan bermain dengan
property `@name`.

{% highlight irb %}
irb(main):027:0> t = TukangSapa.new('Hendy')
=> #<TukangSapa:0x5b040 @name="Hendy">
irb(main):028:0> t.respond_to?('name')
=> true
irb(main):029:0> t.respond_to?('name=')
=> true
irb(main):030:0> t.say_hai
Hai Hendy!
=> nil
irb(main):031:0> t.name='Yohanes'
=> "Yohanes"
irb(main):032:0> t
=> #<TukangSapa:0x5b040 @name="Yohanes">
irb(main):033:0> t.name
=> "Yohanes"
irb(main):034:0> t.say_hai
Hai Yohanes!
=> nil
{% endhighlight %}

Dengan menggunakan `attr_accessor` kita sudah mendefinisikan dua metode
baru untuk kita, `name` untuk mendapatkan (get) value, dan `name=` untuk
mengatur (set) value.

## BosTukangSapa Menyapa Siapa Saja!

TukangSapa kita sebenarnya tidaklah terlalu menarik, TukangSapa hanya
bisa menyapa satu orang di saat yang sama. Bagaimana jika kita punya
BosTukangSapa yang bisa menyapa dunia (world), satu orang, atau bahkan
seluruh list orang-orang ?

Kali ini, mari kita langsung tulis ke file saja daripada memakai IRB
(Ruby Interaktif).

Untuk keluar dari IRB, ketik “quit”, “exit” atau tekan saja Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class BosTukangSapa
  attr_accessor :names

  # Bikin obyek
  def initialize(names = "Dunia")
    @names = names
  end

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

end

if __FILE__ == $0
  mg = BosTukangSapa.new
  mg.say_hai
  mg.say_bye

  # Ganti name menjadi "Azumi"
  mg.names = "Azumi"
  mg.say_hai
  mg.say_bye

  # Ganti name menjadi array name
  mg.names = ["Steven", "Anton", "Ridho",
    "Matz", "Bos"]
  mg.say_hai
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hai
  mg.say_bye
end
{% endhighlight %}

Simpan file dengan nama “ri20min.rb”, dan jalankan dengan “ruby
ri20min.rb”. Outputnya seharusnya menjadi sebagai berikut:

    Hello Dunia!
    Sampai jumpa Dunia. Datang lagi ya!
    Hello Azumi!
    Sampai jumpa Azumi. Datang lagi ya!
    Hello Steven!
    Hello Anton!
    Hello Ridho!
    Hello Matz!
    Hello Bos!
    Sampai jumpa Steven, Anton, Ridho, Matz, Bos. Datang lagi ya!
    ...
    ...
{: .code}

Ada banyak barang baru di contoh terakhir kita kali ini yang [bisa kita
lihat lebih lanjut](../4/)

