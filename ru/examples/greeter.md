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
    puts "Привет, #{@name}!"
  end
end

# Создаем новый объект
g = Greeter.new("мир")

# Результат будет "Привет, Мир!"
g.salute
{% endhighlight %}
