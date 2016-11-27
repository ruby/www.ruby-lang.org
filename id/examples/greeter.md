---
layout: null
---

{% highlight ruby %}
# Kelas Greeter
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Halo #{@name}!"
  end
end

# Membuat sebuh objek baru
g = Greeter.new("dunia")

# Keluaran "Halo Dunia!"
g.salute
{% endhighlight %}
