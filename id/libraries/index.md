---
layout: page
title: "Library"
lang: id
---

Bermacam-macam *library* yang menarik dan berguna telah tersedia untuk
Ruby, sebagian besar dirilis dalam format yang mudah dipakai yaitu dalam
file <abbr title="Library Ruby yang dipaket dalam satu file dan dapat
diinstall menggunakan RubyGems.">*gem*</abbr>. Sebagian lainnya dirilis
dalam format `.zip` atau `.tar.gz` berupa *source code*. Di sini akan
dijelaskan bagaimana mencari dan menginstall library Ruby ke dalam
sistem Anda.

###  <a name="finding-libraries" />Mencari Library

[**RubyForge**][1] adalah situs populer untuk library Ruby. Bagian yang
menarik untuk dikunjungi adalah [peta software][2], yang menampilkan
daftar software berdasarkan topik. (Apabila Anda berminat membuat
library sendiri, Anda dipersilahkan [register][3] proyek Anda di
Rubyforge dan mendapatkan akses gratis untuk Subversion, web hosting,
dan mailing list.)

[**Ruby Application Archive**][4] (RAA) adalah direktori yang berisi
berbagai macam software Ruby berdasarkan fungsionalitas.
Kategori-kategori yang cukup populer adalah [Database][5], [Net][6],
[HTML][7], dan [XML][8]. Bahkan ada juga software untuk kategori
[Physics][9].

###  <a name="using-rubygems" />Menggunakan RubyGems

*One-click installer* Ruby untuk Windows telah menyediakan RubyGems,
namun ada beberapa sistem operasi lain yang tidak langsung
menyediakannya. Silakan membaca instruksi [Instalasi
RubyGems](#installing-rubygems) di bawah ini apabila di sistem Anda
belum terinstall RubyGems.

#### Mengecek versi RubyGems

Gunakan perintah `gem -v` untuk mengecek apakah RubyGems terinstall di
sistem Anda, dan versi RubyGems yang terinstall.

    $ gem -v
    0.9.4
{: .code .sh-code}

#### Mencari Gems

Perintah **search** digunakan untuk mencari gem dengan nama tertentu.

Misalnya, untuk mencari gem dengan nama “html” di dalamnya:

    $ gem search html --remote
    
     *** REMOTE GEMS ***
    
     html-sample (1.0, 1.1)
        A sample Ruby gem, just to illustrate how RubyGems works.
{: .code .sh-code}

(*Flag `--remote` menandakan bahwa kita ingin mencari gem dari
repository resmi Rubyforge.*)

#### Instalasi Sebuah Gem

Setelah Anda mengetahui gem yang ingin Anda **install**\:

    $ gem install html-sample
{: .code .sh-code}

Anda juga dapat menginstall versi library tertentu menggunakan flag
`--version`.

    $ gem install html-sample --version 1.0
{: .code .sh-code}

#### Melihat Daftar Semua Gem

Untuk melihat daftar semua gem di Rubyforge:

    $ gem list --remote
{: .code .sh-code}

Untuk melihat daftar gem yang sudah diinstall di sistem Anda, gunakan
perintah tanpa flag `--remote`\:

    $ gem list
{: .code .sh-code}

Informasi lebih lanjut mengenai RubyGems bisa didapatkan di [**manual
resmi RubyGems**][10], termasuk contoh penggunaan gem dalam *script*
Ruby Anda sendiri.

###  <a name="installing-rubygems" />Instalasi RubyGems

Untuk menginstall RubyGems, download RubyGems terbaru dari [halaman
download][11]. Extract file archive tersebut dan jalankan `setup.rb`.
Untuk beberapa sistem operasi Anda harus menjadi `root` untuk melakukan
hal ini.

Sebagai contoh, di Linux:

    $ tar xzvf rubygems-0.9.4.tar.gz
    $ cd rubygems-0.9.4
    $ su -
    # ruby setup.rb
{: .code .sh-code}

Bila Anda membutuhkan panduan lebih lanjut tentang instalasi, Anda dapat
membaca [**bab instalasi**][12] di manual RubyGems.



[1]: http://rubyforge.org/ 
[2]: http://rubyforge.org/softwaremap/trove_list.php 
[3]: http://rubyforge.org/register/ 
[4]: http://raa.ruby-lang.org/ 
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database 
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net 
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML 
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML 
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics 
[10]: http://rubygems.org/read/chapter/1 
[11]: http://rubyforge.org/frs/?group_id=126 
[12]: http://rubygems.org/read/chapter/3 
