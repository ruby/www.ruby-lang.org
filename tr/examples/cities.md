---
layout: null
---

{% highlight ruby %}
# Tüm bir Array üzerinde
# matematik işlemi yapmak
# isteseniz dahi
# Ruby ne istediğinizi
# hemen anlar
cities = %w[ London
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
