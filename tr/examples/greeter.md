---
layout: null
---

{% highlight ruby %}
# Selamlama sınıfı
class Selamlama
  def initialize(isim)
    @isim = isim.capitalize
  end

  def selamla
    puts "Merhaba #{@isim}!"
  end
end

# Yeni bir nesne üret
s = Selamlama.new("Dünya")

# Çıktı "Merhaba Dünya!"
s.selamla
{% endhighlight %}
