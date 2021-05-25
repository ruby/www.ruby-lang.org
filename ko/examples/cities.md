---
layout: null
---

{% highlight ruby %}
# Ruby는 당신의 말을
# 이해합니다. 전체
# 배열의 계산을 하려고
# 할 때에도 말이죠.
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
