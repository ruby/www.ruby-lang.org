---
layout: nil
---

{% highlight ruby %}
# In ra "Tôi yêu Ruby"
nói = "Tôi yêu Ruby"
puts nói

# In ra "TÔI *YÊU* RUBY"
nói['yêu'] = "*yêu*"
puts nói.upcase

# In ra "Tôi *yêu* Ruby"
# 5 lần
5.times { puts nói }
{% endhighlight %}
