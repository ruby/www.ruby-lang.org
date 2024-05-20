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

* Когда вы на UNIX-подобных операционных системах, использование
  **менеджера пакетов** вашей системы - это самый простой способ.
  Однако, версия Ruby в пакетных менеджерах не самая последняя.
* **Установщики** могут быть использованы для установки конкретной версии или
  нескольких версий Ruby. Есть установщик для Windows.
* **Менеджеры** помогут вам переключаться между различными версиями Ruby,
  установленными на вашей системе.
* Ну и наконец, вы можете также **собрать Ruby из исходников**.

В следующем списке перечислены доступные способы установки для различных нужд
и платформ.

* [Системы управления пакетами](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [OpenBSD](#openbsd)
  * [Solaris, OpenIndiana](#solaris)
  * [Другие дистрибутивы](#other-systems)
* [Установщики](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Менеджеры](#managers)
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

Некоторые участники сообщества Ruby убеждены, что никогда не стоит
пользоваться пакетными менеджерами для установки Ruby. Вместо этого
лучше воспользоваться другими инструментами.
Оставим все плюсы и минусы данного подхода за
границами данного текста, отметим лишь, что основной причиной данной
убежденности является то, что в пакетных менеджерах зачастую содержится
информация об устаревших версиях Ruby. Если вы хотите использовать
новейшую версию Ruby, убедитесь, что вы используете верное имя пакета
или воспользуйтесь инструментами описанными ниже вместо этого.


### apt (Debian или Ubuntu)
{: #apt}

Debian GNU/Linux и Ubuntu используют систему управления пакетами `apt`.
Вы можете использовать ее следующим образом:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

Пакет `ruby-full` установит Ruby версии 2.3.1, которая является последним
стабильным релизом.


### yum (CentOS, Fedora, или RHEL)
{: #yum}

CentOS, Fedora, и RHEL используют систему управления пакетами `yum`.
Вы можете использовать ее следующим образом:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Устанавливаемая версия обычно является последней версией Ruby, доступной
на момент выхода конкретной версии дистрибутива.


### portage (Gentoo)
{: #portage}

Gentoo использует систему управления пакетами `portage`.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

По умолчанию, будут установлены версии 1.9 и 2.0, но доступны и другие версии.
Для установки конкретной версии, заполните `RUBY_TARGETS` в вашем `make.conf`.
Подробнее смотрите на [сайте проекта Gentoo Ruby][gentoo-ruby].


### pacman (Arch Linux)
{: #pacman}

Arch Linux использует систему управления пакетами `pacman`. Чтобы получить
Ruby, просто напишите следующее:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Это должно установить последнюю стабильную версию Ruby.


### Homebrew (macOS)
{: #homebrew}

На OS X El Capitan, Yosemite и Mavericks, Ruby 2.0 уже включены.
OS X Mountain Lion, Lion и Snow Leopard поставляются с версией Ruby 1.8.7.

Многие люди на macOS используют [Homebrew][homebrew] как пакетный менеджер.
И это действительно просто – установить Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Это установит последнюю версию Ruby.


### OpenBSD
{: #openbsd}

OpenBSD, а также его дистрибутив adJ, имеет пакеты для трех
основных версий Ruby. Следующая команда позволяет вам увидеть
доступные версии и установить одну из них:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Вы можете установить несколько основных версий одновременно, потому что их
бинарники имеют разные имена (например, `ruby27`, `ruby26`).

Ветка `HEAD` коллекции портов OpenBSD может иметь
самую последнюю версию Ruby для этой платформы через несколько дней после ее
релиза, смотрите
[директорию lang/ruby в самой последней коллекции портов][openbsd-current-ruby-ports].


### Ruby на Solaris и OpenIndiana
{: #solaris}

Ruby 1.8.7 доступен для Solaris 8-10 на [Sunfreeware][sunfreeware] и
Blastwave. Ruby 1.9.2p0 также доступен на [Sunfreeware][sunfreeware],
но это все уже устарело.

Чтобы установить Ruby на [OpenIndiana][openindiana], пожалуйста, используйте
клиент [Image Packaging System, или IPS][opensolaris-pkg]. Это установит
последние бинарники Ruby и RubyGems прямо из сетевого репозитория
OpenSolaris для Ruby 1.9. Это просто:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Однако, сторонние инструменты могут быть хорошим способом получить
последнюю версию Ruby.


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
планируете использовать [RVM](#rvm) как менеджер версий - то вам не нужен
отдельный установщик, он идет со своим.


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


## Менеджеры
{: #managers}

Многие рубисты используют менеджеры для управления несколькими версиями Ruby.
Они предоставляют различные преимущества, но поддерживаются не официально.
Однако их сообщество может оказать помощь.


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


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] позволяет устанавливать и управлять несколькими 
установками Ruby под Windows. Он является клоном оригинального RVM и поддерживает 
классическую командную строку, а также Powershell, предоставляя тот же интерфейс 
командной строки, что и оригинальный RVM.


### uru
{: #uru}

[Uru][uru] - это легковесная, кросс-платформенная командная утилита, которая
помогает вам использовать несколько версий Ruby на macOS, Linux или Windows.


## Сборка из исходников
{: #building-from-source}

Конечно, вы можете установить Ruby из исходников.
[Скачайте](/ru/downloads/) и распакуйте архив, затем просто выполните:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

По умолчанию, это установит Ruby в `/usr/local`.
Для изменения, передайте опцию `--prefix=DIR` в скрипт `./configure`.

Использование сторонних инструментов или пакетных менеджеров может быть лучше,
хотя бы потому, что установленные Ruby не будут управляться любыми инструментами.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
