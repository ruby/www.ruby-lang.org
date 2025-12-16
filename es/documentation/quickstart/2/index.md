---
layout: page
title: "Ruby en 20 minutos"
lang: es

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby en 20 minutos</h1>

---

¿Qué tal si queremos decir “Hola” muchas veces sin cansar nuestros dedos
con el teclado? ¡Necesitamos definir un método!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hola Mundo"
irb(main):012:1> end
=> nil
{% endhighlight %}

La expresión `def h` inicia la definición del método. Le dice a Ruby que
estamos definiendo un método, cuyo nombre es `h`. La siguiente línea es
el cuerpo del método, la misma expresión que vimos anteriormente: `puts
"Hola Mundo"`. Finalmente, la última línea `end` la dice a Ruby que
terminamos de definir el método. La respuesta de Ruby `=> nil` nos
comunica que él sabe que terminamos de definir el método.

## Las breves y repetitivas vidas de un método

Ahora intentemos ejecutar ese método algunas veces:

{% highlight irb %}
irb(main):013:0> h
Hola Mundo
=> nil
irb(main):014:0> h()
Hola Mundo
=> nil
{% endhighlight %}

Bien, eso fue fácil. Ejecutar un método en Ruby es tan fácil como sólo
mencionar su nombre. Si el método no requiere parámetros para
ejecutarse, eso es todo lo que necesitas. Puedes agregar paréntesis
vacíos, pero no son necesarios.

¿Y qué tal si queremos saludar sólo a una persona y no a todo el mundo?
Simplemente redefine `h` para que tome un nombre como parámetro.

{% highlight irb %}
irb(main):015:0> def h(nombre)
irb(main):016:1> puts "Hola #{nombre}"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hola Matz
=> nil
{% endhighlight %}

Así que eso funciona… pero tomémonos un segundo para ver más en detalle
qué es lo que está sucediendo.

## Reservando espacios en un String

¿Qué significa la expresión `#{nombre}`? Esa es la forma que tiene Ruby
para insertar algo en un String. La expresión entre las llaves es
transformada en un String (si todavía no lo es) y posteriormente
sustituida en ese punto del String que la contiene. También puedes usar
esto para asegurarte que el nombre comience con mayúscula:

{% highlight irb %}
irb(main):019:0> def h(nombre = "Mundo")
irb(main):020:1> puts "Hola #{nombre.capitalize}"
irb(main):021:1> end
=> nil
irb(main):022:0> h "pedro"
Hola Pedro
=> nil
irb(main):023:0> h
Hola Mundo
=> nil
{% endhighlight %}

Algunos otros trucos para destacar. Uno es que otra vez estamos llamando
al método sin utilizar los paréntesis. Si lo que quieres hacer es obvio,
los paréntesis son opcionales. El otro truco es el parámetro por defecto
`Mundo`. Esto significa “si no se provee un nombre, utiliza el nombre
por defecto `"Mundo"`”.

## Convirtiéndolo en un Anfitrión

¿Qué hacemos si queremos tener un anfitrión más “en serio”? Uno que
recuerde tu nombre, te dé la bienvenida y te trate con respeto. Puedes
querer utilizar un objeto para eso. Vamos a crear la clase “Anfitrion” (ojo, sin acento)

{% highlight irb %}
irb(main):024:0> class Anfitrion
irb(main):025:1>   def initialize(nombre = "Mundo")
irb(main):026:2>     @nombre = nombre
irb(main):027:2>   end
irb(main):028:1>   def decir_hola
irb(main):029:2>     puts "Hola #{@nombre}"
irb(main):030:2>   end
irb(main):031:1>   def decir_adios
irb(main):032:2>     puts "Adiós #{@nombre}, vuelve pronto."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

La nueva palabra clave aquí es `class`. Esto define una nueva clase
llamada Anfitrion y un par de métodos para esa clase. También toma nota
de `@nombre`. Esta es una variable de instancia y está disponible para
todos los métodos de la clase. Como puedes ver es utilizada por
`decir_hola` y `decir_adios`.

¿Así que cómo hacemos para que esta clase Anfitrion nos sea de utilidad?
[Crea un objeto](../3/).
