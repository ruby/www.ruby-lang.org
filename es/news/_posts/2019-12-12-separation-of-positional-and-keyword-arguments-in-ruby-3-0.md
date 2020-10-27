---
layout: news_post
title: "Separación de argumentos de palabra clave y posicionales en Ruby 3.0"
author: "mame"
translator: vtamara
date: 2019-12-12 12:00:00 +0000
lang: es
---

Este artículo explica la incompatibilidad planeada de los argumentos
de palabra clave en Ruby 3.0

## tl;dr

En Ruby 3.0 los argumentos posicionales y los argumentos de palabra clave
serán separados.  Ruby 2.7 advertirá comportamientos que cambiarán en
Ruby 3.0.  Si ve las siguientes advertencias, debe actualizar su código:

* Usar el último argumento como un parámetro de palabra clave es obsoleto, o
* Pasar  al argumento de palabra clave como último parámetro de diccionario
  (has) es obsoleto, o
* Dividir el último argumento en parámetros posicional y de palabra clave
  es obsoleto

En la mayoría de casos, puede evitar la incompatibilidad agregando
el operador _doble splat_.   Que especifica que se pasa un argumento
de palabra clave en lugar de un objeto `Hash`.   De la misma forma,
puede agregar llaves `{}` para pasar explícitamente un
objeto `Hash`, en lugar de argumentos de palabra clave.  Lea la sección
"Casos típicos" más adelante para ver detalles.

En Ruby 3, un método que delega todos los argumentos debe delegar
explícitamente argumentos de palabra clave además de los argumentos
posicionales.  Si quiere mantener el comportamiento de delegación
de Ruby 2.7 y anteriores, use `ruby2_keywords`.
Vea más detalles en la sección "Manejando la delegación de argumentos."

