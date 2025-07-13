---
layout: page
title: "A Ruby desde Python"
lang: es
---

Python es otro lenguaje de programación de propósito general
muy agradable. Al pasar de Python a Ruby encontrarás que hay un poco
más de sintaxis por aprender que con Python.

### Similaridades

Como en Python, en Ruby...

* Existe un prompt interactivo (llamado `irb`).
* Puedes leer la documentación en la línea de comandos (con el
comando `ri` en vez de `pydoc`).
* No hay caracter de terminación de línea (excepto el usual
salto de línea).
* Las cadenas pueden expandirse a varias líneas como las cadenas
 de triple entrecomillas de Python.
* Los corchetes son para listas, y las llaves para diccionarios
  (los cuales son llamdos “hashes” en Ruby).
* Los Arreglos funcionan de forma similar (al sumarlos se hace uno
 más grande, pero una composición como esta
 `a3 = [ a1, a2 ]` crea un arreglo de arreglos).
* Los objetos están fuerte y dinámicamente tipados.
* Todo es un objeto, las variables son sólo referencias a objetos.
* Aunque las palabras claves son un poco diferentes, las excepciones
  funcionan casi del mismo modo.
* Tiene herramientas de documentación embebidas (la de Ruby se llama
  RDoc).
* Existe un buen soporte para programación funcional con
 funciones de primera clase, funciones anónimas, y clausuras.

### Diferencias

A diferencia de Python, en Ruby...

* Las cadenas son mutables.
* Puedes tener constantes (variables cuyo valor no pretendes sea modificado).
* Existen algunas convenciones sobre mayúsculas o minúsculas (por ejemplo, los
  nombres de las clases empiezan con mayúscula, las variables comienzan con
  minúscula).
* Existe sólo un tipo de contenedores para listas (Array), y es mutable.
* Las cadenas con doble comilla permiten secuencias de escape (como `\t`)
  y una sintaxis especial de "expresiones de substitución" (lo que permite
  insertar los resultados de una expresión Ruby directamente en otra cadena
  sin tener que `"sumar" + "cadenas " + "con operadores"`). Las cadenas
  con comilla sencilla son idénticas a los `r"raw strings"` de Python.
* No existe un “nuevo” o “viejo” estilo para definir clases. Sólo uno.
  (Python 3+ no tiene este problema, pero no es completamente compatible
  con Python 2).
* Nunca tienes acceso directo a atributos. En Ruby todo se basa en ejecutar
  métodos.
* Los paréntesis en las llamadas a los métodos usualmente son opcionales
  y a menudo son omitidos.
* Existen `public`, `private`, y `protected` para restringir el acceso a
  métodos, en vez de la `_convencion_ __voluntaria__` de Python del
  guion bajo.
* Se usan los “mixins” en vez de la herencia múltiple.
* Puedes agregar o modificar los métodos de las clases nativas. Ambos
  lenguajes permiten abrir y modificar clases en cualquier momento, pero
  Python previene la modificación de clases nativas - Ruby no.
* Tienes `true` y `false` en vez de `True` y `False` (y `nil`
  en vez de `None`).
* Sólo `false` y `nil` son falsos en las condiciones lógicas. Todo lo demás
  es verdadero (incluido `0`, `0.0`, `""`, y `[]`).
* Es `elsif` en vez de `elif`.
* Es `require` en vez de `import`. Por otro lado, su uso es el mismo.
* El estilo habitual de comentarios es *sobre* la(s) línea(s)
  (en vez de los docstrings debajo de estas) para generar la documentación.
* Hay un cierto número de atajos que, a pesar de que tendrías más cosas
  que recordar, aprenderás rápido. Estos tienden a hacer Ruby divertido y
  muy productivo.
* No existe una forma de quitar una variable una vez que ha sido establecida
  (como el comando `del` de Python). Puedes poner una variable a `nil`,
  permitiendo que el contenido anterior sea tomado por el recolector de basura,
  pero la variable permanecerá en la tabla de símbolos por el tiempo que
  siga en su alcance.
* La palabra clave `yield` se comporta de manera diferente. En Python
  retornará la ejecución al ambiente de la función que invocó.
  El código externo es reponsable de reiniciar la función. En Ruby `yield`
  ejecutará otra función que ha sido pasada como argumento final, y
  continuará inmediatamente.
* Python soporta sólo un tipo de funciones anónimas: lambdas, mientras que
  Ruby tiene bloques, Procs y lambdas.
