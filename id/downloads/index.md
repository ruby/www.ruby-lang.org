---
layout: page
title: "Download Ruby"
lang: id
---

Di sini Anda bisa mendapatkan distribusi Ruby terbaru. Versi stabil saat
ini adalah {{ site.downloads.stable.version }}. Ruby disediakan secara gratis,
namun pastikan Anda membaca [Lisensi Ruby][1] terlebih dahulu sebelum
menggunakannya.

### Ruby di Windows

Ruby mempunyai beberapa installer untuk Windows, yaitu menggunakan paket
khusus binary dan menggunakan *one-click installer*. Apabila Anda tidak
yakin, *one-click installer* adalah pilihan instalasi yang paling
praktis dan mudah. Di samping itu, *one-click installer* juga berisi
beberapa *library* tambahan. Anda juga bisa membaca [keterangan lebih
lanjut tentang one-click installer][2].

* [Ruby 1.8.6 One-Click Installer][3]
  (md5: 69945dfae60224cc64139c91e000590e) Versi Stabil (*dianjurkan*)
* [Ruby 1.8.7-p72][4] (md5: d4b04ba03a76dc70120fe96ffa22e5df) Versi
  Stabil (*dianjurkan*)
* [Ruby 1.9.1][5] (md5: c12b4df115797a2f9766b56719805a12) Versi Stabil
  (*dianjurkan*)

### Ruby di Linux

Ada beberapa pilihan untuk melakukan instalasi Ruby di Linux yang
bergantung pada distro Linux yang digunakan. Cara yang paling mudah
adalah menggunakan *package manager* masing-masing distro. Apabila
distro Anda tidak menyediakan paket Ruby, Anda juga bisa melakukan
instalasi dari *source code* Ruby di bawah.

### Debian dan Ubuntu

Apabila Anda menggunakan [Debian][6] atau [Ubuntu][7] (juga distribusi
turunan Debian yang lain), Anda bisa menggunakan `apt-get` untuk
melakukan instalasi Ruby dengan mudah:

    % sudo apt-get install ruby1.9.1-full
{: .code .sh-code}

Catatan: Banyak package Ruby (termasuk `irb` dan `rdoc`) terdapat dalam
*package repository* `universe`. Gunakan package manager yang Anda pakai
(Synaptic atau Adept) untuk mengaktifkan *package repository* tersebut.

Perintah di atas akan menginstall Ruby stabil terakhir versi 1.9.1.
Untuk menginstall versi 1.8.x, gunakan perintah:

    % sudo apt-get install ruby-full
{: .code .sh-code}

### Fedora dan CentOS

Apabila Anda menggunakan [Fedora][8] atau [CentOS][9] (juga distribusi
berbasis Fedora yang lain), login sebagai `root` dan gunakan *package
manager* `yum`\:

    # yum install ruby ruby-libs ruby-mode ruby-rdoc ruby-irb ruby-ri ruby-docs
{: .code .sh-code}

### Ruby di Mac OS X

Ada beberapa pilihan untuk melakukan instalasi Ruby di Macintosh OS X.
[Locomotive][10] adalah pilihan yang paling praktis untuk segera memulai
pemrograman menggunakan Ruby dan Rails. Apabila Anda hanya membutuhkan
*installer* berukuran kecil yang berisi Ruby dan beberapa *library* lain
(tanpa Rails), Anda bisa menggunakan [Ruby One-Click Installer for Mac
OS X][11]. Untuk Anda yang lebih berpengalaman, Anda juga bisa
menggunakan [MacPorts][12] atau [Fink][13].

Untuk melakukan instalasi Ruby menggunakan MacPorts…

    % port install ruby
{: .code .sh-code}

Fink mempunyai tampilan grafis (Fink Commander) untuk melakukan
instalasi Ruby.

OS X merupakan sistem operasi berbasis Unix, oleh karena itu Anda juga
bisa melakukan instalasi Ruby dari paket *source code* di bawah.

