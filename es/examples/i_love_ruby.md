---
layout: null
---

{% highlight ruby %}
# Salida "Yo amo Ruby"
expresion = "Yo amo Ruby"
puts expresion

# Salida "YO *AMO* RUBY"
expresion = expresion.sub("amo", "*amo*")
puts expresion.upcase

# Salida "Yo *amo* Ruby"
# cinco veces
5.times { puts expresion }
{% endhighlight %}
