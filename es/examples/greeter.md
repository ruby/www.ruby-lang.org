---
layout: null
---

{% highlight ruby %}
# La clase Saludo
class Saludo
  def initialize(nombre)
    @nombre = nombre.capitalize
  end

  def saludar
    puts "¡Hola #{@nombre}!"
  end
end

# Crear un nuevo objeto
s = Saludo.new("Mundo")

# Salida "¡Hola Mundo!"
s.saludar
{% endhighlight %}
