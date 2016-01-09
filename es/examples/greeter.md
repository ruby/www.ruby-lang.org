---
layout: null
---

{% highlight ruby %}
# La clase Greeter
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Hola #{@name}!"
  end
end

# Crear un nuevo objeto
g = Greeter.new("Mundo")

# Output "Hola Mundo!"
g.salute
{% endhighlight %}
