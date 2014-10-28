---
layout: null
---

{% highlight ruby %}
# Результат выполнения: "I love Ruby"
say = "I love Ruby"
puts say

# Результат выполнения: "I *LOVE* RUBY"
say['love'] = "*love*"
puts say.upcase

# Результат выполнения: пять раз выводится
# "I *love* Ruby"
5.times { puts say }
{% endhighlight %}