## Casos típicos
{: #typical-cases }

Aquí están los casos más típicos.  Puede usar un operador doble splat
(`**`) para pasar palabras clave en lugar de un diccionario.

{% highlight ruby %}
# Este método acepta sólo un argumento de palabra clave
def foo(k: 1)
  p k
end

h = { k: 42 }

# Esta llamada a un método pasa un argumento Hash posicional
# In Ruby 2.7: El Hash se convierte automáticamente a argumento
# de palabra clave.
# En Ruby 3.0: Este llamado genera un ArgumentError
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# Si quiere mantener el comportamiento en Ruby 3.0, utilice un doble splat
foo(**h) #=> 42
{% endhighlight %}

Aquí hay otro caso.  Puede usar llaves (`{}`) para pasar un diccionario
en lugar de palabras claves explícitas.

{% highlight ruby %}
# Este método acepta un argumento posicional y una argumento de palabra
# clave para el resto
def bar(h, **kwargs)
  p h
end

# Esta llamada pasa sólo un argumento de palabra clave y ningún
# argumento posicional
# En Ruby 2.7: La palabra clave se convierte en un argumento Hash posicional
# En Ruby 3.0: Este llamado genera un ArgumentError
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# Si dese mantener el comportamiento en Ruby 3.0, emplee llaves para hacerlo
# un Hash explícito.
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## ¿Qué se ha vuelto obsoleto?
{: #what-is-deprecated }

En Ruby 2, los argumentos de palabra clave puede tratarse como el último
argumento Hash posicional y un último argumento Hash posicional puede
tratarse como un argumento de palabra clave.

Como la conversión automática es en ocasiones demasiado compleja y
problemática, como se explica al final de la sección, se ha despreciado
en Ruby 2.7 y se eliminará en Ruby 3.  En otras palabras, los argumentos
de palabra clave se separarán por completa de los posicionales en
Ruby 3.  Así que cuando quiera pasar argumento de palabra clave,
debe usar siempre `foo(k: expr)` o `foo(**expr)`.
Si desea aceptar argumentos de palabra clave, en principio debe usar
siempre `def foo(k: default)` o `def foo(k:)` o
`def foo(**kwargs)`.

Note que Ruby 3.0 no se comporta de manera diferente cuando se llama un
método que no acepta argumentos de palabra clave con argumentos
de palabra clave.  Por ejemplo, el siguiente caso no va a ser obsoleto
y seguirá operando en Ruby 3.0.  Los argumentos de palabra clave sigue
tratándose como argumentos Hash posicionales.


{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

Esto es porque el tal estilo se usa con mucha frecuencia, y no hay
ambigüedad en la forma como deben tratarse los argumentos.
Prohibir esta conversión resultaría en incompatibilidad adicional
con poco beneficio.

Sin embargo, no se recomienda este estilo en código nuevo, a menos
que suela pasar un Has como argumento posicional, y también esté
usando argumentos de palabra clave.  En otro caso, use un doble splat:

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## ¿Mí código se quebrará en Ruby 2.7?
{: #break-on-ruby-2-7 }

La respuesta corta es "posiblemente no".

Los cambios en Ruby 2.7 se diseñaron como ruta de migración hacía
3.0.  Mientras que en principio Ruby 2.7 solo advertirá sobre
comportamientos que cambiarán en Ruby 3, incluye algunos cambios
incompatibles que consideramos menores.  Ver detalles en la sección
"Otros cambios menores."

Excepto por las advertencias y cambios menores, Ruby 2.7 trata de
mantener compatibilidad con Ruby 2.6.  Así, que su código probablemente
operará en Ruby 2.7, aunque emita algunas advertencia.
Y al correrlo en Ruby 2.7, puede verificar que su código esté
listo para Ruby 3.0

Si desea deshabilitar los mensajes de obsolescencia, por favor use el
argumento de la línea de ordenes `-W:no-deprecated` o añada a
su código `Warning[:deprecated] = false`.

## Manejando la delegación de argumentos
{: #delegation }

### Ruby 2.6 o anteriores
{: #delegation-ruby-2-6-or-prior }

En Ruby 2, puede escribir una delegación de un método aceptando un
argumento `*rest`  y un argumento `&block`, y pasando ambos al
método objetivo.
De esta manera, los argumentos de palabra clave también
se manejan de manera implícita durante la conversión automática
entre argumentos posicionales y argumentos de palabra clave.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3
{: #delegation-ruby-3 }

Necesita delegar explícitamente los argumntos de palabra clave.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

De manera alterna, si no necesita compatibilidad con Ruby 2.6 o anteriores
y no altera ningún argumento, puede usar la nueva sintaxis para delegar
(`...`) que se introduce en Ruby 2.7.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7
{: #delegation-ruby-2-7 }

Brevemente : use `Module#ruby2_keywords` y delege `*args, &block`.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords` acepta argumentos de palabra clave como
el último argumento Hash, y lo pasa como argumento de palabra clave
cuando llama al otro método.

De hecho, Ruby 2.7 permite el nuevo estilo de delegación en muchos casos.
Sin embargo, hay un caso esquina conocido.  Ver la siguiente sección.

### Una delegación compatible que funciona en Ruby 2.6, 2.7 y Ruby 3
{: #a-compatible-delegation }

Brevemente: nuevamente use `Module#ruby2_keywords`

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

Infortunadamente, necesitamos usar la delegación en el estilo antiguo
(i.e., sin `**kwargs`) porque Ruby 2.6 o anteriores no maneja el nuevo
estilo de delegación correctamente.
Esta es una de las razones para la separación de argumentos de palabras
clave; los detalles se describen en la sección final.   Y `ruby2_keywords`
le permite emplear el estilo antiguo incluso en Ruby 2.7 y Ruby 3.0.
Como no hay `ruby2_keywords` definido en 2.6 o anterior, por favor use
la [gema ruby2_keywords](https://rubygems.org/gems/ruby2_keywords)
od definalo usted mismo:

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

Si su código no necesita ejecutarse con Ruby 2.6 o anteriores, puede
intentar el nuevo estilo de Ruby 2.7.  En casi todos los casos, funciona.
Note que, sin embargo, hay algunos casos esquina como los siguientes:

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []   ({} es ignorado)
foo({}, **{}) #=> Ruby 2.7: [{}] (Puede pasar {} pasando explícitamente la palabra clave "no")
{% endhighlight %}

Un argumento Hash vacío se convierte automáticamente y es absorbido en
`**kwargs`, y la llamada de delegación elimina la palabra clave vacía
del hash, así que no se pasa argumento alguno a  `target`.
Hasta donde sabemos, este es el único caso esquina.

Como se hace notar en la última línea, usted puede sobrellevar este
problema usando `**{}`.

Si realmente se preocupa por la portabilidad, use `ruby2_keywords`.
(Reconociendo que Ruby 2.6 y anteriores tienen muchos casos
esquinas en los argumentos de palabras. :-)
`ruby2_keywords` puede ser eliminado en el futuro después de que
Ruby 2.6 alcance su fin-de-vida. En ese momento, recomendamos delegar
argumentos de palabra reservada (ver el código para Ruby 3 antes presentado).

## Otros cambios menores
{: #other-minor-changes }

Hay otros cambios menores respecto a argumentos de palabra clave en
Ruby 2.7.

### 1. Llaves que no son símbolos se permite como argumentos de palabra clave

En Ruby 2.6 o anteriores, sólo llaves que eran símbolos se permitían en
argumentos de palabra clave.  En Ruby 2.7, los argumentos de palabra
clave pueden usar llaves que no son símbolos.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6 o anteriores: ArgumentError: wrong number of arguments
  #=> Ruby 2.7 o posteriores: {"key"=>42}
{% endhighlight %}

Si un método acepta tanto argumentos opcionales como de palabra clave,
el objeto Hash que tenga llaves símbolos y otras que no sean símbolos
se dividirá en dos en Ruby 2.6.
En Ruby 2.7 ampos se acepta como palabras clave porque las llaves que
no son símbolos son permitidas.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# Use llaves para mantener el comportamiento
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 y 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7 aún divide diccionarios con una advertencia si se pasa un Hash
o argumentos de palabras clave tanto con llaves que sean símbolos como
con llaves que no sean símbolos a un método que acepte explícitamente
palabras clave pero no el argumento de palabra clave para el resto
(`**kwargs`).  Este comportamiento será eliminado en
Ruby 3, y se lanzará un `ArgumentError`.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6 and 2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2. Doble splat con un diccionario vacío (`**{}`) no pasa argumentos
{: #other-minor-changes-empty-hash }

En Ruby 2.6 y anteriores, al pasar `**empty_hash` se pasa un
Hash vacío como argumento posicional. En Ruby 2.7 o posteriores,
no pasa argumento alguno.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 o anteriores: [{}]
  #=> Ruby 2.7 o posteriores: []
{% endhighlight %}

Note que `foo(**{})` no pasa dato alguno ni en Ruby 2.6 ni en
2.7.  En Ruby 2.6 y anteriores, `**{}` es eliminado por el analizador
sintáctico, y en Ruby 2.7 y posteriores, se trata igual que
`**empty_hash`, permitiendo no pasar argumentos de palabra clave
de manera sencilla a un método.

En Ruby 2.7 cuando se llama un método con una cantidad insuficiente
de argumentos posicionales, `foo(**empty_hash)` pasa un
diccionario vacío y emite una advertencia, por compatibilidad con
Ruby 2.6. Este comportamiento será eliminado en 3.0

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 o anterioes: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. Se introduce sintaxis sin-argumentos-de-palabra-clave (`**nil`)

Puede usar `**nil` en la definición de un método para marcar de manera
explícita que el método no acepta argumentos de palabra clave.
Llamar tales métodos con argumentos de palabra clave resultará en un
`ArgumentError`. (En realidad es una nueva característica y no
una incompatibilidad)

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7 o posterior: no keywords accepted (ArgumentError)
{% endhighlight %}

Esto es útil para hacer explícito que el método no acepta argumentos
de palabra clave.  De lo contrario los argumentos de palabra clave
son absorbidos en el argumento para el resto en el ejemplo anterior.
Si extiende un método para que acepte argumentos de palabra clave,
el método podría tener incompatibilidades así:

{% highlight ruby %}
# Si un método acepta el argumento para el resto pero no `**nil`
def foo(*args)
  p args
end

# Al pasar argumentos de palabra clave se convierten en un objeto Hash (aún en Ruby 3.0)
foo(k: 1) #=> [{:k=>1}]

# Si el método se extiende para aceptar una palabra clave
def foo(*args, mode: false)
  p args
end

# Las llamadas existentes pueden quebrarse
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## Razones para despreciar la conversión automática
{: #why-deprecated }

La conversión automática inicialmente parecía una buena idea,
y funcionó bien en muchos casos. Sin embargo, tenía muchos casos
esquina, y hemos recibidos muchos reportes de fallas por el
comportamiento.

La conversión automática no funciona bien cuando un método acepta
argumentos posicionales opciones y argumentos de palabra clave.
Alguna gente espera que el último objeto Hash sea tratado como
un argumento posicional, y otra espera que sea convertido
en argumento de palabra clave.

Este es uno de los casos más confusos:

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> esperado : [{}, {}], realmente: [1, {}]
{% endhighlight %}

En Ruby 2, `foo({})` pasa un diccionario vacío como un argumento normal
(i.e., `{}` se asigna a `x`), mientras que
`bar({})` pasa un argumento de palabra clave (i.e, `{}` se asigna a `kwargs`).
Así que `any_method({})` es muy ambiguo.

Puede pensar que `bar({}, **{})` pasa el diccionario vacío a `x`d
de forma explícita.
Pero sorprendentemente, no opera como espera; aún imprime `[1, {}]`
en Ruby 2.6.
Esto es porque `**{}` es ignorado por el analizador en Ruby 2.6, y
el primer argumento `{}` se convierte automáticamente a
palabras clave (`**kwargs`).  En tal caso, necesita llamar
`bar({}, {})`, que resulta muy extraño.

El mismo problema ocurre con métodos que aceptan argumentos de palabra clave
y resto.  Esto hace que no opere la delegación explícita de argumentos
de palabra clave.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6 o anteriores: [{}]
      #=> Ruby 2.7 o posteriores:  []
{% endhighlight %}

`foo()` no pasa argumentos, pero `target` recibe un argumento de diccionario
vacío en Ruby 2.6. Esto es porque el método `foo` delega las
palabras clave (`**kwargs`) explícitamente.  Cuando se llama `foo()`,
`args`es un arreglo vacío, `kwargs` es un Hash vacío y `block` es `nil`.
Y entonces  `target(*args, **kwargs, &block)` pasa un Hash vacío
como argumento porque `**kwargs` se convierte automáticamente a
un argumento Hash posicional.

La conversión automática no sólo confunde a la gente sino que hace
el método menos extensible.  Ver más detalles en la
[[Característica #14183]](https://bugs.ruby-lang.org/issues/14183) y
razones para el cambio de comportamiento, y porque se hicieron
algunas elecciones de implementación.

## Agradecimientos

Este artículo fue revisado amablemente (e incluso son co-autores) por
Jeremy Evans y Benoit Daloze.

## Historia

* Actualizado 2019-12-25: En 2.7.0-rc2, el mensaje de advertencia
  fue cambiado levemente, y se agregó un API para eliminar la advertencia.
