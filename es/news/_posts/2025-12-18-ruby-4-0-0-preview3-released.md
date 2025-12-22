---
layout: news_post
title: "Publicado Ruby 4.0.0 preview3"
author: "naruse"
translator: vtamara
date: 2025-12-18 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
Nos complace anunciar la publicación de Ruby {{ release.version }}.
Ruby 4.0 introduce Ruby::BOX y "ZJIT", y agrega muchas mejoras.

## Ruby::BOX

Una nueva característica (experimental) para dar separación en definiciones.
Vea detalles de "Ruby Box" en [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
[[Característica #21311]] [[Misc #21385]]

## Cambios en el lenguaje

* `*nil` ya no llama a `nil.to_a`, de forma similar a como `**nil`
  no llama a `nil.to_hash`. [[Característica #21047]]

* Los operadores binarios lógicos (`||`, `&&`, `and` and `or`) al comienzo
  de una línea continúan la línea anterior, cómo un punto fluido.
  Los siguientes dos códigos son iguales:

    ```ruby
    if condicion1
       && condicion2
      ...
    end
    ```

    ```ruby
    if condicion1 && condicion2
      ...
    end
    ```

    [[Característica #20925]]

## Actualizaciones a las clases principales

Nota: Sólo listamos actualizaciones mayores a clases.

* Kernel

* `Kernel#inspect` ahora comprueba la existencia del método `#instance_variables_to_inspect`,
lo que permite controlar qué variables de instancia se muestran en la cadena `#inspect`:

```ruby
class DatabaseConfig
def initialize(host, user, password)
@host = host
@user = user
@password = password
end

private def instance_variables_to_inspect = [:@host, :@user]
end

conf = DatabaseConfig.new("localhost", "root", "hunter2")
conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
```

[[Característica #21219]]

* Se eliminó un comportamiento obsoleto: la creación de procesos mediante `Kernel#open` con un
`|` inicial. [[Característica #19630]]

* Binding

* `Binding#local_variables` ya no incluye parámetros numerados.
Además, `Binding#local_variable_get` y `Binding#local_variable_set` rechazan
manejar parámetros numerados. [[Error #21049]]

* File

* `File::Stat#birthtime` ahora está disponible en Linux a través de la llamada al sistema statx
cuando el kernel y el sistema de archivos lo admiten.
[[Característica #21205]]

* IO

* `IO.select` acepta `Float::INFINITY` como argumento de tiempo de espera.
[[Característica #20610]]

* Se eliminó un comportamiento obsoleto: la creación de procesos mediante métodos de clase `IO`
con un `|` inicial. [[Característica #19630]]

* Math

* Se agregaron `Math.log1p` y `Math.expm1`. [[Característica #21527]]

* Method

* `Method#source_location`, `Proc#source_location` y
`UnboundMethod#source_location` ahora devuelven información de ubicación extendida
con 5 elementos: `[ruta, línea_inicio, columna_inicio,
línea_fin, columna_fin]`. El formato anterior de dos elementos `[ruta,
línea]` aún se puede obtener llamando a `.take(2)` sobre el resultado.
[[Característica #6012]]

* Proc

* `Proc#parameters` ahora muestra los parámetros opcionales anónimos como `[:opt]`
en lugar de `[:opt, nil]`, lo que hace que la salida sea coherente con el caso en que el
parámetro anónimo es obligatorio. [[Error #20974]]

* Ractor

* Se agregó la clase `Ractor::Port` para un nuevo mecanismo de sincronización
para la comunicación entre Ractors. [[Característica #21262]]

```ruby
port1 = Ractor::Port.new
port2 = Ractor::Port.new
Ractor.new port1, port2 do |port1, port2|
port1 << 1
port2 << 11
port1 << 2
port2 << 12
end
2.times{ p port1.receive } #=> 1, 2
2.times{ p port2.receive } #=> 11, 12
```

`Ractor::Port` proporciona los siguientes métodos:

* `Ractor::Port#receive`
* `Ractor::Port#send` (o `Ractor::Port#<<`)
* `Ractor::Port#close`
* `Ractor::Port#closed?`

Como resultado, se eliminaron `Ractor.yield` y `Ractor#take`.

* Se agregaron `Ractor#join` y `Ractor#value` para esperar la
finalización de un Ractor. Estos son similares a `Thread#join`
y `Thread#value`.

* Se agregaron `Ractor#monitor` y `Ractor#unmonitor` como interfaces de bajo nivel
utilizadas internamente para implementar `Ractor#join`.

* `Ractor.select` ahora solo acepta Ractors y Ports. Si se proporcionan Ractors,
devuelve un valor cuando un Ractor finaliza.

* Se agregó `Ractor#default_port`. Cada `Ractor` tiene un puerto predeterminado,
que es utilizado por `Ractor.send` y `Ractor.receive`. * Se eliminaron `Ractor#close_incoming` y `Ractor#close_outgoing`.

* Se introdujeron `Ractor.shareable_proc` y `Ractor.shareable_lambda`
para crear objetos Proc o lambda compartibles.
[[Característica #21550]], [[Característica #21557]]

* Range

* `Range#to_set` y `Enumerator#to_set` ahora realizan comprobaciones de tamaño para evitar
problemas con rangos infinitos. [[Falla #21654]]

* `Range#overlap?` ahora maneja correctamente los rangos infinitos (sin límites).
[[Falla #21185]]

* Se corrigió el comportamiento de `Range#max` en rangos de enteros sin límite inferior.
[[Falla #21174]] [[Falla #21175]]

* Ruby

* Se ha definido un nuevo módulo de nivel superior `Ruby`, que contiene
constantes relacionadas con Ruby. Este módulo estaba reservado en Ruby 3.4
y ahora está definido oficialmente. [[Característica #20884]]

* Ruby::Box

* Una nueva característica (experimental) para proporcionar separación entre definiciones.
Para obtener detalles sobre "Ruby Box", consulte [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
[[Característica #21311]] [[Misc #21385]]

* Set

* `Set` ahora es una clase principal, en lugar de una clase de la biblioteca estándar de carga automática.
[[Característica #21216]]

* `Set#inspect` ahora devuelve una cadena adecuada para `eval`, utilizando la
sintaxis `Set[]` (por ejemplo, `Set[1, 2, 3]` en lugar de
`#<Set: {1, 2, 3}>`). Esto lo hace coherente con otras clases de colecciones principales
como Array y Hash. [[Característica #21389]]

* Pasar argumentos a `Set#to_set` y `Enumerable#to_set` ahora está obsoleto.
[[Característica #21390]]

* Socket

## JIT

* ZJIT
    * Se agregó un compilador JIT experimental basado en métodos.
      Use `--enable-zjit` en `configure` para habilitar el soporte `--zjit`.
    * A partir de Ruby 4.0.0-preview2, ZJIT aún no está listo para acelerar
      la mayoría de los benchmarks.
      Por favor, absténgase de evaluar ZJIT por el momento. Manténgase
      atento al lanzamiento de Ruby 4.0.

* YJIT
    * Estadísticas de YJIT
        * `ratio_in_yjit` ya no funciona en la compilación predeterminada.
            Use `--enable-yjit=stats` en `configure` para habilitarlo
            con `--yjit-stats`.
        * Se agregó `invalidate_everything` a las estadísticas
            predeterminadas, que se incrementa cuando TracePoint invalida
            todo el código.
    * Se agregaron las opciones `mem_size:` y `call_threshold:` a
      `RubyVM::YJIT.enable`.
* RJIT
    * Se eliminó `--rjit`. Trasladaremos la implementación de la API JIT de
      terceros al repositorio [ruby/rjit](https://github.com/ruby/rjit).


* ZJIT
    * Se introduce un [compilador JIT experimental basado en métodos](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
      Para habilitar soporte `--zjit`, compile Ruby con Rust 1.85.0 o
      posterior.
    * En Ruby 4.0.0, ZJIT es tan rápido como el interprete, pero aún no
      tan rápido como YJIT.
      Animamos a experimentar con ZJIT, pero advertimos no desplegarlo
      en producción por ahora.
    * Nuestra meta es hacer ZJIT más rápido que YJIT y listo para
      producción en Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` ya no funciona en la compilación predeterminada.
            Use `--enable-yjit=stats` en `configure` para habilitarlo
            con `--yjit-stats`.
        * Se agregó `invalidate_everything` a las estadísticas
            predeterminadas, que se incrementa cuando TracePoint invalida
            todo el código.
    * Se agregaron las opciones `mem_size:` y `call_threshold:` a
      `RubyVM::YJIT.enable`.
* RJIT
    * Se eliminó `--rjit`. Trasladaremos la implementación de la API JIT de
      terceros al repositorio [ruby/rjit](https://github.com/ruby/rjit).


## Cambios varios

Consulte [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o le[registro de commits](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}) para obtener más detalles.

Con estos cambios, ¡[{{ release.stats.files_changed }} archivos modificados, {{ release.stats.insertions }} inserciones (+), {{ release.stats.deletions }} eliminaciones (-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
desde Ruby 3.4.0!


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

## What is Ruby

Ruby fue desarrollado por primera vez por Matz (Yukihiro Matsumoto) en 1993,
y actualmente se desarrolla como software de código abierto. Se ejecuta en
múltiples plataformas y se utiliza en todo el mundo, especialmente para el
desarrollo web.

[Característica #6012]: https://bugs.ruby-lang.org/issues/6012
[Característica #15408]: https://bugs.ruby-lang.org/issues/15408
[Característica #17473]: https://bugs.ruby-lang.org/issues/17473
[Característica #18455]: https://bugs.ruby-lang.org/issues/18455
[Característica #19630]: https://bugs.ruby-lang.org/issues/19630
[Falla #19868]:     https://bugs.ruby-lang.org/issues/19868
[Característica #19908]: https://bugs.ruby-lang.org/issues/19908
[Característica #20610]: https://bugs.ruby-lang.org/issues/20610
[Característica #20724]: https://bugs.ruby-lang.org/issues/20724
[Característica #20750]: https://bugs.ruby-lang.org/issues/20750
[Característica #20884]: https://bugs.ruby-lang.org/issues/20884
[Característica #20925]: https://bugs.ruby-lang.org/issues/20925
[Característica #20971]: https://bugs.ruby-lang.org/issues/20971
[Falla #20974]:     https://bugs.ruby-lang.org/issues/20974
[Característica #21047]: https://bugs.ruby-lang.org/issues/21047
[Falla #21049]:     https://bugs.ruby-lang.org/issues/21049
[Característica #21166]: https://bugs.ruby-lang.org/issues/21166
[Falla #21174]:     https://bugs.ruby-lang.org/issues/21174
[Falla #21175]:     https://bugs.ruby-lang.org/issues/21175
[Falla #21185]:     https://bugs.ruby-lang.org/issues/21185
[Característica #21205]: https://bugs.ruby-lang.org/issues/21205
[Característica #21216]: https://bugs.ruby-lang.org/issues/21216
[Característica #21219]: https://bugs.ruby-lang.org/issues/21219
[Característica #21258]: https://bugs.ruby-lang.org/issues/21258
[Característica #21262]: https://bugs.ruby-lang.org/issues/21262
[Característica #21275]: https://bugs.ruby-lang.org/issues/21275
[Característica #21287]: https://bugs.ruby-lang.org/issues/21287
[Característica #21311]: https://bugs.ruby-lang.org/issues/21311
[Característica #21347]: https://bugs.ruby-lang.org/issues/21347
[Característica #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Característica #21389]: https://bugs.ruby-lang.org/issues/21389
[Característica #21390]: https://bugs.ruby-lang.org/issues/21390
[Característica #21459]: https://bugs.ruby-lang.org/issues/21459
[Característica #21527]: https://bugs.ruby-lang.org/issues/21527
[Característica #21550]: https://bugs.ruby-lang.org/issues/21550
[Característica #21557]: https://bugs.ruby-lang.org/issues/21557
[Falla #21654]:     https://bugs.ruby-lang.org/issues/21654
