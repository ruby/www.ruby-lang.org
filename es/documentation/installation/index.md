---
layout: page
title: "Instalar Ruby"
lang: es
---

Se pueden utilizar varias herramientas para instalar Ruby.
Esta página describe como usar los sistemas de gestión de paquetes y herramientas
de terceros para instara Ruby y como compilarlo del código fuente.
{: .summary}


## Escoge el método de instalación

Hay varias maneras de instalar Ruby:

* Si lo necesitas en un sistema tipo UNIX, la manera mas sencilla de instalarlo
es usando el **sistema de gestión de paquetes** de la distribución.
* Se pueden usar los **instaladores** para instalar una o varias versiones de Ruby.
Incluso existe un instalador para Windows.
* Los **manejadores** te ayudan a cambiar entre varias versiones de Ruby en tu
sistema.
* Y finalmente, puedes compilar Ruby del **código fuente**.

La lista siguiente muestra los diferentes métodos de instalación para las diversas
necesidades y plataformas.

* [Sistemas Gestores de Paquetes](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [OS X](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Otras Distribuciones](#other-systems)
* [Instaladores](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller and Ruby Stack](#railsinstaller)
* [Manejadores](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Compilar del código](#building-from-source)


## Sistemas Gestores de Paquetes
{: #package-management-systems}

Si no puedes compilar tu propia versión de Ruby y tampoco quieres usar una
herramienta de terceros, puedes usar el sistema gestor de paquetes
de tu sistema para instalar Ruby.

La mayoría de los miembros de la comunidad de Ruby están de acuerdo en que nunca
se debería usar un gestor de paquetes para instalar Ruby y que deberías usar
otras herramientas. La lista de pros y contras de usar uno u otro está fuera de
la intención de este documento, pero la razón básica es que la mayoría de los
gestores de paquetes tienen versiones viejas de Ruby en sus repositorios oficiales.
Si quieres usar la versión más nueva de Ruby asegúrate de que usas el nombre
de paquete correcto o que usas las herramientas descritas mas abajo.


### apt (Debian o Ubuntu)
{: #apt}

Debian GNU/Linux y Ubuntu usan el gestor de paquetes apt.
Se usa de la siguiente manera:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

Al momento de escribir este documento, el paquete `ruby-full` instala la versión
de Ruby 1.9.3, la cual es una entrega vieja pero estable en Debian y Ubuntu.


### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS, Fedora, y RHEL usan el gestor de paquetes yum.
Se usa de la siguiente manera:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

La versión instalada es típicamente la versión de Ruby disponible en el momento
de liberación de la versión específica de cada distribución.


### portage (Gentoo)
{: #portage}

Gentoo usa el gestor de paquetes portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Por defecto, este comando va a tratar de instalar las versiones 1.9 y 2.0, pero
existen más versiones disponibles.
Para instalar una versión específica, establece `RUBY_TARGETS` en el archivo
`make.conf`.
Para obtener más detalles puedes leer el [sitio de el Gento Ruby Project][gentoo-ruby].


### pacman (Arch Linux)
{: #pacman}

Arch Linux usa el gestor de paquetes llamado pacman.
Para instalar Ruby, solamente tienes que hacer esto:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Esto debería instalar la última versión estable de Ruby.


### Homebrew (OS X)
{: #homebrew}

Ruby 2.0.0 ya viene instalado en OS X Yosemite y Mavericks.
OS X Mountain Lion, Lion, y Snow Leopard vienen con Ruby 1.8.7 instalado.

Algunas personas en OS X usan [Homebrew][homebrew] como gestor de paquetes.
Es muy fácil obtener una versión nueva de Ruby usando Homebrew:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Este comando debería instalar la versión más actual de Ruby.


### Ruby en Solaris y OpenIndiana
{: #solaris}

Ruby 1.8.7 está disponible para Solaris 8 a 10 en
[Sunfreeware][sunfreeware] y Ruby 1.8.7 está disponible en
[Blastwave][blastwave].
Ruby 1.9.2p0 también está disponible en [Sunfreeware][sunfreeware],
pero esta es una versión desactualizada.

Para instalar Ruby en [OpenIndiana][openindiana], por favor usa el cliente de
[Image Packaging System (IPS)][opensolaris-pkg].
Esto va a instalar los binarios de Ruby y RubyGems actuales directamente de
el repositorio de la red de OpenSolaris. Es sencillo:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Sin embargo, las herramientas de terceros pueden ser una mejor manera de
obtener la versión más actual de Ruby.


### Otras Distribuciones
{: #other-systems}

En otros sistemas puedes buscar Ruby en  el repositorio de paquetes para el gestor de tu
distribución de Linux, aunque las herramientas de terceros puede que sean tu
mejor opción.


## Instaladores
{: #installers}

Si la versión de Ruby distribuida por el gestor de paquetes de tu sistema está
desactualizada se puede instalar una más actual utilizando un instalador de
terceros.
Algunos de ellos incluso te pueden ayudar a instalar varias versiones en un solo
sistema; los manejadores asociados pueden ayudarte a cambiarte entre las versiones
de Ruby. Si planeas usar [RVM](#rvm) como manejador de versiones no necesitas
usar un instalador aparte, ya viene con uno incluido.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] es un plugin para [rbenv](#rbenv) que
te permite compilar e instalar diferentes versiones de Ruby en directorios
arbitrarios. ruby-build también puede ser usado como un programa independiente
sin rbenv. Está disponible para OS X, Linux y otros sistemas operativos UNIX.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] te permite compilar e instalar diferentes versiones
de ruby en directorios arbitrarios. Tambien tiene un hijo, [chruby](#chruby), el
cual te ayuda a cambiarte entre diferentes versiones de Ruby.
Está disponible para OS X, Linux y otros sistemas operativos UNIX.


### RubyInstaller
{: #rubyinstaller}

Si usas Windows existe un excelente proyecto que te ayuda a instalar Ruby:
[RubyInstaller][rubyinstaller]. Te da todo lo que necesitas para instalar un
ambiente completo de Ruby en Windows.

Simplemente descárgalo, ejecútalo y ¡Listo!


### RailsInstaller y Ruby Stack
{: #railsinstaller}

Si estás instalando Ruby para usar Ruby on Rails, puedes usar los siguientes
instaladores:

* [RailsInstaller][railsinstaller],
  utiliza RubyInstaller pero te da las herramientas extra necesarias
  para desarrollo con Ruby on Rails. Está disponible para OS X y Windows.
* [Bitnami Ruby Stack][rubystack],
  te provee de un ambiente completo de desarrollo para Rails. Soporta OS X,
  Linux, Windows, maquinas virtuales e imágenes cloud.


## Manejadores
{: #managers}

Muchos Rubistas usan manejadores para poder usar varias versiones de Ruby.
Tienen muchas ventajas pero no son soportados oficialmente. Sin embargo, cada
uno tiene su respectiva comunidad, las cuales son de mucha ayuda.


### chruby
{: #chruby}

[chruby][chruby] te permite cambiar entre varias versiones de Ruby.
chruby puede manejar las versiones instaladas por [ruby-install](#ruby-install)
e incluso las que se han compilado del código fuente.


### rbenv
{: #rbenv}

[rbenv][rbenv] te permite manejar varias instalaciones de Ruby.
No soporta instalar Ruby, pero tiene un plugin popular llamado
[ruby-build](#ruby-build) para instalarlo.
Ambas herramientas están disponibles para OS X, Linux y otros sistemas
operativos UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] te permite instalar y manejar varias versiones de Ruby en tu sistema.
También puede manejar varios gemsets. Está disponible para OS X, Linux y otros
sistemas operativos UNIX.


## uru
{: #uru}

[Uru][uru] es una herramienta de la línea de comandos multi-plataforma muy ligera
que te ayuda a usar varias versiones de Ruby en OS X, Linux o sistemas Windows.


## Compilar del código fuente
{: #building-from-source}

Por supuesto, también puedes instalar Ruby usando el código fuente.
[Descarga](/es/downloads/) y desempaqueta el tarball, luego simplemente:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Por defecto este comando va a instala Ruby en `/usr/local`. Para cambiar esto
usa la opción `--prefix=DIR` con el script `./configure`.

Usar manejadores de terceros puede ser una mejor idea, ya que las
versiones instaladas de esta manera no serán manejadas por ninguna otra
herramienta.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv#readme
[ruby-build]: https://github.com/sstephenson/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
