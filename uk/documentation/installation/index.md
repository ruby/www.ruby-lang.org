---
layout: page
title: "Встановлення Ruby"
lang: uk
---

За допомогою пакетних менеджерів або сторонніх інструментів у вас є
багато варіантів для встановлення й керування Ruby.
{: .summary}

Можливо, Ruby уже встановлений на вашому комп’ютері. Перевірте це у
[термінальному емуляторі][terminal], ввівши:

{% highlight sh %}
ruby -v
{% endhighlight %}

Має відобразитися інформація про встановлену версію Ruby.

## Оберіть метод встановлення

Є кілька способів встановити Ruby:

* У UNIX-подібній ОС найпростіше використовувати **пакетний менеджер**
  системи. Однак пакетна версія Ruby може бути не найновішою.
* **Інсталятори** можна використовувати для встановлення конкретної або
  кількох версій Ruby. Також є інсталятор для Windows.
* **Менеджери** допомагають перемикатися між кількома версіями Ruby
  у вашій системі.
* Зрештою, ви можете **зібрати Ruby з вихідного коду**.

У Windows 10 ви також можете використовувати
[Windows Subsystem for Linux][wsl], щоб установити одну з підтримуваних
дистрибутивів Linux і застосувати будь-який із доступних методів
встановлення в цій системі.

Ось доступні методи встановлення:

