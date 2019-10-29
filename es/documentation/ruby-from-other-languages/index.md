---
layout: page
title: "Ruby desde otros lenguajes"
lang: es
---

Cuando te enfrentas por primera vez a código escrito en Ruby,
probablemente te recuerde otros lenguajes que hayas usado. Esto es a
propósito. La mayor parte de la sintaxis es familiar para los usuarios
de Perl, Python y Java (entre otros lenguajes), así que si has usado
alguno de estos, aprender Ruby será muy fácil.
{: .summary}

Este documento contiene dos secciones. La primera intenta ser un resumen
de lo que puedes esperar ver al aprender Ruby viniendo de otro lenguaje.
La segunda sección se enfoca en determinadas funcionalidades del
lenguaje y cómo podrían compararse a lo que ya puedas estar
familiarizado.

## Qué esperar: *Lenguaje X* a Ruby

* [A Ruby desde Java](to-ruby-from-java/)
* [A Ruby desde PHP](to-ruby-from-php/)
* [A Ruby desde Python](to-ruby-from-python/)

Estamos en proceso de traducir todos estos artículos, pero mientras lo
hacemos no queremos privarte de que los leas en inglés:

* [To Ruby From C and C++](/en/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp/)
  (en inglés)
* [To Ruby From Java](/en/documentation/ruby-from-other-languages/to-ruby-from-java/)
  (en inglés)
* [To Ruby From Perl](/en/documentation/ruby-from-other-languages/to-ruby-from-perl/)
  (en inglés)
* [To Ruby From PHP](/en/documentation/ruby-from-other-languages/to-ruby-from-php/)
  (en inglés)


## Funcionalidades importantes del lenguaje y algunas advertencias

Aquí tienes algunas referencias y consejos sobre funcionalidades de Ruby
que verás mientras lo aprendes.

### Iteración

