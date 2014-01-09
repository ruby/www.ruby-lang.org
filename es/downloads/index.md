---
layout: page
title: "Descarga Ruby"
lang: es
---

Aquí puedes obtener las últimas distribuciones de Ruby en tu sabor
favorito. La versión estable actual es {{ site.downloads.stable.version }}.
Por favor asegúrate de leer la [licencia de Ruby]({{ site.license.url }}).
{: .summary}

### Tres formas de instalar Ruby

Puedes obtener una copia de Ruby de distintas formas y personas distintas pueden
preferir uno de los tres métodos por diferentes razones. Cada forma tendrá una
sección a continuación, pero aquí hay un resumen:

* **Compilar desde las fuentes** es la forma estándar con la que el software ha
  sido distribuido desde hace muchos, muchos años. Esta será la forma más común
  para un mayor número de desarrolladores de software.
* Hay algunas **herramientas de terceros** para instalar Ruby. Estas son a menudo
  más simples para novatos o hasta los usuarios más avanzados.
* Finalmente, algunos **sistemas de gestión de paquetes** soportan Ruby. Esta será
  la forma más familiar para personas que usan un sistema operativo para todo y 
  prefieren acogerse a esos stándares individuales.

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

* [Ruby {{ site.downloads.stable.version }}][ruby21]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Versión Estable (*recomendada*)
* [Ruby {{ site.downloads.previous.version }}][ruby20]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Versión Previa
* [Ruby {{ site.downloads.previous19.version }}][ruby19]
  (md5:&nbsp;{{ site.downloads.previous19.md5.gz }}) Versión Previa 1.9
* [Snapshot estable][3] Ultima versión (*estable*) del repositorio (ruby\_2\_1).
* [Snapshot diario][4] Ultima versión de lo que exista en SVN, hecho diariamente.
  Puede contener errores, ¡úsalo bajo tu responsabilidad!

Para información sobre los repositorios de Subversion y Git, consulta nuestra página
[Ruby core](/es/community/ruby-core/).

### Mirror sites

El código fuente de Ruby está disponible desde un conjunto de mirror sites a lo largo
del mundo. Intenta usar el mirror site más cerca de ti.

#### Mirror sites via HTTP

* [CDN][mirror-http-cdn] (fastly.com)
* [Japón 1][mirror-http-jp1] (Master) - HTTPS
* Japón 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-http-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-http-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-http-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-http-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-http-jp-ring-airnet]
  * [maffin.ad.jp][mirror-http-jp-ring-maffin]
* [Gran Bretaña][mirror-http-uk] (The Mirror Service)
* [Alemania][mirror-http-de] (AmbiWeb GmbH)
* [Bélgica][mirror-http-be] (Easynet)
* [Dinamarca][mirror-http-dk] (sunsite.dk)
* [Holanda][mirror-http-nl] (XS4ALL) - only release packages
* [EEUU 1][mirror-http-us1] (ibiblio.org)
* [EEUU 2][mirror-http-us2] (lcs.mit.edu)
* [EEUU 3][mirror-http-us3] (binarycode.org)
* [EEUU 4][mirror-http-us4] (online-mirror.org)
* [EEUU 5][mirror-http-us5] (trexle.com)
* [Austria][mirror-http-at] (tuwien.ac.at)
* [Taiwan 1][mirror-http-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-http-tw2] (ftp.cs.pu.edu.tw)
* [China 1][mirror-http-cn] (ruby.taobao.org)

#### Mirror sites via FTP

* [Japón 1][mirror-ftp-jp1] (Master: ruby-lang.org)
* Japón 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-ftp-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-ftp-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-ftp-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-ftp-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-ftp-jp-ring-airnet]
  * [maffin.ad.jp][mirror-ftp-jp-ring-maffin]
