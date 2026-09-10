---
layout: page
title: "kama jo e Ruby"
lang: tok
---

kepeken ilo lawa namako anu ilo jan ante, sina jo e nasin mute tawa
kama jo e Ruby en lawa e ona.
{: .summary}

sina ken jo e Ruby lon ilo sona sina lon tenpo ni. o lukin lon [ilo
toki][terminal], o sitelen e:

{% highlight sh %}
ruby -v
{% endhighlight %}

ni li wile pana e sona pi nanpa Ruby li lon.

## o wile e nasin kama jo sina

nasin mute li lon tawa kama jo e Ruby:

* lon ilo sona sama UNIX, kepeken **ilo lawa namako** pi ilo sona sina
  li nasin pona lili. taso, nanpa Ruby ona li ken jo ala e nanpa sin
  nanpa wan.
* **ilo kama jo** (Installers) li ken pana e nanpa wan anu nanpa mute
  pi Ruby. ilo kama jo li lon tawa Windows sin.
* **ilo lawa** (Managers) li pona e ken ante lon nanpa Ruby mute lon
  ilo sona sina.
* sina ken pali sin, **pali e Ruby tan sitelen open**.

lon Windows 10, sina ken kepeken [Windows Subsystem for Linux][wsl]
tawa kama jo e ilo sona Linux, la sina ken kepeken nasin kama jo ale
pi ilo sona ni.

nasin kama jo li lon:

