---
layout: null
---

{% highlight ruby %}
# Ruby sait ce que vous
# voulez vraiment faire,
# même avec des tableaux.
villes   = %w[ Londres
               Oslo
               Paris
               Amsterdam
               Berlin ]
visitees = %w[Berlin Oslo]

puts "Encore à visiter :",
     villes - visitees
{% endhighlight %}
