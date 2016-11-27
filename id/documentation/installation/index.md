---
layout: page
title: "Instalasi Ruby"
lang: id
---

Anda dapat menggunakan beberapa kakas bantu untuk memasang Ruby.
Halaman ini menjelaskan bagaimana menggunakan *package management systems*
dan kakas bantu pihak ketiga untuk mengatur dan memasang Ruby
dan bagaimana membangun Ruby dari kode sumbernya.
{: .summary}


## Pilih Metode Instalasi Anda

Ada banyak jalan untuk memasang Ruby:

* Saat Anda menggunakan sistem operasi UNIX-like, menggunakan **package manager**
  sistem adalah jalan paling mudah untuk memulai.
  Namun, versi Ruby yang akan dipasang biasanya bukan yang terbaru.
* **Installers** dapat digunakan untuk memasang versi Ruby tertentu
  atau banyak versi Ruby. Ada juga sebuah *installer* untuk Windows.
* **Managers** membantu Anda untuk berpindah antar instalasi Ruby yang berbeda
  pada sistem Anda.
* Dan terakhir, Anda juga dapat **membangun Ruby dari kode sumbernya**.

Berikut adalah daftar metode instalasi yang tersedia
sesuai kebutuhan dan *platform* tertentu.

* [Package Management Systems](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [OS X](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Other Distributions](#other-systems)
* [Installers](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller and Ruby Stack](#railsinstaller)
* [Managers](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Membangun Ruby dari kode sumbernya](#building-from-source)


## Package Management Systems
{: #package-management-systems}

Jika Anda tidak dapat mengkompilasi Ruby sendiri, dan tidak ingin menggunakan sebuah
kakas bantu pihak ketiga, Anda dapat menggunakan *package manager* sistem untuk memasang Ruby.

Beberapa anggota komunitas Ruby sangat menyarankan Anda untuk
tidak menggunakan *package manager* untuk memasang Ruby dan sebaiknya menggunakan kakas
bantu. Selagi penuh pro dan kontra di luar bahasan
halaman ini, alasan mendasarnya adalah kebanyakan *package manager* memiliki
versi Ruby lama di dalam *repository* mereka. Jika Anda ingin
menggunakan Ruby terbaru, pastikan Anda menggunakan nama *package* yang benar,
atau menggunakan kakas bantu yang dijelaskan di bawah ini.


### apt (Debian atau Ubuntu)
{: #apt}

Debian GNU/Linux dan Ubuntu menggunakan *apt package manager*.
Anda dapat menggunakannya seperti ini:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

Sesuai penulisan, paket `ruby-full` menyediakan Ruby 1.9.3, yang mana adalah versi
lama yang stabil, pada Debian dan Ubuntu.


### yum (CentOS, Fedora, atau RHEL)
{: #yum}

CentOS, Fedora, dan RHEL menggunakan *yum package manager*.
Anda dapat menggunakannya seperti ini:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Versi yang terpasang adalah versi Ruby terbaru yang tersedia
saat waktu rilis versi distribusi tertentu.


### portage (Gentoo)
{: #portage}

Gentoo menggunakan *portage package manager*.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Secara otomatis, ini akan mencoba untuk memasang Ruby versi 1.9 dan 2.0,
tetapi versi lainnya juga tersedia.
Untuk memasang versi tertentu, atur `RUBY_TARGETS` di dalam `make.conf` Anda.
Lihat [Gentoo Ruby Project website][gentoo-ruby] untuk detail.


### pacman (Arch Linux)
{: #pacman}

Arch Linux menggunakan sebuah *package manager* bernama *pacman*.
Untuk mendapatkan Ruby, lakukan ini:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Ini semestinya memasang versi Ruby terbaru.


### Homebrew (OS X)
{: #homebrew}

Pada OS X Yosemite dan Mavericks, Ruby 2.0 sudah tersedia.
OS X Mountain Lion, Lion, dan Snow Leopard terisi dengan Ruby 1.8.7.

Banyak pengguna OS X menggunakan [Homebrew][homebrew] sebagai *package manager*.
Hal ini sangat mudah untuk mendapatkan versi terbaru menggunakan Homebrew:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Ini semestinya memasang versi Ruby terbaru.


### Ruby di Solaris dan OpenIndiana
{: #solaris}

Ruby 1.8.7 tersedia untuk Solaris 8 hingga Solaris 10 di
[Sunfreeware][sunfreeware] dan Ruby 1.8.7 tersedia di
[Blastwave][blastwave].
Ruby 1.9.2p0 juga tersedia di [Sunfreeware][sunfreeware],
namun sudah tidak diperbarui lagi.

Untuk memasang Ruby pada [OpenIndiana][openindiana], mohon gunakan
[Image Package Systems (IPS)][opensolaris-pkg] *client*.
Ini akan memasang *binary* Ruby terbaru dan RubyGems secara langsung
dari jaringan *repository* OpenSolaris untuk Ruby 1.9. Ini mudah:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Namun demikian, kakas bantu pihak ketiga mungkin adalah jalan terbaik untuk mendapatkan
Ruby versi terbaru.


### Distribusi Lainnya
{: #other-systems}

Pada sistem lain, Anda dapat mencari *package repository* dari
*manager* distribusi Linux Anda untuk Ruby, atau kakas bantu pihak ketiga mungkin
pilihan tepat untuk Anda.


## Installers
{: #installers}

Jika versi Ruby yang disediakan oleh system atau *package manager* Anda telah
usang, versi terbaru dapat dipasang menggunakan sebuah *installer* pihak ketiga.
Beberapa dari mereka juga memperbolehkan Anda untuk memasang banyak versi dalam sistem yang sama;
*manager* yang bersesuaian dapat membantu berpindah antar versi Ruby yang berbeda.
Jika Anda sedang merencanakan untuk mengunakan [RVM](#rvm) sebagai *version manager* Anda tidak perlu
*installer* terpisah, ini sudah ada dengan sendirinya.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] adalah sebuah *plugin* untuk [rbenv](#rbenv) yang
memperbolehkan Anda untuk mengkompilasi dan memasang versi Ruby yang berbeda
ke dalam *directory* pilihan Anda.
ruby-build juga dapat digunakan sebagai *standalone program* tanpa rbenv.
ruby-build tersedia untuk OS X, Linux, dan sistem operasi UNIX-like lainnya.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] memperbolehkan Anda untuk mengkompilasi dan memasang
versi Ruby yang berbeda ke dalam *directory* pilihan Anda.
Ini juga ada saudaranya, [chruby](#chruby), yang menangani perpindahan antar
versi Ruby.
ruby-install tersedia untuk OS X, Linux, dan sistem operasi UNIX-like lainnya.


### RubyInstaller
{: #rubyinstaller}

Jika Anda di Windows, ada sebuah kakas bantu yang membantu Anda memasang Ruby:
[RubyInstaller][rubyinstaller]. Ini memberikan apapun yang Anda butuhkan untuk memasang
Ruby *development environment* sepenuhnya pada Windows.

Unduh, jalankan, dan selesai!


### RailsInstaller dan Ruby Stack
{: #railsinstaller}

Jika Anda sedang memasang Ruby untuk menggunakan Ruby on Rails,
Anda dapat menggunakan *installer* berikut:

* [RailsInstaller][railsinstaller],
  yang mana menggunakan RubyInstaller tetapi memberikan
  kakas tambahan untuk pengembangan dengan Rails.
  RailsInstaller mendukung OS X dan Windows.
* [Bitnami Ruby Stack][rubystack],
  yang mana menyediakan *development environment* lengkap untuk Rails.
  Bitnami Ruby Stack mendukung OS X, Linux, Windows, *virtual machines*, dan *cloud images*.


## Managers
{: #managers}

Banyak Rubyists menggunakan Ruby *manager* untuk mengatur banyak versi Ruby.
Ruby *manager* memberikan banyak keuntungan tetapi tidak didukung secara resmi.
Meskipun demikian, perhatian komunitas ini sangat membantu.


### chruby
{: #chruby}

[chruby][chruby] memperbolehkan Anda untuk berpindah antar banyak versi Ruby.
chruby dapat mengatur Ruby yang terpasang dengan [ruby-install](#ruby-install)
atau bahkan dari kode sumber.


### rbenv
{: #rbenv}

[rbenv][rbenv] memperbolehkan Anda untuk mengatur banyak instalasi Ruby.
rbenv tidak mendukung instalasi Ruby, tetapi ada sebuah *plugin* populer
yang bernama [ruby-build](#ruby-build) untuk memasang Ruby.
Kedua kakas bantu ini tersedia untuk OS X, Linux, atau sistem operasi UNIX-like lainnya.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] memperbolehkan Anda untuk memasang dan mengatur banyak instalasi Ruby
pada sistem Anda. RVM juga dapat mengatur *gemsets* yang berbeda.
RVM tersedi untuk OS X, Linux, dan sistem operasi UNIX-like lainnya.


## uru
{: #uru}

[Uru][uru] adalah sebuah *command line tool* yang ringan dan mendukung banyak *platform* yang membantu Anda
untuk menggunakan banyak versi Ruby pada sistem operasi OS X, Linux, atau Windows.


## Membangun dari Kode Sumber
{: #building-from-source}

Tentu saja, Anda dapat memasang Ruby dari kode sumbernya.
[Download](/id/downloads/) dan *unpack tarball* tersebut, kemudian lakukan ini:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Secara otomatis, ini akan memasang Ruby pada `/usr/local`.
Untuk mengubahnya, tambahkan opsi `--prefix=DIR` di dalam skrip `./configure`.

Meskipun begitu, menggunakan kakas bantu pihak ketiga atau *package manager* mungkin adalah solusi yang terbaik,
karena Ruby yang terpasang tidak akan diatur oleh kakas apapun.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
