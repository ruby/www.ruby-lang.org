---
layout: news_post
title: "21 Trik-Trik Ruby"
author: "Arie Kusuma Atmaja"
date: 2008-05-28 16:05:39 +0000
lang: id
---

Sewaktu mengurus Ruby Inside pengurusnya sering melihat banyak sekali
code Ruby. Kebanyakan sih sangat bagus, tetapi kadang-kadang kita lupa
kalau sebetulnya ada jalan pintas beserta trik-trik Ruby yang bisa
digunakan daripada reinvent the wheel (maksudnya: menemukan sesuatu yang
sudah ada). Berikut adalah 21 trik-trik Ruby yang beraneka-ragam, mulai
dari yang biasa digunakan sehari-hari oleh Ruby Developer berpengalaman
maupun juga yang belum banyak ditemukan. Sebelum menulis posting ini
sebenarnya Penulis RubyInside bahkan belum dapat ide buat trik yang
nomor 2! Pokoknya apapun level Ruby Anda, semoga dengan penyegaran dan
pencerahan posting ini di kemudian hari dapat bermanfaat buat Anda di
kemudian hari bila menemukan kasus serupa.

**1 – Cara Cepat Mengekstraksi hasil match regexp**

Cara yang biasa digunakan untuk mengekstrak data dari teks pakai regexp
adalah dengan menggunakan metode match. Nah sebetulnya ada shortcut yang
bisa dipakai agar proses hidup lebih sejahtera.

{% highlight ruby %}
email = "Fred Bloggs <fred@bloggs.com>"
email.match(/<(.*?)>/)[1]     # => “fred@bloggs.com”
email[/<(.*?)>/, 1]           # => “fred@bloggs.com”
email.match(/(x)/)[1]         # => NoMethodError [:(]
email[/(x)/, 1]               # => nil
email[/([bcd]).*?([fgh])/, 2] # => “g”
{% endhighlight %}

**2 – Shortcut buat Array#join**

Sudah mafhum bagi kebanyakan kita Rubyist bila menggunakan Array#\*
dengan angka, untuk memproses kali dari besarnya array banyak elemen,
tetapi jarang diketahui kalau sebenarnya kita bisa menggunakan Array#\*
buat string ketimbang memakai Array#join!

{% highlight ruby %}
%w{ariekeren lagi ngetes} * ", "          # => "ariekeren, lagi, ngetes"
h = { :name => "ArieKeren", :age => 27 }
h.map { |i| i * "=" } * "\n"              # => “age=27\nname=ArieKeren”
{% endhighlight %}

**3 – Cara Cepat Memformat Angka Desimal**

Memformat angka float ke bentuk yang biasa digunakan untuk harga bisa
dicapai dengan sprintf atau bisa juga dengan cara alternatif, yaitu
dengan formatting interpolation:

{% highlight ruby %}
duit = 9.5
"%.2f" % duit # => “9.50″
{% endhighlight %}

**4 – Cara Cepat Mengapit Teks**

Teknik formatting interpolation dari nomor ketiga keluar lagi, kali ini
adalah bagaimana menyisipkan suatu string ke string yang lain:

{% highlight ruby %}
"[%s]" % "stringnya pindah doang" # => “[stringnya pindah doang]”
{% endhighlight %}

Anda juga bisa menggunakan elemen-elemen dari array untuk mengganti
penempatan string tersebut:

{% highlight ruby %}
x = %w{p ketemulagi p}
"<%s>%s</%s>" % x # => “<p>ketemulagi</p>"
{% endhighlight %}

**5 – Menghapus direktori beserta seluruh isinya**

Jangan sortir ulang dengan menggunakan shell. Ruby punya library file
utilities yang nyaman dipakai untuk operasi file seperti menghapus
direktori berikut seluruh isinya:

{% highlight ruby %}
require 'fileutils'
FileUtils.rm_r 'somedir'
{% endhighlight %}

Hati-hati kalau Anda menggunakan cara ini!

**6 – Menyatukan dan Memisahkan enumerable**

Tanda bintang juga bisa digunakan untuk menyatukan dan memisahkan
enumerable (berfungsi untuk array maupun hash) daripada menggunakan
metode flatten. Kita akan langsung lihat dari contoh berikut bicara ini
saja biar jelas:

Contah dengan Array:

{% highlight ruby %}
a = %w{a b}
b = %w{c d}
[ a + b ]   # => [["a", "b", "c", "d"]]
[ *a + b ]  # => ["a", "b", "c", "d"]
{% endhighlight %}