* [Japón 3][mirror-ftp-jp3] (IIJ)
* [Corea del Sur][mirror-ftp-kr] (Korea FreeBSD Users Group)
* [Alemania][mirror-ftp-de] (FU Berlin)
* [Gran Bretaña][mirror-ftp-uk] (The Mirror Service)
* [Bélgica][mirror-ftp-be] (Easynet)
* [Rusia][mirror-ftp-ru] (ChgNet)
* [Grecia][mirror-ftp-gr] (ntua.gr)
* [Dinamarca][mirror-ftp-dk] (sunsite.dk)
* [EEUU 1][mirror-ftp-us1] (ibiblio.org)
* [EEUU 2][mirror-ftp-us2] (lcs.mit.edu)
* [Austria][mirror-ftp-at] (tuwien.ac.at)
* [Taiwan 1][mirror-ftp-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-ftp-tw2] (ftp.cs.pu.edu.tw)
* [Canadá][mirror-ftp-ca] (mirror.cs.mun.ca)

#### Mirror sites via rsync

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Gran Bretaña)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Dinamarca)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canadá)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

### Herramientas de terceros

Muchos usuarios de Ruby usan herramientas de terceros para ayudarles a instalar Ruby. 
Tienen varias ventajas pero no son oficialmente soportadas. Sin embargo, sus respectivas 
comunidades son de gran ayuda.

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

Si estás instalando Ruby para usar Rails, puedes usar [RailsInstaller][10] el cual
usa RubyInstaller pero incluye herramientas extra para ayudarte al desarrollo de
Rails.

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

[ruby21]: {{ site.downloads.stable.url.gz }}
[ruby20]: {{ site.downloads.previous.url.gz }}
[ruby19]: {{ site.downloads.previous19.url.gz }}
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
[mirror-http-cdn]: http://cache.ruby-lang.org/pub/ruby/
[mirror-http-jp-ring-shibaura-it]: http://ring.shibaura-it.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-tohoku]: http://ring.tains.tohoku.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-u-toyama]: http://ring.u-toyama.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-yamanashi]: http://ring.yamanashi.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-airnet]: http://ring.airnet.ne.jp/archives/lang/ruby/
[mirror-http-jp-ring-maffin]: http://ring.maffin.ad.jp/archives/lang/ruby/
[mirror-https-jp]: https://ftp.ruby-lang.org/pub/ruby/
[mirror-http-uk]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-http-de]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[mirror-http-be]: http://ruby.mirror.easynet.be/
[mirror-http-dk]: http://mirrors.sunsite.dk/ruby/
[mirror-http-nl]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[mirror-http-us1]: http://www.ibiblio.org/pub/languages/ruby/
[mirror-http-us2]: http://xyz.lcs.mit.edu/ruby/
[mirror-http-us3]: http://www.binarycode.org/ruby/
[mirror-http-us4]: http://www.online-mirror.org/ruby/
[mirror-http-us5]: http://ruby.trexle.com/
[mirror-http-at]: http://gd.tuwien.ac.at/languages/ruby/
[mirror-http-tw1]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[mirror-http-tw2]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-http-cn]: http://ruby.taobao.org/mirrors/ruby/
[mirror-ftp-jp1]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-shibaura-it]: ftp://ring.shibaura-it.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-tohoku]: ftp://ring.tains.tohoku.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-u-toyama]: ftp://ring.u-toyama.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-yamanashi]: ftp://ring.yamanashi.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-airnet]: ftp://ring.airnet.ne.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-maffin]: ftp://ring.maffin.ad.jp/pub/lang/ruby/
[mirror-ftp-jp3]: ftp://ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-kr]: ftp://ftp.kr.freebsd.org/pub/ruby/
[mirror-ftp-de]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[mirror-ftp-uk]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-be]: ftp://ftp.easynet.be/ruby/ruby/
[mirror-ftp-ru]: ftp://ftp.chg.ru/pub/lang/ruby/
[mirror-ftp-gr]: ftp://ftp.ntua.gr/pub/lang/ruby/
[mirror-ftp-dk]: ftp://sunsite.dk/mirrors/ruby/
[mirror-ftp-us1]: ftp://www.ibiblio.org/pub/languages/ruby/
[mirror-ftp-us2]: ftp://xyz.lcs.mit.edu/pub/ruby/
[mirror-ftp-at]: ftp://gd.tuwien.ac.at/languages/ruby/
[mirror-ftp-tw1]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[mirror-ftp-tw2]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-ftp-ca]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
