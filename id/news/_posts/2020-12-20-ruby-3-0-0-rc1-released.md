---
layout: news_post
title: "Ruby 3.0.0 RC1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2020-12-20 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 3.0.0-rc1.

Rilis ini mengenalkan sejumlah fitur baru dan perbaikan performa.

## Analisis Statis

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

Lihat [dokumentasi](https://github.com/ruby/typeprof/blob/master/doc/doc.md) dan [demonstrasi](https://github.com/ruby/typeprof/blob/master/doc/demo.md) untuk detail.

*TypeProf* masih eksperimental dan belum sempurna; hanya sebagian dari bahasa
Ruby didukung dan pendeteksian *type error* terbatas. Tetapi, ini masih bisa
berkembang dengan memperbaiki cakupan dari fitur bahasa, performa analisis,
dan kegunaan. Masukan apapun sangat diterima.

## Ractor (eksperimental)

*Ractor* adalah sebuah *Actor-model* seperti *concurrent abstraction* yang
didesain untuk menyediakan sebuah fitur eksekusi paralel tanpa mengkhawatirkan
*thread-safety*.

Anda dapat membuat beberapa *ractor* dan menjalankannya secara paralel. *Ractor*
memungkinkan untuk membuat program paralel yang *thread-safe* karena *ractor*
tidak dapat membagi objek normal. Komunikasi antar *ractor* didukung oleh
*message passing*.

Untuk membatasi pembagian objek, *Ractor* mengenalkan beberapa batasan pada
sintaks Ruby (tanpa banyak *Ractor*, maka tidak ada batasan).

Spesifikasi dan implementasi dari *Ractor* masih belum sempurna dan memungkinkan
adanya perubahan ke depan, sehingga fitur ini ditandai dengan eksperimental
dan menampilkan peringatan "experimental feature" saat `Ractor.new` pertama kali.

Berikut adalah program kecil yang mengecek `n.prime?` (`n` adalah relatif
sebuah *big integer*) secara paralel dengan dua *ractor*. Anda bisa memastikan
jika program akan memiliki kecepatan 2 kali lebih cepat dibanding
program *sequential* pada komputer paralel.

``` ruby
require 'prime'
# n.prime? dengan mengirim integer r1, r2 jalan secara paralel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.receive
    n.prime?
  end
end
# parameter dikirim
r1.send 2**61 - 1
r2.send 2**61 + 15
# menunggu hasil dari expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Lihat [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md)
untuk lebih detail.

## Fiber Scheduler

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
- `IO#wait`, `IO#read`, `IO#write` dan *method* yang berkaitan (seperti `#wait_readable`, `#gets`, `#puts` dan lainnya).
- `IO#select` *tidak didukung*.

(Jelaskan *gem* Async dengan tautan). Ini adalah contoh program yang akan
melakukan *request* HTTP secara bersamaan:

(Jelaskan ini:)
1. async adalah *gem* dari luar
2. async menggunakan fitur baru ini

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

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

* Banyak perbaikan yang telah diimplementasikan dalam MJIT. Lihat NEWS untuk detail.
* Menempelkan kode yang panjang pada IRB 53 kali lebih cepat dibandingkan yang di-*bundle* dengan Ruby 2.7.0. Sebagai contoh, waktu yang dibutuhkan untuk menempelkan [kode ini](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) berubah dari 11.7 detik menjadi 0.22 detik.

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
* Fitur `$SAFE` telah dihilangkan; sekarang adalah sebuah variabel global.
* Urutan dari *backtrace* telah dibalik pada Ruby 2.5, tetapi itu dibatalkan. Sekarang urutan berperilaku seperti Ruby 2.4; pesan *error* dan nomor baris di mana *exception* terjadi dicetak terlebih dahulu dan pemanggilnya baru dicetak kemudian.
* Beberapa pustaka standar yang diperbarui.
  * RubyGems 3.2.2
  * Bundler 2.2.2
  * IRB 1.2.6
  * Reline 0.1.5
  * Psych 3.2.1
  * JSON 2.4.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Digest 3.0.0
  * Fiddle 1.0.4
  * StringIO 3.0.0
  * StringScanner 3.0.0
* Berikut adalah pustaka yang tidak lagi masuk sebagai *bundled gem*.
  Pasang *gem* berikut jika ingin menggunakan fiturnya.
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

Lihat [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_rc1/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_rc1)
untuk lebih detail.

{% assign release = site.data.releases | where: "version", "3.0.0-rc1" | first %}

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)
sejak Ruby 2.7.0!

Mohon coba Ruby 3.0.0-rc1 dan berikan kami masukan!

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
