---
layout: page
title: "A Ruby desde Java"
lang: es
---

Java está maduro. Está probado. Y es rápido (contrariamente a lo que
todavía afirman las masas anti-java). También es bastante verborrágico.
Al ir de Java hacia Ruby, puedes esperar que el tamaño de tu código
disminuya considerablemente. También puedes esperar que te lleve menos
tiempo el armado de prototipos.

### Semejanzas

Como en Java, en Ruby…

* la memoria es manejada automáticamente mediante un colector de basura
  (garbage collector).
* los objetos son fuertemente tipados.
* hay métodos públicos, privados y protegidos.
* tiene herramientas de documentación embebidas (la de Ruby se llama
  RDoc). La documentación generada por rdoc se ve muy similar a la
  generada por javadoc.

### Diferencias

A diferencia de Java, en Ruby…

* no necesitas compilar tu código fuente. Directamente lo ejecutas.
* hay distintos conjuntos de herramientas para interfaz gráfica. Los
  usuarios de Ruby pueden probar con [WxRuby][1], [FXRuby][2],
  [Ruby-GNOME2][3], [Qt][4], o el Ruby Tk incluido, por ejemplo.
* se usa la palabra clave `end` después de definir clases, en vez de
  tener que poner llaves encerrando el código.
* tienes `require` en vez de `import`.
* todas las variables de instancia son privadas. Desde afuera, todo se
  accede usando métodos.
* los paréntesis en las llamadas a los métodos usualmente son opcionales
  y a menudo son omitidos.
* todo es un objeto, incluyendo los números como 2 y 3,14159.
* no hay validación estática de tipos de datos.
* los nombres de variables son sólo etiquetas. No tienen un tipo de dato
  asociado.
* no hay declaración de tipo de datos. Simplemente se asigna a nuevos
  nombres de variable a medida que se necesita (por ejemplo `a =
  [1,2,3]` en vez de `int[] a = {1,2,3};`).
* no hay transformación de tipos (casting). Simplemente se llama a los
  métodos. Tus pruebas unitarias deberían avisarte antes de que ejecutes
  el código si habrá una excepción.
* es `foo = Foo.new("hola")` en vez de `Foo foo = new Foo("hola")`.
* el constructor siempre se llama “initialize” en vez del nombre de la
  clase.
* tienes “mixins” en vez de interfaces.
* se tiende a favorecer el uso de YAML en vez de XML.
* es `nil` en vez de `null`.



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
