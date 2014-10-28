---
layout: null
---

{% highlight ruby %}
# Ruby понимает,
# что вы имеете в виду,
# даже если вы хотите производить
# вычисления на целом массиве.
cities  = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Oslo]

puts "I still need " +
     "to visit the " +
     "following cities:",
     cities - visited
{% endhighlight %}
