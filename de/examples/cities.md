---
layout: null
---

{% highlight ruby %}
# Ruby weiß, was du
# meinst, sogar wenn du
# versuchst, einem Array
# Mathestunden zu geben
cities  = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Oslo]

puts "Ich muss noch " +
     "die folgenden " +
     "Orte besuchen:",
     cities - visited
{% endhighlight %}
