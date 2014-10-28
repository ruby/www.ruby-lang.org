---
layout: null
---

{% highlight ruby %}
# Stampa "Mi piace Ruby"
frase = "Mi piace Ruby"
puts frase

# Stampa "MI *PIACE* RUBY"
frase['piace'] = "*piace*"
puts frase.upcase

# Stampa "Mi *piace* Ruby"
# cinque volte
5.times { puts frase }
{% endhighlight %}
