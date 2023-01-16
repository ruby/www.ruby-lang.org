---
layout: page
title: "Instalasi Ruby"
lang: id
---

Dengan *package manager* dan alat bantu pihak ketiga, Anda mempunyai banyak
pilihan untuk memasang dan mengatur Ruby.
{: .summary}

Anda mungkin telah memiliki Ruby yang terpasang di komputer Anda. Anda dapat
mengeceknya di dalam sebuah [terminal emulator][terminal] dengan mengetik:

{% highlight sh %}
ruby -v
{% endhighlight %}

Ini seharusnya mengeluarkan informasi versi Ruby yang terpasang.

## Pilih Metode Instalasi Anda

Ada banyak jalan untuk memasang Ruby:

* Pada sebuah sistem operasi *UNIX-like*, menggunakan **package manager**
  sistem adalah jalan paling mudah.
  Namun, versi Ruby yang akan terpasang biasanya bukan yang terbaru.
* **Installers** dapat digunakan untuk memasang versi Ruby tertentu
  atau banyak versi Ruby. Ada juga sebuah *installer* untuk Windows.
* **Managers** membantu Anda untuk berpindah antar versi Ruby yang berbeda
  pada sistem Anda.
* Dan terakhir, Anda juga dapat **membangun Ruby dari kode sumbernya**.

Pada Windows 10, Anda juga dapat menggunakan [Windows Subsystem untuk Linux][wsl]
untuk memasang satu dari distribusi Linux yang didukung dan metode instalasi
apa pun yang tersedia pada sistem tersebut.

Berikut adalah daftar metode instalasi yang tersedia:

