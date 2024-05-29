---
layout: news_post
title: "Ruby 3.0.0 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2020-12-25 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 3.0.0. Dari tahun 2015, kami
bekerja keras untuk Ruby 3 yang mana tujuannya adalah kinerja, *concurrency*,
dan *Typing*. Khususnya kinerja, Matz mengatakan "Ruby3 akan 3 kali lebih
cepat dibanding Ruby2" yang juga dikenal dengan
[Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

Dengan [Optcarrot benchmark](https://github.com/mame/optcarrot), yang mengukur
kinerja *single thread* berdasarkan beban kerja NES's *game emulation*, kinerja
Ruby 3.0 mencapai 3x lebih cepat dibanding Ruby 2.0! <details>Ini dihitung pada
*environment* yang dicatat dalam [https://github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark). [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095)
yang digunakan sebagai *benchmark* ini. Kinerja mungkin tidak 3x lebih cepat
karena bergantung pada *environment* atau *benchmark* Anda.</details>

Ruby 3.0.0 mencapai tujuan tersebut dengan:
* Kinerja
  * MJIT
* *Concurrency*
  * *Ractor*
  * *Fiber Scheduler*
* *Typing* (Analisis Statis)
  * RBS
  * *TypeProf*

Dengan perbaikan kinerja di atas, Ruby 3.0 mengenalkan sejumlah fitur baru yang
digambarkan sebagai berikut.

## Kinerja

> Ketika saya menyatakan "Ruby3x3" pertama kali pada sebuah konferensi, banyak
> peserta termasuk anggota dari *core team* merasa "Matz is a boaster".
> Kenyataannya, saya juga merasa begitu. Tetapi, kami berhasil. Saya merasa
> terhormat melihat *core team* benar-benar bisa menjadikan Ruby3.0 tiga kali
> lebih cepat dibanding Ruby2.0 (pada beberapa *benchmark*). -- Matz

### MJIT

Banyak perbaikan yang telah diimplementasikan pada MJIT. Lihat NEWS untuk
detail.

Pada Ruby 3.0, JIT seharusnya memberikan perbaikan kinerja pada beban kerja
terbatas, seperti permainan
([Optcarrot](https://github.com/mame/optcarrot)),
AI ([Rubykon](https://github.com/benchmark-driver)),
atau aplikasi apapun yang mayoritas menghabiskan waktu saat memanggil beberapa
*method* berkali-kali.

Meskipun Ruby 3.0 [significantly decreased the size of JIT-ed code](https://twitter.com/k0kubun/status/1256142302608650244),
ini masih belum siap untuk mengomptimalkan beban kerja seperti *Rails*, yang
mana menghabiskan waktu pada banyak *method*. Sehingga, ini akan menderita dari
*i-cache misses* yang diperburuk oleh JIT. Nantikan perbaikan lebih lanjut
masalah ini pada Ruby 3.1.

## Concurrency / Parallel

> Ini zaman *multi-core* sekarang. *Concurrency* sangatlah penting. Dengan
> *Ractor*, bersama dengan *Async Fiber*, Ruby akan menjadi sebuah bahasa
> *concurrent* asli. --- Matz

### Ractor (eksperimental)

*Ractor* adalah sebuah *Actor-model* seperti *concurrent abstraction* yang
didesain untuk menyediakan sebuah fitur eksekusi paralel tanpa mengkhawatirkan
*thread-safety*.

Anda dapat membuat beberapa *ractor* dan menjalankannya secara paralel. *Ractor*
memungkinkan untuk membuat program paralel yang *thread-safe* karena *ractor*
tidak dapat membagi objek normal. Komunikasi antar *ractor* didukung oleh
pertukaran pesan.

Untuk membatasi pembagian objek, *Ractor* mengenalkan beberapa batasan pada
sintaks Ruby (tanpa banyak *Ractor*, maka tidak ada batasan).

Spesifikasi dan implementasi dari *Ractor* masih belum sempurna dan memungkinkan
adanya perubahan ke depan, sehingga fitur ini ditandai dengan eksperimental
dan menampilkan peringatan "experimental feature" saat `Ractor.new` pertama kali.

Berikut adalah program kecil untuk mengukur waktu eksekusi dari fungsi populer
*tak* ([Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))),
dengan mengeksekusinya 4 kali secara berurutan atau 4 kali secara paralel dengan
*Ractor*.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # versi berurutan
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # versi paralel
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Hasil benchmark:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Hasil diukur pada Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 *cores*, 8
*hardware threads*). Ini menunjukkan versi paralel 3.87 kali lebih cepat
dibanding versi berurutan.

Lihat [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html)
untuk lebih detail.

### Fiber Scheduler

`Fiber#scheduler` diperkenalkan untuk menghalangi operasi *blocking*. Ini
memperbolehkan *light-weight concurrency* tanpa pengubahan kode yang sudah ada.
Tonton ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc)
sebagai gambaran bagaimana fitur ini bekerja.

Saat ini, *class*/*method* yang didukung:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write`, dan *method* yang berkaitan (seperti `#wait_readable`, `#gets`, `#puts` dan lainnya).
- `IO#select` *tidak didukung*.

Ini adalah contoh program yang akan melakukan beberapa HTTP *request* secara
bersamaan:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Ini menggunakan [async](https://github.com/socketry/async) yang mana menyediakan
*event loop*. *Event loop* ini menggunakan `Fiber#scheduler` *hook* untuk
membuat `Net::HTTP` *non-blocking*. *Gem* lainnya dapat menggunakan *interface*
ini untuk menyediakan eksekusi *non-blocking* pada Ruby dan *gem* tersebut
cocok dengan implementasi Ruby lainnya (misalnya, JRuby, TruffleRuby) yang dapat
mendukung *non-blocking hook* yang sama.

## Analisis Statis

> 2010-an adalah zaman dari *statically typed programming language*. Ruby melihat
> masa depan dengan *static type checking*, tanpa *type declaration*,
> menggunakan interpretasi abstrak. RBS & *TypeProf* adalah langkah pertama
> menuju masa depan. Lebih banyak langkah yang akan datang. --- Matz

### RBS

RBS adalah sebuah bahasa untuk mendeskripsikan tipe dari program Ruby.

*Type checker* termasuk *TypeProf* dan *tool* lainnya yang mendukung RBS
akan memahami program Ruby jauh lebih baik dengan definisi RBS.

Anda dapat menuliskan definisi *class* dan *module*: *method* didefinisikan di
dalam *class*, *instance variables* dan tipenya, serta hubungan
*inheritance/mix-in*.

RBS memiliki tujuan untuk mendukung pola yang biasanya
kita lihat dalam program Ruby dan memperbolehkan penulisan *advanced types*
yang berisi *union type*, *method overloading*, dan *generic*. RBS juga
mendukung *duck typing* dengan _interface types_.

Ruby 3.0 dirilis dengan gem `rbs`, yang memperbolehkan untuk mem-*parse* dan
memproses definisi tipe yang ditulis di dalam RBS. Berikut ini adalah sebuah
contoh kecil dari RBS dengan *class*, *module*, dan *constant definition*.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

Lihat [README dari gem rbs](https://github.com/ruby/rbs) untuk lebih detail.

### TypeProf

*TypeProf* adalah sebuah *type analysis tool* yang di-*bundle* di dalam Ruby.

Saat ini, *TypeProf* berperan semacam sebuah *type inference*.

*TypeProf* membaca kode Ruby (*non-type-annotated*), menganalisis apa *method*
yang didefinisikan dan bagaimana itu digunakan, dan menghasilkan sebuah
prototipe dari *type signature* dalam format RBS.

Berikut adalah sebuah demonstrasi sederhana dari *TypeProf*.

Contoh masukan:

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Contoh keluaran:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Anda dapat menjalankan *TypeProf* dengan menyimpan masukan sebagai "test.rb"
dan memanggilnya dengan perintah "typeprof test.rb".

Anda juga dapat [mencoba TypeProf daring](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (Ini menjalankan *TypeProf* di *server*, maaf jika hasilnya tidak keluar)

Lihat [dokumentasi](https://github.com/ruby/typeprof/blob/master/doc/doc.md)
dan [demonstrasi](https://github.com/ruby/typeprof/blob/master/doc/demo.md)
untuk detail.

*TypeProf* masih eksperimental dan belum sempurna; hanya sebagian dari bahasa
Ruby didukung dan pendeteksian *type error* terbatas. Tetapi, ini masih bisa
berkembang dengan memperbaiki cakupan dari fitur bahasa, performa analisis,
dan kegunaan. Masukan apapun sangat diterima.

## Fitur Baru Lainnya

* *One-line pattern matching* didesain ulang.  (eksperimental)

    * `=>` ditambahkan. Ini bisa digunakan seperti *rightward assignment*.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` diubah dengan mengembalikan `true` atau `false`.

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* *Find pattern* ditambahkan. (eksperimental)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Definisi *endless method* ditambahkan.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` sekarang *built-in*.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* *Memory view* ditambahkan sebagai sebuah fitur eksperimental

    * Ini adalah sebuah kumpulan C-API baru yang menukar sebuah area *raw memory*, seperti sebuah *numeric array* dan sebuah *bitmap image*, antara pustaka *extension*. Pustaka *extension* dapat juga membagikan *metadata* dari area *memory* yang terdiri dari bentuk, format elemen, dan sebagainya. Menggunakan semacam *metadata* seperti ini, pustaka *extension* bahkan dapat membagikan sebuah *multidimensional array* dengan tepat. Fitur ini didesain dengan merujuk pada *buffer protocol* dari Python.

## Perbaikan performa

* Menempelkan kode yang panjang pada IRB 53 kali lebih cepat dibandingkan yang di-*bundle* dengan Ruby 2.7.0. Sebagai contoh, waktu yang dibutuhkan untuk menempelkan [kode ini](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) berubah dari 11.7 detik menjadi 0.22 detik.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* Perintah `measure` telah ditambakan ke IRB. Ini memperbolehkan perhitungan waktu eksekusi secara sederhana.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Perubahan penting lainnya sejak 2.7

* *Keyword argument* dipisahkan dari *argument* lainnya.
  * Pada dasarnya, kode yang mencetak sebuah peringatan pada Ruby 2.7 tidak akan
bekerja. Lihat [dokumen](https://www.ruby-lang.org/id/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) untuk detail.
  * Omong-omong, *argument forwarding* sekarang mendukung *leading argument*.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* *Pattern matching* (`case`/`in`) tidak lagi eksperimental.
  * Lihat [dokumentasi pattern matching](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html) untuk detail.
* Fitur `$SAFE` telah dihilangkan; sekarang adalah sebuah variabel global.
* Urutan dari *backtrace* telah dibalik pada Ruby 2.5, tetapi itu dibatalkan. Sekarang urutan berperilaku seperti Ruby 2.4; pesan *error* dan nomor baris di mana *exception* terjadi dicetak terlebih dahulu dan pemanggilnya baru dicetak kemudian.
* Beberapa pustaka standar yang diperbarui.
* Berikut adalah pustaka yang tidak lagi masuk sebagai *bundled gem*.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * lainnya.
* Pustakan berikut tidak lagi *bundle gem* atau pustaka standar.
  Pasang *gem* berikut jika ingin menggunakan fiturnya.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* Berikut adalah *default gem* yang sekarang menjadi *bundled gem*.
  * rexml
  * rss
* Berikut adalah berkas *stdlib* yang sekarang menjadi *default gem* dan telah dipublikasikan ke rubygems.org
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

Lihat [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})
untuk lebih detail.

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)
sejak Ruby 2.7.0!

Selamat Natal, selamat berlibur, dan nikmati memprogram dengan Ruby 3.0!

## Unduh

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Apa itu Ruby

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993
dan sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di berbagai
jenis *platform* dan digunakan di seluruh dunia khususnya pengembangan *web*.
