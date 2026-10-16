---
layout: page
title: "Установка Ruby"
lang: ru
---

Вы можете использовать различные инструменты для установки Ruby.
Эта страница описывает, как использовать основные системы управления пакетами
и сторонние инструменты для управления и установки Ruby,
и как собрать Ruby из исходников.
{: .summary}

## Выберите ваш метод установки

Есть несколько способов установки Ruby:

* На UNIX-подобных операционных системах проще всего использовать **менеджер пакетов**
  вашей системы, но поставляемый пакет может быть несколько устаревшим.
* **Установщики** могут быть использованы для установки конкретной версии или
  нескольких версий Ruby. Есть установщик для Windows.
* **Менеджеры версий** позволяют легко переключаться между различными версиями Ruby.
* Ну и наконец, вы можете также **собрать Ruby из исходников**.

На Windows 10 вы также можете воспользоваться [Windows Subsystem for Linux][wsl],
чтоб установить дистрибутив Linux, а затем в него установить Ruby любым из
перечисленных способов.

Ниже перечислены все возможные способы установки на разные платформы.

* [Системы управления пакетами](#package-management-systems)
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
  * [Chocolatey для Windows](#chocolatey)
  * [Другие дистрибутивы](#other-systems)
* [Установщики](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Менеджеры версий](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Сборка из исходников](#building-from-source)


## Системы управления пакетами
{: #package-management-systems}

Если вы не можете скомпилировать ваш собственный Ruby и не хотите
использовать сторонний инструмент для установки – вы можете
воспользоваться пакетным менеджером вашей операционной системы.

Некоторые участники сообщества Ruby убеждены, что не стоит
пользоваться пакетными менеджерами для установки Ruby, и что
лучше воспользоваться специальными инструментами.

Одна из причин -- это то, что пакетные менеджеры могут поставлять
устаревшую версию Ruby. Вы можете проверить это, посмотрев на версию,
значащуюся в имени пакета. Чтобы установить более новую версию,
вы можете воспользоваться [инсталляторами][installers].


### apt (Debian или Ubuntu)
{: #apt}

Debian GNU/Linux и Ubuntu используют систему управления пакетами `apt`.
Вы можете использовать ее следующим образом:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora или RHEL)
{: #yum}

CentOS, Fedora и RHEL используют систему управления пакетами `yum`.
Вы можете использовать ее следующим образом:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Устанавливаемая версия обычно является последней версией Ruby, доступной
на момент выхода конкретной версии дистрибутива.


### snap (Ubuntu и другие Linux)
{: #snap}

Snap -- это менеджер пакетов, разработанный Canonical.
Он доступен из коробки на Ubuntu, но также его можно установить и на
многие другие дистрибутивы Linux.

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

На каждую минорную версию Ruby имеется несколько каналов.
Например, так можно установить stable-версию Ruby 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo использует систему управления пакетами `portage`.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Для установки конкретной версии, заполните `RUBY_TARGETS` в вашем `make.conf`.
Подробнее смотрите на [сайте проекта Gentoo Ruby][gentoo-ruby].


### pacman (Arch Linux)
{: #pacman}

Arch Linux использует систему управления пакетами `pacman`.

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Это установит последнюю стабильную версию Ruby.


### Homebrew (macOS)
{: #homebrew}

OS X El Capitan, Yosemite и Mavericks уже поставляются с Ruby 2.0.
OS X Mountain Lion, Lion и Snow Leopard поставляются с версией Ruby 1.8.7.

Многие на macOS используют [Homebrew][homebrew] в качестве пакетного менеджера.

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Это установит последнюю версию Ruby.


### FreeBSD
{: #freebsd}

FreeBSD предоставляет Ruby как в виде пакета, так и в исходниках.
Готовые пакеты могут быть установлены при помощи pkg:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

Из исходников Ruby можно установить при помощи
[Ports Collection][freebsd-ports-collection]. Это полезно в случае,
когда вы хотите как-либо кастомизировать сборку.

Больше информации о Ruby и его экосистеме на FreeBSD
вы найдёте на [сайте FreeBSD Ruby Project][freebsd-ruby].


### OpenBSD
{: #openbsd}

OpenBSD, а также его дистрибутив adJ, имеет пакеты для трёх
основных версий Ruby. Следующая команда позволяет вам увидеть
доступные версии и установить одну из них:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Вы можете установить несколько основных версий одновременно, потому что их
бинарники имеют разные имена (например, `ruby27`, `ruby26`).

Ветка `HEAD` коллекции портов OpenBSD может иметь самую последнюю
версию Ruby для этой платформы через несколько дней после ее релиза, смотрите
[директорию lang/ruby в самой свежей коллекции портов][openbsd-current-ruby-ports].


### Ruby на OpenIndiana
{: #openindiana}

Чтобы установить Ruby на [OpenIndiana][openindiana], пожалуйста, используйте
клиент [Image Packaging System, или IPS][opensolaris-pkg]. Следующая команда
установит последние бинарники Ruby и RubyGems прямо из сетевого репозитория
OpenSolaris.

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}


### Windows Package Manager
{: #winget}

На Windows для установки Ruby вы можете воспользоваться
[Windows Package Manager CLI](https://github.com/microsoft/winget-cli):

{% highlight sh %}
> winget install Ruby
{% endhighlight %}

### Chocolatey для Windows
{: #chocolatey}

Также для установки Ruby на Windows доступен
[менеджер пакетов Chocolatey](https://chocolatey.org/install):

{% highlight sh %}
> choco install ruby
{% endhighlight %}

Эта команда доустановит `msys2` при необходимости.


### Другие дистрибутивы
{: #other-systems}

На других системах, вы можете поискать репозиторий пакета Ruby
для пакетного менеджера вашего Linux дистрибутива, или же
сторонние инструменты могут стать хорошим выбором для вас.


## Установщики
{: #installers}

Если версия Ruby, предоставляемая вашей операционной системой
или пакетным менеджером, не актуальна, то вы можете установить новую версию
при помощи сторонних установщиков. Некоторые из них также позволяют установить
несколько версий Ruby в вашей системе и переключаться между ними. Если вы
планируете использовать [RVM](#rvm) как менеджер версий, то вам не нужен
отдельный установщик, он идет в комплекте.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] - это плагин для [rbenv](#rbenv), который позволяет
вам скомпилировать и установить разные версии Ruby в произвольные каталоги.
ruby-build может использоваться как отдельная программа без rbenv.
Он доступен для macOS, Linux и других UNIX-подобных операционных систем.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] позволяет вам скомпилировать и установить
различные версии Ruby в произвольные каталоги. Существует также родственник
[chruby](#chruby), который управляет переключением между версиями Ruby.
Он доступен для macOS, Linux и других UNIX-подобных операционных систем.


### RubyInstaller
{: #rubyinstaller}

Для пользователей Windows существует отличный проект, помогающий
установить Ruby: [RubyInstaller][rubyinstaller]. Он предоставляет вам все,
что нужно для настройки полноценного окружения Ruby на Windows.

Просто скачайте его, запустите и все готово!


### Ruby Stack
{: #rubystack}

Если вы устанавливаете Ruby для того, чтобы воспользоваться Ruby on Rails,
вы можете использовать следующий установщик:

* [Bitnami Ruby Stack][rubystack],
  которые предоставляет полное окружение для разработки на Rails.
  Поддерживает macOS, Linux, Windows, виртуальные машины и облачные сервисы.


## Менеджеры версий
{: #managers}

Многие рубисты используют менеджеры версий для управления несколькими версиями Ruby.
Они автоматически переключают текущую версию и имеют ряд других преимуществ,
но не поддерживаются официально. Однако, вы можете получить необходимую помощь
в соответствующих сообществах.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] - это расширяемый менеджер версий, который может управлять
несколькими исполняемыми версиями языка для каждого проекта. Вам понадобится
плагин [asdf-ruby][asdf-ruby] (который, в свою очередь, использует
[ruby-build](#ruby-build)), чтобы установить Ruby.


### chruby
{: #chruby}

[chruby][chruby] позволяет вам переключаться между разными версиями Ruby.
chruby может управлять версиями Ruby, которые установлены с помощью
[ruby-install](#ruby-install) или даже собранными из исходников.


### rbenv
{: #rbenv}

[rbenv][rbenv] позволяет вам управлять несколькими установленными версиями Ruby.
Он не поддерживает установку Ruby, но для этого существует популярный плагин
[ruby-build](#ruby-build). Оба инструмента доступны для macOS, Linux и других
UNIX-подобных операционных систем.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] позволяет вам устанавливать и управлять несколькими установленными
версиями Ruby в вашей системе. Также он может управлять разными наборами гемов.
Доступен для macOS, Linux и других UNIX-подобных операционных систем.


### uru
{: #uru}

[Uru][uru] - это легковесная, кросс-платформенная командная утилита, которая
помогает вам использовать несколько версий Ruby на macOS, Linux или Windows.


## Сборка из исходников
{: #building-from-source}

Конечно, вы можете установить Ruby из исходников.
[Скачайте](download) и распакуйте архив, затем просто выполните:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

По умолчанию, это установит Ruby в `/usr/local`.
Для изменения, передайте опцию `--prefix=DIR` в скрипт `./configure`.

Узнать больше о сборке из исходников вы можете из [файла Ruby README][readme].

Использование сторонних инструментов или пакетных менеджеров может быть лучше,
хотя бы потому, что установленные Ruby не будут управляться любыми инструментами.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html
[homebrew]: http://brew.sh/
[download]: /ru/downloads/
[installers]: /ru/documentation/installation/#installers
[readme]: https://github.com/ruby/ruby#how-to-compile-and-install
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
