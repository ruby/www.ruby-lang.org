---
layout: page
title: "Ruby en 20 minutos"
lang: es

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby en 20 minutos</h1>

---

Así que, investigando nuestro programa, notarás que las primeras líneas
comienzan con un numeral (#). En Ruby, todo lo que esté detrás de un
numeral es un comentario y es ignorado por el intérprete. La primera
línea del archivo es un caso especial y en los sistemas operativos del
estilo Unix determina cómo ejecutar el archivo. El resto de los
comentarios están únicamente para aportar claridad al significado del
código.

Nuestro método `decir_hola` se ha vuelto un poco más complicado:

{% highlight ruby %}
# Decirle hola a todos
def decir_hola
  if @nombres.nil?
    puts "..."
  elsif @nombres.respond_to?("each")
    # @nombres es una lista de algún tipo,
    # ¡así que podemos iterar!
    @nombres.each do |nombre|
      puts "Hola #{nombre}"
    end
  else
    puts "Hola #{@nombres}"
  end
end
{% endhighlight %}

Ahora usa el atributo `@nombres` para tomar decisiones. Si es `nil`, sólo
imprime tres puntos. No hay razón para saludar a nadie, ¿cierto?

## Iterando

Si el objeto `@nombres` responde al método `each`, es algo sobre lo que
se puede iterar, así que iteramos entre sus elementos y saludamos a cada
uno de sus integrantes. Finalmente, si `@nombres` es otra cosa, dejamos
que automáticamente se convierta en un string y usamos el saludo por
defecto.

Veamos ese iterador en más detalle:

{% highlight ruby %}
@nombres.each do |nombre|
  puts "Hola #{nombre}"
end
{% endhighlight %}

El método `each` acepta un bloque de código y lo ejecuta por cada
elemento de la lista, y el código entre `do` y `end` es el bloque en sí
mismo. Un bloque es como una función anónima o `lambda`. La variable
entre los pipes (\|) es el parámetro para este bloque.

Lo que sucede es que por cada elemento en la lista, `nombre` va tomando
su valor y se ejecuta la expresión `puts "Hola #{nombre}"` con ese
nombre.

Muchos otros lenguajes de programación manejan la iteración de una lista
usando la clásica sintaxis `for`, que en C se ve así:

{% highlight c %}
for (i=0; i<cantidad_de_elementos; i++)
{
  hacer_algo_con(elementos[i]);
}
{% endhighlight %}

Esto funciona, pero no es muy elegante. Necesitas una variable
descartable como `i`, averiguar la cantidad de elementos de la lista, y
explicar cómo recorrerla. La costumbre Ruby (The Ruby Way) es mucho más
elegante, todos los detalles de infraestructura se ocultan en el método
`each`, todo lo que necesitas hacer es decirle qué hacer con cada
elemento. Internamente, el método `each` llamará `yield "Alberto"`,
después `yield "Beatriz"`, después `yield "Carlos"`, y así
sucesivamente.

## Los bloques, una de las funcionalidades más potentes de Ruby

El poder real de los bloques se disfruta al trabajar con cosas más
complicadas que las listas. Más allá de manejar los detalles de
infraestructura dentro del método, también puedes manejar la
inicialización, la finalización, y los errores—todos ocultos y
simplificados frente a las preocupaciones del desarrollador.

{% highlight ruby %}
# Decirle adiós a todos
def decir_adios
  if @nombres.nil?
    puts "..."
  elsif @nombres.respond_to?("join")
    # Juntar los elementos de la lista
    # usando la coma como separador
    puts "Adiós #{@nombres.join(", ")}. Vuelvan pronto."
  else
    puts "Adiós #{@nombres}. Vuelve pronto."
  end
end
{% endhighlight %}

El método `decir_adios` no usa `each`, en vez de eso se fija si
`@nombres` responde al método `join`, y si es así, lo usa. Si no es así,
simplemente imprime la variable como un string. Esta práctica de no
preocuparse sobre el *tipo* de objeto de una variable, y simplemente
depender de los métodos que esta soporta, es conocida como “Duck
Typing”. El beneficio es que no limita innecesariamente los tipos de
variables que son soportados. Si alguien inventa un nuevo tipo de lista,
siempre y cuando implemente el método `join` con la misma semántica que
otras listas, todo funcionará como fue planeado.

## Arrancando el Script

Así que eso es la clase MegaAnfitrion, el resto del archivo sólo llama a
los métodos de la clase. Hay un último truco para tener en cuenta, y es
la línea:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` es la variable mágica que contiene el nombre del archivo que
se está ejecutando en ese momento. `$0` es el nombre del archivo usado
para iniciar el programa. Esta verificación dice “si este es el archivo
principal…”. Esto permite que un archivo sea utilizado como una
biblioteca, y no ejecutar código en ese contexto. Pero si el archivo
está siendo usado como un ejecutable, entonces ejecuta ese código.

## Considérate iniciado

Eso es todo en este rápido paseo por Ruby. Hay mucho más por explorar,
las estructuras de control diferentes que ofrece Ruby; el uso de los
bloques y `yield`; módulos como mixins; y más. Espero que esta pequeña
muestra de Ruby te despierte el interés por saber más.

Si es así, por favor dirígete a nuestra área de
[Documentación](/es/documentation/), donde encontrarás vínculos a cursos
y manuales, todos disponibles gratuitamente en internet.