* [Пакетні менеджери](#package-management-systems)
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
  * [Chocolatey package manager для Windows](#chocolatey)
  * [Інші дистрибутиви](#other-systems)
* [Інсталятори](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Менеджери](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [mise-en-place](#mise-en-place)
  * [rbenv](#rbenv)
  * [rbenv для Windows](#rbenv-for-windows)
  * [RVM](#rvm)
  * [uru](#uru)
* [Збирання з вихідного коду](#building-from-source)


## Пакетні менеджери
{: #package-management-systems}

Якщо ви не можете компілювати Ruby самостійно і не хочете використовувати
сторонні інструменти, скористайтеся пакетним менеджером вашої системи
для встановлення Ruby.

Деякі члени спільноти Ruby вважають, що пакетних менеджерів для встановлення
Ruby слід уникати й натомість використовувати спеціалізовані інструменти.

Можливо, основні пакетні менеджери встановлять старіші версії Ruby замість
найновішого релізу. Щоб використовувати найновіший реліз, перевірте, що
назва пакета відповідає номеру версії. Або використовуйте спеціалізований
[інсталятор][installers].


### apt (Debian або Ubuntu)
{: #apt}

Debian GNU/Linux і Ubuntu використовують пакетний менеджер apt. Ви можете
скористатися ним так:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora або RHEL)
{: #yum}

CentOS, Fedora і RHEL використовують пакетний менеджер yum.
Ви можете скористатися ним так:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Встановлена версія зазвичай є найновішою версією Ruby, доступною на момент
випуску відповідної версії дистрибутива.


### snap (Ubuntu або інші дистрибутиви Linux)
{: #snap}

Snap — пакетний менеджер, розроблений компанією Canonical.
Він доступний «з коробки» в Ubuntu, але також працює у багатьох
інших дистрибутивах Linux.
Використовуйте так:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Ми маємо кілька каналів для кожної молодшої серії Ruby.
Наприклад, ці команди перемикаються на Ruby 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo використовує пакетний менеджер portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Щоб встановити конкретну версію, встановіть `RUBY_TARGETS` у вашому `make.conf`.
Дивіться [сайт Gentoo Ruby Project][gentoo-ruby] для деталей.


### pacman (Arch Linux)
{: #pacman}

Arch Linux використовує пакетний менеджер pacman.
Щоб отримати Ruby, виконайте:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Це має встановити останню стабільну версію Ruby.


### Homebrew (macOS)
{: #homebrew}

Версії Ruby 2.0 і вище включені за замовчуванням у релізи macOS
принаймні з El Capitan (10.11).

[Homebrew][homebrew] — поширений пакетний менеджер у macOS.
Встановити Ruby через Homebrew легко:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Це має встановити останню версію Ruby.


### FreeBSD
{: #freebsd}

FreeBSD пропонує як попередньо зібрані, так і вихідні способи встановлення Ruby.
Попередньо зібрані пакунки можна встановити через інструмент pkg:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

Вихідний спосіб встановлення доступний через
[колекцію Ports][freebsd-ports-collection]. Це корисно, якщо ви хочете
налаштувати параметри збірки.

Детальніше про Ruby та екосистему на FreeBSD — на сайті
[FreeBSD Ruby Project][freebsd-ruby].


### OpenBSD
{: #openbsd}

OpenBSD, а також його дистрибутив adJ мають пакети для трьох основних
версій Ruby. Наступна команда дозволяє переглянути доступні версії та
встановити одну з них:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Ви можете встановлювати кілька основних версій поруч, оскільки їхні
бінарні файли мають різні назви (наприклад, `ruby27`, `ruby26`).

Гілка `HEAD` колекції портів OpenBSD може містити найсвіжішу версію Ruby
для цієї платформи через кілька днів після релізу; дивіться
[каталог lang/ruby у найсвіжішій колекції портів][openbsd-current-ruby-ports].


### Ruby на OpenIndiana
{: #openindiana}

Щоб встановити Ruby на [OpenIndiana][openindiana], використовуйте клієнт
Image Packaging System (IPS).
Він встановить бінарні файли Ruby і RubyGems безпосередньо з репозиторіїв
OpenIndiana. Це просто:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

Проте сторонні інструменти можуть бути хорошим способом отримати
найновішу версію Ruby.

### Windows Package Manager
{: #winget}

У Windows можна використовувати
[Windows Package Manager CLI](https://github.com/microsoft/winget-cli)
для встановлення Ruby:

{% highlight ps1 %}
> winget install RubyInstallerTeam.Ruby.{MAJOR}.{MINOR}
# Example
> winget install RubyInstallerTeam.Ruby.3.2
# To see all versions available
> winget search RubyInstallerTeam.Ruby
# Note: if you are installing ruby for projects, you may want to install RubyWithDevKit
> winget install RubyInstallerTeam.RubyWithDevKit.3.2
{% endhighlight %}

### Chocolatey package manager для Windows
{: #chocolatey}

У Windows також можна використовувати
[Chocolatey Package Manager](https://chocolatey.org/install)
для встановлення Ruby:

{% highlight sh %}
> choco install ruby
{% endhighlight %}

Він повторно використає наявний `msys2` або встановить власний для
повного середовища розробки Ruby.

### Інші дистрибутиви
{: #other-systems}

В інших системах ви можете знайти Ruby у репозиторії пакетів вашого
дистрибутива Linux. Альтернативно ви можете використати
[сторонній інсталятор][installers].


## Інсталятори
{: #installers}

Якщо версія Ruby, яку надає ваша система або пакетний менеджер, застаріла,
новішу можна встановити за допомогою стороннього інсталятора.

Деякі інсталятори дозволяють встановлювати кілька версій на одній системі;
пов’язані менеджери допомагають перемикатися між різними Ruby.

Якщо ви плануєте використовувати [RVM](#rvm) як менеджер версій, окремий
інсталятор не потрібен — він має власний.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] — плагін для [rbenv](#rbenv), який дозволяє
компілювати та встановлювати різні версії Ruby. ruby-build також може
використовуватися як окрема програма без rbenv. Він доступний для macOS,
Linux та інших UNIX-подібних ОС.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] дозволяє компілювати та встановлювати різні
версії Ruby у довільні каталоги. [chruby](#chruby) — допоміжний інструмент
для перемикання між версіями Ruby. Доступний для macOS, Linux та інших
UNIX-подібних ОС.


### RubyInstaller
{: #rubyinstaller}

У Windows [RubyInstaller][rubyinstaller] надає все необхідне для
налаштування повного середовища розробки Ruby.

Просто завантажте його, запустіть і готово!


### Ruby Stack
{: #rubystack}

Якщо ви встановлюєте Ruby для використання Ruby on Rails,
можете скористатися таким інсталятором:

* [Bitnami Ruby Stack][rubystack] надає повне середовище розробки для Rails.
  Підтримує macOS, Linux, Windows, віртуальні машини та образи для хмари.


## Менеджери
{: #managers}

Багато Rubyists використовують менеджери Ruby для керування кількома
версіями Ruby. Вони дозволяють легко або навіть автоматично перемикатися
між версіями Ruby залежно від проєкту, а також мають інші переваги, але
офіційно не підтримуються. Втім, підтримку можна знайти у відповідних
спільнотах.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] — розширюваний менеджер версій, який може керувати
версіями runtime кількох мов на рівні проєкту. Вам знадобиться плагін
[asdf-ruby][asdf-ruby] (який, своєю чергою, використовує [ruby-build](#ruby-build))
для встановлення Ruby.


### chruby
{: #chruby}

[chruby][chruby] дозволяє перемикатися між кількома Ruby. Він може
керувати Ruby, встановленими через [ruby-install](#ruby-install), або
збірками з вихідного коду.


### mise-en-place
{: #mise-en-place}

[mise-en-place][mise-en-place] дозволяє перемикатися між кількома Ruby без
потреби в додаткових інструментах. Він автоматично керує встановленнями й
містить [gem backend](https://mise.jdx.dev/dev-tools/backends/gem.html)
для керування версіями CLI, написаних на Ruby. Підтримує UNIX-подібні та
Windows ОС.


### rbenv
{: #rbenv}

[rbenv][rbenv] дозволяє керувати кількома встановленнями Ruby. За
замовчуванням він не встановлює Ruby, але його плагін [ruby-build](#ruby-build)
може. Обидва інструменти доступні для macOS, Linux та інших UNIX-подібних ОС.


### rbenv для Windows
{: #rbenv-for-windows}

[rbenv for Windows][rbenv-for-windows] дозволяє встановлювати й керувати
кількома встановленнями Ruby у Windows. Він написаний на PowerShell, що
надає нативний спосіб використання Ruby для користувачів Windows.
Крім того, інтерфейс командного рядка сумісний з [rbenv][rbenv]
на UNIX-подібних системах.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] дозволяє встановлювати й керувати кількома встановленнями
Ruby у вашій системі. Він також може керувати різними gemset-ами.
Доступний для macOS, Linux та інших UNIX-подібних ОС.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] дозволяє встановлювати й керувати кількома
встановленнями Ruby у Windows. Це клон оригінального RVM і підтримує
класичний командний рядок, а також PowerShell, надаючи той самий
інтерфейс командного рядка, що й оригінальний RVM.


### uru
{: #uru}

[Uru][uru] — легкий кросплатформний інструмент командного рядка, що
допомагає використовувати кілька Ruby на macOS, Linux або Windows.


## Збирання з вихідного коду
{: #building-from-source}

Звісно, Ruby можна встановити з вихідного коду.
[Завантажте][download] та розпакуйте tarball, після чого виконайте:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

За замовчуванням Ruby буде встановлено у `/usr/local`.
Щоб змінити це, передайте опцію `--prefix=DIR` до скрипта `./configure`.

Більше інформації про збирання з вихідного коду можна знайти в
[інструкціях збирання Ruby][building-ruby].

Втім, використання сторонніх інструментів або пакетних менеджерів може бути
кращою ідеєю, адже встановлений Ruby не буде керуватися жодними інструментами.


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
[download]: /uk/downloads/
[installers]: /uk/documentation/installation/#installers
[building-ruby]: https://docs.ruby-lang.org/en/master/contributing/building_ruby_md.html
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[mise-en-place]: https://mise.jdx.dev
[mise-en-place-ruby]: https://mise.jdx.dev/lang/ruby.html
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
