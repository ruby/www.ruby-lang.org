---
layout: page
title: "Pobierz Rubiego"
lang: pl
---

Tutaj znajdziesz najnowsze dystrybucje języka Ruby. Aktualna stabilna
wersja to {{ site.downloads.stable.version }}. Pamiętaj aby przeczytać
[licencję Rubiego]({{ site.license.url }}).
{: .summary}

### Trzy sposoby instalacji Rubiego

Możesz zdobyć kopię Rubiego na wiele sposobów, różne osoby preferują
z różnych powodów jedną z trzech metod. Każda z nich będzie opisana
w odrębnej sekcji, a tutaj ich krótki przegląd:

* **Kompilacja ze źródeł** jest standardem w jakim oprogramowanie jest
  dostarczane od wielu, wielu lat. To będzie najbardziej znane dla
  większości projektantów oprogramowania.
* Istnieje parę **narzędzi osób trzecich** by zainstalować Rubiego. Są
  często prostsze dla początkujących lub dla najbardziej zaawansowanych
  użytkowników.
* Wreszcie, kilka **systemów zarządzania pakietami** wpiera Rubiego.
  To będzie najbardziej znane dla ludzi, którzy używają jednego systemu
  do wszystkiego i woli być przywiązanych do tych indywidualnych standardów.

Na koniec, jeśli chcesz uruchamiać wiele wersji Rubiego na tej samej
maszynie, sprawdź sekcję **narzędzia osób trzecich** i używaj RVM.
Dotychczas jest to najlepszy sposób by to uzyskać pod warunkiem, że wiesz
co robisz.

### Kompilacja Rubiego — Kod źródłowy

Instalowanie z kodów źródłowych jest doskonałym rozwiązaniem gdy dobrze
znasz swój system i gdy potrzebujesz specyficznych ustawień dla swojego
środowiska. Jest to także dobra opcja gdy nie ma dla twojej platformy
innych przygotowanych pakietów.

Jeśli masz problem z kompilacją Rubiego rozważ skorzystanie z narzędzi osób
trzecich z następnej sekcji. Mogą ci pomóc.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Stabilny
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Poprzedni
* [Stabilny Snapshot][3] To jest tarball ostatniego snapshotu stabilnego
  brancha (ruby\_2\_0\_0).
* [Nocny Snapshot][4] To jest tarball tego co jest w SVN, przygotowany
  w nocy. Może zawierać błędy lub inne problemy, używaj na własne ryzyko!

Aby uzyskać informacje na temat repozytorium Rubiego w Subversion i Git,
zobacz stronę [Ruby Core](/en/community/ruby-core/).

### Strony lustrzane

Źródła Rubiego są dostępne na światowych stronach lustrzanych. Spróbuj
użyć jakiegoś blisko ciebie.

#### Strony lustrzane poprzez HTTP

* [CDN][64] (fastly.com)
* [Japan 1][63] (Master) - HTTPS
* [Japan 2][50] and [mirror][32] (RingServer)
* [Britain][49] (The Mirror Service)
* [Germany][51] (AmbiWeb GmbH)
* [Belgium][52] (Easynet)
* [Denmark][53] (sunsite.dk)
* [Holland][54] (XS4ALL) - only release packages
* [USA 1][55] (ibiblio.org)
* [USA 2][56] (lcs.mit.edu)
* [USA 3][57] (binarycode.org)
* [USA 4][58] (online-mirror.org)
* [USA 5][59] (trexle.com)
* [Austria][60] (tuwien.ac.at)
* [Taiwan 1][61] (cdpa.nsysu.edu.tw)
* [Taiwan 2][62] (ftp.cs.pu.edu.tw)

#### Strony lustrzane poprzez FTP

* [Japan 1][35] (Master: ruby-lang.org)
* [Japan 2][31] and [mirror][32] (RingServer)
* [Japan 3][33] (IIJ)
* [South Korea][36] (Korea FreeBSD Users Group)
* [Germany][37] (FU Berlin)
* [Britain][38] (The Mirror Service)
* [Belgium][39] (Easynet)
* [Russia][40] (ChgNet)
* [Greece][41] (ntua.gr)
* [Denmark][42] (sunsite.dk)
* [USA 1][43] (ibiblio.org)
* [USA 2][44] (lcs.mit.edu)
* [Austria][45] (tuwien.ac.at)
* [Taiwan 1][46] (cdpa.nsysu.edu.tw)
* [Taiwan 2][47] (ftp.cs.pu.edu.tw)
* [Canada][48] (mirror.cs.mun.ca)

