---
layout: null
---

{% highlight ruby %}
# Ruby sabe lo que tu
# quieres, aun si quieres
# hacer matematicas
# en un Arreglo completo 
cities  = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Oslo]

puts "Aun necesito " +
     "visitar las " +
     "siguientes ciudades:",
     cities - visited
{% endhighlight %}
