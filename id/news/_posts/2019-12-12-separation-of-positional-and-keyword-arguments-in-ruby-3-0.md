---
layout: news_post
title: "Pemisahan positional dan keyword argument pada Ruby 3.0"
author: "mame"
translator: "meisyal"
date: 2019-12-12 12:00:00 +0000
lang: id
---

Artikel ini menjelaskan rencana *incompatibility* dari *keyword argument*
pada Ruby 3.0

## tl;dr

Pada Ruby 3.0, *positional* dan *keyword argument* akan dipisahkan. Ruby 2.7
akan memberi peringatan terhadap perilaku yang akan berubah pada Ruby 3.0.
Jika Anda melihat peringatan di bawah ini maka Anda perlu untuk memperbarui
kode Anda:

* `Menggunakan argument terakhir sebagai parameter argument sudah usang`, atau
* `Melewatkan keyword argument sebagai parameter hash terakhir juga sudah usang`, atau
* `Memisahkan argument terakhir ke positional dan keyword argument juga sudah usang`

Pada kebanyakan kasus, Anda dapat menghindari *compatibility* ini dengan
menambahkan operator _double splat_. Operator ini secara langsung melewatkan
*keyword argument* ketimbang sebuah objek `Hash`. Begitu juga, Anda mungkin
menambahkan tanda kurung kurawal `{}` untuk secara langsung melewatkan sebuah
objek `Hash` ketimbang *keyword argument*. Baca bagian "Kasus Khusus" di
bawah ini untuk lebih detail.

Pada Ruby 3, sebuah *method* yang mendelegasikan semua *argument* harus secara
langsung mendelegasikan *keyword argument* dan *positional argument*. Jika
Anda ingin tetap menggunakan perilaku delegasi yang ditemukan pada Ruby 2.7
dan sebelumnya, gunakan `ruby2_keywords`. Lihat bagian "Menangani delegasi
argument" untuk lebih detail.

