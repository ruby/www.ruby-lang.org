---
layout: null
---

{% highlight ruby %}
# Ruby knows what you
# mean, even if you
# want to do math on
# an entire Array
cities  = %w[ London
              Shiraz
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Shiraz]

puts "I still need " +
     "to visit the " +
     "following cities:",
     cities - visited
{% endhighlight %}
