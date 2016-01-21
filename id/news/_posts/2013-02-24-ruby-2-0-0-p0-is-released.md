---
layout: news_post
title: "Ruby 2.0.0-p0 Diluncurkan"
author: "Yusuke Endoh"
translator: "catcyborg"
date: 2013-02-24 09:06:22 +0000
lang: id
---

Kami sangat senang untuk mengumumkan rilis Ruby 2.0.0-p0.

Ruby 2.0.0 merupakan rilis stabil pertama dari seri Ruby 2.0, dengan banyak
fitur baru dan perbaikan untuk menanggapi semakin beragam
dan memperluas tuntutan untuk Ruby.

Nikmati pemrograman dengan Ruby 2.0.0!

## Unduhan

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## Apakah Ruby 2.0.0 Itu?

### Fitur-Fitur baru


Beberapa highlight:

* Fitur bahasa core
  * Argumen berkata kunci (keyword arguments), yang memberikan fleksibilitas untuk mendesain API
  * Module#prepend, cara baru untuk meng-extend sebuah class
  * Literal %i, yang membuat jajaran simbol dengan mudah
  * \_\_dir\_\_, yang mengembalikan nama dir file saat ini sedang dieksekusi
  * UTF-8 sebagai encoding default, yang membuat komentar ajaib dapat dihapus

* Library
  * Enumerable#lazy dan Enumerator::Lazy, untuk (mungkin tak terbatas) stream yang lazy (malas)
    stream
  * Enumerator#size dan Range#size, untuk mengevaluasi ukuran secara lazy
  * \#to\_h, sebuah konvensi baru untuk mengkonversi ke Hash
  * Onigmo, sebuah engine regexp baru (fork dari Oniguruma)
  * API untuk mengatasi exception secara asynchronous

* Support untuk debug
  * Support untuk DTrace, yang memungkinkan diagnosa run-time di production
  * TracePoint, yang merupakan API untuk tracing yang sudah ditingkatkan

* Peningkatan performance
  * Optimisasi GC dengan cara penandaan bitmap
  * Optimisasi Kernel#require yang membuat startup Rails sangat cepat
  * Optimisasi VM seperti method dispatch
  * Optimisasi operasi pada Float

Sebagai tambahan, walaupun sebagai fitur experimen, 2.0.0 memuat Refinement, yang menambahkan
konsep baru untuk modularitas Ruby.

Harap lihat juga NEWS untuk lebih banyak fitur, peningkatan dan rinciannya.

### Kompatibilitas

Kami juga telah menjaga desain 2.0.0 untuk membuatnya cocok dengan 1.9. Bermigrasi dari 1.9 ke 2.0 akan lebih mudah daripada 1.8 ke 1.9. (Ketidakcocokan yang perlu diperhatikan akan dijelaskan nanti.)

Bahkan, berkat kerja berdedikasi pihak ketiga, beberapa populer
aplikasi seperti Rails dan tDiary telah dilaporkan untuk bekerja pada
versi rilis kandidat dari 2.0.0.

### Dokumentasi

Kami juga telah membuat perbaikan dokumentasi yang banyak diminta para pengguna Ruby.
Kami telah menambahkan sejumlah besar rdoc untuk module dan method.
2.0.0 akan menjadi sekitar 75% terdokumentasikan, sementara 1.9.3 sekitar 60%.
Juga, kami telah menambahkan deskripsi sintaks Ruby. Anda dapat melihat:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### Stabilitas

Perhatikan bahwa tidak seperti 1.9.0, 2.0.0 ADALAH rilis stabil.
Semua penulis library sangat dianjurkan untuk mendukung 2.0.0. Seperti
disebutkan di atas, maka akan relatif mudah untuk bermigrasi dari 1.9
2.0.

Ruby 2.0.0 siap untuk penggunaan praktis, dan akan benar-benar meningkatkan kehidupan Ruby Anda.

## Catatan

### Artikel Pengantar

Berikut adalah beberapa artikel pengantar fitur 2.0.0 oleh pihak ketiga:

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (komprehensif, disarankan)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (komprehensif, disarankan)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (singkat, dalam Bahasa Jepang)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (hanya Enumerator::Lazy, dalam Bahasa Jepang)

Artikel-artikel berikut ini juga membantu, tetapi agak tertinggal berkaitan dengan
refinement:

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

Juga, edisi terbaru \"Rubyist Magazine\" mencakup beberapa artikel
yang ditulis oleh beberapa penulis untuk memperkenalkan beberapa
fitur baru 2.0.0.

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

Meskipun artikel-artikel di atas akan ditulis dalam Bahasa Jepang,
terjemahan bahasa Inggris direncanakan untuk masa depan.

### Inkompatibilitas

Ada lima ketidakcocokan yang perlu diperhatikan:

* Encoding default untuk skrip Ruby sekarang UTF-8 \[#6679\]. Beberapa orang
  melaporkan bahwa hal itu mempengaruhi program yang ada, seperti beberapa
  program benchmark menjadi sangat lambat \[ruby-dev:46547\].
* Iconv telah dihapus, yang sudah tidak didukung lagi sejak M17N sudah
  diperkenalkan di Ruby 1.9. Gunakan String#encode, dll. sebagai penggantinya.
* Ada kerusakan ABI \[ruby-core:48984\]. Kami berpikir bahwa pengguna normal
  dapat/sebaiknya menginstal ulang library extension. Anda harus
  menyadari: JANGAN MENGKOPI FILE .so ATAU .bundle dari 1.9.
* \#lines, #chars, #codepoints, #bytes sekarang mengembailkan sebuat Array,
  bukan Enumerator \[#6670\]. Perubahan ini memungkinkan Anda untuk
  menghindari idiom umum \"lines.to\_a\". Harap gunakan #each\_line, dll.
  untuk mendapatkan sebuah Enumerator.
* Object#inspect selalu mengembalikan sebuah string seperti
  #&lt;ClassName:0x...&gt;, bukan men-delegate ke #to\_s. \[#2152\]

Ada beberapa inkompatibilitas yang relatif kecil
\[ruby-core:49119\].

### Status Refinements

Kami telah menambahkan fitur bernama Refinement, yang menambah konsep baru pada
modularitas Ruby. Namun, perlu diketahui bahwa Refinement masih
sebuah fitur eksperimental: kami dapat mengubah spesifikasi di masa depan.
Meskipun begitu, kami ingin Anda untuk mencobanya dan memberi kami pemikiran Anda.
Tanggapan Anda akan membantu untuk menempa fitur menarik ini.

## Ucapan Terima Kasih

Sangat banyak orang yang berkontribusi pada 2.0.0. Bahkan ucapan
terima kasih untuk beberapa bagian kontribusi menjadi terlalu besar untuk
dimuat di sini. Maaf, tapi izinkan saya untuk menambahkan link
ke halaman terima kasih khusus.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

Terima kasih semuanya!



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
