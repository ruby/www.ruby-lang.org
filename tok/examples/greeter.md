---
layout: null
---

{% highlight ruby %}
# poki Greeter (jan toki)
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "toki #{@name}!"
  end
end

# o pali e ijo sin
g = Greeter.new("ma")

# ona li sitelen e "toki Ma!"
g.salute
{% endhighlight %}
