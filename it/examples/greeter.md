---
layout: null
---

{% highlight ruby %}
# Classe PersonaCordiale
class PersonaCordiale
  def initialize(nome)
    @nome = nome.capitalize
  end

  def saluta
    puts "Ciao #{@nome}!"
  end
end

# Crea un nuovo oggetto
g = PersonaCordiale.new("Mondo")

# Stampa "Ciao Mondo!"
g.saluta
{% endhighlight %}
