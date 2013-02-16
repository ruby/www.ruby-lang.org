---
layout: page
title: "Descarga Ruby"
lang: es
---

Aquí puedes obtener las últimas distribuciones de Ruby en tu sabor
favorito. La versión estable actual es {{ site.downloads.stable.version }}.
Por favor asegúrate de leer la [licencia de Ruby](/es/about/license.txt).

### El código fuente de Ruby

Instalar desde los fuentes es una buena solución para cuando te sientes
confiado con tu plataforma y puedas necesitar configuraciones
específicas para tu entorno. También es una buena solución en el caso de
que no existan paquetes disponibles.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5 }}) Stable Version (*recommended*)
* [Snapshot estable][2] This is tar’ed and gzip’ed file of the latest
  stable SVN. It should be better than the last stable release.
* [Snapshot diario][3] This is tar’ed and gzip’ed file of the latest
  SVN. It may contain unfixed problems.

### Ruby en Windows

Hay varias opciones para instalar Ruby en la plataforma Windows. La
primera opción es usar [RubyInstaller][4], un instalador que contiene
los binarios compilados y sus librerías de soporte. La segunda opción es
el descargar los binarios compilados. Si no estás seguro sobre cómo
instalar Ruby, RubyInstaller puede ser tu mejor opción. (Además de Ruby,
el one-click installer incluye un montón de bibliotecas).

### RVM

La herramienta mas popular para instalar Ruby en sistemas derivados de
Unix es RVM. Es decir, “Ruby Versión Manager”. No solo hace que instalar
Ruby sea increíblemente sencillo sino que támbien permite gestionar
múltiples copias de Ruby en un sistema e incluso alternar estas con las
diferentes implementaciones existentes.

Para instalar RVM es indispensable tener instalado [git][5]. Una vez
cumplido este requisito se utilizara el siguiente comando.

    $ bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
{: .code .sh-code}

Para obtener información actualizada del proceso de instalación de RVM
la mejor opción es visitar su [pagina de instalación][6].

### Ruby en Linux

Dependiendo de la distribución que utilices, hay varias maneras de
instalar Ruby. La primer opción es simplemente bajar el código fuente y
compilarlo a mano. Pero en algunas plataformas, hay gestores de paquetes
que hacen la instalación de Ruby extremadamente sencilla.

Debian/Ubuntu:

    % sudo apt-get install ruby irb rdoc
{: .code .sh-code}

Archlinux:

    # pacman -S ruby
{: .code .sh-code}

Gentoo/Sabayon/Funtoo Linux:

    # emerge ruby
{: .code .sh-code}

### Ruby en OS X

Hay una cantidad de opciones en la plataforma Macintosh OS X para
instalar la última versión de Ruby. [Locomotive][7] es una buena opción
si estás buscando algo que rápidamente te permita desarrollar con Rails.
El uso de [DarwinPorts][8] o [Fink][9] puede ser mejor para las personas
con más conocimientos técnicos.

En DarwinPorts, puedes instalar Ruby con…

    % port install ruby
{: .code .sh-code}

Fink tiene una interfaz gráfica (usando Fink Commander) para instalar
Ruby.

También, como OS X está basado en Unix, descargar e instalar desde el
código fuente es tan fácil y efectivo como las otras soluciones.

Para ver en más detalle la instalación de Ruby (y Rails), el excelente
artículo de Dan Benjamin [*Building Ruby, Rails, LightTPD, and MySQL on
Tiger*][10] te ayudará a lograrlo rápidamente.

*Nota: tanto Ruby 1.8.6 como Rails deberían venir preinstalados con la
siguiente versión de Mac OS X, Leopard (actualmente en beta). ([Más
información aquí][11]). Con suerte, cuando Leopard salga las cosas
“simplemente funcionarán” como vienen.*



[1]: {{ site.downloads.stable.url }}
[2]: {{ site.downloads.stable_snapshot.url }}
[3]: {{ site.downloads.nightly_snapshot.url }}
[4]: http://rubyinstaller.org 
[5]: http://git-scm.com/ 
[6]: https://rvm.beginrescueend.com/rvm/install/ 
[7]: http://locomotive.raaum.org/ 
[8]: http://darwinports.opendarwin.org/ 
[9]: http://fink.sourceforge.net/ 
[10]: http://hivelogic.com/articles/2005/12/01/ruby_rails_lighttpd_mysql_tiger 
[11]: http://weblog.rubyonrails.org/2006/8/7/ruby-on-rails-will-ship-with-os-x-10-5-leopard 
