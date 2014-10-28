---
layout: null
---

{% highlight ruby %}
# Output "Aku cinta Ruby"
say = "Aku cinta Ruby"
puts say

# Output "AKU *CINTA* RUBY"
say['cinta'] = "*cinta*"
puts say.upcase

# Output "Aku *cinta* Ruby"
# sebanyak lima kali
5.times { puts say }
{% endhighlight %}
