---
layout: page
title: "Ruby'yi Kurma"
lang: tr
---

Paket yöneticileri ya da üçüncü taraf araçlar ile,
Ruby'yi kurmak ve yönetmek için çok sayıda seçeneğiniz vardır.
{: .summary}

Ruby, bilgisayarınızda zaten kurulu olabilir. Bir
[uçbirim öykünücüsü][terminal] içinde şunu yazarak denetleyebilirsiniz:

{% highlight sh %}
ruby -v
{% endhighlight %}

Bu, kurulu Ruby sürümü hakkında bazı bilgileri çıktı vermelidir.

## Kurulum Yönteminizi Seçin

Ruby'yi kurmanın birçok yolu vardır:

* UNIX benzeri bir işletim sistemi üzerinde sisteminizin
  **paket yöneticisi**ni kullanmak en kolayıdır. Fakat paketlenmiş
  Ruby sürümü en yenisi olmayabilir.
* **Kurucular**, belirli bir ya da birden çok Ruby sürümü kurmak için
  kullanılabilir. Ayrıca Windows için de bir kurucu vardır.
* **Yöneticiler**, sisteminiz üzerinde birden çok Ruby sürümü arasında
  geçiş yapmanıza yardım eder.
* Son olarak, ayrıca **Ruby'yi kaynaktan inşa edebilirsiniz**.

Windows 10'da ayrıca desteklenen Linux dağıtımlarından birini kurmak ve bu
sistemde var olan kurulum yöntemlerinden herhangi birini kullanmak için
[Linux için Windows Altsistemi][wsl]'ni kullanabilirsiniz.

İşte kullanılabilir kurulum yöntemleri:

