---
layout: page
title: "Instalowanie Rubiego"
lang: pl
---

Możesz użyć pewnych narzędzi do instalacji Rubiego.
Ta strona opisuje użyteczne systemy zarządzania pakietami i narzędzia osób
trzecich do zarządzania i instalacji Rubiego.
{: .summary}


## Wybierz metodę instalacji dla swojego systemu

Poniższa lista przedstawia dostępne metody instalacji.
Wybierz najbardziej odpowiednią.

* macOS

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [Budowanie ze źródeł](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Systemy zarządzania pakietami](#package-management-systems)
  * [Budowanie ze źródeł](#building-from-source)

* Windows

  * [RubyInstaller](#rubyinstaller)
  * [RVM 4 Windows](#rvm-windows)


## Narzędzia osób trzecich

Wielu użytkowników Rubiego używa narzędzi osób trzecich by wspomóc
instalację Rubiego. Posiadają one wiele zalet, ale nie są oficjalnie
wspierane. Jednak ich społeczności są bardzo pomocne.


### rbenv
{: #rbenv}

Narzędzie rbenv umożliwia zarządzanie wieloma instalacjami Rubiego.

Nie umożliwia instalowania Rubiego, ale jest popularna wtyczka ruby-build
do instalowania Rubiego.

Oba narzędzia są dostępne dla systemu macOS, Linux, lub innych bazujących na UNIX-ie.

Po najaktualniejszą instrukcję instalacji rbenv zajrzyj na [stronę rbenv][rbenv].

Istnieje też podobne narzędzie zwane RVM, opisane w następnej sekcji.
Sprawdź je też i wybierz odpowiednie dla ciebie.


### RVM ("Ruby Version Manager")
{: #rvm}

Narzędzie RVM umożliwia instalację i zarządzanie wieloma instalacjami Rubiego w
systemie. Jest dostępny wyłącznie na system macOS, Linux, lub dowolny system
bazujący na systemie UNIX.

Po najaktualniejszą instrukcję instalacji RVM zajrzyj na [rvm.io][rvm].


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] umożliwia instalację i zarządzanie wieloma instalacjami
Ruby w systemie Windows. Jest to klon oryginalnego RVM i obsługuje klasyczny wiersz
poleceń, a także Powershell, zapewniając ten sam interfejs wiersza poleceń, co
oryginalny RVM.


### RubyInstaller
{: #rubyinstaller}

Jeśli używasz Windowsa dobrym projektem by pomóc ci zainstalować Rubiego
jest: [RubyInstaller][rubyinstaller]. Dostarcza wszystkiego czego potrzebujesz do
zestawienia pełnego środowiska deweloperskiego na systemie Windows.

By użyć RubyInstallera, ściągnij go ze
[strony pobierania RubyInstallera][rubyinstaller]. Następnie po prostu go użyj!


## Systemy zarządzania pakietami
{: #package-management-systems}

Jeśli nie możesz skompilować swojego Rubiego i nie chcesz używać narzędzi
osób trzecich, możesz skorzystać z menedżera pakietów twojego systemu do
instalacji Rubiego.

Niektórzy członkowie społeczności Rubiego uważają, że nie powinieneś nigdy
używać menedżera pakietów do instalacji Rubiego, i że w zamian powinieneś
użyć RVM. Podczas gdy pełna lista zalet i wad jest poza zakresem tej strony,
to podstawowym powodem jest to, że większość menedżerów pakietów posiada
starsze wersje Rubiego w swoich repozytoriach. Jeśli chciałbyś używać
najnowszego Rubiego, upewnij się, że używasz poprawnej nazwy pakietu lub
skorzystaj z narzędzi opisanych powyżej.

Na tej stronie następujące menedżery pakietów są opisane:

* [apt (Debian lub Ubuntu)](#apt)
* [yum (CentOS, Fedora lub RHEL)](#yum)
* [portage (Gentoo)](#gentoo)
* [pacman (Arch Linux)](#pacman)
* [Homebrew (macOS)](#homebrew)
* [Solaris, OpenIndiana](#solaris)


### apt (Debian lub Ubuntu)
{: #apt}

Debian GNU/Linux lub Ubuntu używa menedżera pakietów apt.
Możesz go użyć tak:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

Na czas pisania pakiet `ruby` dostarcza starszego Rubiego 2.3.1 dla Debiana i
Ubuntu.


### yum (CentOS, Fedora lub RHEL)
{: #yum}

CentOS, Fedora lub RHEL używają menedżera pakietów yum.
Możesz go użyć tak:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Zainstalowana wersja jest typowo najnowszą wersją Rubiego dostępną na dzień
wydania wersji dystrybucji systemu.


### portage (Gentoo)
{: #portage}

Gentoo używa menedżera pakietów portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Domyślnie spróbuje to zainstalować wszystkie dostępne wersje (1.8, 1.9 i 2.0).
By zainstalować konkretną wersję ustaw `RUBY_TARGETS` w twoim `make.conf`.
Zobacz [stronę Gentoo Ruby Project][gentoo-ruby] dla szczegółów.


### pacman (Arch Linux)
{: #pacman}

Arch Linux używa menedżera pakietów zwanego pacman. By zainstalować Rubiego:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (macOS)
{: #homebrew}

Ruby 2.0.0 jest zawarty w OS X Mavericks.
A OS X Mountain Lion, Lion i Snow Leopard jest dostarczany z 1.8.7.

2.0 oraz 1.8 są starszymi wersjami, więc jest sporo możliwości by zainstalować
najnowszą wersję Rubiego.

Większość użytkowników systemu macOS ze społeczności Rubiego używa narzędzi osób
trzecich by zainstalować Rubiego. Ale są też menedżery pakietów wspierające
Rubiego.

Wiele osób w macOS używa [Homebrew][homebrew] jako menedżera pakietów.
Bardzo łatwo jest zainstalować Rubiego:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

A ponadto z racji, że macOS bazuje na Unixie, pobieranie i instalowanie ze
źródeł jest proste i efektywne jak inne rozwiązania. By ułatwić ci instalację
nowej wersji Rubiego w macOS dobrym pomysłem jest użycie narzędzi osób trzecich.


### Ruby On Solaris and OpenIndiana
{: #solaris}

Ruby 1.8.7 jest dostępny dla Solarisa 8 do Solarisa 10 na
[Sunfreeware][sunfreeware] i Ruby 1.8.7 jest dostępny na Blastwave.
Ruby 1.9.2p0 jest także dostępny na [Sunfreeware][sunfreeware], ale przestarzały.
Użycie RVM umożliwi ci skorzystanie z najnowszej wersji Rubiego.

By zainstalować Rubiego w [OpenIndianie][openindiana] użyj klienta [Image Packaging
System, lub IPS][opensolaris-pkg]. Zainstaluje ostatnią wersję binarną Rubiego i
RubyGems bezpośrednio z repozytorium sieciowego OpenSolaris dla Ruby 1.9.
To proste:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Jak poprzednio narzędzia osób trzecich są dobrym sposobem na uzyskanie najnowszej
wersji Rubiego.


### Inne dystrybucje

Na innych systemach możesz przeszukać repozytorium menedżera pakietów lub
narzędzia osób trzecich mogą być dobrym wyborem dla ciebie.


## Budowanie ze źródeł
{: #building-from-source}

Oczywiście możesz zainstalować Rubiego ze źródeł.
Pobierz i rozpakuj tarballa, a potem zrób to:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Domyślnie zainstaluje to Rubiego w `/usr/local`. By to zmienić ustaw opcję
`--prefix=DIR` w skrypcie `./configure`.

Aczkolwiek użycie narzędzi osób trzecich lub menedżerów pakietów jest lepszym
pomysłem, ponieważ zainstalowany Ruby nie będzie zarządzany przez żadne z narzędzi.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
