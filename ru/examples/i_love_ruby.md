---
layout: null
---

{% highlight ruby %}
# Результат выполнения: "Мне нравится Ruby"
say = "Мне нравится Ruby"
puts say

# Результат выполнения: "МНЕ *НРАВИТСЯ* RUBY"
say = say.sub("нравится", "*нравится*")
puts say.upcase

# Результат выполнения: пять раз выводится
# "Мне *нравится* Ruby"
5.times { puts say }
{% endhighlight %}
