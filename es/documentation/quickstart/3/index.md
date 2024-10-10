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
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby en 20 minutos</h1>

---

Ahora vamos a crear y usar un objeto anfitrión:

{% highlight irb %}
irb(main):035:0> a = Anfitrion.new("Juan")
=> #<Anfitrion:0x16cac @nombre="Juan">
irb(main):036:0> a.decir_hola
Hola Juan
=> nil
irb(main):037:0> a.decir_adios
Adiós Juan, vuelve pronto.
=> nil
{% endhighlight %}

Una vez que el objeto `a` es creado, nos recuerda que el nombre es Juan.
Mmm, ¿y si queremos acceder al nombre directamente?

{% highlight irb %}
irb(main):038:0> a.@nombre
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

No, no podemos.

## Por debajo de la piel del objeto

Las variables de instancia se esconden dentro del objeto. No están tan
escondidas, las puedes ver cuando inspeccionas el objeto, y hay otras
formas de acceder a ellas, pero Ruby es fiel a las buenas costumbres de
la programación orientada a objetos manteniendo los datos lo más
privados posible.

Entonces, ¿qué métodos están disponibles para los objetos Anfitrion?

{% highlight irb %}
irb(main):039:0> Anfitrion.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "decir_hola", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "decir_adios", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Bien. Eso es un montón de métodos. Nosotros sólo definimos dos métodos.
¿Qué es lo que está sucediendo? Bueno, estos son **todos** los métodos
para los objetos Anfitrion, una lista completa, incluyendo los que están
definidos en las superclases de Anfitrion. Si queremos listar únicamente
los métodos definidos para la clase Anfitrion podemos pedirle que no
incluya sus ancestros pasándole el parámetro `false`, que significa que
no queremos los métodos definidos por sus ancestros.

{% highlight irb %}
irb(main):040:0> Anfitrion.instance_methods(false)
=> ["decir_adios", "decir_hola"]
{% endhighlight %}

Ah, hay más cosas como esa. Veamos a qué métodos puede responder nuestro
objeto anfitrión:

{% highlight irb %}
irb(main):041:0> a.respond_to?("nombre")
=> false
irb(main):042:0> a.respond_to?("decir_hola")
=> true
irb(main):043:0> a.respond_to?("to_s")
=> true
{% endhighlight %}

Así que, sabe `decir_hola`, y `to_s` (que significa “convertir algo en
un string”, un método que está definido por defecto para todos los
objetos), pero no reconoce `nombre` como un método.

## Modificando clases—Nunca es demasiado tarde

¿Pero qué pasa si quieres poder ver o modificar el nombre? Ruby provee
una forma fácil para permitir acceder a las variables de un objeto.

{% highlight irb %}
irb(main):044:0> class Anfitrion
irb(main):045:1>   attr_accessor :nombre
irb(main):046:1> end
=> [:nombre, :nombre=]
{% endhighlight %}

En Ruby, puedes volver a abrir una clase y modificarla. Eso no cambia
objetos que ya existan, pero afecta a los nuevos objetos que puedas
crear. Así que vamos a crear un nuevo objeto y juguemos con su propiedad
`@nombre`.

{% highlight irb %}
irb(main):047:0> a = Anfitrion.new("Pedro")
=> #<Anfitrion:0x3c9b0 @nombre="Pedro">
irb(main):048:0> a.respond_to?("nombre")
=> true
irb(main):049:0> a.respond_to?("nombre=")
=> true
irb(main):050:0> a.decir_hola
Hola Pedro
=> nil
irb(main):051:0> a.nombre="Matilde"
=> "Matilde"
irb(main):052:0> a
=> #<Anfitrion:0x3c9b0 @nombre="Matilde">
irb(main):053:0> a.nombre
=> "Matilde"
irb(main):054:0> a.decir_hola
Hola Matilde
=> nil
{% endhighlight %}

El uso de `attr_accessor` determinó que se definan dos nuevos métodos
por nosotros, `nombre` para obtener el valor, y `nombre=` para
modificarlo.

## Saludando a todo el mundo, ¡MegaAnfitrion no niega el saludo a nadie!

De todas formas, este anfitrión no es tan interesante, sólo puede
trabajar con una persona a la vez. ¿Qué pasaría si tuviéramos alguna
clase MegaAnfitrion que pudiera saludar al mundo, a una persona, o una
lista completa de personas?

Escribamos esto en un archivo en vez de usar directamente el intérprete
interactivo de Ruby IRB.

Para salir de IRB, escribe “quit”, “exit” o simplemente presiona
Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaAnfitrion
  attr_accessor :nombres

  # Crear el objeto
  def initialize(nombres = "Mundo")
    @nombres = nombres
  end

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

end


if __FILE__ == $0
  ma = MegaAnfitrion.new
  ma.decir_hola
  ma.decir_adios

  # Cambiar el nombre a "Diego"
  ma.nombres = "Diego"
  ma.decir_hola
  ma.decir_adios

  # Cambiar el nombre a un vector de nombres
  ma.nombres = ["Alberto", "Beatriz", "Carlos",
    "David", "Ernesto"]
  ma.decir_hola
  ma.decir_adios

  # Cambiarlo a nil
  ma.nombres = nil
  ma.decir_hola
  ma.decir_adios
end
{% endhighlight %}

Guarda este archivo como “ri20min.rb”, y ejecútalo con “ruby
ri20min.rb”. El resultado debería ser:

    Hola Mundo
    Adiós Mundo. Vuelve pronto.
    Hola Diego
    Adiós Diego. Vuelve pronto.
    Hola Alberto
    Hola Beatriz
    Hola Carlos
    Hola David
    Hola Ernesto
    Adiós Alberto, Beatriz, Carlos, David, Ernesto. Vuelvan pronto.
    ...
    ...
{: .code}

Hay un montón de cosas nuevas en este nuevo ejemplo en las que podemos
[echar una mirada más profunda](../4/).
