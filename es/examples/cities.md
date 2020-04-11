---
layout: null
---

{% highlight ruby %}
# Ruby sabe lo que tu
# quieres, aun si quieres
# hacer matemáticas
# en un Arreglo completo
ciudades = %w[ Londres
              Oslo
              París
              Ámsterdam
              Berlín ]
visitado = %w[Berlín Oslo]

puts "Aun necesito " +
     "visitar las " +
     "siguientes ciudades:",
     ciudades - visitado
{% endhighlight %}
