---
layout: null
---

{% highlight ruby %}
# Salida "Yo amo Ruby"
say = "Yo amo Ruby"
puts say

# Salida "YO *AMO* RUBY"
say['amo'] = "*amo*"
puts say.upcase

# Salida "Yo *amo* Ruby
# cinco veces
5.times { puts say }
{% endhighlight %}
