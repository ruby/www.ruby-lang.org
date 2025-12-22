---
layout: null
---

{% highlight ruby %}
# Output "I love Ruby"
say = "I love Ruby"
puts say

# Output "I *LOVE* RUBY"
say = say.sub("love", "*love*")
puts say.upcase

# Output "I *love* Ruby"
# five times
5.times { puts say }
{% endhighlight %}