* [Paket Yönetim Sistemleri](#package-management-systems)
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
  * [Diğer Dağıtımlar](#other-systems)
* [Kurucular](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Yöneticiler](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Kaynaktan inşa etme](#building-from-source)


## Paket Yönetim Sistemleri
{: #package-management-systems}

Eğer kendi Ruby'nizi derleyemiyor, ve üçüncü taraf bir araç kullanmak
istemiyorsanız, Ruby'yi kurmak için sisteminizin paket yöneticisini
kullanabilirsiniz.

Ruby topluluğunun bazı üyeleri, Ruby'yi kurmak için paket yöneticilerinden
sakınılması ve bunun yerine adanmış araçların kullanılması gerektiğini
düşünürler.

Başlıca paket yöneticilerinin en son sürüm yerine daha eski Ruby sürümlerini
kurması mümkündür. Son Ruby sürümünü kullanmak için paket adının bu sürümün
numarası ile eşleştiğini kontrol edin. Ya da adanmış bir [kurucu][installers]
kullanın.


### apt  (Debian ya da Ubuntu)
{: #apt}

Debian GNU/Linux ve Ubuntu, apt paket yöneticisini kullanır. Bunu şu şekilde
kullanabilirsiniz:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora, ya da RHEL)
{: #yum}

CentOS, Fedora, ve RHEL, yum paket yöneticisini kullanır.
Bunu şu şekilde kullanabilirsiniz:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Kurulan sürüm genelde belirli dağıtım sürümünün yayın zamanında kullanılabilir
olan Ruby'nin en son sürümüdür.


### snap (Ubuntu ya da başka Linux dağıtımı)
{: #snap}

Snap, Canonical tarafından geliştirilen bir paket yöneticisidir. Bu, Ubuntu'da
halihazırda kullanılabilirdir, fakat snap ayrıca birçok Linux dağıtımında
çalışır. Snap'i şu şekilde kullanabilirsiniz:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Ruby ikincil serileri için birçok kanal vardır. Örneğin, aşağıdaki komut Ruby
2.3'e geçiş yapar:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo, portage paket yöneticisini kullanır.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Belirli bir sürümü kurmak için `make.conf`'unuzdaki `RUBY_TARGETS`'ı ayarlayın.
Ayrıntılar için [Gentoo Ruby Projesi websitesi][gentoo-ruby]ne bakın.


### pacman (Arch Linux)
{: #pacman}

Arch Linux, pacman isimli bir paket yöneticisi kullanır. Ruby'yi almak için
sadece şunu yapın:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Bu, son kararlı Ruby sürümünü kurmalıdır.


### Homebrew (macOS)
{: #homebrew}

Ruby'nin 2.0 ve üstü sürümleri en azından El Capitan (10.11)'dan beri
macOS sürümlerinde varsayılan olarak içerilir.

[Homebrew][homebrew], macOS'ta sıklıkla kullanılan bir paket yöneticisidir.
Ruby'yi Homebrew kullanarak kurmak kolaydır:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Bu, son Ruby sürümünü kurmalıdır.


### FreeBSD
{: #freebsd}

FreeBSD Ruby'yi kurmak için hem önceden paketlenmiş hem de kaynak tabanlı
yöntemler sunar. Önceden inşa edilmiş paketler pkg aracı yoluyla kurulabilir:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

Kaynak tabanlı bir metod, [Ports Collection][freebsd-ports-collection]
kullanılarak Ruby'yi kurmak için kullanılabilir. Eğer inşa yapılandırma
seçeneklerini özelleştirmek istiyorsanız, bu, kullanışlıdır.

FreeBSD'de Ruby ve onun çevreleyen ekosistemi hakkında daha fazla bilgi
[FreeBSD Ruby Projesi websitesi][freebsd-ruby]nde bulunabilir.

### OpenBSD
{: #openbsd}

OpenBSD ve OpenBSD'nin dağıtımı olan adJ, Ruby'nin üç ana sürümü için paketlere sahiptir.
Aşağıdaki komut mevcut sürümleri görmenizi ve bunlardan birini kurmanızı sağlar:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Aynı anda birden fazla ana sürüm kurabilirsiniz, çünkü bu sürümlerin ikilileri farklı isimlere sahiptir (ruby27, ruby26, vb. gibi).

OpenBSD'nin ports koleksiyonunun `HEAD` dalı, Ruby'nin en son sürümüne, sürüm yayınlandıktan birkaç gün sonra sahip olacaktır.
[En son ports koleksiyonundaki lang/ruby dizinine][openbsd-current-ruby-ports] bakın.

### OpenIndiana üzerinde Ruby
{: #openindiana}

Ruby'yi [OpenIndiana][openindiana] üzerinde kurmak için lütfen Image Packaging
System (IPS) istemcisini kullanın.
Bu, Ruby ikililerini ve RubyGems'i doğrudan OpenIndiana depolarından
kuracaktır. Bu kolaydır:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

Fakat üçüncü taraf araçlar, Ruby'nin en son sürümünü elde etmek için iyi bir
yol olabilir.

### Windows Paket Yöneticisi
{: #winget}

Windows'ta Ruby'yi kurmak için [Windows Paket Yöneticisi CLI](https://github.com/microsoft/winget-cli)'ını kullanabilirsiniz:

{% highlight sh %}
> winget install RubyInstallerTeam.Ruby
{% endhighlight %}

### Diğer Dağıtımlar
{: #other-systems}

Diğer sistemlerde, Linux dağıtımınızın yöneticisinin paket depolarında Ruby'yi
arayabilirsiniz. Alternatif olarak [üçüncü taraf bir kurucu][installers] da
kullanabilirsiniz.


## Kurucular
{: #installers}

Eğer sisteminiz ya da paket yöneticiniz tarafından sağlanan Ruby'nin sürümü
güncel değilse, üçüncü taraf bir kurucu kullanılarak daha yeni bir Ruby
kurulabilir.

Bazı kurucular birden çok sürümü aynı sistemde kurmanıza imkan verir; ilgili
yöneticiler farklı Ruby'ler arasında geçiş yapmanıza yardım edebilir.

Eğer sürüm yöneticisi olarak [RVM](#rvm)'i kullanmayı planlıyorsanız, ayrı bir
kurucuya ihtiyacınız yok, RVM kendisininki ile gelir.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build], [rbenv](#rbenv) için Ruby'nin farklı sürümlerini
derleyip kurmanıza imkan veren bir eklentidir. ruby-build ayrıca rbenv olmadan
tek başına çalışan bir program olarak da kullanılabilir. macOS, Linux, ve diğer
UNIX benzeri işletim sistemlerinde kullanılabilir.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install], Ruby'nin farklı sürümlerini isteğe bağlı
dizinlere derleyip kurmanıza imkan sağlar. [chruby](#chruby), bu kurucu ile
kullanılabilen ve Ruby sürümleri arasında geçiş yapmak için kullanılan bir
araçtır. macOS, Linux, ve diğer UNIX benzeri işletim sistemlerinde
kullanılabilir.


### RubyInstaller
{: #rubyinstaller}

Windows'ta [RubyInstaller][rubyinstaller] tam bir Ruby geliştirme ortamı
ayarlamak için size gereken her şeyi verir.

Sadece indirin, çalıştırın, ve her şey tamam!


### Ruby Stack
{: #rubystack}

Eğer Ruby'yi Ruby on Rails kullanmak için kuruyorsanız, aşağıdaki kurucuyu
kullanabilirsiniz:

* [Bitnami Ruby Stack][rubystack], Rails için tam bir geliştirme ortamı sağlar.
  macOS, Linux, Windows, sanal makineler, ve bulut görüntülerini destekler.


## Yöneticiler
{: #managers}

Birçok Ruby'ci birden çok Ruby'yi yönetmek için Ruby yöneticilerini kullanır.
Yöneticiler Ruby sürümleri arasında kolay hatta projeye bağlı olarak otomatik
geçiş imkanı sağlar ve başka avantajlara sahiptir fakat resmi olarak
desteklenmezler. Fakat ilgili topluluklar içinde destek bulabilirsiniz.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm], proje başına birden çok dil çalışma zamanı sürümlerini yönetebilen genişletilebilir bir sürüm yöneticisidir.
Ruby'yi kurmak için [asdf-ruby][asdf-ruby] ([ruby-build](#ruby-build)'ı kullanır) eklentisini kurmalısınız.

### chruby
{: #chruby}

[chruby][chruby] birden çok Ruby arasında geçiş yapmanıza imkan sağlar.
[ruby-install](#ruby-install) tarafından, hatta kaynaktan inşa edilerek kurulan
Ruby'leri yönetebilir.


### rbenv
{: #rbenv}

[rbenv][rbenv], Ruby'nin birden çok kurulumunu yönetmenize imkan sağlar.
Varsayılan olarak Ruby'yi kuramasa da, [ruby-build](#ruby-build) eklentisi bunu
yapabilir. Her iki araç da macOS, Linux, ve diğer UNIX benzeri işletim
sistemlerinde kullanılabilir.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm], sisteminizde Ruby'nin birden çok kurulumunu kurup yönetmenize imkan
sağlar. Ayrıca farklı gem kümelerini yönetmek için de kullanılabilir. macOS,
Linux, ve diğer UNIX benzeri işletim sistemlerinde kullanılabilir.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] Windows üzerinde Ruby'nin birden fazla kurulumunu
yüklemenizi ve yönetmenizi sağlar. Orijinal RVM'nin bir klonudur ve orijinal RVM
ile aynı komut satırı arayüzünü sağlayarak klasik komut satırının yanı sıra
Powershell'i de destekler.


### uru
{: #uru}

[Uru][uru], macOS, Linux, ya da Windows sistemlerinde birden çok Ruby'yi
kullanmanıza yardımcı olan hafif, çoklu platform bir komut satırı aracıdır.


## Kaynaktan İnşa Etme
{: #building-from-source}

Tabii ki Ruby'yi kaynaktan kurabilirsiniz. Bir tar arşivi [indirin][download]
ve açın, sonra sadece şunu yapın:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Varsayılan olarak, bu, Ruby'yi `/usr/local` içine kuracaktır. Değiştirmek için
`./configure` betiğine `--prefix=DIR` seçeneğini geçirin.

Kaynaktan inşa etme hakkında daha fazla bilgiyi
[Ruby oluşturma talimatları][building-ruby]nda bulabilirsiniz.

Üçüncü taraf araçlar ya da paket yöneticileri kullanmak daha iyi bir fikir
olabilir, çünkü kurulan Ruby herhangi bir araç tarafından yönetilmeyecektir.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
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
[download]: /tr/downloads/
[installers]: /tr/documentation/installation/#installers
[building-ruby]: https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
