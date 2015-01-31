---
layout: page
title: "Unduh Ruby"
lang: id
---

Di sini Anda bisa mendapatkan distribusi Ruby terbaru. Versi stabil saat
ini adalah {{ site.downloads.stable.version }}. Ruby disediakan secara gratis,
namun pastikan Anda membaca [Lisensi Ruby][license] terlebih dahulu sebelum
menggunakannya.
{: .summary}

### Tiga Cara Menginstall Ruby

Anda bisa mendapatkan copy dari Ruby dalam berbagai cara, dan ada tiga
metode untuk alasan yang berbeda:

* **Kompilasi dari Sumber** adalah cara standar memasang perangkat lunak
  telah dipakai selama bertahun-tahun. Ini dikhususkan bagi developer
  yang terbiasa mengkompilasi sendiri.
* Ada beberapa perangkat lunak **pihak ketiga** untuk menginstall Ruby.
  Ini paling sederhana untuk pemula total.
* Terakhir, sebuah **sistem manajemen paket** yang mendukung Ruby. Cara
  ini paling akrab bagi orang yang menggunakan sistem operasi berbasis
  Linux seperti [Linux Mint][2], [Ubuntu][3], [Debian][4], dan
  [Fedora][5].

Jika Anda ingin menjalankan beberapa versi Ruby pada mesin yang sama,
silakan gunakan RVM. Ini cara terbaik melakukannya, kecuali Anda tahu
persis apa yang Anda lakukan.

### Ruby di Windows

Jika Anda menggunakan Windows, ada sebuah proyek besar untuk membantu
Anda menginstal Ruby: [RubyInstaller][6]. Ini memberi Anda semua yang
anda butuhkan untuk menyiapkan lingkungan pengembangan Ruby lengkap pada
Windows.

Untuk menggunakan RubyInstaller, download dari [laman download
RubyInstaller][7]. Kemudian jalankan installer, dan Anda selesai!

Jika Anda menginstal Ruby untuk menggunakan Rails, Anda harus
menggunakan [RailsInstaller][8] yang menggunakan RubyInstaller tapi
memberi Anda tambahan yang membantu untuk pengembangan website berbasis
Ruby on Rails.

### Ruby di Linux

Ada beberapa pilihan untuk melakukan instalasi Ruby di Linux yang
bergantung pada distro Linux yang digunakan. Cara yang paling mudah
adalah menggunakan *package manager* masing-masing distro. Apabila
distro Anda tidak menyediakan paket Ruby, Anda juga bisa melakukan
instalasi dari *source code* Ruby di bawah.

### Debian dan Ubuntu

Apabila Anda menggunakan [Debian][4] atau [Ubuntu][3] (juga distribusi
turunan Debian yang lain), Anda bisa menggunakan `apt-get` untuk
melakukan instalasi Ruby dengan mudah:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1-full
{% endhighlight %}

Catatan: Banyak package Ruby (termasuk `irb` dan `rdoc`) terdapat dalam
*package repository* `universe`. Gunakan package manager yang Anda pakai
(Synaptic atau Adept) untuk mengaktifkan *package repository* tersebut.

Perintah di atas akan menginstall Ruby stabil terakhir versi 1.9.1.
Untuk menginstall versi 1.8.x, gunakan perintah:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

### Fedora dan CentOS

Apabila Anda menggunakan [Fedora][9] atau [CentOS][10] (juga distribusi
berbasis Fedora yang lain), login sebagai `root` dan gunakan *package
manager* `yum`\:

{% highlight sh %}
# yum install ruby ruby-libs ruby-mode ruby-rdoc ruby-irb ruby-ri ruby-docs
{% endhighlight %}

### Ruby di Mac OS X

Ada beberapa pilihan untuk melakukan instalasi Ruby di Macintosh OS X.
[Locomotive][11] adalah pilihan yang paling praktis untuk segera memulai
pemrograman menggunakan Ruby dan Rails. Apabila Anda hanya membutuhkan
*installer* berukuran kecil yang berisi Ruby dan beberapa *library* lain
(tanpa Rails), Anda bisa menggunakan [Ruby One-Click Installer for Mac
OS X][12]. Untuk Anda yang lebih berpengalaman, Anda juga bisa
menggunakan [MacPorts][13] atau [Fink][14].

