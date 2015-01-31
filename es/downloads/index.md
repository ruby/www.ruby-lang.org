---
layout: page
title: "Descarga Ruby"
lang: es
---

Aquí puedes obtener las últimas distribuciones de Ruby en tu sabor
favorito. La versión estable actual es {{ site.downloads.stable.version }}.
Por favor asegúrate de leer la [licencia de Ruby][license].
{: .summary}

### Tres formas de instalar Ruby

Puedes obtener una copia de Ruby de distintas formas y personas distintas pueden
preferir uno de los tres métodos por diferentes razones. Cada forma tendrá una
sección a continuación, pero aquí hay un resumen:

* **Compilar desde las fuentes** es la forma estándar con la que el software ha
  sido distribuido desde hace muchos, muchos años. Esta será la forma más común
  para un mayor número de desarrolladores de software.
* Hay algunas **herramientas de terceros** para instalar Ruby.
  Estas son a menudo más simples para novatos o hasta los usuarios
  más avanzados.
* Finalmente, algunos **sistemas de gestión de paquetes** soportan Ruby.
  Esta será la forma más familiar para personas que usan un sistema operativo
  para todo y prefieren acogerse a esos stándares individuales.

Finalmente, si quieres usar diferentes versiones de Ruby en la misma máquina, revisa
la sección de **herramientas de terceros** y usa RVM. Es de lejos la mejor forma de
lograr esto, a menos que conozcas exactamente lo que haces.

### Compilando Ruby — Código fuente

Instalar desde los fuentes es una buena solución para cuando te sientes
confiado con tu plataforma y puedas necesitar configuraciones
específicas para tu entorno. También es una buena solución en el caso de
que no existan paquetes disponibles.

Si tienes algún problema compilando Ruby, considera usar una de las herramientas
de terceros en la sección siguiente. Pueden servirte de ayuda.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (sha256:&nbsp;{{ site.downloads.stable.sha256.gz }}) Versión Estable (*recomendada*)
* [Ruby {{ site.downloads.previous.version }}][previous-gz]
  (sha256:&nbsp;{{ site.downloads.previous.sha256.gz }}) Versión Previa
* [Ruby {{ site.downloads.previous19.version }}][old-gz]
  (sha256:&nbsp;{{ site.downloads.previous19.sha256.gz }}) Versión Previa 1.9
* [Snapshot estable][stable-snapshot-gz] Ultima versión (*estable*)
  del repositorio (ruby\_2\_1).
* [Snapshot diario][nightly-gz] Ultima versión de lo que exista en SVN,
  hecho diariamente.
  Puede contener errores, ¡úsalo bajo tu responsabilidad!

Para información sobre los repositorios de Subversion y Git, consulta
nuestra página [Ruby core](/es/community/ruby-core/).

El código fuente de Ruby está disponible desde un conjunto
de [mirror sites][mirrors] a lo largo del mundo.
Intenta usar el mirror site más cerca de ti.

### Herramientas de terceros

Muchos usuarios de Ruby usan herramientas de terceros para ayudarles
a instalar Ruby. Tienen varias ventajas pero no son oficialmente soportadas.
Sin embargo, sus respectivas comunidades son de gran ayuda.

#### RVM

La heramienta más popular para instalar Ruby es **RVM** ("Ruby Version Manager").
No solo hace que instalar Ruby sea increíblemente fácil, también permite instalar y
gestionar múltiples copias de Ruby en tu sistema, además de distintas implementaciones
de Ruby.

RVM está sólo disponible para Mac OS X, Linux o cualquier sistema operativo tipo UNIX.
Usuarios de Windows deben usar [pik][5] para proyectos similares o considerar
RubyInstaller, descrito en la siguiente sección.

Al escribir estas líneas, debes poder instalar RVM con:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Para obtener las últimas instrucciones para instalar RVM, comprueba [la página
de instalación de RVM][7]. El comando anterior te instalará RVM y la última versión
de Ruby. RVM puede instalar la mayoría de las implementaciones de Ruby listadas
anteriormente. Para ver todas las versiones soportadas, ejecuta `rvm list known`.

### RubyInstaller

Si estás en Windows, hay un gran proyecto para ayudarte a instalar Ruby:
[RubyInstaller][8]. Permite tener todo lo que necesites para tener un entorno
de desarrollo de Ruby en Windows.

Para usar RubyInstaller, descargalo desde la [página de descarga de RubyInstaller][9].
Después es sólo un instalador, y ya está listo.

Si estás instalando Ruby para usar Rails, puedes usar los siguientes instaladores:

* [RailsInstaller][10] el cual usa RubyInstaller pero incluye herramientas
  extra para ayudarte al desarrollo de Rails.
* [Bitnami Ruby Stack][rubystack] el cual provee un entorno de desarrollo
  completo para Ruby On Rails. Soporta Windows, OS X, Linux, máquinas virtuales
  e imágenes en la nube.

### Sistemas de gestión de paquetes

Si no puedes compilar Ruby por tu cuenta, y no quieres usar una herramienta de
terceros, puedes usar el sistema de gestión de paquetes para instalar Ruby.