Untuk instalasi Ruby (dan Rails) di Mac OS X yang lebih detail, Anda
bisa mengikuti artikel [*Building Ruby, Rails, LightTPD, and MySQL on
Tiger*][14] yang ditulis oleh Dan Benjamin.

*Catatan: Ruby 1.8.6 dan Rails akan dimasukkan dalam distribusi Mac OS X
rilis selanjutnya, 10.5 “Leopard”. [Informasi lebih lanjut][15].*

### Ruby di FreeBSD

Gunakan [Ports][16] untuk menginstall Ruby di [FreeBSD][17]\:

    # pkg_add -r ruby ruby18-gems
{: .code .sh-code}

### Ruby di Solaris

Untuk melakukan instalasi Ruby di [Solaris][18], download distribusi
*source code* Ruby terlebih dahulu. Dengan login sebagai root
menggunakan console atau xterm:

    # tar -xzv -f ruby-1.8.6.tar.gz
    # cd ruby-1.8.6
    # ./configure --enable-pthread
    # make
    # make install
{: .code .sh-code}

Apabila Anda menggunakan [Nexenta][19], Anda bisa menggunakan Synaptic
untuk melakukan instalasi paket bernama **ruby**. Anda juga bisa
menggunakan console:

    sudo apt-get install ruby
{: .code .sh-code}

### Source Code Ruby

Melakukan instalasi dari *source code* adalah solusi yang baik apabila
Anda berpengalaman dengan sistem operasi Anda atau membutuhkan
konfigurasi yang spesifik. Apabila tidak ada paket distribusi siap pakai
untuk sistem operasi Anda, alternatif ini juga solusi yang baik.

* [Ruby {{ site.downloads.stable.version }}][20]
  (md5: {{ site.downloads.stable.md5 }})) Versi Stabil (*dianjurkan*)
* [*Snapshot* Versi Stabil][21] Ini adalah versi stabil terakhir dalam
  format tar+gzip. Versi ini cenderung lebih baik daripada rilis versi
  stabil terakhir.
* [*Snapshot* Harian][22] Ini adalah versi paling mutakhir langsung dari
  Subversion *repository* dalam format tar+gzip. Versi ini mungkin
  memiliki bug yang belum diperbaiki.

Untuk informasi lebih lengkap mengenai Subversion *repository* untuk
Ruby, silakan kunjungi halaman [Ruby Core](/id/community/ruby-core/).



[1]: http://www.ruby-lang.org/en/about/license.txt 
[2]: http://rubyinstaller.rubyforge.org/wiki/wiki.pl?RubyInstaller 
[3]: http://rubyforge.org/frs/download.php/47082/ruby186-27_rc2.exe 
[4]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p72-i386-mswin32.zip "Binary saja"
[5]: ftp://ftp.ruby-lang.org//pub/ruby/binaries/mswin32/ruby-1.9.1-p376-i386-mswin32.zip "Binary saja"
[6]: http://www.debian.org 
[7]: http://www.ubuntu.com 
[8]: http://fedoraproject.org/ 
[9]: http://www.centos.org/ 
[10]: http://locomotive.raaum.org/ 
[11]: http://rubyosx.rubyforge.org/ 
[12]: http://www.macports.org/ 
[13]: http://fink.sourceforge.net/ 
[14]: http://hivelogic.com/articles/2005/12/01/ruby_rails_lighttpd_mysql_tiger 
[15]: http://weblog.rubyonrails.org/2006/8/7/ruby-on-rails-will-ship-with-os-x-10-5-leopard 
[16]: http://www.freebsd.org/ports/ 
[17]: http://www.freebsd.org/ 
[18]: http://www.sun.com/software/solaris/ 
[19]: http://www.gnusolaris.org/ 
[20]: {{ site.downloads.stable.url }}
[21]: {{ site.downloads.stable_snapshot.url }}
[22]: {{ site.downloads.nightly_snapshot.url }}