Untuk melakukan instalasi Ruby menggunakan MacPorts…

{% highlight sh %}
$ port install ruby
{% endhighlight %}

Fink mempunyai tampilan grafis (Fink Commander) untuk melakukan
instalasi Ruby.

OS X merupakan sistem operasi berbasis Unix, oleh karena itu Anda juga
bisa melakukan instalasi Ruby dari paket *source code* di bawah.

Untuk instalasi Ruby (dan Rails) di Mac OS X yang lebih detail, Anda
bisa mengikuti artikel [*Building Ruby, Rails, LightTPD, and MySQL on
Tiger*][15] yang ditulis oleh Dan Benjamin.

*Catatan: Ruby 1.8.6 dan Rails akan dimasukkan dalam distribusi Mac OS X
rilis selanjutnya, 10.5 “Leopard”. [Informasi lebih lanjut][16].*

### Ruby di FreeBSD

Gunakan [Ports][17] untuk menginstall Ruby di [FreeBSD][18]\:

{% highlight sh %}
# pkg_add -r ruby ruby18-gems
{% endhighlight %}

### Ruby di Solaris

Untuk melakukan instalasi Ruby di [Solaris][19], download distribusi
*source code* Ruby terlebih dahulu. Dengan login sebagai root
menggunakan console atau xterm:

{% highlight sh %}
$ tar -xzv -f ruby-1.8.6.tar.gz
$ cd ruby-1.8.6
$ ./configure --enable-pthread
$ make
$ make install
{% endhighlight %}

Apabila Anda menggunakan [Nexenta][20], Anda bisa menggunakan Synaptic
untuk melakukan instalasi paket bernama **ruby**. Anda juga bisa
menggunakan console:

{% highlight sh %}
sudo apt-get install ruby
{% endhighlight %}

### Source Code Ruby

Melakukan instalasi dari *source code* adalah solusi yang baik apabila
Anda berpengalaman dengan sistem operasi Anda atau membutuhkan
konfigurasi yang spesifik. Apabila tidak ada paket distribusi siap pakai
untuk sistem operasi Anda, alternatif ini juga solusi yang baik.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (sha256:&nbsp;{{ site.downloads.stable.sha256.gz }}) Stable (*dianjurkan*)
* [Ruby 1.9.3 preview1][22] (md5:&nbsp;0f0220be4cc7c51a82c1bd8f6a0969f3)
* [Stable Snapshot][stable-snapshot-gz]
* [Nightly Snapshot][nightly-gz] Ini adalah versi paling mutakhir langsung dari
  Subversion *repository* dalam format tar+gzip. Versi ini mungkin
  memiliki bug yang belum diperbaiki.

Untuk informasi lebih lengkap mengenai Subversion *repository* untuk
Ruby, silakan kunjungi halaman [Ruby Core](/id/community/ruby-core/).



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[2]: http://www.linuxmint.com/
[3]: http://www.ubuntu.com
[4]: http://www.debian.org
[5]: http://fedoraproject.org
[6]: http://rubyinstaller.org/
[7]: http://rubyinstaller.org/downloads/
[8]: http://railsinstaller.org/
[9]: http://fedoraproject.org/
[10]: http://www.centos.org/
[11]: http://locomotive.raaum.org/
[12]: http://rubyosx.rubyforge.org/
[13]: http://www.macports.org/
[14]: http://fink.sourceforge.net/
[15]: http://hivelogic.com/articles/ruby_rails_lighttpd_mysql_tiger
[16]: http://weblog.rubyonrails.org/2006/8/7/ruby-on-rails-will-ship-with-os-x-10-5-leopard
[17]: http://www.freebsd.org/ports/
[18]: http://www.freebsd.org/
[19]: http://www.sun.com/software/solaris/
[20]: http://www.gnusolaris.org/
[22]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
