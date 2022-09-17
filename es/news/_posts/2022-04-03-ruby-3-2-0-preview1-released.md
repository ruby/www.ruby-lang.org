---
layout: news_post
title: "Publicado Ruby 3.2.0 versión previa 1"
author: "naruse"
translator: vtamara
date: 2022-04-03 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

Nos complace anunciar la publicación de Ruby {{ release.version }}. Ruby 3.2
agrega muchas características y mejoras en desempeño.

## Soporte para WebAssembly basado en WASI

Esta es un porte inicial del soporte para WebAssembly basado en WASI.
Esto permite que un binario de CRuby esté disponible en navegadores Web,
ambientes sin servidor Edge y otros empotrables WebAssembly/WASI.
Actualmente este porte pasa los juegos de pruebas básicas de bootstrap
que no usan el API de Threads.

![](https://i.imgur.com/opCgKy2.png)

### Trasfondo

[WebAssembly (Wasm)](https://webassembly.org/) fue introducido inicialmente
para ejecutar programas de manera segura y rápida en navegadores web.
Pero buena parte de su objetivo --ejecutar programar eficientemente y con
seguridad-- es anhelado hace tiempo no sólo para el web sino para aplicaciones
en general.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) fue diseñado
para ese caso de uso.  Aunque una aplicación necesita comunicarse con
el sistema operativo, WebAssembly corre en una máquina virtual que no tiene
una interfaz del sistema.  WASI lo estandariza.

El soporte para WebAssembly/WASI en ruby pretende aprovechar estos
proyectos.  Habilita a los desarrolladores de ruby para escribir aplicaciones
que corran en esa plataforma prometida.

### Caso de uso

Este soporte anima a los desarrolladores para que pueda utilizar
CRuby en ambientes WebAssembly.  Un ejemplo de un caso de uso es
el soporte CRuby del
[espacio de juego TryRuby](https://try.ruby-lang.org/playground/).
Ahora usted puede probar CRuby original en su navegador web.

### Puntos técnicos

Hoy en día WASI y WebAssembly carecen de algunas características para
implementar Fibras, excepciones y el Recolector de Basura porque aún está
evolucionado y también por razones de seguridad.
Así que CRuby llena ese vació mediante Asyncify, que es una técnica de
transformación binaria para controlar la ejecución en el espacio
del usuario.

Además, construimos un [Sistema Virtual de Archivos (VFS) sobre WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)
que permite empaquetar con facilidad aplicación Ruby en un sólo archivo
.wasm. Esto hace un poco más fácil la distribución de aplicaciones.


### Enlaces relacionados

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Temporizadore para Regexp

Se introduce una característica de temporizador durante concordancias de
expresiones regulares.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Se sabe que la concordancia de expresiones regulares puede tardar un tiempo
inesperadamente largo.  Si su código intenta concordar una expresión regular
posiblemente ineficiente con una cadena no confiable, un atacante podría
explotarlo para lograr una Denegación de Servicio efectiva (también llamada
Denegación de servicio por expresiones regulares o ReDoS).

El riesgo de Denegaciones de Servicio (DoS) puede prevenirse o mitigarse
significativamente al configurar `Regexp.timeout` de acuerdo a los
requerimientos de su aplicación Ruby.  Por favor pruébelo en su aplicación,
después le damos la bienvenida a su retroalimentación.

Observe que `Regexp.timeout` es una configuración global. Si quiere usar una
configuración del temporizador diferente para una cierta
expresión regular, puede usar la palabra reservada `timeout`
junto con `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

La propuesta original está en <https://bugs.ruby-lang.org/issues/17837>

## Otras características nuevas y notables

### Ya no se incluyen fuentes de terceros

* Ya no incluimos las fuentes de terceros como `libyaml` y `libffi`.

    * la fuente de `libyaml` fue eliminada de `psych`. Puede instalar
      `libyaml-dev` en plataformas Ubuntu/Debian. El nombre del
      paquete difiere en cada plataforma.

    * `libffi` será eliminado de `fiddle` durante la segunda versión previa.

### Lenguaje

* El patrón Find ya no es experimental.


## Mejoras en desempeño

## Otros cambios notables desde 3.1

* Hash
    * Hash#shift ahora siempre retorna nil si el hash está vacío,
      en lugar de retornar el valor predeterminado o llamar el
      proc predeterminado. [[Bug #16908]]

* MatchData
    * Se ha añadido `MatchData#byteoffset`. [[Feature #13110]]

* Modulos
    * Se ha añadido `Module.used_refinements`. [[Feature #14332]]
    * Se ha añadido `Module#refinements`. [[Feature #12737]]
    * Se ha añadido `Module#const_added`. [[Feature #17881]]

* Proc
    * `Proc#dup` retorna una instancia de subclase. [[Bug #17545]]
    * `Proc#parameters` ahora acepta la palabra reservada lambda. [[Feature #15357]]

* Refinamiento
    * Se ha añadido `Refinement#refined_class`. [[Feature #12737]]

* Conjuntos
    * `Set` ahora está disponible como una clase incorporada que no necesita
      `require "set"`. [[Feature #16989]]
      Ahora se llama de manera automática al usar la constante `Set` o con una
      llamada a `Enumerable#to_set`.

* Cadenas
    * Se han añadido `String#byteindex` y `String#byterindex`. [[Feature #13110]]
    * Se actualizó Unicode a la versión 14.0.0 y Emoji a la version 14.0. [[Feature #18037]]
      (también aplica para Regexp)
    * Se ha añadido `String#bytesplice`.  [[Feature #18598]]

* `Struct`
    * Una clase `Struct` también puede inicializarse con argumentos de
      palabra reservada sin `keyword_init: true` en `Struct.new` [[Feature #16806]]


### Actualizaciones a la librería estándar

*   Se actualizaron las siguientes gemas predeterminadas.

    * TBD

*   Se actualizaron las siguientes gemas incluidas.

    * TBD

*   Las siguientes gemas predeterminadas ahora son gemas incluidas (bundled).
    Debe agregar las siguientes librerías al `Gemfile` en entornos que usan
    `bundler`.

    * TBD

Ver más detalles en [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}).

Con esos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
desde Ruby 3.1.0!

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

## Lo que es Ruby

Ruby fue desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como Código Abierto. Corre en múltiples plataformas
y se usa en todo el mundo especialmente para desarrollo web.
