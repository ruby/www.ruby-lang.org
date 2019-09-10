---
layout: page
title: "Bibliotecas"
lang: es
---

Como la mayoría de los lenguajes de programación, Ruby aprovecha un amplio conjunto de bibliotecas.
{: .summary}

Casi todas estas bibliotecas se lanzan en forma de **gema**, una biblioteca o aplicación empaquetada que se puede instalar con una herramienta llamado [**RubyGems**] [1].

RubyGems es un sistema de empaquetado de Ruby diseñado para facilitar la creación, el intercambio y la instalación de bibliotecas (de alguna manera, es un sistema de empaquetado similar a `apt-get`, pero dirigido a Ruby).
Ruby viene con RubyGems por defecto desde la versión 1.9, las versiones anteriores de Ruby requieren que RubyGems esté [instalado a mano] [2].

Otras bibliotecas se publican como directorios archivados (.zip o .tar.gz) de **código fuente**. Los procesos de instalación pueden variar, pero normalmente un archivo `README` o `INSTALL` se encuentra disponible con instrucciones.

Veamos cómo encontrar e instalar bibliotecas para que puedas
utilizarlas.

### Buscando bibliotecas

El lugar principal donde se alojan las bibliotecas es [**RubyGems.org**] [1], un repositorio público de gemas que se pueden buscar e instalar en su máquina.
Puede buscar gemas utilizando el sitio web RubyGems, o utilizando el comando `gem`.

Usando `gem search -r`, puedes buscar en el repositorio de RubyGems. Por ejemplo, `gem search -r rails` devolverá una lista de gemas relacionadas con Rails. Con la opción `--local` (`-l`), se realiza una búsqueda local de tus gemas instaladas localmente.
Para instalar una gema, use `gem install [gem]`. Parar listar sus gemas instaladas se utilizan `gem list`. Para obtener más información sobre el comando `gem`, vea más abajo o diríjase a [RubyGems’ docs] [3].

Existes ademas otras fuentes de bibliotecas.
[**GitHub**] [5] es el repositorio principal de contenido relacionado con Ruby. La mayoría de las veces, el código fuente de la gema se alojará en GitHub, publicándose también como una gema en RubyGems.org.

[**The Ruby Toolbox**] [6] es un proyecto que facilita la exploración de proyectos de código abierto de Ruby.
Tiene categorías para varias tareas de desarrollo, recopila mucha información sobre los proyectos y califica los proyectos según su popularidad en RubyGems.org y GitHub.
Esto hace que sea fácil encontrar una gema que resuelva un problema particular, como frameworks web, herramientas de documentación y bibliotecas de calidad de código.

### Unas palabras más sobre RubyGems

Daremos una revisión rápida del comando `gem` para su uso diario.
[Documentación más detallada] [7] se encuentra disponible, cubriendo todos sus aspectos.

#### Buscando entre las gemas disponibles

El comando **search** se puede usar para buscar gemas utilizando una string.
Las gemas cuyos nombres comiencen con la string especificada se listarán en la devolución.
Por ejemplo, para buscar las gemas relacionadas con “html”:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

La bandera `--remote` /` -r` indica que queremos inspeccionar el
repositorio oficial de RubyGems.org.
Con la bandera `--local` /` -l` realizarías una búsqueda local entre tus gemas instaladas.

#### Instalando una gema

Una vez que sepa qué gema le gustaría **instalar**, por ejemplo, el popular framework Ruby on Rails:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Incluso puede instalar solo una versión específica de la biblioteca, usando la bandera `--version` /` -v`:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Listado de todas las gemas

Para una **lista** de todas las gemas instaladas localmente:

{% highlight sh %}
$ gem list
{% endhighlight %}

Para obtener una lista (muy larga) de todas las gemas disponibles en RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### ¡Ayuda!

Para acceder a la documentación disponible dentro de su terminal:

{% highlight sh %}
$ gem help
{% endhighlight %}

Por ejemplo, `gem help commands` es muy útiles ya que lista de todos los comandos de `gem`.

#### Crear tus propias gemas

RubyGems.org tiene [varias guías] [3] sobre este tema. También es posible que desee investigar [Bundler] [9], una herramienta que le ayuda a administrar las dependencias de una aplicación y se puede usar junto con RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
