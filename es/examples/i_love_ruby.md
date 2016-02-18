---
layout: null
---

{% highlight ruby %}
# Salida "Yo amo Ruby"
expresar = "Yo amo Ruby"
puts expresar

# Salida "YO *AMO* RUBY"
expresar['amo'] = "*amo*"
puts expresar.upcase

# Salida "Yo *amo* Ruby
# cinco veces
5.times { puts expresar }
{% endhighlight %}