* [ilo lawa namako](#package-management-systems)
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
  * [Chocolatey pi Windows](#chocolatey)
  * [ilo sona ante](#other-systems)
* [ilo kama jo](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [ilo lawa](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [mise-en-place](#mise-en-place)
  * [rbenv](#rbenv)
  * [rbenv tawa Windows](#rbenv-for-windows)
  * [RVM](#rvm)
  * [uru](#uru)
* [pali tan sitelen open](#building-from-source)


## ilo lawa namako
{: #package-management-systems}

sina ken ala pali e Ruby sina, sina wile ala e ilo jan ante la, sina
ken kepeken ilo lawa namako pi ilo sona sina.

jan lon kulupu Ruby li pilin e ni: sina wile ala kepeken ilo lawa namako
tawa kama jo e Ruby, sina wile kepeken ilo namako taso.

ilo lawa namako suli li ken kama jo e nanpa Ruby pini, ala nanpa sin.
sina wile e nanpa sin la, o lukin e nimi poki li sama nanpa ona. anu o
kepeken [ilo kama jo][installers] namako.


### apt (Debian anu Ubuntu)
{: #apt}

Debian GNU/Linux en Ubuntu li kepeken ilo lawa apt. sina ken kepeken e
ona sama ni:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora, anu RHEL)
{: #yum}

CentOS, Fedora, en RHEL li kepeken ilo lawa yum. sina ken kepeken e ona
sama ni:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

nanpa li kama jo li nanpa Ruby sin nanpa wan pi tenpo pana pi ilo sona
ni.


### snap (Ubuntu anu ilo sona Linux ante)
{: #snap}

Snap li ilo lawa namako tan Canonical. ona li lon Ubuntu lon open, taso
ona li ken pali lon ilo sona Linux ante mute. sina ken kepeken e ona
sama ni:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

mi jo e nasin mute tawa lipu Ruby lili ale. sama ni, nasin ni li ante e
Ruby tawa 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo li kepeken ilo lawa portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

sina wile e nanpa wan taso la, o ante e `RUBY_TARGETS` lon `make.conf`
sina. o lukin e [lipu Gentoo Ruby Project][gentoo-ruby] tawa sona mute.


### pacman (Arch Linux)
{: #pacman}

Arch Linux li kepeken ilo lawa li nimi pacman. tawa kama jo e Ruby, o
pali e ni:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (macOS)
{: #homebrew}

Ruby nanpa 2.0 en nanpa sewi li lon insa pi macOS tan El Capitan (10.11)
kama.

[Homebrew][homebrew] li ilo lawa namako li jan macOS li kepeken mute.
kama jo e Ruby kepeken Homebrew li pona lili:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

ni li kama jo e nanpa Ruby sin nanpa wan.


### FreeBSD
{: #freebsd}

FreeBSD li pana e nasin tu: poki kama jo pona, anu sitelen open. sina
ken kama jo e poki pona kepeken ilo pkg:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

sina ken pali tan sitelen open kepeken [Ports Collection][freebsd-ports-collection].
ni li pona sina wile ante e nasin pali.

sona mute pi Ruby lon FreeBSD li lon [lipu FreeBSD Ruby Project][freebsd-ruby].


### OpenBSD
{: #openbsd}

OpenBSD, en lipu adJ ona, li jo e poki tawa nanpa suli Ruby mute (tu
wan). nasin ni li pana e lukin nanpa lon lon en kama jo e wan:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

sina ken kama jo e nanpa suli mute lon poki wan, tan ni nimi ilo ona li
ante (sama `ruby27`, `ruby26`).

lipu `HEAD` pi OpenBSD ports collection li ken jo e nanpa Ruby sin lili
tenpo lon tenpo suno lili poka pana ona. o lukin e
[lipu lang/ruby lon ports collection sin][openbsd-current-ruby-ports].


### Ruby lon OpenIndiana
{: #openindiana}

tawa kama jo e Ruby lon [OpenIndiana][openindiana], o kepeken ilo Image
Packaging System (IPS). ni li kama jo e ilo Ruby en RubyGems tan poki
sitelen OpenIndiana. ona li pona lili:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

taso, ilo jan ante li ken pona lili tawa kama jo e nanpa Ruby sin nanpa
wan.

### Windows Package Manager
{: #winget}

lon Windows, sina ken kepeken [Windows Package Manager CLI](https://github.com/microsoft/winget-cli)
tawa kama jo e Ruby:

{% highlight powershell %}
> winget install RubyInstallerTeam.Ruby.{MAJOR}.{MINOR}
# lipu:
> winget install RubyInstallerTeam.Ruby.3.2
# tawa lukin e nanpa ale li lon:
> winget search RubyInstallerTeam.Ruby
# sona: sina kama jo Ruby tawa pali sina la, sina ken wile kama jo RubyWithDevKit
> winget install RubyInstallerTeam.RubyWithDevKit.3.2
{% endhighlight %}

### Chocolatey pi Windows
{: #chocolatey}

lon Windows sin, sina ken kepeken [Chocolatey Package Manager](https://chocolatey.org/install)
tawa kama jo e Ruby:

{% highlight sh %}
> choco install ruby
{% endhighlight %}

ona li kepeken `msys2` sina jo, anu li kama jo e ona sin, tawa ma pali
Ruby li jo e ale.

### ilo sona ante
{: #other-systems}

lon ilo sona ante, o alasa e poki namako pi ilo lawa pi ilo sona Linux
sina tawa Ruby. anu, sina ken kepeken [ilo kama jo namako][installers].


## ilo kama jo
{: #installers}

nanpa Ruby pi ilo sona sina anu ilo lawa namako sina li tenpo pini la,
sina ken kama jo e nanpa sin kepeken ilo kama jo namako.

ilo kama jo ante li ken pana e nanpa mute lon ilo sona sama; ilo lawa
poka ona li pona e ken ante lon insa Ruby mute.

sina wile kepeken [RVM](#rvm) sama ilo lawa nanpa, sina wile ala e ilo
kama jo ante; RVM li jo e ilo pi ona taso.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] li poki namako pi [rbenv](#rbenv) li ken pali
en kama jo e nanpa Ruby ante mute. ruby-build li ken kepeken lon ken
ala rbenv. ona li lon macOS, Linux, en ilo sona sama UNIX ante.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] li ken pali en kama jo e nanpa Ruby ante
mute lon lipu ale sina wile. [chruby](#chruby) li ilo poka li ken ante
lon nanpa Ruby. ona li lon macOS, Linux, en ilo sona sama UNIX ante.


### RubyInstaller
{: #rubyinstaller}

lon Windows, [RubyInstaller][rubyinstaller] li pana e ale sina wile,
tawa ma pali Ruby li jo e ale.

o kama jo taso, o pali e ona, pini!


### Ruby Stack
{: #rubystack}

sina kama jo Ruby tawa kepeken Ruby on Rails la, sina ken kepeken ilo
kama jo ni:

* [Bitnami Ruby Stack][rubystack] li pana e ma pali ale tawa Rails. ona
  li pona lon macOS, Linux, Windows, ilo sona sona (virtual machines),
  en sitelen lipu awawa (cloud images).


## ilo lawa
{: #managers}

jan Ruby mute li kepeken ilo lawa Ruby tawa lawa e nanpa Ruby mute. ona
li pana e ken ante lili, anu ken ante sama-sama, lon nanpa Ruby, kepeken
pali sina. taso kulupu Ruby li lawa ala e ilo ni; sina ken alasa pona
lon kulupu pi ilo ona taso.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] li ilo lawa nanpa li ken lawa e nanpa toki ilo mute
lon pali wan wan. sina wile e poki namako [asdf-ruby][asdf-ruby] (ona li
kepeken [ruby-build](#ruby-build)) tawa kama jo e Ruby.


### chruby
{: #chruby}

[chruby][chruby] li pona e ken ante lon insa Ruby mute. ona li ken lawa
e Ruby li kama jo tan [ruby-install](#ruby-install) anu tan sitelen
open.


### mise-en-place
{: #mise-en-place}

[mise-en-place][mise-en-place] li pona e ken ante lon insa Ruby mute,
sina wile ala e ilo namako. ona li lawa e kama jo lon ken ona taso, li
jo e [gem backend](https://mise.jdx.dev/dev-tools/backends/gem.html)
tawa lawa e nanpa ilo CLI li sitelen lon Ruby. ona li pona lon ilo sona
sama UNIX en lon Windows.


### rbenv
{: #rbenv}

[rbenv][rbenv] li pona e lawa lon insa Ruby mute. ona taso li ken ala
kama jo e Ruby, taso poki namako ona [ruby-build](#ruby-build) li ken.
ilo tu ni li lon macOS, Linux, anu ilo sona sama UNIX ante.


### rbenv tawa Windows
{: #rbenv-for-windows}

[rbenv tawa Windows][rbenv-for-windows] li pona e kama jo en lawa lon
insa Ruby mute lon Windows. ona li sitelen lon PowerShell, tan ni ona
li nasin lon pona tawa jan Windows. poka ona, nasin toki ilo li sama
[rbenv][rbenv] lon ilo sona sama UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] li pona e kama jo en lawa lon insa Ruby mute lon ilo sona
sina. ona li ken lawa e gemsets ante sin. ona li lon macOS, Linux, anu
ilo sona sama UNIX ante.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] li pona e kama jo en lawa lon insa Ruby
mute lon Windows. ona li sama RVM open, li pona lon linja toki open en
lon Powershell, kepeken nasin toki ilo sama RVM open.


### uru
{: #uru}

[Uru][uru] li ilo linja toki lili li pali lon ma ilo mute, li pona e
kepeken Ruby mute lon macOS, Linux, anu Windows.


## pali tan sitelen open
{: #building-from-source}

sina ken pali sin, kama jo e Ruby tan sitelen open. o [kama jo][download]
e poki, o open e ona, la o pali e ni:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

lon open, ni li kama jo e Ruby lon `/usr/local`. sina wile ante e ma
ni, o pana e `--prefix=DIR` tawa `./configure`.

sona mute pi pali tan sitelen open li lon
[lawa pi pali Ruby][building-ruby].

taso, kepeken ilo jan ante anu ilo lawa namako li ken pona lili, tan ni
Ruby li kama jo lon nasin ni li lawa ala kepeken ilo.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[rbenv-for-windows]: https://github.com/RubyMetric/rbenv-for-windows#readme
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
[download]: /tok/downloads/
[installers]: /tok/documentation/installation/#installers
[building-ruby]: https://docs.ruby-lang.org/en/master/contributing/building_ruby_md.html
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[mise-en-place]: https://mise.jdx.dev
[mise-en-place-ruby]: https://mise.jdx.dev/lang/ruby.html
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
