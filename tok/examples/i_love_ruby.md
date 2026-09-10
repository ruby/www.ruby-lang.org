---
layout: null
---

{% highlight ruby %}
# ona li sitelen e "mi olin e Ruby"
say = "mi olin e Ruby"
puts say

# ona li sitelen e "mi *OLIN* E RUBY"
say = say.sub("olin", "*olin*")
puts say.upcase

# ona li sitelen e "mi *olin* e Ruby"
# nanpa luka
5.times { puts say }
{% endhighlight %}
