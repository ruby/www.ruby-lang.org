---
layout: nil
---

{% highlight ruby %}
# Selamlama sınıfı
class Greeter
  def initialize(isim)
    @isim = isim.capitalize
  end

  def salute
    puts "Merhaba #{@isim}!"
  end
end

# Yeni bir obje üretin
g = Greeter.new("Dünya!")

# Çıktı "Merhaba Dünya!"
g.salute
{% endhighlight %}