Contoh dengan Hash:

{% highlight ruby %}
a = { :name => "ArieKeren", :age => 27 }
# => {:name=>"ArieKeren", :age=>27}

[a]
# => [{:name=>"ArieKeren", :age=>27}]

[*a]
# => [[:name, "ArieKeren"], [:age, 27]]
{% endhighlight %}

Contoh dengan tangkapan parameter paralel:

{% highlight ruby %}
a = %w{a b c d e f g h}
# => ["a", "b", "c", "d", "e", "f", "g", "h"]

b = [0, 5, 6]
# => [0, 5, 6]

a.values_at(*b)
# => ["a", "f", "g"]
{% endhighlight %}

**7 – Persingkat definisi variabel lokal**

Daripada mendefinisikan variabel lokal dengan beragam konten awal
(sering hanya berupa hash kosong ataupun array kosong), Anda sebenarnya
bisa langsung mendefinisikan variabel lokal “sekaligus” ketika operasi
sedang berlangsung:

{% highlight ruby %}
(z ||= []) << 'coba'
{% endhighlight %}

**8 – Penggunaan yang-bukan-string maupun yang-bukan-simbol sebagai hash
key**

Sangat jarang kita lihat seseorang menggunakan yang-bukan-string maupun
yang-bukan-simbol sebagai hash key. Padahal itu semua bisa dilakukan,
dan kadang-kadang berguna (dan, tidak, contoh berikut bukan contoh yang
dahsyat):

{% highlight ruby %}
does = is = { true => 'Yes', false => 'No' }
does[10 == 50]
# => “No”

is[10 > 5]
# => “Yes”
{% endhighlight %}

**9 – Gunakan ‘and’ dan ‘or’ untuk mengelompokkan operasi satu baris**

Trik ini adalah trik yang biasa dipakai oleh Ruby Developer dengan penuh
percaya diri untuk memperpadat, mempersingkat, dan menghilangkan terlalu
banyaknya baris-baris kode yang sebetulnya berisikan statement-statement
yang pendek-pendek:

{% highlight ruby %}
queue = []
%w{hello x world}.each do |word|
  queue << word and puts "Added to queue" unless word.length < 2
end
puts queue.inspect
# Output:
#   Added to queue
#   Added to queue
#   ["hello", "world"]
{% endhighlight %}

**10 – Menentukan eksekusi kode**

Trik berikut merupakan pattern yang biasa digunakan Ruby Developer
berpengalaman. Kalau Anda menulis Ruby script yang dapat digunakan
sebagai library maupun langsung dari command line, Anda bisa menggunakan
trik ini untuk menentukan apakah Anda sedang menjalankan script langsung
atau tidak:

{% highlight ruby %}
if __FILE__ == $0
  # Do something.. run tests, call a method, etc. We're direct.
end
{% endhighlight %}

**11 – Mempercepat assignment sekaligus (mass assignment)**

Mass assignment merupakan trik yang Ruby Developer pelajari dari
awal-awal ya, tetapi adalah sesuatu yang amazing dan menyenangkan betapa
jarang trik ini digunakan:

{% highlight ruby %}
a, b, c, d = 1, 2, 3, 4
{% endhighlight %}

Trik ini bisa dipakai di banyak kasus seperti menangkap parameter
argumen suatu metode yang berupa array dengan tanda \* (bintang) :

{% highlight ruby %}
def my_method(*args)
  a, b, c, d = args
end
{% endhighlight %}

**12 – Gunakan range daripada perbandingan rumit untuk angka**

Tidak ada lagi kode omong kosong seperti if x &gt; 1000 &amp;&amp; x
&lt; 2000.

{% highlight ruby %}
year = 1972
puts  case year
        when 1970..1979: "Tujuhpuluhan"
        when 1980..1989: "Delapanpuluhan"
        when 1990..1999: "Sembilanpuluhan"
      end
{% endhighlight %}

**13 – Gunakan Enumeration untuk menghindari kode-kode berulang**

{% highlight ruby %}
%w{rubygems daemons eventmachine}.each { |x| require x }
{% endhighlight %}

**14 – Operator Ternary**

Trik lain yang biasa dipelajari di awal-awal oleh Ruby Developer tetapi
sesuatu yang sebenarnya jarang kelihatan digunakan oleh Ruby Developer
berpengalaman adalah operator ternary. Operator ternary bukan hammer,
tetapi terkadang bisa membuat banyak hal menjadi singkat dan padat.

