---
layout: null
---

{% highlight ruby %}
# Ruby li sona e wile sina,
# taso sina wile pali nanpa
# lon Array ale
cities  = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Oslo]

puts "mi wile awen " +
     "tawa lukin e ma " +
     "ni:",
     cities - visited
{% endhighlight %}
