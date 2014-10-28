---
layout: null
---

{% highlight ruby %}
# Класс Greeter
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Hello #{@name}!"
  end
end

# Создаем новый объект
g = Greeter.new("world")

# Результат будет "Hello World!"
g.salute
{% endhighlight %}
