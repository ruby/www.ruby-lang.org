---
layout: null
---

{% highlight ruby %}
# Ausgabe "Ich liebe Ruby"
say = "Ich liebe Ruby"
puts say

# Ausgabe "ICH *LIEBE* RUBY"
say = say.sub("liebe", "*liebe*")
puts say.upcase

# Ausgabe "Ich *liebe* Ruby"
# fünf mal
5.times { puts say }
{% endhighlight %}
