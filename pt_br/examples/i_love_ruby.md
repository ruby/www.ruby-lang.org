---
layout: null
---

{% highlight ruby %}
# Output "Eu gosto de ruby"
diz = "Eu gosto de Ruby"
puts diz

# Saída "EU *GOSTO* DE RUBY"
diz = diz.sub("gosto", "*gosto*")
puts diz.upcase

# Output: "Eu *gosto*
# de Ruby" 5 vezes
5.times { puts diz }
{% endhighlight %}
