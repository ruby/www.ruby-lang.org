---
layout: nil
---

{% highlight ruby %}
# Tüm bir Array üzerinde
# matematik işlem yapmak
# isteseniz dahi
# Ruby ne istediğinizi
# hemen anlar
cities  = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Oslo]

puts "Halihazırda " +
     "şu şehirleri " +
     "ziyaret etmedim:",
     cities - visited
{% endhighlight %}
