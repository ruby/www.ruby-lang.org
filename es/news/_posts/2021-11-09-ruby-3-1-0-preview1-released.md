---
layout: news_post
title: "Publicado Ruby 3.1.0 versión previa 1"
author: "naruse"
translator: vtamara
date: 2021-11-09 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby {{ release.version }}.

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}


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

Mientras MJIT es un compilador JIT basado-en-métodos y usa un
compilador de C externo, YJIT usa Versiones de Bloques Básicos e
incluye un compilador JIT.  Con Versiones de Bloques Básicos Perezosa
(Lazy Basic Block Versioning - LBBV), que primero compilan el comienzo de
un método e incrementalmente compila el resto a medida que el tipo de
los argumentos y variables se determina dinámicamente.  Ver una introducción
detallada en
[YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781).

Con esta tecnología, YJIT alcanza tanto un tiempo de calentamiento rápido como
mejoras en desempeño en la mayoría de software del mundo-real, hasta
22% en railsbench, 39% en liquid-render.

<!-- 試す人向けのお知らせ -->

YJIT es aún una características experimental, y como tal,
está deshabilitado de manera predeterminada.  Si quiere usarlo,
especifique la opción `--yjit` en la línea de ordenes que habilita
YJIT.  Por ahora está limitado a macOS & Linux sobre plataformas
x86-64.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## Gema debug: Un nuevo depurador

Se incluye un nuevo depurador [debug.gem](https://github.com/ruby/debug).
debug.gem es una implementación de un depurador rápido que provee muchas
características tales como depuración remota, REPL con colores, integración
con IDE (VSCode) entre otras.
Remplaza la librería estándar `lib/debug.rb`.

## error_highlight: Localización de errores afinada en las trazas

Se ha incluido un gema con Ruby, error_highlight. Proporciona
localización afinada de errores en la traza:

```
$ ruby prueba.rb
prueba.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Esta gema está habilitada de manera predeterminada. Puede deshabilitarla
desde la línea de ordenes con la opción `--disable-error_highlight`.
Ver detalles en [el repositorio](https://github.com/ruby/error_highlight).

## Mejoras a Irb

Se describirán en la siguiente versión previa.

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


### RBS

RBS es un lenguaje para describir la estructura de programas Ruby.
Ver detalles en [el repositorio](https://github.com/ruby/rbs).

Actualizaciones desde Ruby 3.0.0:

* se introduce `rbs collection` para administrar RBSs de gemas.
  [doc](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Se han añadido/actualizado muchas características incorporadas y de
  la librería estándar.
* Incluye soluciones a muchas fallas, así como mejoras de desempeño.

Ver más informaciń en [el archivo CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md).

### TypeProf

TypeProf es un analizador de tipos estático para Ruby. Genera un prototipo
en RBS a partir de código Ruby sin anotaciones de tipos.  Ver detalles en
[el documento](https://github.com/ruby/typeprof/blob/master/doc/doc.md).

Actualizaciones desde Ruby 3.0.0:

* Se ha implementado [soporte experimental para IDE](https://github.com/ruby/typeprof/blob/master/doc/ide.md).
* Muchas correcciones a fallas y mejoras de desempeño.

## Mejoras de desempeño

* MJIT
  * Para cargas de trabajo como Rails, se cambia `--jit-max-cache` de 100
    a 10000.
    El compilador JIT ya no se salta la compilación de métodos con menos de
    1000 instrucciones.
  * Para soportar Zeitwerk de Rails, el código compilado con JIT ya no
    se cancela cuando se habilita un TracePoint para eventos de clase.

## Otros cambios notables desde 3.0

* Reconocimiento de patrones en una línea, e.g., `ary => [x, y, z]`, ya no es
  experimental.
* Se ha cambiado levemente el orden de evaluación de asignaciones múltiples.
  [[Bug #4443]]
  * `foo[0], bar[0] = baz, qux` era evaluado en el orden `baz`, `qux`, `foo`,
    y después `bar` en Ruby 3.0. En Ruby 3.1, se evalúa en el orden
    `foo`, `bar`, `baz`, y después `qux`.
* Localización de ancho variable: Cadenas (experimental)
  [[Falla #18239]](https://bugs.ruby-lang.org/issues/18239)

### Actualizaciones a la librería estándar

* Se actualizaron algunas librerías estándar
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* Se actualizaron las siguientes gemas incluidas en Ruby
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* Las siguientes gemas por omisión ahora son ahora gemas incluidas en Ruby.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

Ver más detalles en
[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o [en la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}).

Con esos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones (-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
desde Ruby 3.0.0!

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

Ruby fue desarrollado inicialmente pof Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como Código Abierto. Corre en múltiples
plataformas y se usa en todo el mundo especialmente para desarrollo web.
