---
layout: page
title: "Ruby en 20 minutos"
lang: es

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby en 20 minutos</h1>

---

## Introducción

Este es un pequeño tutorial de Ruby que no debería tomar más de 20
minutos completarlo. Se asume que ya tienes instalado Ruby.
(Si no tienes Ruby funcionando en tu computadora, [instálalo][installation]
antes de comenzar).

## Ruby interactivo

Ruby incluye un programa que mostrará el resultado de cualquier
comando Ruby que le introduzcas. Jugar con código Ruby en una sesión
interactiva como ésta es una manera estupenda de aprender el lenguaje.

Arranca el IRB.

* Si estás usando **macOS** abre una `Terminal` y escribe `irb`,
  después presiona enter.
* Si estás usando **Linux**, abre una `Terminal` y escribe `irb`,
  después presiona enter.
* Si estás usando **Windows**, abre `Interactive Ruby` desde la sección Ruby
  de tu Menú de Inicio.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Bien, ahora está abierto. ¿Y ahora qué?

Escribe esto: `"Hola Mundo"`

{% highlight irb %}
irb(main):001:0> "Hola Mundo"
=> "Hola Mundo"
{% endhighlight %}

## ¡Ruby te obedeció!

¿Qué fue lo que pasó? ¿Acaso acabamos de escribir el programa “Hola
Mundo” más corto del mundo? No exactamente. La segunda línea sólo es la
forma que tiene IRB para decirnos el resultado de la última expresión
evaluada. Si queremos que el programa escriba “Hola Mundo” necesitamos
un poco más:

{% highlight irb %}
irb(main):002:0> puts "Hola Mundo"
Hola Mundo
=> nil
{% endhighlight %}

`puts` es el comando básico para escribir algo en Ruby. Pero entonces,
¿qué es ese `=> nil`? Ese es el resultado de la expresión. `puts`
siempre retorna `nil`, que es el valor que significa “absolutamente
nada” en Ruby.

## Tu calculadora gratis está aquí

Pronto, tenemos suficiente para usar IRB como una calculadora básica:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Tres más dos. Bastante fácil. ¿Y qué tal tres *veces* dos? Podrías
escribirlo, es bastante corto, pero también podrías subir y simplemente
cambiar lo que ya ingresaste. Prueba presionando la **flecha hacia
arriba** en tu teclado y verifica si aparece la línea con `3+2` escrito.
Si es así, puedes usar la **flecha hacia la izquierda** para
posicionarte junto al signo `+` y cambiarlo por un `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Ahora intentemos tres al cuadrado:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

En Ruby `**` es la forma que tienes para decir “elevado al”. ¿Y qué tal
si quieres hacer lo inverso y encontrar la raíz cuadrada de algo?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Bien, esperen, ¿qué fue eso? Si adivinaste, “fue la forma de averiguar
la raíz cuadrada de nueve”, estás en lo cierto. Pero veamos las cosas un
poco más de cerca. Antes que nada, ¿qué es `Math`?

## Módulos, agrupa el código por tópicos

`Math` es un módulo incluido para matemáticas. Los módulos tienen dos
roles en Ruby. Esto muestra uno de sus roles: agrupar métodos similares
bajo un nombre familiar. `Math` también tiene métodos como `sin()` y
`tan()`.

Después de `Math` hay un punto. ¿Cuál es la función del punto? El punto
es la forma de identificar al receptor de un mensaje. ¿Qué es un
mensaje? En este caso es `sqrt(9)`, que significa “llama al método
`sqrt`”, abreviación de “square root” (raíz cuadrada) con el parámetro
`9`.

El resultado de la llamada a este método es el valor `3.0`. Notarás que
no es simplemente `3`. Eso es porque la mayoría de las veces la raíz
cuadrada de un número no será un número entero, así que el método
siempre retorna un número flotante.

¿Y qué pasa si queremos recordar el resultado de algunas de estas
operaciones? Asigna el resultado a una variable.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Por más bueno que esté esto de la calculadora, nos estamos alejando del
tradicional mensaje `Hola Mundo` en el que se supone que los cursos para
principiantes deben enfocarse… [así que volvamos a eso](2/).

[installation]: /es/documentation/installation/
