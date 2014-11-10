---
layout: page
title: "Bibliotecas"
lang: es
---

{% include out-of-date.html %}

Existen fascinantes, útiles y variadas bibliotecas para Ruby, muchas
disponibles como un conveniente archivo *gem*. Otras bibliotecas son
liberadas como directorios comprimidos (.zip o .tar.gz) de código
fuente. Veamos cómo encontrar e instalar bibliotecas para que puedas
utilizarlas.
{: .summary}

### Encontrando bibliotecas

[**RubyGems**][1] es la herramienta preferida por la comunidad para
distribuir código. Por lo general, las gemas tienen links hacia la
documentación e información sobre los desarrolladores, así que es un
buen punto de partida para comenzar a explorar el mundo Ruby.

Muchos proyectos utilizan [**GitHub**][2] para albergar sus
repositorios. Puedes explorar el site para conocer más sobre cada
librería y para colaborar.

[**RubyForge**][3] cayó en desuso en los últimos años y ya no es una
fuente confiable. Antes de RubyGems y GitHub, era el mejor lugar para
buscar librerías de Ruby. Un buen lugar para navegar es su [mapa de
software][4], donde se listan las bibliotecas por tópico. (Si terminas
creando tus propias bibliotecas, puedes [registrar][5] tu proyecto en
RubyForge para obtener acceso gratuito a Subversion, espacio web y
listas de correo).

Otro site que cayó en desuso es el [**Ruby Application Archive**][6] (o
RAA). Se trata de un directorio de software Ruby de todo tipo,
categorizado por su funcionalidad. En este momento, la categoría [Base
de Datos][7] (Database) tiene la mayor cantidad de items, liderando
sobre [Red][8] (Net) por 1. [HTML][9] y [XML][10] también son populares.
Incluso hay 4 items sobre [Física][11].

### Usando RubyGems

Mientras que el instalador de Windows incluye RubyGems, muchos sistemas
operativos no lo hacen. Aprende cómo instalar RubyGems aquí debajo si
estos comandos no te funcionan.

#### Buscando gemas

El comando **search** puede ser usado para buscar gemas con determinado
nombre. Para buscar la palabra “html” en el nombre de una gema:

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

(*La opción `--remote` / `-r` indica que estamos buscando entre las gemas
oficiales de RubyForge*).

#### Instalando una gema

Una vez que sabes qué gema te gustaría **instalar**\:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

Incluso puedes instalar una versión específica de la biblioteca
utilizando la opción `--version`.

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### Listando todas las gemas

Para obtener una **lista** completa de las gemas en RubyForge:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

Para listar sólo las gemas que tienes instaladas, quita la
opción—remote.

{% highlight sh %}
$ gem list
{% endhighlight %}

Para obtener más información sobre el uso de RubyGems, estudia [la
documentación oficial][12] que incluye ejemplos de cómo usar gemas en
tus programas Ruby.

### Cómo instalar RubyGems

Para instalar RubyGems, sigue las instrucciones que se detallan en
[https://rubygems.org/pages/download][13].



[1]: https://rubygems.org/
[2]: https://github.com/
[3]: http://rubyforge.org/
[4]: http://rubyforge.org/softwaremap/trove_list.php
[5]: http://rubyforge.org/register/
[6]: http://raa.ruby-lang.org/
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML
[10]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML
[11]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics
[12]: http://guides.rubygems.org
[13]: https://rubygems.org/pages/download
