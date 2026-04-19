---
layout: null
---

{% highlight ruby %}
# Клас Greeter
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Вітаю, #{@name}!"
  end
end

# Створюємо новий об’єкт
g = Greeter.new("світ")

# Виведе "Вітаю, Світ!"
g.salute
{% endhighlight %}
