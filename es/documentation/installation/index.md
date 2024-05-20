---
layout: page
title: "Instalar Ruby"
lang: es
---

Con gestores de paquetes o herramientas de terceros, tienes varias opciones
para instalar y gestionar Ruby.
{: .summary}

Puede que ya tengas Ruby instalado en tu computadora.
Puedes revisar dentro de una [ventana de terminal][terminal]
con la siguiente orden:

{% highlight sh %}
ruby -v
{% endhighlight %}

Esto debería darte la información de la versión de Ruby instalada.

## Escoge un método de instalación

Hay varias maneras de instalar Ruby:

* Si lo necesitas en un sistema tipo UNIX, la manera más sencilla de instalarlo
  es usando el **sistema de gestión de paquetes** de la distribución.
  Sin embargo, la versión de Ruby provista puede no ser la última versión.
* Se pueden usar los **instaladores** para instalar una o varias
  versiones de Ruby. Incluso existe un instalador para Windows.
* Los **gestores** te ayudan a cambiar entre varias versiones de
  Ruby en tu sistema.
* Y finalmente, puedes compilar Ruby desde el **código fuente**.

En Windows 10, también puedes usar el [subsistema de Windows para Linux][wsl]
para instalar una de las distribuciones de Linux soportadas
y usar cualquier método de instalación disponible en ese sistema.

La lista siguiente muestra los diferentes métodos de instalación:

