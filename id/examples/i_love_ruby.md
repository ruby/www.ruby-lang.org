---
layout: null
---

{% highlight ruby %}
# Keluaran "Saya cinta Ruby"
say = "Saya cinta Ruby"
puts say

# Keluaran "Saya *CINTA* RUBY"
say['cinta'] = "*cinta*"
puts say.upcase

# Keluaran "Saya *cinta* Ruby"
# sebanyak lima kali
5.times { puts say }
{% endhighlight %}
