---
layout: null
---

{% highlight ruby %}
# "I love Ruby" 출력
say = "I love Ruby"
puts say

# "I *LOVE* RUBY" 출력
say = say.sub("love", "*love*")
puts say.upcase

# 다섯 번
# "I *love* Ruby" 출력
5.times { puts say }
{% endhighlight %}