* [Sistemas Gestores de Paquetes](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Gestor de paquetes de Windows](#winget)
  * [Gestor de paquetes Chocolatey para Windows](#chocolatey)
  * [Otras Distribuciones](#other-systems)
* [Instaladores](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Gestores](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Compilar desde el código](#building-from-source)


## Sistemas Gestores de Paquetes
{: #package-management-systems}

Si no puedes compilar tu propia versión de Ruby y tampoco quieres usar
una herramienta de terceros, puedes usar el sistema gestor de paquetes
de tu sistema para instalar Ruby.

Algunos miembros de la comunidad Ruby sienten que debes evitar gestores
de paquetes para instalar Ruby y deberías en su lugar usar
herramientas dedicadas.

Es posible que algunos gestores de paquetes importantes insten versiones
anteriores de Ruby en lugar de la última versión.
Para usar la última versión de Ruby, revisa que el nombre del paquete coincida
con el número de versión. O usa un [instalador][installers] dedicado.

### apt (Debian o Ubuntu)
{: #apt}

Debian GNU/Linux y Ubuntu usan el gestor de paquetes apt.
Puedes usarlo así:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora, o RHEL)
{: #yum}

CentOS, Fedora, y RHEL usan el gestor de paquetes yum.
Puedes usarlo así:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

La versión instalada es típicamente la versión de Ruby disponible en el
momento de liberación de la versión específica de cada distribución.

### snap (Ubuntu u otras distribuciones Linux)
{: #snap}

Snap es un gestor de paquetes desarrollado por Canonical.
Está disponible directamente en Ubuntu, pero snap también funciona en muchas
otras distribuciones de Linux.
Puedes usarlo así:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Tenemos varios canales por cada serie menor de Ruby.
Por ejemplo, la siguiente orden cambia a Ruby 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo usa el gestor de paquetes portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Para instalar una versión específica, establece `RUBY_TARGETS` en
tu archivo `make.conf`.
Revisa el [sitio web del proyecto Gento Ruby][gentoo-ruby].


### pacman (Arch Linux)
{: #pacman}

Arch Linux usa un gestor de paquetes llamado pacman.
Para instalar Ruby, solamente tienes que hacer esto:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Esto debería instalar la última versión estable de Ruby.


### Homebrew (macOS)
{: #homebrew}

Ruby 2.0 y superiores se incluyen por defecto en las versiones de macOS
desde al menos El Capitan (10.11).

[Homebrew][homebrew] es un gestor de paquetes comúnmente usado en macOS.
Es muy fácil obtener Ruby usando Homebrew:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Este comando debería instalar la última versión de Ruby.


### FreeBSD
{: #freebsd}

FreeBSD ofrece ambos métodos para instalar Ruby; paquete o porte a partir de fuentes.
Puedes instalar un paquete precompilados vía la herramienta pkg.

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

Puedes instalar Ruby con el método basado en código fuente usando
[la colección de portes][freebsd-ports-collection].
Esto es útil si quieres personalizar las opciones
de configuración de compilación.

Puedes encontrar más información sobre Ruby y su ecosistema circundante en FreeBSD
en el [sitio web del proyecto FreeBSD Ruby][freebsd-ruby].


### OpenBSD
{: #openbsd}

OpenBSD y la distribución en español adJ tienen paquetes para las tres versiones
principales de Ruby.
La siguiente orden te permite ver las versiones disponibles e instalar alguna:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Puedes instalar varias versiones lado a lado, porque sus binarios tienen
usan nombres diferentes (p.ej. `ruby27`, `ruby26`).

La rama `HEAD` de la colección de portes de OpenBSD puede tener la versión más
reciente de Ruby para esta plataforma unos días después de que sea publicada, revisa
[el directorio lang/ruby en la colección de portes más recientes][openbsd-current-ruby-ports].

### Ruby en OpenIndiana
{: #openindiana}

Para instalar Ruby en [OpenIndiana][openindiana], por favor usa el cliente de
Image Packaging System (IPS).
Esto va a instalar los binarios de Ruby y RubyGems
actuales directamente del repositorio de la red de OpenIndiana. Es sencillo:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

Sin embargo, las herramientas de terceros pueden ser una buena manera
de obtener la versión más actual de Ruby.

### Gestor de paquetes de Windows
{: #winget}

En Windows, puedes usar [el CLI del gestor de paquetes de Windows](https://github.com/microsoft/winget-cli)
para instalar Ruby:

{% highlight sh %}
> winget install RubyInstallerTeam.Ruby
{% endhighlight %}

### Gestor de paquetes Chocolatey para Windows
{: #chocolatey}

También en Windows, puedes usar [gestor de paquetes Chocolatey](https://chocolatey.org/install)
para instalar Ruby:

{% highlight sh %}
> choco install ruby
{% endhighlight %}

Reutilizará los existentes `msys2`, o instalará el propio para un entorno de desarrollo completo de Ruby.

### Otras distribuciones
{: #other-systems}

En otros sistemas puedes buscar Ruby en el repositorio de paquetes para el gestor de tu distribución de Linux.
Alternativamente, puedes usar [instaladores de terceros][installers].


## Instaladores
{: #installers}

Si la versión de Ruby distribuida por tu sistema o por el gestor de
paquetes de tu sistema está desactualizada, se puede instalar una más reciente utilizando un instalador de terceros.

Algunos de ellos incluso te pueden ayudar a instalar varias versiones
en el mismo sistema; los gestores asociados pueden ayudarte a cambiarte
entre las versiones de Ruby.

Si planeas usar [RVM](#rvm) como gestor de versiones no necesitas usar
un instalador aparte, ya viene con uno incluido.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] es un plugin para [rbenv](#rbenv) que te permite
compilar e instalar diferentes versiones de Ruby.
ruby-build también puede ser usado como un programa independiente sin rbenv.
Está disponible para macOS, Linux y otros sistemas operativos UNIX.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] te permite compilar e instalar diferentes
versiones de Ruby en directorios arbitrarios.
[chruby](#chruby) es una herramienta complementaria usada para cambiar
entre diferentes versiones de Ruby.
Está disponible para macOS, Linux y otros sistemas operativos UNIX.


### RubyInstaller
{: #rubyinstaller}

En Windows, [RubyInstaller][rubyinstaller] te da todo lo que necesitas
para instalar un entorno de desarrollo completo de Ruby.

Simplemente descárgalo, ejecútalo y ¡Listo!


### Ruby Stack
{: #rubystack}

Si estás instalando Ruby para usar Ruby on Rails, puedes usar los siguientes
instaladores:

* [Bitnami Ruby Stack][rubystack], provee un entorno de desarrollo completo
  para Rails. Soporta macOS, Linux, Windows, maquinas virtuales
  e imágenes cloud.


## Gestores
{: #managers}

Muchos Rubistas usan gestores para poder usar varias versiones de Ruby.
Permiten cambiar de versiones Ruby fácilmente o incluso automáticamente
dependiendo del proyecto y otras ventajas pero no son oficialmente soportados.
Puedes, sin embargo, encontrar apoyo dentro de cada comunidad respectiva.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] es un gestor de versiones expandible que puede gestionar multiples versiones del lenguaje por proyecto.
Necesitaras el plugin [asdf-ruby][asdf-ruby]
(que por su parte usa [ruby-build](#ruby-build)) para instalar Ruby.

### chruby
{: #chruby}

[chruby][chruby] te permite cambiar entre varias versiones de Ruby.
Puede manejar las versiones instaladas por [ruby-install](#ruby-install)
e incluso las que se han compilado del código fuente.


### rbenv
{: #rbenv}

[rbenv][rbenv] te permite manejar varias instalaciones de Ruby.
No soporta instalar Ruby, pero tiene un plugin popular llamado [ruby-build](#ruby-build) para instalarlo.
Ambas herramientas están disponibles para macOS, Linux y otros sistemas
operativos UNIX.


### rbenv para Windows
{: #rbenv-for-windows}

[rbenv para Windows][rbenv-for-windows] te permite instalar y manejar varias instalaciones de Ruby en Windows. Está escrito en
PowerShell proporcionando así una forma nativa de usar Ruby para usuarios de Windows.
Además, la interfaz de línea de comandos es compatible con [rbenv][rbenv]
en sistemas operativos UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] te permite instalar y manejar varias versiones de Ruby en tu sistema.
También puede manejar varios gemsets. Está disponible para macOS, Linux y otros
sistemas operativos UNIX.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows]  te permite instalar y administrar múltiples 
instalaciones de Ruby en Windows. Es un clon del RVM original y soporta la línea 
de comandos clásica así como Powershell proporcionando la misma interfaz de línea 
de comandos que el RVM original.


### uru
{: #uru}

[Uru][uru] es una herramienta de la línea de comandos multi-plataforma muy ligera que te ayuda a usar varias versiones de Ruby en macOS, Linux o sistemas Windows.


## Compilar del código fuente
{: #building-from-source}

Por supuesto, también puedes instalar Ruby usando el código fuente.
[Descarga][download] y desempaqueta el tarball, luego simplemente:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Por defecto este comando va a instalar Ruby en `/usr/local`. Para cambiar esto usa la opción `--prefix=DIR` con el script `./configure`.

Puedes encontrar más información acerca de cómo compilar el código fuente en las
[Instrucciones de compilación de Ruby][building-ruby].

Usar herramientas de terceros o gestores de paquetes puede ser una mejor idea,
ya que las versiones instaladas de esta manera no serán manejadas por ninguna otra herramienta.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
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
[download]: /es/downloads/
[installers]: /en/documentation/installation/#installers
[building-ruby]: https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
