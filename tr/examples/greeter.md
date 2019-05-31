---
layout: null
---

{% highlight ruby %}
# Greeter sınıfı
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Hello #{@name}!"
  end
end

# Yeni bir nesne üret
g = Greeter.new("world")

# Çıktı "Hello World!"
g.salute
{% endhighlight %}
