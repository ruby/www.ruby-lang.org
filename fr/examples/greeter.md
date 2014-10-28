---
layout: null
---

{% highlight ruby %}
# La classe Majordome
class Majordome
  def initialize(nom)
    @nom = nom.capitalize
  end

  def saluer
    puts "Bonjour #{@nom} !"
  end
end

# Créer un nouvel objet
m = Majordome.new("patron")

# « Bonjour Patron ! »
m.saluer
{% endhighlight %}
