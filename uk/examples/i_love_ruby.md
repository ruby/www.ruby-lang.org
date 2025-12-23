---
layout: null
---

{% highlight ruby %}
# Виведе "Я люблю Ruby"
say = "Я люблю Ruby"
puts say

# Виведе "Я *ЛЮБЛЮ* RUBY"
say = say.sub("люблю", "*люблю*")
puts say.upcase

# Виведе "Я *люблю* Ruby"
# п’ять разів
5.times { puts say }
{% endhighlight %}
