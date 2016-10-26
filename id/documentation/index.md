---
layout: page
title: "Dokumentasi"
lang: id
---

Di sini Anda akan menemukan petunjuk manual, tutorial, dan referensi yang
akan berguna ketika Anda merasa seperti meng-*coding* di Ruby.
{: .summary}

### Memasang Ruby

Kecuali jika Anda hanya ingin mencoba Ruby di *browser* (lihat tautan di bawah ini)
Anda perlu memasang Ruby di dalam komputer Anda.
Anda dapat mengecek apakah Ruby telah tersedia dengan membuka *terminal*
dan mengetik

{% highlight sh %}
ruby -v
{% endhighlight %}

Ini seharusnya mengeluarkan informasi versi Ruby yang terpasang.
Jika tidak, lihat [halaman instalasi](installation/) untuk berbagai pilihan
mendapatkan Ruby.

### Langkah Pertama

[Try Ruby!][1]
: Tutorial interaktif yang memungkinkan Anda mencoba Ruby tepat di browser
  Anda. Tutorial 15 menit tersebut ditujukan pada pemula yang ingin
  merasakan bahasanya.

[Ruby Koans][2]
: Ruby Koans memandu Anda sepanjang jalan menuju pencerahan untuk belajar
  Ruby. Tujuannya adalah untuk belajar bahasa Ruby, sintaks, struktur, dan
  beberapa fungsi umum dan library. Kami juga mengajarkan budaya Ruby.

[RubyMonk][3]
: Temukan idiom Ruby, pelajari dan pecahkan masalah Ruby, semua dalam
  browser Anda!

[Hackety Hack][4]
: <q cite="http://www.hackety.com/">Starter kit kecil untuk koder</q>.
  Ini sebuah cara menyenangkan dan mudah untuk belajar tentang
  pemrograman (melalui Ruby) menggunakan Shoes GUI Toolkit.

[Why’s (Poignant) Guide to Ruby][5]
: Ini sebuah buku tak konvensional tapi menarik yang akan mengajarkan Anda Ruby
  melalui cerita, humor cerdas, dan komik. Awalnya dibuat oleh *why the lucky
  stiff*, panduan ini tetap klasik untuk pelajar Ruby.

[Ruby dalam 20 Menit](/id/documentation/quickstart/)
: Ini tutorial yang mencakup dasar-dasar Ruby. Dari awal sampai akhir, tutorial
  tersebut tidak akan membawa Anda lebih dari 20 menit.

[Ruby dari Bahasa Pemrograman Lain](/id/documentation/ruby-from-other-languages/)
: Datang ke Ruby dari bahasa lain? Entah itu C, C + +, Java, Perl,
  PHP, atau Python, artikel ini dapat menolong Anda!

[Learning Ruby][6]
: Sebuah koleksi menyeluruh dari catatan pelajaran Ruby bagi mereka yang baru ke
  bahasa Ruby dan sedang mencari pengenalan konsep dan konstruksi
  Ruby.

[Ruby Essentials][7]
: Ruby Essentials adalah buku online gratis yang dirancang untuk memberikan
  panduan singkat dan mudah diikuti untuk belajar Ruby.

[Learn to Program][8]
: Tutorial kecil yang indah Chris Pine untuk pemula pemrograman. Jika
  Anda tidak tahu bagaimana membuat program, mulai di sini.

[Learn Ruby the Hard Way][38]
: Sebuah kumpulan latihan yang sangat baik dengan penjelasan yang memandu Anda dari
  semua dasar Ruby hingga OOP dan pengembangan *web*.

### Manual

[Programming Ruby][9]
: Ini salah satu karya penting untuk pemrograman Ruby dalam Bahasa Inggris.
  Edisi pertama [Pragmatic Programmers’ book][10] ini tersedia gratis online.

[Ruby User’s Guide][11]
: Diterjemahkan dari versi Jepang asli ditulis oleh Yukihiro
  Matsumoto (pencipta Ruby), versi ini, oleh Goto Kentaro dan
  Mark Slagell adalah gambaran baik dari banyak aspek dari bahasa Ruby.

[The Ruby Programming Wikibook][12]
: Manual online gratis dengan konten untuk pemula dan menengah ditambah
  referensi bahasa Ruby secara menyeluruh.

### Referensi

[Ruby Core Reference][13]
: Diambil langsung dari source code Ruby menggunakan [RDoc][14],
  referensi ini mendokumentasikan seluruh class dan module core
  (seperti String, Array, Symbol, dll.).

[Ruby Standard Library Reference][15]
: Juga diambil langsung dari source code menggunakan RDoc, referensi ini
  mendokumentasikan library standar.