#### Strony lustrzane poprzez rsync

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Britain)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Denmark)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canada)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

### Narzędzia osób trzecich

Wielu użytkowników Rubiego używa narzędzi osób trzecich by wspomóc
instalację Rubiego. Posiadają one wiele zalet, ale nie są oficjalnie
wspierane. Jednak ich społeczności są bardzo pomocne.

#### RVM

Najbardziej popularnym narzędziem do instalacji Rubiego jest **RVM**
(“Ruby Version Manager”). Nie tylko sprawia, że instalacja jest wyjątkowo
łatwa, ale dodatkowo umożliwia instalowanie i zarządzanie wieloma kopiami
Rubiego w twoim systemie, jak również wieloma alternatywnymi implementacjami
Rubiego.

RVM jest dostępny wyłącznie na Mac OS X, Linuxa, lub dowolny system bazujący
na systemie UNIX. Użytkownicy Windowsa powinni sprawdzić podobny projekt
[pik][5] lub rozważyć użycie RubyInstaller, opisanego w następnej sekcji.

Na dzień pisania tego artykułu powinieneś być w stanie tak zainstalować RVM:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Dla najnowszych instrukcji instalacji RVM sprawdź [strona instalacji
RVM][7]. Powyższa komenda zainstaluje RVM i najnowszą wersję Rubiego.
RVM jest w stanie zainstalować większość implementacji Rubiego
wyszczególnionych poniżej. By zobaczyć wszystkie wspierane wersje wpisz
`rvm list known`.

#### RubyInstaller

Jeśli używasz Windowsa dobrym projektem by pomóc ci zainstalować Rubiego
jest: [RubyInstaller][8]. Dostarcza wszystkiego czego potrzebujesz do
zestawienia pełnego środowiska deweloperskiego na systemie Windows.

By użyć RubyInstallera, ściągnij go ze [strony pobierania
RubyInstallera][9]. Następnie po prostu go użyj!

Jeśli instalujesz Rubiego w celu używania Railsów, powinieneś użyć
[RailsInstaller][10], który używa RubyInstallera dając dodatkowe narzędzia
pomagające z Railsami.

### Systemy zarządzania pakietami

Jeśli nie możesz skompilować swojego Rubiego i nie chcesz używać narzędzi
osób trzecich, możesz skorzystać z menedżera pakietów twojego systemu do
instalacji Rubiego.

Niektórzy członkowie społeczności Rubiego uważają, że nie powinieneś nigdy
używać menedżera pakietów do instalacji Rubiego, i że w zamian powinieneś
użyć RVM. Podczas gdy pełna lista zalet i wad jest poza zakresem tej strony,
to podstawowym powodem jest to, że większość menedżerów pakietów posiada
starsze wersje Rubiego w swoich repozytoriach. Jeśli chciałbyś używać
najnowszego Rubiego, upewnij się, że używasz poprzwnej nazwy pakietu lub
skorzystaj z RVM.

#### Ruby w Linuxie

Debian GNU/Linux lub Ubuntu używa menedżera pakietów apt.
Możesz go użyć tak:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Tak, to zainstaluje Rubiego 1.9.2 lub nowszego. Ma ‘wersję zgodności
biblioteki’ 1.9.1, stąd nazwa.

Jeśli instalujesz pakiet ‘ruby’, możesz dostać starszego Rubiego 1.8,
w zależności od dystrybucji.

Arch Linux używa menedżera pakietów o nazwie pacman. By dostać Rubiego
zrób tak:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Na innych systemach możesz przeszukać repozytorium pakietów swojego menedżera
lub dobrym wyborem może być RVM.

#### Ruby na Mac OS X

Ruby 1.8.7 jest w pełni wspierany w Mac OS X Lion jak również wiele
popularnych gemów Rubiego (pakietów). Szczegóły na [Ruby wiki at Mac OS
Forge][11].

W Mac OS X Tiger jest dostępna wersja 1.8.2 Rubiego, a Leopard jest
dostarczany z 1.8.6, ale, dla tych którzy nie aktualizowali do Leoparda jest
dostępnych wiele opcji by zainstalować najnowszego Rubiego.

Wiele osób w Mac OS X używa [Homebrew][12] jako menedżera pakietów.
Bardzo łatwo jest zainstalować Rubiego:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Ponadto z racji, że OS X bazuje na Unixie, pobieranie i instalowanie ze
źródeł jest proste i efektywne jak inne rozwiązania. By ułatwić ci instalację
nowej wersji Rubiego w OS X dobrym pomysłem jest użycie RVM. Wpisz
`rvm notes` po szczegółowe informacje dla twojego systemu.