* [Package Management Systems](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Windows Package Manager](#winget)
  * [Chocolatey package manager for Windows](#chocolatey)
  * [Other Distributions](#other-systems)
* [Installers](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Managers](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Membangun Ruby dari kode sumbernya](#building-from-source)


## Package Management Systems
{: #package-management-systems}

Jika Anda tidak dapat mengkompilasi Ruby sendiri dan tidak ingin menggunakan
sebuah alat bantu pihak ketiga, Anda dapat menggunakan *package manager*
sistem untuk memasang Ruby.

Beberapa anggota komunitas Ruby sangat menyarankan Anda untuk tidak
menggunakan *package manager* saat memasang Ruby dan sebaiknya menggunakan
alat bantu.

Ini mungkin sebagian besar *package manager* akan memasang versi Ruby
lama ketimbang versi terbaru. Untuk menggunakan versi Ruby terbaru,
cek nama *package* yang cocok dengan nomor versinya. Atau gunakan sebuah
[installer][installers].


### apt (Debian atau Ubuntu)
{: #apt}

Debian GNU/Linux dan Ubuntu menggunakan *apt package manager*.
Anda dapat menggunakannya sebagai berikut:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora, atau RHEL)
{: #yum}

CentOS, Fedora, dan RHEL menggunakan *yum package manager*.
Anda dapat menggunakannya sebagai berikut:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Versi yang terpasang adalah versi Ruby terbaru yang tersedia
saat waktu rilis versi distribusi tertentu.


### snap (Ubuntu atau distribusi Linux lain)
{: #snap}

Snap adalah sebuah *package manager* yang dikembangkan oleh Canonical.
Ini tersedia *out-of-the-box* pada Ubuntu, tetapi snap juga berjalan
pada banyak distribusi Linux lainnya.
Anda dapat menggunakannya sebagai berikut:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Kami memiliki beberapa *channel* tiap rangkaian minor Ruby.
Sebagai contoh, perintah di bawah ini beralih ke Ruby 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo menggunakan *portage package manager*.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Untuk memasang versi tertentu, atur `RUBY_TARGETS` pada `make.conf` Anda.
Lihat [Gentoo Ruby Project website][gentoo-ruby] untuk detail.


### pacman (Arch Linux)
{: #pacman}

Arch Linux menggunakan sebuah *package manager* bernama *pacman*.
Untuk memasang Ruby, lakukan ini:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Ini semestinya memasang versi Ruby terbaru yang *stable*.


### Homebrew (macOS)
{: #homebrew}

Versi Ruby 2.0 and diatasnya sudah dimasukkan secara *default* pada rilis
macOS setidaknya sejak El Capitan (10.11).

[Homebrew][homebrew] adalah sebuah *package manager* yang umumnya digunakan
pada macOS.
Memasang Ruby dengan menggunakan Homebrew sangat mudah:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Ini semestinya memasang versi Ruby terbaru.


### FreeBSD
{: #freebsd}

FreeBSD menawarkan metode *pre-packaged* dan *source-based* untuk memasang Ruby.
*Prebuilt package* dapat dipasang melalui *pkg tool*:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

Metode *source-based* dapat digunakan untuk memasang Ruby menggunakan
[Ports Collection][freebsd-ports-collection]. Hal ini sangat berguna jika Anda
ingin menyesuaikan konfigurasi.

Informasi lebih lanjut terkait Ruby dan ekosistem sekelilingnya pada FreeBSD
dapat ditemukan di [FreeBSD Ruby Project website][freebsd-ruby].


### OpenBSD
{: #openbsd}

OpenBSD beserta distribusinya adJ memiliki *package* untuk tiga versi *major*
dari Ruby. Perintah berikut memperbolehkan Anda untuk melihat versi yang
tersedia dan untuk memasangnya:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Anda dapat memasang lebih dari satu versi *major* satu sama lain karena
setiap versi memiliki *binary* dengan nama yang berbeda
(contoh `ruby27`, `ruby26`).

*Branch* `HEAD` dari OpenBSD *port collection* mungkin memiliki versi Ruby
terbaru setelah beberapa hari dirilis, lihat
[directory lang/ruby in the most recent ports collection][openbsd-current-ruby-ports].


### Ruby pada OpenIndiana
{: #openindiana}

Untuk memasang Ruby pada [OpenIndiana][openindiana], mohon gunakan
Image Package Systems (IPS) *client*.
Ini akan memasang *binary* Ruby terbaru dan RubyGems secara langsung
dari *repository* OpenIndiana. Ini mudah:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

Namun demikian, alat bantu pihak ketiga mungkin adalah jalan terbaik untuk
mendapatkan versi Ruby terbaru.

### Windows Package Manager
{: #winget}

Pada Windows, Anda dapat menggunakan
[Windows Package Manager CLI](https://github.com/microsoft/winget-cli) untuk
memasang Ruby:

{% highlight sh %}
> winget install RubyInstallerTeam.Ruby
{% endhighlight %}

### Chocolatey package manager untuk Windows
{: #chocolatey}

Pada Windows juga, Anda dapat menggunakan
[Chocolatey Package Manager](https://chocolatey.org/install) untuk
memasang Ruby:

{% highlight sh %}
> choco install ruby
{% endhighlight %}

Perintah di atas akan menggunakan `msys2` yang telah ada atau memasang sendiri
untuk Ruby *development environment* yang lengkap.

### Distribusi Lainnya
{: #other-systems}

Pada sistem lain, Anda dapat mencari *package repository* dari
*manager* distribusi Linux Anda untuk Ruby. Kemungkinan lain, Anda dapat
menggunakan sebuah [*third-party installer*][installers].


## Installers
{: #installers}

Jika versi Ruby yang disediakan oleh sistem atau *package manager* Anda telah
usang, versi terbaru dapat dipasang menggunakan sebuah *installer* pihak ketiga.

Beberapa dari mereka juga memperbolehkan Anda untuk memasang banyak versi
dalam sistem yang sama; *manager* yang bersesuaian dapat membantu beralih
antar versi Ruby yang berbeda.

Jika Anda sedang merencanakan untuk mengunakan [RVM](#rvm) sebagai
*version manager*, Anda tidak perlu *installer* terpisah. Ini sudah ada dengan
sendirinya.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] adalah sebuah *plugin* untuk [rbenv](#rbenv) yang
memperbolehkan Anda untuk mengkompilasi dan memasang versi Ruby yang berbeda.
ruby-build juga dapat digunakan sebagai *standalone program* tanpa rbenv.
ruby-build tersedia untuk macOS, Linux, dan sistem operasi *UNIX-like* lainnya.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] memperbolehkan Anda untuk mengkompilasi
dan memasang versi Ruby yang berbeda ke dalam *directory* pilihan Anda.
[chruby](#chruby) adalah sebuah alat bantu pelengkap yang digunakan untuk
beralih ke versi Ruby yang berbeda. ruby-install tersedia untuk macOS, Linux,
dan sistem operasi *UNIX-like* lainnya.


### RubyInstaller
{: #rubyinstaller}

Pada Windows, [RubyInstaller][rubyinstaller] memberikan apa pun yang Anda
butuhkan untuk memasang Ruby *development environment* sepenuhnya.

Unduh, jalankan, dan selesai!


### Ruby Stack
{: #rubystack}

Jika Anda sedang memasang Ruby untuk menggunakan Ruby on Rails,
Anda dapat menggunakan *installer* berikut:

* [Bitnami Ruby Stack][rubystack] menyediakan *development environment*
  lengkap untuk Rails. Bitnami Ruby Stack mendukung macOS, Linux, Windows,
  *virtual machines*, dan *cloud images*.


## Managers
{: #managers}

Banyak Rubyist menggunakan Ruby *manager* untuk mengatur banyak versi Ruby.
*Manager* memperbolehkan Anda untuk beralih antar versi Ruby dengan mudah
bahkan otomatis pada proyek dan kelebihan lainnya yang tidak didukung secara
resmi. Meskipun demikian, Anda dapat menemukan dukungan dalam komunitas
masing-masing.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] adalah sebuah *extendable version manager* yang dapat
mengatur banyak versi *language runtime* berdasarkan sebuah proyek.
Anda akan membutuhkan *plugin* [asdf-ruby][asdf-ruby] (dimana menggunakan
[ruby-build](#ruby-build)) untuk memasang Ruby.


### chruby
{: #chruby}

[chruby][chruby] memperbolehkan Anda untuk beralih antar banyak versi Ruby.
chruby dapat mengatur Ruby yang terpasang dengan [ruby-install](#ruby-install)
atau bahkan dari kode sumber.


### rbenv
{: #rbenv}

[rbenv][rbenv] memperbolehkan Anda untuk mengatur banyak instalasi Ruby.
Selagi rbenv tidak dapat memasang Ruby secara *default*, *plugin*
[ruby-build](#ruby-build) dapat. Kedua alat bantu ini tersedia untuk macOS,
Linux, atau sistem operasi *UNIX-like* lainnya.


### rbenv untuk Windows
{: #rbenv-for-windows}

[rbenv untuk Windows][rbenv-for-windows] memperbolehkan Anda untuk memasang
dan mengatur banyak instalasi Ruby pada Windows. Alat bantu ini ditulis dalam
PowerShell sehingga menyediakan sebuah jalan asli untuk menggunakan Ruby
bagi pengguna Windows. Di samping itu, *command line interface* kompatibel
dengan [rbenv][rbenv] pada sistem *UNIX-like*.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] memperbolehkan Anda untuk memasang dan mengatur banyak instalasi
Ruby pada sistem Anda. RVM juga dapat mengatur *gemsets* yang berbeda.
RVM tersedia untuk macOS, Linux, atau sistem operasi *UNIX-like* lainnya.


### uru
{: #uru}

[Uru][uru] adalah sebuah *command line tool* yang ringan dan mendukung
banyak *platform* yang membantu Anda untuk menggunakan banyak versi Ruby
pada sistem operasi macOS, Linux, atau Windows.


## Membangun dari Kode Sumber
{: #building-from-source}

Tentu saja, Anda dapat memasang Ruby dari kode sumbernya.
[Unduh][download] dan *unpack tarball* tersebut, kemudian lakukan ini:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Secara otomatis, ini akan memasang Ruby pada `/usr/local`.
Untuk mengubahnya, tambahkan opsi `--prefix=DIR` di dalam skrip `./configure`.

Anda dapat menemukan informasi lebih lanjut terkait membangun dari kode
sumber pada [instruksi Building Ruby][building-ruby].

Meskipun begitu, menggunakan alat bantu pihak ketiga atau *package manager*
mungkin adalah ide yang lebih baik, karena Ruby yang terpasang tidak akan
diatur oleh alat bantu apa pun.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv#readme
[rbenv-for-windows]: https://github.com/ccmywish/rbenv-for-windows#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html
[homebrew]: http://brew.sh/
[terminal]: https://en.wikipedia.org/wiki/List_of_terminal_emulators
[download]: /id/downloads/
[installers]: /id/documentation/installation/#installers
[building-ruby]: https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
