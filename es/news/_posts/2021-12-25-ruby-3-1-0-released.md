---
layout: news_post
title: "Publicado Ruby 3.1.0"
author: "naruse"
translator: vtamara
date: 2021-12-25 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Tenemos el gusto de anunciar la publicación de of Ruby {{ release.version }}.
Ruby 3.1 mantiene la compatibilidad con Ruby 3.0 y añade muchas
características nuevas.

## YJIT: Nuevo compilador experimental JIT en-proceso

Ruby 3.1 incorpora YJIT, un nuevo compilador JIT en-proceso desarrollado
por Shopify.

Desde que [Ruby 2.6 introdujo MJIT en 2018](https://www.ruby-lang.org/es/news/2018/12/25/ruby-2-6-0-released/),
su desempeño ha mejorado significativamente, y finalmente
[alcanzamos Ruby3x3 el año pasado](https://www.ruby-lang.org/es/news/2020/12/25/ruby-3-0-0-released/).
Pero aún cuando Optcarrot ha demostrado un impresionante aumento de velocidad,
el JIT no ha beneficiado aplicaciones de negocios del mundo real.

Recientemente Shopify contribuyó muchas mejoras a Ruby para aumentar la
velocidad de su aplicación Rails.
YJIT es una contribución importante y busca mejorar el desempeño de
aplicaciones rails.

Mientras MJIT es un compilador JIT basado-en-métodos que usa un
compilador de C externo, YJIT usa Versiones de Bloques Básicos e
incluye un compilador JIT.  Con Versiones de Bloques Básicos Perezosa
(Lazy Basic Block Versioning - LBBV), se compila primero el comienzo de
un método e incrementalmente se compila el resto a medida que el tipo de
los argumentos y variables son determinadas dinámicamente.  Ver una
introducción detallada en
[YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781).

Con esta tecnología, YJIT alcanza tanto un tiempo de calentamiento rápido como
mejoras en desempeño en la mayoría de software del mundo-real, hasta
22% en railsbench, 39% en liquid-render.

YJIT es aún una características experimental, y como tal,
está deshabilitado de manera predeterminada.  Si quiere usarlo,
especifique la opción `--yjit` en la línea de ordenes para habilitar
YJIT.  Por ahora está limitado a plataformas tipo Unix sobre x86-64.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>


## Gema debug: Un nuevo depurador

Se incluye un depurador completamente re-escrito [debug.gem](https://github.com/ruby/debug).
debug.gem cuenta con las siguientes características:

* Mejora el desempeño de la depuración (no relentiza la aplicación
  aún con el depurador activad)
* Soporta depuración remota
* Siporte interfaces de depuración ricas (por ahoras se soportan VSCode
  y el navegador Chrome)
* Soporta depuración multi-proceso / multi-hilos
* REPL con colres
* Y otras características como grabación y reproducción, posibilidad
  de hacer seguimiento y más.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby incluía lib/debug.rb, pero no estaba bien mantenido y tenía problemas
de desempeño y funcionalidad. debug.gem remplazó por completo a lib/debug.rb.


## error_highlight: Localización de errores afinada en las trazas

Se ha introducido una gema incorporada con Ruby, error_highlight. Proporciona
localización afinada de errores en la traza:

```
$ ruby prueba.rb
prueba.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Por el momento sólo soporta `NameError`.

Esta gema está habilitada de manera predeterminada. Puede deshabilitarla
desde la línea de ordenes con la opción `--disable-error_highlight`.
Ver detalles en [el repositorio](https://github.com/ruby/error_highlight).


## Aucompletación en IRB y Presentación de Documentación

El IRB ahora tienen una característica de autocompletación, que le permite
simplemente teclear algo de código y aparecerá un diálogo de
candidatos de completación.  Puede usar Tab y Shift+Tab para desplazar
arriba y abajo.

Si se ha instalado la documentación, cuando elija un candidato de completación,
aparecerá el diálogo de documentación junto al diálogo de candidatos de
completación, mostrando parte del contenido.  Puede leer la documentación
completa presionando Alt+d.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>


## Otras características nuevas y notables

### Lenguaje

* Pueden omitirse valores en literales de diccionarios y en argumentos de
  palabra reservada [Feature #14579]
  * `{x:, y:}` es azúcar sintáctica para `{x: x, y: y}`.
  * `foo(x:, y:)` es azúcar sintáctica para `foo(x: x, y: y)`.

* En reconocimiento de patrones el operador pin ahora toma una
  expresión [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```

* Se pueden omitir paréntesis en reconocimiento de patrones de un línea.
  [Feature #16182]

```ruby
[0, 1] => _, x
{y: 2} => y:
x #=> 1
y #=> 2
```

### RBS

RBS es un lenguaje para describir la estructura de programas Ruby.
Ver detalles en [el repositorio](https://github.com/ruby/rbs).

Actualizaciones desde Ruby 3.0.0:

* Los tipos de parámetros genéricos pueden acotarse. ([PR](https://github.com/ruby/rbs/pull/844)).
*  Se soportan aliases de tipos genéricos. ([PR](https://github.com/ruby/rbs/pull/823))
* Se introduce `rbs collection` para administrar RBSs de gemas.
  [doc](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Se han añadido/actualizado muchas firmas para librerías incorporadas y de
  la librería estándar.
* Incluye soluciones a muchas fallas, así como mejoras de desempeño.

Ver más informaciń en [el archivo CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md).


### TypeProf

TypeProf es un analizador de tipos estático para Ruby. Genera un prototipo
en RBS a partir de código Ruby sin anotaciones de tipos.  Ver detalles en
[la documentación](https://github.com/ruby/typeprof/blob/master/doc/doc.md).

La principla actualización desde Ruby 3.0.0 es un soporte experimental
para IDE llamado "TypeProf para IDE".

![Demo de TypeProf para IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

La extensión vscode presenta la signatura adivinada de un método (o escrita
explicitamente en un archivo RBS), subraya en rojo el código que podría
causar un error de nombre o de tipo, y completa los nombres de métodos
(i.e, muestra métodos candidatos). Ver detalles en
[la documentación](https://github.com/ruby/typeprof/blob/master/doc/ide.md) in detail.

También, esta versión incluye muchas correcciones a fallas y mejoras
en desempeño.


## Mejoras en desempeño

* MJIT
  * Para cargas de trabajo como Rails, se cambia `--jit-max-cache` de 100
    a 10000.
    El compilador JIT ya no se salta la compilación de métodos con más de
    1000 instrucciones.
  * Para soportar Zeitwerk de Rails, el código compilado con JIT ya no
    se cancela cuando se encuentra habilitado un TracePoint para eventos
    de clase.


## Otros cambios notables desde 3.0

* Reconocimiento de patrones en una línea, e.g., `ary => [x, y, z]`, ya no es
  experimental.
* Se ha cambiado levemente el orden de evaluación de asignaciones múltiples.
  [[Falla #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` era evaluado en el orden `baz`, `qux`, `foo`,
    y después `bar` en Ruby 3.0. En Ruby 3.1, se evalúa en el orden
    `foo`, `bar`, `baz`, y después `qux`.
* Localización de Ancho Variable: Cadenas (experimental)
  [[Falla #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0 cambia `Psych.load` como `safe_load` al método por omisión.
  Puede necesitar usar Psych 3.3.2 para cambiar este comportamiento.
  [[Falla #17866]](https://bugs.ruby-lang.org/issues/17866)

### Actualizaciones a las bibliotecas estándar

*   Se actualizan las siguiente gemas predeterminadas
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
*   Se actualizan las siguiente gemas incorporadas.
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
*   Las siguientes gemeas predeterminadas ahora son gemas incorporadas.
    Debe añadir las siguiente librerías en el `Gemfile` en entornos con
    bundler.
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0


Ver más detalles en el archivo [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en la [bitácora de cambios](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}).


Desde Ruby 3.0.0 hay
[{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminacion(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)!

¡Feliz Navidad, Felices Fiestas y disfrute programando con Ruby 3.1!


## Descargas

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Qué es Ruby

Ruby fue desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora se desarrolla como código abierto. Corre sobre diversas plataformas
y se usa en todo el mundo especialmente para desarrollo web.
