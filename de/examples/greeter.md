---
layout: null
---

{% highlight ruby %}
# Die Begrüßungsklasse
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Hallo #{@name}!"
  end
end

# Erstelle ein neues Objekt
g = Greeter.new("Welt")

# Ausgabe "Hallo Welt!"
g.salute
{% endhighlight %}