Bardziej szczegółowo o instalacji Rubiego (i Railsów) w dobrych artykułach
Dana Benjamina [dla Tigera][13], [dla Leoparda][14], i [dla Snow
Leoparda][15]. Dla Liona, [ten artykuł][16] może ci pomóc.

#### Ruby w Solarisie i OpenIndianie

Ruby 1.8.7 jest dostępny dla Solarisa 8 do Solarisa 10 na
[Sunfreeware][17] i Ruby 1.8.7 jest dostępny na [Blastwave][18].
Ruby 1.9.2p0 jest także dostępny na [Sunfreeware][17], ale przestarzały.
Użycie RVM umożliwi ci skorzystanie z najnowszej wersji Rubiego.

By zainstalować Rubiego w [OpenIndianie][19] użyj klienta [Image Packaging
System, lub IPS][20]. Zainstaluje ostatnią wersję binarną Rubiego i RubyGems
bezpośrednio z repozytorium sieciowego OpenSolaris dla Ruby 1.9. To proste:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Jak poprzednio RVM jest dobrym sposobem na uzyskanie najnowszej wersji
Rubiego.

### Inne implementacje Rubiego

Ruby jako język ma kilka różnych implementacji. Ten poradnik omawia
bazową implementację, **MRI** (“Matz's Ruby
Interpreter”) lub **CRuby**, ale są inne.
Często są użyteczne w niektórych sytuacjach, integrują się z innymi językami
lub środowiskami lub mają specjalne cechy, których MRI nie ma.

Tu jest lista:

* [JRuby][21] jest Rubim na JVM (Java Virtual Machine), wykorzystując
  optymalizację kompilatorów JIT JVM, odśmiecanie pamięci, współbieżne wątki,
  narzędzia i kolekcję bibliotek.
* [Rubinius][22] jest ‘Rubim napisanym w Rubim’. Zbudowanym na szczycie LLVM,
  Rubinius ukazuje sprytną maszynę wirtualną na bazie której budowane są inne
  języki.
* [MacRuby][23] jest Rubim ściśle zintegrowanym z bibliotekami Cocoa Apple
  dla Mac OS X, umożliwiając łatwe pisanie desktopowych aplikacji.
* [mruby][mruby] jest lekką implementacją języka Ruby, która może być połączona
  i osadzona w aplikacji.
+  Its development is lead by Ruby’s creator Yukihiro “Matz” Matsumoto.
* [IronRuby][26] jest implementacją “ściśle zintegrowaną z frameworkiem .NET”.
* [MagLev][27] jest “szybką, stabilną, implementacją Rubiego ze zintegrowaną
  trwałością obiektów i rozproszonym wpsółdzielonym cachem”.
* [Cardinal][24] jest “kompilatorem Rubiego dla [Parrot][25] Virtual Machine”
  (Perl 6).

Niektóre z tych implementacji, włączając w to MRI, podążają za wytycznymi
[RubySpec][28], “pełna wykonywalna specyfikacja dla języka programowania Ruby”.

[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
[31]: ftp://core.ring.gr.jp/pub/lang/ruby/
[32]: http://www.t.ring.gr.jp/
[33]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[35]: ftp://ftp.ruby-lang.org/pub/ruby/
[36]: ftp://ftp.kr.freebsd.org/pub/ruby/
[37]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[38]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[39]: ftp://ftp.easynet.be/ruby/ruby/
[40]: ftp://ftp.chg.ru/pub/lang/ruby/
[41]: ftp://ftp.ntua.gr/pub/lang/ruby/
[42]: ftp://sunsite.dk/mirrors/ruby/
[43]: ftp://www.ibiblio.org/pub/languages/ruby/
[44]: ftp://xyz.lcs.mit.edu/pub/ruby/
[45]: ftp://gd.tuwien.ac.at/languages/ruby/
[46]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[47]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[48]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
[49]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[50]: http://www.dnsbalance.ring.gr.jp/archives/lang/ruby/
[51]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[52]: http://ruby.mirror.easynet.be/
[53]: http://mirrors.sunsite.dk/ruby/
[54]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[55]: http://www.ibiblio.org/pub/languages/ruby/
[56]: http://xyz.lcs.mit.edu/ruby/
[57]: http://www.binarycode.org/ruby/
[58]: http://www.online-mirror.org/ruby/
[59]: http://ruby.trexle.com/
[60]: http://gd.tuwien.ac.at/languages/ruby/
[61]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[62]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[63]: https://ftp.ruby-lang.org/pub/ruby/
[64]: http://cache.ruby-lang.org/pub/ruby/
