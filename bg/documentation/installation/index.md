---
layout: page
title: "Инсталиране на Ruby"
lang: bg
---

Има няколко начина за инсталиране на Ruby.
Тази страница описва как това може да стане с помощта на пакетни мениджъри,
инсталатори и мениджъри за управление и инсталиране на Ruby. Обяснено е и как
да се инсталира от изходен код.
{: .summary}


## Изберете метод за инсталиране

Съществуват няколко начина да бъде инсталиран Ruby:

* Най-лесният начин за инсталиране на Ruby на UNIX системи е чрез
  използването на **пакетният мениджър** на системата. В повечето случаи
  обаче това няма да инсталира най-новата версия на Ruby.
* Могат да бъдат използвани и **инсталатори** за инсталиране на една или
  повече Ruby версии. Налични са и за Windows.
* **Мениджъри** се използват за смяна между различните инсталирани версии
  на Ruby.

Следва списък с наличните методи за инсталиране за различни платформи.

* [Пакетни мениджъри](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Други системи](#other-systems)
* [Инсталатори](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller и Ruby Stack](#railsinstaller)
* [Мениджъри](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Инсталация от изходен код](#building-from-source)


## Пакетни мениджъри
{: #package-management-systems}

Ако не можете да компилирате Ruby и не искате да използвате допълнителен
софтуер, може да използвате пакетният мениджър на вашата система.

Някои членове на Ruby общността са на мнението, че не трябва да се използва
пакетният мениджър за инсталиране на Ruby и че трябва да се използват
специализирани затова инструменти. Предимствата и недостатъците са извън
обхвата на статията, но основната причина е, че повечето пакетни мениджъри
имат стара версия на Ruby в хранилищата си. Ако искате да използвате текущата
версия на Ruby се уверете, че използвате правилното име на пакет или
използвайте някой от начините за инсталиране по-долу.


### apt (Debian или Ubuntu)
{: #apt}

Debian GNU/Linux и Ubuntu използват пакетният мениджър apt.
Използва се по следният начин:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

По времето на писане, пакетът ruby-full инсталира Ruby 2.3.1, което е стара
стабилна версия.


### yum (CentOS, Fedora, или RHEL)
{: #yum}

CentOS, Fedora, и RHEL използват пакетният мениджър yum.
Използва се по следният начин:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Обикновено се инсталира последната версия на Ruby, която е била
налична по времето на излизането на специфичната версия на дистрибуцията.


### portage (Gentoo)
{: #portage}

Gentoo използва пакетният мениджър portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

По подразбиране това ще се опита да инсталира версии 1.9 и 2.0, но са налични и
други.
За инсталирането на специфична версия, задайте `RUBY_TARGETS` в `make.conf`.
Вижте [сайтът за Ruby на Gentoo][gentoo-ruby] за повече информация.


### pacman (Arch Linux)
{: #pacman}

Arch Linux използва пакетният мениджър pacman.

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Това ще инсталира последната стабилна версия на Ruby.


### Homebrew (macOS)
{: #homebrew}

Ruby 2.0 е включен в OS X Mavericks.
OS X Mountain Lion, Lion, и Snow Leopard са с вграден Ruby 1.8.7.

Много потребители на macOS ползват [Homebrew][homebrew] за пакетен
мениджър. С него е много е лесно да се инсталира нова версия на Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Това би трябвало да инсталира последната версия на Ruby.


### Ruby на Solaris и OpenIndiana
{: #solaris}

Ruby 1.8.7 е наличен за Solaris от версия 8 до 10 на
[Sunfreeware][sunfreeware] и на Blastwave.
Ruby 1.9.2p0 също може да бъде инсталиран от [Sunfreeware][sunfreeware],
но е стара версия.

За да инсталирате Ruby на [OpenIndiana][openindiana], моля ползвайте
[Image Packaging System (IPS)][opensolaris-pkg].
Това ще инсталира последните версии на Ruby и RubyGems директно от
хранилището на OpenSolaris за Ruby 1.9. Лесно е:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Обмислете и използването на специални инструменти, за да инсталирате
последната версия на Ruby.


### Други системи
{: #other-systems}

Може да потърсите в пакетните хранилищата на вашата дистрибуция или да
използвате описаните по-долу методи за инсталиране.


## Инсталатори
{: #installers}

Ако версията на Ruby във вашият пакетен мениджър е прекалено стара, може да
инсталирате нова с помощта на специален инсталатор. Някои от тях позволяват
инсталирането и използването на множество версии на една система; съществуват
и мениджъри, които улесняват смяната между версиите.
Ако планирате да използвате [RVM](#rvm) като мениджър на версиите няма да ви
е нужен отделен инсталатор.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] е плъгин за [rbenv](#rbenv), който
позволява компилирането и инсталирането на различни версии на Ruby в
произволни директории.
ruby-build може да бъде използван и самостоятелно, без rbenv.
Наличен е за macOS, Linux и други UNIX системи.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] позволява инсталирането на множество версии на
Ruby в произволни директории.
Съществува и [chruby](#chruby), което осъществява смянате между различните
версии.
Налично е за macOS, Linux и други UNIX системи.


### RubyInstaller
{: #rubyinstaller}

Потребителите на Windows могат да използват [RubyInstaller][rubyinstaller], за
да инсталират Ruby. Пакетът осигурява всичко необходимо за разработката на Ruby
приложения на Windows.

Просто свалете и изпълнете!


### RailsInstaller и Ruby Stack
{: #railsinstaller}

Ако инсталирате Ruby, за да използвате Ruby on Rails, може да използвате
следните инсталатори:

* [RailsInstaller][railsinstaller],
  използва RubyInstaller, но предоставя допълнителни инструменти, спомагащи
  разработването на Rails приложения.
  Налично за OS X и Windows.
* [Bitnami Ruby Stack][rubystack],
  осигурява пълна среда за разработка за Rails.
  Поддържа macOS, Linux, Windows и виртуални машини.


## Мениджъри
{: #managers}

Много Ruby разработчици използват специални мениджъри за управлението
на множество Ruby инсталации, което имат разнообразни ползи. Те не са официално
поддържани, но имат много отзивчиви общности.


### chruby
{: #chruby}

[chruby][chruby] позволява смяната между различни версии на Ruby.
Различните версии могат да се инсталират чрез [ruby-install](#ruby-install)
или да се компилират от изходен код.


### rbenv
{: #rbenv}

[rbenv][rbenv] също позволява използването на множество версии на Ruby.
Официално не поддържа инсталирането на Ruby, но затова съществува популярният
плъгин [ruby-build](#ruby-build).
И двата инструмента са налични за macOS, Linux и други UNIX системи.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] позволява инсталирането и използването на множество инсталации на
Ruby. Също така позволява и създаването на gemsets.
Налично е за macOS, Linux и други UNIX системи.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] ви позволява да инсталирате и управлявате множество 
инсталации на Ruby в Windows. Той е клонинг на оригиналния RVM и поддържа 
класическия команден ред, както и Powershell, като предоставя същия интерфейс 
на командния ред като оригиналния RVM.


### uru
{: #uru}

[Uru][uru] е лек, мултиплатформен инструмент, който помага при ползването на
една или повече версии на Ruby за macOS, Linux или Windows системи.


## Компилиране от изходен код
{: #building-from-source}

Ruby може да бъде инсталиран от изходен код.
[Свалете](/bg/downloads/) и разархивирайте, след това изпълнете следните
команди:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

По подразбиране това ще инсталира Ruby в `/usr/local`.
За да промените това, подайте опцията `--prefix=DIR` към `./configure` скрипта.

[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
