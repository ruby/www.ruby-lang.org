---
layout: null
---

{% highlight ruby %}
# Écrit "J'aime Ruby"
phrase = "J'aime Ruby"
puts phrase

# Écrit "J'*AIME* RUBY"
phrase = phrase.sub("aime", "*aime*")
puts phrase.upcase

# Écrit "J'*aime* Ruby"
# cinq fois de suite
5.times { puts phrase }
{% endhighlight %}
