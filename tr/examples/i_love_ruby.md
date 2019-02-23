---
layout: null
---

{% highlight ruby %}
# Çıktı "I love Ruby"
söz = "I love Ruby"
puts söz

# Çıktı "I *LOVE* RUBY"
söz['love'] = "*love*"
puts söz.upcase

# Çıktı "I *love* Ruby"
# ama 5 kere
5.times { puts söz }
{% endhighlight %}