## Kasus Khusus
{: #typical-cases }

Berikut adalah kasus yang paling khas. Anda dapat menggunakan operator *double
splat* (`**`) untuk melewatkan *keyword* daripada sebuah *Hash*.

{% highlight ruby %}
# Method ini hanya menerima sebuah keyword argument
def foo(k: 1)
  p k
end

h = { k: 42 }

# Pemanggilan method ini melewatkan sebuah positional Hash argument
# Pada Ruby 2.7: Hash secara otomatis diubah menjadi sebuah keyword argument
# Pada Ruby 3.0: Pemanggilan ini menyebabkan ArgumentError
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# Jika Anda ingin tetap menggunakan perilaku sebelumnya pada Ruby 3.0, gunakan double splat
foo(**h) #=> 42
{% endhighlight %}

Ini adalah kasus lainnya. Anda dapat menggunakan tanda kurung kurawal (`{}`)
untuk melewatkan sebuah objek *Hash* ketimbang *keyword* secara langsung.

{% highlight ruby %}
# Method ini menerima satu positional argument dan sebuah keyword rest argument
def bar(h, **kwargs)
  p h
end

# Pemanggilan ini hanya melewatkan sebuah keyword argument tanpa positional argument
# Pada Ruby 2.7: keyword diubah ke sebuah positional Hash argument
# Pada Ruby 3.0: Pemanggilan ini menyebabkan ArgumentError
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# Jika Anda ingin tetap menggunakan perilaku sebelumnya pada Ruby 3.0, gunakan
# tanda kurung kurawal untuk mengubahnya menjadi sebuah explicit Hash
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## Apa yang sudah usang?
{: #what-is-deprecated}

Pada Ruby 2, *keyword argument* dapat dianggap sebagai *positional Hash argument*
terakhir dan sebuah *positional Hash argument* terakhir dapat dianggap sebagai
*keyword argument*.

Karena pengubahan otomatis tersebut, kadang-kadang hal ini sangat kompleks dan
sulit seperti yang dideskripsikan pada bagian terakhir. Sehingga, sekarang
perilaku tersebut sudah usang pada Ruby 2.7 dan akan dihilangkan pada Ruby 3.
Dengan kata lain, *keyword argument* akan dipisahkan seluruhnya dari
*positional*-nya pada Ruby 3. Ketika Anda ingin melewatkan *keyword argument*,
Anda seharusnya selalu menggunakan `foo(k: expr)` atau `foo(**expr)`. Jika
Anda ingin menerima *keyword argument*, pada dasarnya Anda harus selalu
menggunakan `def foo(k: default)` atau `def foo(k:)` atau `def foo(**kwargs)`.

Ingat bahwa Ruby 3.0 tidak membedakan perilaku ketika memanggil sebuah *method*
yang tidak menerima *keyword argument* dengan *method* yang menerima
*keyword argument*. Sebagai contoh, kasus berikut ini tidak akan usang dan
akan tetap berjalan pada Ruby 3.0. *Keyword argument* tetap dianggap sebagai
sebuah *positional Hash argument*.

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

Hal ini karena gaya di atas sangat sering digunakan dan tidak ada ambiguitas
saat bagaimana *argument* seharusnya diperlakukan. Melarang pengubahan ini
akan menyebabkan *incompatibility* tambahan untuk manfaat yang sedikit.

Namun demikian, gaya ini tidak direkomendasikan pada kode baru, kecuali anda
sering melewatkan sebuah *Hash* sebagai sebuah *positional argument* dan juga
menggunakan *keyword argument*. Jika tidak, gunakan *double splat*:

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## Akankah kode saya tidak berjalan pada Ruby 2.7?
{: #break-on-ruby-2-7 }

Jawaban singkatnya adalah "mungkin tidak".

Perubahan pada Ruby 2.7 didesain sebagai sebuah migrasi menuju 3.0. Pada
dasarnya, Ruby 2.7 hanya memperingatkan perilaku yang akan berubah pada Ruby 3,
ini termasuk beberapa perubahan *incompatible* yang kami pertimbangkan sangat
kecil. Lihat bagian "Perubahan kecil lainnya" untuk detail.

Kecuali untuk peringatan dan perubahan kecil, Ruby 2.7 mencoba untuk tetap
*compatible* dengan Ruby 2.6. Sehingga, kode Anda mungkin akan berjalan pada
Ruby 2.7, walaupun mungkin mengeluarkan peringatan. Dengan menjalankannya pada
Ruby 2.7, Anda dapat mengecek jika kode Anda siap untuk Ruby 3.0.

Jika Anda ingin mematikan peringatan *deprecation*, mohon gunakan *command-line
argument* `-W:no-deprecated` atau menambahkan `Warning[:deprecated] = false`
pada kode Anda.

## Menangani delegasi argument
{: #delegation }

### Ruby 2.6 dan sebelumnya
{: #delegation-ruby-2-6-or-prior }

Pada Ruby 2, Anda dapat menulis sebuah *method* delegasi dengan menerima sebuah
*argument* `*rest` dan `&block` dan melewatkan keduanya ke *method* tujuan.
*Keyword argument* pada perilaku ini secara tidak langsung ditangani oleh
pengubahan otomatis antara *positional* dan *keyword argument*.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3
{: #delegation-ruby-3 }

Anda butuh mendelegasikan *keyword argument* secara langsung.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

Kalau tidak, jika anda tidak membutuhkan *compatibility* dengan Ruby 2.6 atau
sebelumnya dan Anda tidak mengubah *argument* apapun, Anda dapat menggunakan
sintaks delegasi baru (`...`) yang dikenalkan pada Ruby 2.7.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7
{: #delegation-ruby-2-7 }

Secara singkat: gunakan `Module#ruby2_keywords` dan delegasikan `*args, &block`.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords` menerima *keyword argument* sebagai *Hash argument* terakhir
dan melewatkannya sebagai *keyword argument* ketika memanggil *method* lain.

Faktanya, Ruby 2.7 memperbolehkan gaya baru delegasi pada kebanyakan kasus.
Namun, ada sebuah *corner case* yang diketahui. Lihat pada bagian berikutnya.

### Sebuah compatible delegation yang berjalan pada Ruby 2.6, 2.7, dan 3
{: #a-compatible-delegation }

Secara singkat: menggunakan `Module#ruby2_keywords` lagi.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

Sayangnya, kami perlu untuk menggunakan delegasi gaya lama (seperti, tanpa
`**kwargs`) karena Ruby 2.6 dan sebelumnya tidak dapat menangani gaya delegasi
baru dengan benar. Ini adalah satu alasan dari pemisahan *keyword argument*;
detail dijelaskan di bagian akhir. `ruby2_keywords` memperbolehkan Anda untuk
menjalankan gaya lama walaupun pada Ruby 2.7 dan 3.0. Karena tidak ada
`ruby2_keywords` pada 2.6 atau sebelumnya, mohon gunakan
[ruby2_keywords gem](https://rubygems.org/gems/ruby2_keywords) atau definisikan
sendiri:

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

Jika kode Anda tidak harus berjalan pada Ruby 2.6 atau sebelumnya, Anda bisa
mencoba gaya baru pada Ruby 2.7. Pada kebanyakan kasusu, ini berjalan. Catat
bahwa masih ada *corner case* berikut:

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []   ({} dibuang)
foo({}, **{}) #=> Ruby 2.7: [{}] (Anda dapat melewatkan {} dengan secara langsung melewatkan tanpa keyword)
{% endhighlight %}

Sebuah *Hash argument* kosong secara otomatis diubah dan diserap menjadi
`**kwargs` dan pemanggilan delegasi menghilangkan *keyword hash* kosong,
sehinggan tanpa argument dilewatkan ke `target`. Sejauh yang kami tahu,
*corner case* hanya ini.

Seperti yang tertulis di baris terakhir, Anda dapat menyelesaikan masalah ini
dengan menggunakan `**{}`.

Jika Anda sangat khawatir terkait *portability*, gunakan `ruby2_keywords`.
(Diakui bahwa Ruby 2.6 dan sebelumnya memiliki banyak *corner case* pada
*keyword argument*. :-) `ruby2_keywords` ke depan mungkin dihilangkan setelah
masa Ruby 2.6 berakhir. Pada saat tersebut, kami merekomendasikan untuk secara
langsung mendelegasikan *keyword argument* (lihat kode Ruby 3 di atas).

## Perubahan kecil lainnya
{: #other-minor-changes }

Ada tiga perubahan kecil terkait *keyword argument* pada Ruby 2.7.

### 1. Non-symbol key diperbolehkan pada keyword argument
{: #other-minor-changes-non-symbol-keys }

Pada Ruby 2.6 dan sebelumnya, hanya *Symbol key* yang diperbolehkan pada
*keyword argument*. *Keyword argument* dapat menggunakan *non-Symbol key* pada
Ruby 2.7.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6 dan sebelumnya: ArgumentError: wrong number of arguments
  #=> Ruby 2.7 dan setelahnya: {"key"=>42}
{% endhighlight %}

Jika sebuah *method* menerima baik *optional* maupun *keyword argument*, objek
*Hash* yang memiliki *Symbol* dan *non-Symbol* key dipisah menjadi dua pada
Ruby 2.6. Pada Ruby 2.7, keduanya diterima sebagai *keyword* karena *non-Symbol
key* diperbolehkan.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# Gunakan tanda kurung kurawal untuk menjaga perilaku
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 and 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7 masih memisahkan *hash* dengan sebuah peringatan jika sebuah *Hash*
atau *keyword argument* dengan *Symbol* dan *non-Symbol key* ke sebuah *method*
yang menerima *keyword* secara langsung, tetapi tidak ada *keyword rest argument*
(`**kwargs`). Perilaku ini akan dihilangkan pada Ruby 3 dan `ArgumentError`
akan muncul.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6 and 2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2. Double splat dengan sebuah hash kosong (`**{}`) melewati tanpa argument
{: #other-minot-changes-empty-hash }

Ruby 2.6 dan sebelumnya melewatkan `**empty_hash` ke sebuah *Hash* kosong
sebagai sebuah *positional argument*. Ruby 2.7 dan setelahnya akan melewatkan
tanpa *argument*.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 dan sebelumnya: [{}]
  #=> Ruby 2.7 dan setelahnya: []
{% endhighlight %}

Catat bahwa `foo(**{})` tidak melewatkan apapun baik di Ruby 2.6 maupun Ruby 2.7.
Pada Ruby 2.6 dan sebelumnya, `**{}` dihilangkan oleh *parser*. Hal ini berlaku
sama seperti `**empty_hash` pada Ruby 2.7 dan setelahnya, memperbolehkan untuk
jalan mudah melewatkan tanpa *keyword argument* ke sebuah *method*.

Ketika memanggil sebuah *method* dengan jumlah *required positional argument*
yang kurang pada Ruby 2.7, `foo(**empty_hash)` melewatkan sebuah *hash* kosong
dengan sebuah peringatan untuk *compatible* dengan Ruby 2.6. Perilaku ini akan
dihilangkan pada Ruby 3.0.

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 dan sebelumnya: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. Sintaks no-keyword-argument (`**nil`) diperkenalkan
{: #other-minor-changes-double-splat-nil }

Anda dapat menggunakan `**nil` pada sebuah definisi *method* untuk menandakan
secara langsung bahwa *method* menerima tanpa *keyword argument*. Pemanggilan
seperti ini dengan *keyword argument* akan menghasilkan `ArgumentError`.
(Ini sebenarnya adalah fitur baru, bukan *compatibility*).

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7 dan setelahnya: no keywords accepted (ArgumentError)
{% endhighlight %}

Ini berguna untuk menandakan secara langsung jika *method* tidak dapat menerima
*keyword argument*. Jika tidak, *keyword* akan diserap pada *rest argument*
sesuai contoh di atas. Jika Anda memperluas sebuah *method* untuk menerima
*keyword argument*, *method* mungkin memiliki *incompatibility* berikut:

{% highlight ruby %}
# Jika sebuah method menerima rest argument dan tanpa `**nil`
def foo(*args)
  p args
end

# Keyword yang dilewatkan diubah menjadi sebuah objek Hash (walaupun di Ruby 3.0)
foo(k: 1) #=> [{:k=>1}]

# Jika method diperluas untuk menerima sebuah keyword
def foo(*args, mode: false)
  p args
end

# Pemanggilan yang sudah ada mungkin tidak berjalan
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## Mengapa kami membuat usang konversi otomatis
{: #why-deprecated }

Konversi otomatis pada mulanya muncul sebagai sebuah ide bagus dan bekerja
dengan baik di banyak kasus. Namun, hal ini memiliki banyak *corner case* dan
kami telah menerima banyak laporan *bug* terhadap perilaku tersebut.

Konversi otomatis tidak bekerja dengan baik ketika sebuah *method* menerima
*optional positional argument* dan *keyword argument*. Beberapa orang
mengharapkan objek *Hash* terakhir dianggap sebagai sebuah *positional argument*
dan lainnya mengharapkan diubah menjadi *keyword argument*.

Berikut adalah salah satu kasus yang sangat membingungkan:

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> expected: [{}, {}], actual: [1, {}]
{% endhighlight %}

Pada Ruby 2, `foo({})` melewatkan sebuah *hash* kosong sebagai *normal argument*
(contoh, `{}` ditetapkan sebagai `x`), sementara `bar({})` melewatkan sebuah
*keyword argument* (contoh, `{}` ditetapkan sebagai `kwargs`). Sehingga,
`any_method({})` sangat ambigu.

Masalah yang sama juga berlaku pada *method* yang menerima *rest* dan *keyword
argument*. Ini membuat delegasi langsung *keyword argument* tidak berjalan

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6 dan sebelumnya: [{}]
      #=> Ruby 2.7 dan setelahnya:  []
{% endhighlight %}

`foo()` melewatkan tanpa *argument*, tetapi *target* menerima sebuah *hash
argument* kosong pada Ruby 2.6. Hal ini karena *method* `foo` mendelegasikan
*keyword* (`kwargs`) secara langsung. Ketika `foo()` dipanggil, `args` adalah
sebuah *Array* kosong, `kwargs` adalah sebuah *Hash* kosong, dan `block`
adalah `nil`. Kemudian, `target(*args, **kwargs, &block)` melewatkan sebuah
*Hash* kosong sebagai *argument* karena `**kwargs` secara otomatis diubah
ke sebuah *positional Hash argument*.

Konversi otomatis tidak hanya membingungkan orang akan tetapi membuat *method*
kurang *extensible*. Lihat
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183) untuk lebih detail
terkait alasan perubahan perilaku ini dan mengapa pilihan implementasi ini
dibuat.

## Rujukan

Artikel ini telah diperiksa (atau bahkan *co-authored*) oleh Jeremy Evans dan
Benoit Daloze.

## Riwayat

* Diperbarui 2019-12-25: Pada 2.7.0-rc2, pesan peringatan sedikit diubah dan
sebuah API untuk membenamkan peringatan telah ditambahkan.
