---
layout: nil
---

{% highlight ruby %}
# In ra "I love Ruby"
nói = "I love Ruby"
puts nói

# In ra "I *LOVE* RUBY"
nói['love'] = "*love*"
puts nói.upcase

# In ra "I *love* Ruby " 5 lần
5.times { puts nói }
{% endhighlight %}
