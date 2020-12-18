---
layout: news_post
title: "Ruby 3.0.0 Preview 1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2020-09-25 00:00:00 +0000
lang: id
---

Kami dengan senang hati mengumumkan rilis dari Ruby 3.0.0-preview1.

Rilis ini mengenalkan sejumlah fitur baru dan perbaikan performa.

## RBS

RBS adalah sebuah bahasa yang mendeskripsikan tipe dari program Ruby.
*Type checker* termasuk *type-profiler* dan *tool* lainnya yang mendukung RBS
akan memahami program Ruby jauh lebih baik dengan definisi RBS.

Anda dapat menuliskan definisi *class* dan *module*: *method* didefinisikan di
dalam *class*, *instance variables* dan tipenya, serta hubungan
*inheritance/mix-in*. RBS memiliki tujuan untuk mendukung pola yang biasanya
kita lihat dalam program Ruby dan memperbolehkan penulisan *advanced types*
yang berisi *union type*, *method overloading*, dan *generic*. RBS juga
mendukung *duck typing* dengan _interface types_.

Ruby 3.0 dirilis dengan gem `rbs`, yang memperbolehkan untuk mem-*parse* dan
memproses definisi tipe yang ditulis di dalam RBS.

Berikut ini adalah sebuah contoh kecil dari RBS.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` berarti union types, `User` atau `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Method overloading didukung.
            | (File, from: User | Bot) -> Message
  end
end
```

Lihat [README dari gem rbs](https://github.com/ruby/rbs) untuk lebih detail.

## Ractor (eksperimental)

*Ractor* adalah sebuah *Actor-model* seperti *concurrent abstraction* yang
didesain untuk menyediakan sebuah fitur eksekusi paralel tanpa mengkhawatirkan
*thread-safety*.

Anda dapat membuat beberapa *ractor* dan menjalankannya secara paralel. *Ractor*
memungkinkan untuk membuat program paralel yang *thread-safe* karena *ractor*
tidak dapat membagi objek normal. Komunikasi antar *ractor* didukung oleh
*message passing*.

Untuk membatasi pembagian objek, *Ractor* mengenalkan beberapa batasan pada
sintaks Ruby (tanpa banyak *Ractor*, maka tidak ada perubahan).

Spesifikasi dan implementasi dari *Ractor* masih belum sempurna dan memungkinkan
adanya perubahan ke depan, sehingga fitur ini ditandai dengan eksperimental
dan peringatan fitur eksperimental akan ditampilkan ketika *Ractor* dibuat.

Berikut adalah program kecil yang mengecek `prime?` secara paralel dengan
dua *ractor* dan memiliki kecepatan 2 kali lebih cepat dengan dua atau lebih
*core* dibanding program *sequential*.

``` ruby
require 'prime'

# n.prime? dengan integer r1, r2 jalan secara paralel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
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

## Scheduler (eksperimental)

`Thread#scheduler` diperkenalkan untuk menghalangi operasi *blocking*. Ini
memperbolehkan *light-weight concurrency* tanpa pengubahan kode yang sudah ada.

Saat ini, *class*/*method* yang didukung:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` dan *method* yang berkaitan (seperti `#wait_readable`, `#gets`, `#puts` dan lainnya).
- `IO#select` *tidak didukung*.

Titik masuk dari *concurrency* saat ini adalah `Fiber.schedule{...}`, namun
ini dapat berubah sewaktu-waktu ketika Ruby 3 dirilis.

Sekarang, ada sebuah *test scheduler* yang tersedia di [`Async::Scheduler`](https://github.com/socketry/async/pull/56). Lihat [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md)
untuk lebih detail. [Feature #16786]

**PERINGATAN**: Fitur ini masih eksperimental. Baik nama maupun fitur akan
berubah pada rilis *preview* berikutnya.

## Fitur Baru Lainnya

* *Rightward assignment statement* ditambahkan.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Definisi *endless method* ditambahkan.

  ``` ruby
  def square(x) = x * x
  ```

* *Find pattern* ditambahkan.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
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

* Fitur `$SAFE` telah dihilangkan; sekarang adalah sebuah variabel global.

* Urutan dari *backtrace* telah dibalik pada Ruby 2.5, tetapi itu dibatalkan. Sekarang urutan berperilaku seperti Ruby 2.4; pesan *error* dan nomor baris di mana *exception* terjadi dicetak terlebih dahulu dan pemanggilnya baru dicetak kemudian.

* Beberapa pustaka standar yang diperbarui.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Berikut adalah pustaka yang tidak lagi masuk sebagai *bundled gem*.
  Pasang *gem* berikut jika ingin menggunakan fiturnya.
  * net-telnet
  * xmlrpc

* Memindahkan *default gem* ke *bundled gem*.
  * rexml
  * rss

* Memindahkan *stdlib* ke *default gem*. Berikut adalah *default gem* yang telah dipublikasikan ke rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Lihat [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
atau [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
untuk lebih detail.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

Dengan perubahan tersebut, [{{ release.stats.files_changed }} berkas berubah, {{ release.stats.insertions }} sisipan(+), {{ release.stats.deletions }} terhapus(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
sejak Ruby 2.7.0!

Mohon coba Ruby 3.0.0-preview1 dan berikan kami umpan balik!

## Unduh

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Cuplikan 3.0.0-preview2

Kami merencanakan untuk memasukkan ["type-profiler"](https://github.com/mame/ruby-type-profiler)
yang mana adalah sebuah fitur analisis *static type*. Nantikan!

## Apa itu Ruby

Ruby pertama kali dikembangkan oleh Matz (Yukihiro Matsumoto) pada 1993
dan sekarang dikembangkan sebagai *Open Source*. Ruby berjalan di berbagai
jenis *platform* dan digunakan di seluruh dunia khususnya pengembangan *web*.