Algunos miembros de la comunidad de Ruby creen firmemente que no debes usar nunca
el sistema de gestión de paquetes para instalar Ruby, y debes usar RVM. Mientras
que la lista de pros y contras queda fuera del objetivo de esta página, la razón
básica es que la mayoría de gestores de paquetes tienen versiones antiguas de Ruby
en sus repositorios. Si prefieres usar la última versión de Ruby, asegúrate de usar
el nombre correcto del paquete o usar RVM en su caso.

#### Ruby en Linux

##### Debian o Ubuntu

Debian GNU/Linux o Ubuntu usa el sistema de gestión de paquetes apt. Puedes usar
algo como esto:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Sí, esto instalará Ruby 1.9.2 o más reciente. Tiene una ‘versión de librería de
compatibilidad’ de 1.9.1, de ahí el nombre.

Si instalas el paquete ‘ruby’, podrías estar obteneiendo la antigua versión 1.8, dependiendo
de la distribución.

##### Arch Linux

Arch Linux usa el gestor de paquetes llamado pacman. Para obtener Ruby, haz lo
siguiente:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

##### Fedora

Fedora utiliza el gestor de paquetes yum. Puedes usar algo como esto:

{% highlight sh %}
$ su -c "yum install ruby"
{% endhighlight %}

La versión instalada sera normalmente la última versión de Ruby disponible
cuando la versión especifica de Fedora fue lanzada.

##### Otras Distribuciones

En otros sistemas puedes buscar utilizando gestor de paquetes de tu distribución de Linux, o quizá RVM podría ser la mejor opción para ti.

#### Ruby en Mac OS X

Ruby 1.8.7 está soportado en Mac OS X Lion así como muchas gemas de Ruby populares.
Para más detalles, consulta la [Wiki de Ruby en Mac OS Forge][11].

Mac OS X Tiger incluye la version 1.8.2 de Ruby, y Leopard contiene 1.8.6, pero
para aquellos que no han actualizado a Leopard, hay varias opciones para instalar la
última versión de Ruby.

Muchos usuarios de Mac OS X usan [Homebrew][12] como gestor de paquetes. Es fácil
instalar Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Ya que OS X está basado en Unix, descargar e instalar Ruby desde las fuentes es tan
fácil y efectivo como otras soluciones. Para ayudar con la instalación de nuevas
versiones de Ruby en OS X, es probable que la mejor idea sea usar RVM. Ejecuta
`rvm notes` para información específica del sistema.

Para una información detallada para instalar Ruby (y Rails), los excelentes artículos
de Dan Benjamin [para Tiger][13], [para Leopard][14], y [para Snow Leopard][15] te
permitirán tenerlo funcionando muy rápidamente. En Lion, [este ariculo][16] puede
ayudarte.

#### Ruby en Solaris y OpenIndiana

Ruby 1.8.7 está disponible desde Solaris 8 hasta Solaris 10 en [Sunfreeware][17] y
Ruby 1.8.7 está disponible en [Blastwave][18]. Ruby 1.9.2p0 está también disponible
en [Sunfreeware][17], pero está desactualizado. Usando RVM puedes obtener la
última versión de Ruby.

Para instalar Ruby en [OpenIndiana][19], usa el cliente del [Image Packaging System,
o IPS][20]. Esto isntallará los últimos binarios de Ruby y RubyGems directamente
desde el repositorio de OpenSolaris para Ruby 1.9. Es fácil:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Como antes, RVM es la mejor forma de obtener la última versión de Ruby.

### Otras implementaciones de Ruby

Ruby, como lenguaje, tienes diferentes implementaciones. En esta guía se ha
discutido la implementación de referencia, **MRI** ("Matz's Ruby Interpreter")
o **Cruby**, pero hay también otras.
Pueden ser útiles en ciertas situaciones, o características especiales que MRI
no tiene.

Esta es la lista:

* [JRuby][21] es Ruby sobre JVM (Java Virtual Machine), utilizando
  compiladores optimizados JIT, recolectores de basura, hilos concurrentes,
  ecosistema de herramientas y una gran colección de librerías.
* [Rubinius][22] es ‘Ruby escrito en Ruby’. Construido sobre LLVM,
  Rubinius usa una ingeniosa máquina virtual sobre la que otros lenguajes están siendo
  construidos también.
* [MacRuby][23] es Ruby que está integrado con la librería Cocoa de Apple,
  permitiendo escribir aplicaciones de escritorio con facilidad.
* [mruby][mruby] es una implementación ligera de Ruby que puede ser embebido con
  una aplicación. Está liderado por el creador de Ruby Yukihiro "Matz" Matsumoto.
* [IronRuby][26] es una implementación "integrada con la plataforma .NET".
* [MagLev][27] es una implementación "rápida, estable, integrada con persistencia
  de objetos y una caché compartida distribuida"
* [Cardinal][24] es un "compilador de Ruby para la máquina virtual [Parrot][25]"
  (Perl 6).

Algunas de estas implementaciones, incluyendo MRI, siguen las pautas de [RubySpec][28],
una "completa especificación ejecutable para el lenguaje de programación Ruby".



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[old-gz]:      {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[rubystack]: http://bitnami.com/stack/ruby/installer
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
[mruby]: http://www.mruby.org/
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
