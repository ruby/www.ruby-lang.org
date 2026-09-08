---
layout: null
---

{% highlight ruby %}
# A classe Saudação
class Saudacao
  def initialize(name)
    @name = name.capitalize
  end

  def sauda
    puts "Olá #{@name}!"
  end
end

# Criar um novo objecto
ola = Saudacao.new("mundo")

# Saída: "Olá Mundo!"
ola.sauda
{% endhighlight %}
