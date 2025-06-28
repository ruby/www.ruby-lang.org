---
layout: news_post
title: "Publicado Ruby 3.4.0"
author: "naruse"
translator: vtamara
date: 2024-12-25 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Nos complace anunciar la publicación de Ruby {{ release.version }}.
Ruby 3.4 añade la referencia a parámetros de bloque `it`, cambia Prism
como analizador sintáctico predeterminado, agrega soporte para
Happy Eyeballs Version 2 a la librería de zócales, mejora YJIT,
agrega recolector de basura modular, y otros cambios.

## Se introduce `it`

`it` se agrega para referenciar un parámetro de bloque sin un nombre de
variable. [[Característica #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` se comporta de manera muy similar a `_1`. Cuando la intención es usar
sólo `_1` en un bloque, el potencial de otros parámetros numerados tales
como `_2` aparece para imponer una carga cognitiva extra para los lectores.
Así que `it` se introdujo como un sobrenombre práctico.  Use `it` en casos
simples donde `it` hable por si mismo, tales como bloques de una sola linea.

## Prism es ahora el analizador sintáctico predeterminado

Cambia el analizador sintáctico predeterminado de parse.y a Prism.
[[Característica #20564]]

Esta es una mejora interna y debería corresponder a un cambio mínimo
visible al usuario.  Si nota algún problema de compatibilidad, por favor
reportelo.

Para usar el analizador convencional, use el argumento para la línea de
ordenes `--parser=parse.y`.

## La librería de sockets ahora incluye la característica Happy Eyeballs Version 2 (RFC 8305)

La librería de sockets ahora incluye [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305),
la última versión estandarizada de una aproximación ampliamente adoptada para
mejorar la conectividad en muchos lenguajes de programación,  en
`TCPSocket.new` (`TCPSocket.open`) y `Socket.tcp`.
Esta mejora le permite a Ruby proveer conexiones de red eficientes y robustas,
adaptadas a los ambientes de internet modernos.

Hasta Ruby 3.3, estos métodos efectuaban resolución den nombres e intentos de
conexión de manera serial.  Con este algoritmo, estos ahora operan así:

1. Efectuar la resolución de nombres IPv6 e IPv4 concurrentemente
2. Intentar la conexión con las direcciones IP resueltas, priorizando IPv6,
   con intentos en paralelo escalonados en intervalos de 250ms
3. Retornar la primera conexión exitosa mientras cancela cualquier otra

Esto asegura que se minimizan demoras en la conexión, aún si el protocolo
especificado o la dirección IP se demoran o no están disponible.
Esta característica esta habilita de manera predeterminada, así que no
se requiere configuración adicional para usarla.  Para deshabilitarla,
establezca la variable de ambiente `RUBY_TCP_NO_FAST_FALLBACK=1` o llame
`Socket.tcp_fast_fallback=false`.
O deshabilitarlas por método, usando el argumento de palabra clave
`fast_fallback: false`.

## YJIT

### TL;DR

* Mejor resultado en la mayoría de pruebas de desempeño tanto en plataformas
  x86-64 como en arm64.
* Uso de memoria reducido mediante meta-datos comprimidos y un límite
  de memoria unificado.
* Se corrigen diversas fallas: YJIT es ahora más robusto y mejor probado.

### Nuevas características

* Opciones en la línea de ordenes
  * `--yjit-mem-size` introudce un límite de memoria unificado
    (128MiB predeterminado) para hacer seguimiento al uso total de
    memoria de YJIT, siendo una alternativa más intuitiva respecto
    a la opción anterior `--yjit-exec-mem-size`.
  * `--yjit-log` permite que la bitácora de compilación haga seguimiento
    a lo que se compila.
* API de Ruby
  * `RubyVM::YJIT.log` da acceso a la cola de la bitácora de compilación
    en tiempo de ejecución.
* Estadísticas YJIT
  * `RubyVM::YJIT.runtime_stats` ahora da estadísticas adicionales de
     invalidación, compilación en línea y codificación de meta-datos.

### Nuevas optimizaciones

* Añade soporte para constantes compartidas en modo multi-ractor.
* Ahora puede hacer seguimiento a la cuenta de salidas con
  `--yjit-trace-exits=COUNTER`

### Nuevas optimizaciones:
* El contexto comprimido reduce la memoria requerida para almacenar los
  metadatos de YJIT.
* Localiza registros para variables locales y para argumentos de métodos.
* Cuando YJIT está habilitado, usa más primitivas fundamentales escritas
  en Ruby:
  * `Array#each`, `Array#select`, `Array#map` reescritas en Ruby para dar
     mejor desempeño [[Caracteristica #20182]].
* Habilidad de ejecutar en línea métodos pequeños/triviales tales como:
  * Métodos vacios.
  * Métodos que retornan una constante.
  * Métodos que retornan self.
  * Métodos que retornan directamente un argumento.
* Codegen especializado para muchos más métodos en tiempo de ejecución.
* Optimiza `String#getbyte`, `String#setbyte` y otros métodos de string.
* Optimiza operaciones entre bits para acelerar las manipulaciones de
  bits/bytes a bajo nivel.
* Otra optimizaciones incrementales diversas.


## Recolector de basura modular

* Pueden cargarse dinámicamente implementaciones alternativas del recolector
  de basura (__Garbage Collector__ o __GC__) mediante la característica
  recolector de basura modular.  Para habilitar esta característica
  configure Ruby con `--with-modular-gc` durante la compilación.
  Las librerías del GC pueden cargarse en tiempo de ejecución con la
  variable de ambiente `RUBY_GC_LIBRARY`. [[Característica #20351]]

* El recolector de basura incorporado en Ruby se ha dividido en un archivo
  `gc/default/default.c` que interacuta con Ruby usando la API definida en
  `gc/gc_impl.h`. El recolector de basura incorporado ahora puede ser compilado
  como librería usando `make modular-gc MODULAR_GC=default` y se habilita
  con la variable de ambiente `RUBY_GC_LIBRARY=default`. [[Característica#20470]]

* Se provee una librería de GC experimental en [MMTk](https://www.mmtk.io/).
  Esta librería de GC puede compilarse usando `make modular-gc MODULAR_GC=mmtk`
  y se habiita usando la variable de ambiente `RUBY_GC_LIBRARY=mmtk`.
  Esto requiere las herramientas de Rust en el computador donde se compila.
  [[Característica#20860]]


## Cambios en el lenguaje

* Las cadenas literales en archivos sin el comentario `frozen_string_literal`
  ahora emiten una advertencia de deprecación cuando se mutan.
  Estas advertencia pueden ser habilitadas con `-W:deprecated`
  o estableciendo `Warning[:deprecated] = true`.
  Para deshabilitar este cambio, puede ejecutar Ruby con el argumento
  `--disable-frozen-string-literal` desde la línea de ordenes.
  [[Característica #20205]]

* Ahora se soporta hacer splat de palabras clave con `nil` cuando se
  llaman métodos.
  `**nil` se trata de manera similar a `**{}`, no pasar palabras clave,
  y no llamar método de conversión alguno.  [[Falla #20064]]

* Ya no se permite pasar bloques como índices.  [[Falla #19918]]

* Ya no se permiten argumentos de palabra clave como índices.  [[Falla #20218]]

* El nombre de nivel superior `::Ruby` ahora es reservao, y su definición
  producirá una adverencia `Warning[:deprecated]`.  [[Característica #20884]]

## Clases fundamentales actualizadas

Nota: Listamos sólo actualizaciones notables a las clases fundamentales.

* Exception

  * `Exception#set_backtrace` ahora acepta arreglos de
    `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` y `Fiber#raise` también aceptan
    este nuevo formato. [[Característica #13557]]

* GC

    * `GC.config` agregado para establecer variables de configuración del
      recolector de basura. [[Característica #20443]]

    * Se introdujo el parámetro de configuración del GC
      `rgengc_allow_full_mark`.  Cuando es `false`
      el GC sólo marcará objetos jóvenes.
      De manera predeterminada es `true`.  [[Característica #20443]]

* Ractor

    * Se permite `require` en un Ractor. El proceso requerido se ejecutará
      en el Ractor principal.
      Se añade `Ractor._require(feature)` para ejecutar procesos requeridos
      en el Ractor principal. [[Característica #20627]]

    * Se agrega `Ractor.main?`. [[Característica #20627]]

    * `Ractor.[]` y `Ractor.[]=` se agregan para acceder al almacenamiento
      local del Ractor acutual. [[Característica #20715]]

    * `Ractor.store_if_absent(key){ init }` se añade para inicializar las
      variables locales del ractor de manera segura entre hilos.
      [[Característica #20875]]

* Range

  * `Range#size` ahora lanza `TypeError` si el rango no es iterable.
    [[Varios #18984]]


## Actualizaciones a la librería estándar

Nota: Listamos sólo actualizaciones notables a las librerías estándar.

* RubyGems
    * Se agrega la opción `--attestation` a gem push.
      Permite almacenar la firma a [sigstore.dev]

* Bundler
    * Se añade la configuración `lockfile_checksums` para incluir sumas de
      chequeo en archivos de bloqueo frescos
    * Se añade bundle lock `--add-checksums` para agregar sumas de chequeo
      a archivos de bloqueo existentes.

* JSON

    * Mejoras de desempeño a `JSON.parse` que resulta 1.5 veces más rápido
      que json-2.7.x.

* Tempfile

    * El argumento de palabra clave `anonymous: true` se implementa en
      `Tempfile.create`.
      `Tempfile.create(anonymous: true)` elimina inmediatamente el archivo
      temporal creado.
      Así que las aplicaciones no necesitan eliminarlo.
      [[Característica #20497]]

* win32/sspi.rb

    * Se extrajo esta librería del repositorio Ruby a [ruby/net-http-sspi].
      [[Característica #20775]]

Las siguientes gemas incluidas han sido promovidas a gemas predeterminadas:

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## Problemas de compatibilidad

Nota: Excluyendo correcciones a problemas en características.

* Los mensajes de error y la presentación de trazas han sido cambiadas.
  * Se usa un sólo apóstrofe en lugar de un apostrofe invertido para
    iniciar una cita. [[Característica #16495]]
  * Se presenta un nombre de clase antes del nombre de un método
   (sólo cuando la clase tiene un nombre permanente). [[Característica #19117]]
  * También se cambiaron de la manera análoga los métodos `Kernel#caller`,
    `Thread::Backtrace::Location`, etc.

  ```
  Antes:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  Ahora:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* Hash#inspect ha cambiado la forma de presentar información. [[Falla #20433]]

    * Las llaves símbolo se presentan usando la sintaxis moderna para
      llaves símbolo: `"{usuario: 1}"`
    * Otras llaves ahora tienen espacio alrededor de `=>`:
      `'{"usuario" => 1}'`, aunque antes no lo tenían: `'{"usuario"=>1}'`

* Kernel#Float() ahora acepta una cadena en decimal omitiendo la parte decimal. [[Característica #20705]]

  ```rb
  Float("1.")    #=> 1.0 (antes lanzaba ArgumentError)
  Float("1.E-1") #=> 0.1 (antes lanzaba ArgumentError)
  ```

* String#to_f ahora acepta una cadena decimal que omite la parte decimal.
  Note que el resultado cambia cuando se especifica un exponente.
  [[Característica #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (antes retornaba 1.0)
  ```

* Refinement#refined_class ha sido eliminada. [[Característica #19714]]

## Problemas de compatibilidad de la Librería Estándar

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=` y `DidYouMean::SPELL_CHECKERS.merge!`
      eliminadas.

* Net::HTTP

    * Se eliminaron las siguientes contantes despreciadas:
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      Estas constantes fueron despreciadas desde el 2012.

* Timeout

    * Rechaza valores negativos para Timeout.timeout. [[Falla #20795]]

* URI

    * Se cambió el analizador predeterminado compatible con el RFC 3986 por
      otro compatible con le con el RFC 2396. [[Falla #19266]]


## Actualizaciones del API en C

* Se han eliminado `rb_newobj` y `rb_newobj_of` (y los respectivos macros
  `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`).
  [[Característica #20265]]
* Se eliminó la función despreciada `rb_gc_force_recycle`.
  [[Característica #18290]]

## Cambios diversos

* Al pasar un bloque a un método que no use el bloque recibido se
  presentará una advertencia en modo verboso (`-w`).
  [[Característica #15554]]

* Al redefinir algunos métodos fundamentales que se han optimizado
  de manera especial por el interprete y por JIT como `String.freeze` o
  `Integer#+` ahora produce una advertencia en la clase de
  desempeño (`-W:performance` o `Warning[:performance] = true`).
  [[Característica #20429]]


Ver más detalles en
[NEWS]([NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
o en la [bitácora de contribuciones](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}).

Con estas novedades, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
desde Ruby 3.3.0!

¡Feliz navidad, felices fiestas, y disfrute programando con Ruby 3.4!

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

Ruby fu desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora se desarrolla como Fuentes Abiertas. Corre en múltiples
plataformas y se usa en todo el mundo especialmente para
de desarrollo de aplicaciones web.

[Característica #13557]: https://bugs.ruby-lang.org/issues/13557
[Característica #15554]: https://bugs.ruby-lang.org/issues/15554
[Característica #16495]: https://bugs.ruby-lang.org/issues/16495
[Característica #18290]: https://bugs.ruby-lang.org/issues/18290
[Característica #18980]: https://bugs.ruby-lang.org/issues/18980
[Varios #18984]:    https://bugs.ruby-lang.org/issues/18984
[Característica #19117]: https://bugs.ruby-lang.org/issues/19117
[Falla #19918]:     https://bugs.ruby-lang.org/issues/19918
[Falla #20064]:     https://bugs.ruby-lang.org/issues/20064
[Característica #20182]: https://bugs.ruby-lang.org/issues/20182
[Característica #20205]: https://bugs.ruby-lang.org/issues/20205
[Falla #20218]:     https://bugs.ruby-lang.org/issues/20218
[Característica #20265]: https://bugs.ruby-lang.org/issues/20265
[Característica #20351]: https://bugs.ruby-lang.org/issues/20351
[Característica #20429]: https://bugs.ruby-lang.org/issues/20429
[Característica #20470]: https://bugs.ruby-lang.org/issues/20470
[Característica #20564]: https://bugs.ruby-lang.org/issues/20564
[Característica #20860]: https://bugs.ruby-lang.org/issues/20860
[Falla #19266]:     https://bugs.ruby-lang.org/issues/19266
[Característica #19714]: https://bugs.ruby-lang.org/issues/19714
[Falla #19918]:     https://bugs.ruby-lang.org/issues/19918
[Falla #20064]:     https://bugs.ruby-lang.org/issues/20064
[Característica #20182]: https://bugs.ruby-lang.org/issues/20182
[Característica #20205]: https://bugs.ruby-lang.org/issues/20205
[Falla #20218]:     https://bugs.ruby-lang.org/issues/20218
[Característica #20265]: https://bugs.ruby-lang.org/issues/20265
[Característica #20351]: https://bugs.ruby-lang.org/issues/20351
[Característica #20429]: https://bugs.ruby-lang.org/issues/20429
[Característica #20443]: https://bugs.ruby-lang.org/issues/20443
[Característica #20470]: https://bugs.ruby-lang.org/issues/20470
[Característica #20497]: https://bugs.ruby-lang.org/issues/20497
[Característica #20564]: https://bugs.ruby-lang.org/issues/20564
[Falla #20620]: https://bugs.ruby-lang.org/issues/20620
[Característica #20627]: https://bugs.ruby-lang.org/issues/20627
[Característica #20705]: https://bugs.ruby-lang.org/issues/20705
[Característica #20715]: https://bugs.ruby-lang.org/issues/20715
[Característica #20775]: https://bugs.ruby-lang.org/issues/20775
[Falla #20795]: https://bugs.ruby-lang.org/issues/20795
[Característica #20860]: https://bugs.ruby-lang.org/issues/20860
[Característica #20875]: https://bugs.ruby-lang.org/issues/20875
[Característica #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