{% highlight ruby %}
puts x == 10 ? "x adalah sepuluh" : "x bukan sepuluh"

# Atau.. bisa juga digunakan untuk assignment yang bersandar pada hasil operator ternary
LOG.sev_threshold = ENVIRONMENT == :development ? Logger::DEBUG : Logger::INFO
{% endhighlight %}

**15 – Operator Ternary Bersarang (Nested Ternary Operators)**

Trik ini bisa jadi membuat kode menjadi rumit dibaca. Tetapi sebenarnya
hanya urusan return obyek saja sama seperti banyak obyek lain di Ruby.

{% highlight ruby %}
qty = 1
qty == 0 ? 'none' : qty == 1 ? 'one' : 'many'
# Hanya sebagai ilustrasi saja supaya tidak bingung:
(qty == 0 ? 'none' : (qty == 1 ? 'one' : 'many'))
{% endhighlight %}

**16 – Maksimalkan penggunaan fitur bawaan logis di Ruby**

Ada sering banyak metode yang menggunakan pattern kurang lebih sebagai
berikut:

{% highlight ruby %}
def is_odd(x)
  # Terlalu panjang..
  if x % 2 == 0
    return false
  else
    return true
  end
end
{% endhighlight %}

Mungkin kita bisa saja menggunakan operator ternary untuk improve?

{% highlight ruby %}
def is_odd(x)
  # Jangan sekali-sekali menaruh false dan true pada operator ternary!!
  x % 2 == 0 ? false : true
end
{% endhighlight %}

Ya, kode barusan tadi memang lebih pendek, dan saya sering melihat
pattern seperti itu, padahal sebenarnya Anda seharusnya bisa selangkah
lebih maju dan menyandarkan diri pada hasil respon dari operator
comparison Ruby yang berupa true maupun false langsung!

{% highlight ruby %}
def is_odd(x)
  # Gunakan hasil logis yang sudah disediakan Ruby secara otomstis untuk Anda..
  x % 2 != 0
end
{% endhighlight %}

**17 – Perhatikan seluruh exception backtrace**

{% highlight ruby %}
def do_division_by_zero; 5 / 0; end
begin
  do_division_by_zero
rescue => exception
  puts exception.backtrace
end
{% endhighlight %}

**18 – Manfaatkan obyek tunggal DAN array agar dapat dienumerasikan**

{% highlight ruby %}
[*items].each do |item|
  # …
end
{% endhighlight %}

**19 – Rescue yang berada dalam blok tidak perlu diapit ‘begin’**

{% highlight ruby %}
def x
  begin
    # …
  rescue
    # …
  end
end
{% endhighlight %}

{% highlight ruby %}
def x
  # …
rescue
  # …
end
{% endhighlight %}

**20 – Komentar format blok**

Di Ruby kita bisa dengan bebas sesuai selera untuk berkomentas di kode
dengan pagar ataupun menggunakan blok begin dan end:

{% highlight ruby %}
puts "x"
=begin
  ini adalah blok komentar
  Anda dapat menaruh apa saja yang Anda suka disini!

  puts "y"
=end
puts "z"
{% endhighlight %}

**21 – Rescue satu baris**

{% highlight ruby %}
h = { :age => 10 }
h[:name].downcase                         # ERROR
h[:name].downcase rescue "No name"        # => “No name”
{% endhighlight %}

Jika Anda ingin mem-posting daftar trik-trik Ruby di blog Anda, kirimkan
trackback kesini atau berkomentarlah lewat media milis ID Ruby maupun
blog Anda, nanti kami akan melink semua posting. Alternatif lain,
seperti yang sudah sering didengung-dengungkan di komunitas Ruby
Indonesia, Anda dapat menghubungi kami bila Anda mempunyai artikel,
tulisan tentang Ruby, maupun trik-trik Ruby untuk kami pasang disini,
semua hal seperti komentar, maupun kritik dan hal-hal lain demi kebaikan
dan kemajuan kita bersama. Terima kasih.

Sumber tulisan dari [RubyInside – 21 Ruby Tricks You Should Be Using In
Your Own Code][1] dengan penyesuaian seperlunya oleh [ArieKeren][2]



[1]: http://www.rubyinside.com/21-ruby-tricks-902.html
[2]: http://ariekusumaatmaja.wordpress.com