Dos funcionalidades de Ruby que se diferencian de lo que puedes haber
visto previamente, y que toma cierto tiempo acostumbrarse a ellas, son
los “bloques” e iteradores. En vez de recorrer un índice (como con C,
C++, o Java anterior al 1.5), o recorrer una lista (como el
`for (@a) {...}` de Perl, o `for i in aList: ...` en Python,
con Ruby verás muy frecuentemente código de este estilo:

{% highlight ruby %}
una_lista.each do |este_item|
  # Estamos dentro del bloque.
  # Trabaja con este_item.
end
{% endhighlight %}

Para obtener más información sobre `each` (y sus amigos `collect`,
`find`, `inject`, `sort`, etc.), ejecuta `ri Enumerable` (y después
`ri Enumerable#nombre_del_metodo`).

### Todo tiene un valor

No hay diferencia entre una expresión y un comando. Todo tiene un valor,
incluso si ese valor es **nil**. Esto es posible:

{% highlight ruby %}
x = 10
y = 11
z = if x < y
      true
    else
      false
    end
z # => true
{% endhighlight %}

### Los symbols (símbolos) no son strings especiales

A muchos novatos en Ruby les cuesta entender qué son los symbols, y qué
utilidad pueden tener.

Los symbols pueden ser descritos como identidades. Lo importante de un
Symbol es **quién** es, no **qué** es. Arranca `irb` y experimenta la
diferencia:

{% highlight irb %}
irb(main):001:0> :jorge.object_id == :jorge.object_id
=> true
irb(main):002:0> "jorge".object_id == "jorge".object_id
=> false
irb(main):003:0>
{% endhighlight %}

El método `object_id` retorna la identidad de un objeto. Si dos objetos
tienen el mismo `object_id`, son el mismo objeto (apuntan al mismo
objeto en la memoria).

Como puedes ver, una vez que has usado un Symbol, cualquier otro Symbol
con los mismos caracteres referencia al mismo objeto en memoria. Para
dos symbols que representan los mismos caracteres, el `object_id` es el
mismo.

Ahora veamos el String (“jorge”). El `object_id` no es el mismo. Eso
significa que representan a dos objetos diferentes en memoria. Siempre
que uses un nuevo String, Ruby reserva memoria para él.

Si tienes dudas sobre usar un Symbol o un String, considera qué es más
importante: la identidad de un objeto (por ejemplo la Key de un Hash), o
el contenido (en nuestro ejemplo, “jorge”).

### Todo es un objeto

“Todo es un objeto” no es una exageración. Incluso las clases y los
enteros son objetos, y puedes hacer con ellos las mismas cosas que con
cualquier otro objeto:

{% highlight ruby %}
# Esto es lo mismo que:
# class MiClase
#   attr_accessor :variable_de_instancia
# end
MiClase = Class.new do
  attr_accessor :variable_de_instancia
end
{% endhighlight %}

### Constantes variables

Las constantes no son realmente… constantes. Si modificas una constante
previamente inicializada, Ruby disparará una advertencia, pero no
detendrá tu programa. De todas formas, eso no quiere decir que
**deberías** redefinir tus constantes.

### Convenciones de sintaxis

Ruby impone algunas convenciones de sintaxis. Si un identificador
comienza con una letra mayúscula, es una constante. Si comienza con un
símbolo de moneda (`$`), es una variable global. Si comienza con `@`, es
una variable de instancia. Si comienza con `@@`, es una variable de
clase.

Sin embargo, los nombres de los métodos tienen permitido comenzar con
letras mayúsculas. Esto puede confundirte, como muestra el siguiente
ejemplo:

{% highlight ruby %}
Constante = 10
def Constante
  11
end
{% endhighlight %}

Ahora `Constante` vale 10, pero `Constante()` retorna 11.

### Falsos parámetros nombrados

A diferencia de Python, Ruby no tiene parámetros nombrados. Sin embargo,
pueden ser emulados mediante el uso de symbols y hashes. Ruby on Rails,
entre otros, usa esto a discreción. Por ejemplo:

{% highlight ruby %}
def parametros_con_nombre(params)
  params
end
parametros_con_nombre(:param_uno => 10, :param_dos => 42)
# => {:param_uno=>10, :param_dos=>42}
{% endhighlight %}

### La verdad universal

En Ruby, todo excepto **nil** y **false** es considerado **true**. En C,
Python y muchos otros lenguajes, **0** y posiblemente otros valores,
como listas vacías, son considerados **false**. Examina el siguiente
código Python (el ejemplo aplica también a otros lenguajes):

{% highlight python %}
# en Python
if 0:
  print("0 es verdadero")
else:
  print("0 es falso")
{% endhighlight %}

Esto imprimirá “0 es falso”. El equivalente en Ruby:

{% highlight ruby %}
# en Ruby
if 0
  puts "0 es verdadero"
else
  puts "0 es falso"
end
{% endhighlight %}

Imprime “0 es verdadero”.

### Los modificadores de acceso aplican hasta el fin del alcance

En el siguiente código Ruby,

{% highlight ruby %}
class MiClase
  private
  def un_metodo; true; end
  def otro_metodo; false; end
end
{% endhighlight %}

Puede ser que esperes que `otro_metodo` sea de alcance público. Esto no
es así. El modificador de acceso `private` continúa hasta el fin del
alcance, o hasta que aparezca un nuevo modificador de acceso, lo que
ocurra primero. Por defecto, los métodos son públicos:

{% highlight ruby %}
class MiClase
  # Ahora un_metodo es público
  def un_metodo; true; end

  private

  # otro_metodo es privado
  def otro_metodo; false; end
end
{% endhighlight %}

`public`, `private` y `protected` en realidad son métodos, así que pueden recibir parámetros. Si pasas un símbolo a uno de ellos, la visibilidad de ese método es alterada.

### Acceso a los métodos

En Java, `public` significa que un método puede ser accedido por
cualquiera. `protected` significa que las instancias de la clase,
instancias de sus descendientes así como también de clases en el mismo
paquete, pueden accederlo, pero nadie más. Y `private` significa que los
métodos son accesibles únicamente desde las instancias de la clase.

En Ruby esto es un poco diferente. `public` es, naturalmente, público.
`private` significa que los métodos son accesibles sólo cuando pueden
ser invocados sin un receptor explícito. Sólo **self** tiene permitido
ser el receptor de la invocación a un método privado.

Al que debemos estar atentos es a `protected`. Un método protegido puede
ser llamado desde una instancia de una clase o las instancias de sus
ancestros, pero también con otra instancia como su receptor.

Ejemplo, adaptado del [Ruby Language FAQ][faq]:

{% highlight ruby %}
class Test
  # public por defecto
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# ahora haz `identifier' protected, todavía funciona
# porque protected permite la otra referencia

class Test
  protected :identifier
end

t1 == t2  # => true

# ahora haz `identifier' private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Las clases están abiertas

Las clases de Ruby están abiertas. Puedes abrirlas, agregarles
funcionalidad y modificarlas en cualquier momento. Incluso las clases
principales, como `Integer` o incluso `Object`, el padre de todos los
objetos. Ruby on Rails define un montón de métodos para manejar el
tiempo y los horarios en `Integer`. Mira:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # cantidad de segundos en una hora
  end
  alias hour hours
end

# 14 horas desde las 00:00 del 1ro de enero del 2006
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Nombres de métodos graciosos

En Ruby, los métodos tienen permitido terminar en signos de exclamación
o interrogación. Por convención, los métodos que responden preguntas
(i.e. `Array#empty?` retorna **true** si el receptor está vacío)
terminan con un signo de interrogación. Métodos potencialmente
“peligrosos” (i.e. métodos que modifican **self** o sus argumentos,
`exit!` etc.) por convención terminan en un signo de exclamación.

De todas formas, no todos los métodos que modifican sus argumentos
terminan en signos de exclamación. `Array#replace` reemplaza el
contenido de un array con el contenido de otro array. No tiene mucho
sentido tener un método como ese que **no** modifique **self**.

### Los métodos Singleton

Los métodos Singleton son métodos-por-objeto. Sólo están disponibles en
el objeto en el que los defines.

{% highlight ruby %}
class Automovil
  def inspect
    "Auto barato"
  end
end

porsche = Automovil.new
porsche.inspect # => Auto barato
def porsche.inspect
  "Auto muy caro"
end

porsche.inspect # => Auto muy caro

# Otros objetos no son afectados
otro_auto = Automovil.new
otro_auto.inspect # => Auto barato
{% endhighlight %}

### Métodos faltantes

Ruby no se rinde si no puede encontrar un método que responda a un
mensaje en particular. Llama al método `method_missing` con el nombre
del método que no pudo encontrar y sus argumentos. Por defecto,
`method_missing` lanza una excepción NameError, pero puedes redefinirlo
para que se ajuste mejor a tu aplicación, y muchas bibliotecas lo hacen.
Aquí tienes un ejemplo:

{% highlight ruby %}
# id es el nombre del método invocado, la sintaxis * recolecta
# todos los argumentos en un array llamado 'argumentos'
def method_missing(id, *argumentos)
  puts "El método #{id} fue invocado, pero no existe. Tiene " +
       "estos argumentos: #{argumentos.join(", ")}"
end

__ :a, :b, 10
# => El método __ fue invocado, pero no existe. Tiene estos
# argumentos: a, b, 10
{% endhighlight %}

Este código sólo imprime los detalles de la invocación, pero eres libre
de manejar el mensaje como te parezca más apropiado.

### Pasaje de mensajes, no llamadas a funciones

Una invocación a un método, en realidad es un **mensaje** a otro objeto:

{% highlight ruby %}
# Esto
1 + 2
# Es lo mismo que esto ...
1.+(2)
# Que es lo mismo que esto:
1.send "+", 2
{% endhighlight %}

### Los bloques son objetos, sólo que todavía no lo saben

Los bloques (cierres en realidad) son muy utilizados por la biblioteca
estándar. Para llamar a un bloque, puedes usar `yield`, o transformarlo
en un `Proc` al anexarle un parámetro especial a la lista de argumentos,
así:

{% highlight ruby %}
def block(&el_bloque)
  # Aquí dentro, el_bloque es el bloque pasado al método
  el_bloque # retornar el bloque
end
sumador = block { |a, b| a + b }
# sumador ahora es un objeto Proc
sumador.class # => Proc
{% endhighlight %}

También puedes crear bloques fuera de las invocaciones a métodos,
utilizando `Proc.new` con un bloque o llamando al método `lambda`.

Similarmente, los métodos también pueden ser objetos:

{% highlight ruby %}
method(:puts).call "¡puts es un objeto!"
# => ¡puts es un objeto!
{% endhighlight %}

### Los operadores son comodidades sintácticas

La mayoría de los operadores en Ruby son simples simplificaciones
sintácticas (con algunas reglas de precedencia) para llamar a ciertos
métodos. Puedes, por ejemplo, redefinir el método `Integer#+`\:

{% highlight ruby %}
class Integer
  # Puedes, pero por favor no lo hagas
  def +(otro)
    self - otro
  end
end
{% endhighlight %}

No necesitas el`operator+` de C++, etc.

Incluso puedes tener acceso estilo array si defines los métodos `[]` y
`[]=`. Para definir los métodos unitarios + y – (piensa en +1 y -2), debes
definir los métodos `+@` and `-@` respectivamente.

Sin embargo, los siguientes operadores **no** son simplificaciones
sintácticas. No son métodos, y no pueden ser redefinidos:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Además, `+=`, `*=` etc. sólo son abreviaciones para `var = var + otra_var`,
`var = var * otra_var`, etc. y por ende no pueden ser redefinidos.

## Para saber más

Cuando estés listo para saber más sobre Ruby, visita nuestra sección de
[Documentación](/es/documentation/).



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
