---
layout: page
title: "Descarga Ruby"
lang: es
---

Aquí puedes obtener las últimas distribuciones de Ruby en tu sabor
favorito. La versión estable actual es 1.9.2-p0. Por favor asegúrate de
leer la [licencia de Ruby](/es/about/license.txt).

### El código fuente de Ruby

Instalar desde los fuentes es una buena solución para cuando te sientes
confiado con tu plataforma y puedas necesitar configuraciones
específicas para tu entorno. También es una buena solución en el caso de
que no existan paquetes ya armados para tu plataforma.

* [Ruby 1.9.2-p180][1] (md5:  0d6953820c9918820dd916e79f4bfde8) Stable
  Version (*recommended*)
* [Snapshot estable][2] This is tar’ed and gzip’ed file of the latest
  stable SVN. It should be better than the last stable release.
* [Snapshot diario][3] This is tar’ed and gzip’ed file of the latest
  SVN. It may contain unfixed problems.

### Ruby en Windows

Hay varias opciones para instalar Ruby en la plataforma Windows. La
primer opción es usar [RubyInstaller][4], un instalador que contiene los
binarios compilados y sus librerías de soporte. La segunda opción es el
descargar los binarios compilados. Si no estás seguro sobre cómo
instalar Ruby, RubyInstaller puede ser tu mejor opción. (Además de Ruby,
el one-click installer incluye un montón de bibliotecas).

* [Ruby 1.8.6-p398 RubyInstaller][5]
  (md5: 233d6b3ddc4c61436b075b51254cd138) Stable version
* [Ruby 1.8.7-p334 RubyInstaller][6]
  (md5: 64e30e63e16028282fcfe3ec57b561dc) Stable version (*recomendada*)
* [Ruby 1.9.1-p430 RubyInstaller][7]
  (md5: 86ac589a955898c3163b161d81750a05) Stable version
* [Ruby 1.9.2-p180 RubyInstaller][8]
  (md5: 2c94aef50987416d64c85a4ea0fa428b) Stable version (*recomendada*)
* [Ruby 1.8.7-p249 Binary][9] (md5: 4fd37b0b4b21a042cae7f5f0a8daad16)
  Stable version
* [Ruby 1.9.1-p378 Binary][10] (md5: 7d14a918cc8d243d3e2c409aff41f454)
  Stable version
* [Ruby 1.9.1-p129-x64 Binary][11] Versión estable rama 1.9 64 bits

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
instalar la última versión de Ruby. [Locomotive][12] es una buena opción
si estás buscando algo que rápidamente te permita desarrollar con Rails.
El uso de [DarwinPorts][13] o [Fink][14] puede ser mejor para las
personas con más conocimientos técnicos.

En DarwinPorts, puedes instalar Ruby con…

    % port install ruby
{: .code .sh-code}

Fink tiene una interfaz gráfica (usando Fink Commander) para instalar
Ruby.

También, como OS X está basado en Unix, descargar e instalar desde el
código fuente es tan fácil y efectivo como las otras soluciones.

Para ver en más detalle la instalación de Ruby (y Rails), el excelente
artículo de Dan Benjamin [*Building Ruby, Rails, LightTPD, and MySQL on
Tiger*][15] te ayudará a lograrlo rápidamente.

*Nota: tanto Ruby 1.8.6 como Rails deberían venir preinstalados con la
siguiente versión de Mac OS X, Leopard (actualmente en beta). ([Más
información aquí][16]). Con suerte, cuando Leopard salga las cosas
“simplemente funcionarán” como vienen.*



[1]: ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p180.tar.gz 
[2]: ftp://ftp.ruby-lang.org:21//pub/ruby/ruby-1.9-stable.tar.gz 
[3]: ftp://ftp.ruby-lang.org/pub/ruby/snapshot.tar.gz 
[4]: http://rubyinstaller.org 
[5]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe 
[6]: http://rubyforge.org/frs/download.php/74293/rubyinstaller-1.8.7-p334.exe 
[7]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe 
[8]: http://rubyforge.org/frs/download.php/74298/rubyinstaller-1.9.2-p180.exe 
[9]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p249-i386-mswin32.zip 
[10]: ftp://ftp.ruby-lang.org:21/pub/ruby/binaries/mswin32/ruby-1.9.1-p378-i386-mswin32.zip 
[11]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.9.1-p129-x64-mswin64_80.zip 
[12]: http://locomotive.raaum.org/ 
[13]: http://darwinports.opendarwin.org/ 
[14]: http://fink.sourceforge.net/ 
[15]: http://hivelogic.com/articles/2005/12/01/ruby_rails_lighttpd_mysql_tiger 
[16]: http://weblog.rubyonrails.org/2006/8/7/ruby-on-rails-will-ship-with-os-x-10-5-leopard 