[Ruby C API Reference][extensions]
: Pengenalan Ruby C API.
  Bagus jika Anda ingin membuat *extension* C
  atau membantu pengembangan Ruby.

[RubyDoc.info][16]
: Situs web lengkap untuk dokumentasi referensi tentang gem Ruby dan
  proyek Ruby yang di-host di GitHub.

[Ruby & Rails Searchable API Docs][17]
: Dokumentasi Rails dan Ruby yang dilengkapi dengan pencarian cerdas.

[APIdock][18]
: Dokumentasi Ruby, Rails dan RSpec dengan catatan para pengguna.

[Omniref: Annotated Ruby, Rails, dan Gem Documentation][40]
: Dokumentasi setiap versi Ruby dan setiap versi dari setiap
  RubyGem. Sebuah referensi manual Ruby yang lengkat, dengan pencarian *code*,
  *source annotation*, dan fitur Q&A.

### Editor dan IDE

Untuk meng-*coding* Ruby, Anda dapat menggunakan *default editor* dari sistem operasi
Anda. Supaya lebih efektif koding, alangkah sangat berguna untuk
memilih editor dengan dukungan Ruby dasar (misalnya
*highlight* sintaks, *browsing file*) atau *integrated development environment*
yang memiliki fitur canggih (misalnya *code completion*, *refactoring*,
*testing support*).

Berikut adalah daftar kakas populer yang digunakan oleh para pengguna Ruby.

* Kakas pada Linux dan lintas platform:
  * [Aptana Studio][19]
  * [Emacs][20] with [Ruby mode][21] and [Rsense][22]
  * [Geany][23]
  * [gedit][24]
  * [Vim][25] with [vim-ruby][26] plugin and [Rsense][22]
  * [RubyMine][27]
  * [SciTe][28]
  * [NetBeans][36]
  * [Sublime Text][37]
  * [Atom][atom]

* Pada Windows:
  * [Notepad++][29]
  * [E-TextEditor][30]
  * [Ruby In Steel][31]
  * [Atom][atom]

* Pada Mac OS X:
  * [TextMate][32]
  * [TextWrangler][33]
  * [Dash][39] (documentation browser)
  * [Atom][atom]

### Bacaan selanjutnya

[Ruby-Doc.org][34] me-maintain daftar lengkap dokumentasi bahasa Inggris.
Ada juga banyak [buku tentang Ruby] [35]. Jika Anda memiliki pertanyaan
tentang Ruby, [mailing list](/id/community/mailing-lists/)
adalah tempat yang baik untuk memulai.



[1]: http://tryruby.org/
[2]: http://rubykoans.com/
[3]: http://rubymonk.com/
[4]: http://www.hackety.com/
[5]: http://mislav.uniqpath.com/poignant-guide/
[6]: http://rubylearning.com/
[7]: http://www.techotopia.com/index.php/Ruby_Essentials
[8]: http://pine.fm/LearnToProgram/
[9]: http://www.ruby-doc.org/docs/ProgrammingRuby/
[10]: http://pragmaticprogrammer.com/titles/ruby/index.html
[11]: http://www.rubyist.net/~slagell/ruby/
[12]: http://en.wikibooks.org/wiki/Ruby_programming_language
[13]: http://www.ruby-doc.org/core
[14]: http://docs.seattlerb.org/rdoc/
[15]: http://www.ruby-doc.org/stdlib
[extensions]: https://docs.ruby-lang.org/en/trunk/extension_rdoc.html
[16]: http://www.rubydoc.info/
[17]: http://rubydocs.org/
[18]: http://apidock.com/
[19]: http://www.aptana.com/
[20]: http://www.gnu.org/software/emacs/
[21]: http://www.emacswiki.org/emacs/RubyMode
[22]: http://rsense.github.io/
[23]: http://www.geany.org/
[24]: http://projects.gnome.org/gedit/screenshots.html
[25]: http://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: http://www.jetbrains.com/ruby/
[28]: http://www.scintilla.org/SciTE.html
[29]: http://notepad-plus-plus.org/
[30]: http://www.e-texteditor.com/
[31]: http://www.sapphiresteel.com/
[32]: http://macromates.com/
[33]: http://www.barebones.com/products/textwrangler/
[34]: http://ruby-doc.org
[35]: http://www.ruby-doc.org/bookstore
[36]: https://netbeans.org/
[37]: http://www.sublimetext.com/
[38]: http://ruby.learncodethehardway.org/
[39]: http://kapeli.com/dash
[40]: https://www.omniref.com
[atom]: https://atom.io/
