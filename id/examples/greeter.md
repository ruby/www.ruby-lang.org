---
layout: null
---

{% highlight ruby %}
# kelas TukangSapa
class TukangSapa
  def initialize(name)
    @name = name.capitalize
  end

  def menyapa
    puts "Halo #{@name}!"
  end
end

# Membuat obyek baru
g = TukangSapa.new("dunia")

# Output "Halo dunia!"
g.menyapa
{% endhighlight %}
