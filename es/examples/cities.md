---
layout: null
---

{% highlight ruby %}
# Ruby sabe lo que tu
# quieres, aun si quieres
# hacer matemáticas
# en un Arreglo completo
ciudades = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visitado = %w[Berlin Oslo]

puts "Aun necesito " +
     "visitar las " +
     "siguientes ciudades:",
     ciudades - visitado
{% endhighlight %}
