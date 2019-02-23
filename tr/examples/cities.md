---
layout: null
---

{% highlight ruby %}
# Tüm bir Array üzerinde
# matematik işlemi yapmak
# isteseniz dahi
# Ruby ne istediğinizi
# hemen anlar
şehirler = %w[ İstanbul
               Tokyo
               Londra
               Paris
               Berlin ]
gidilen  = %w[Berlin İstanbul]

puts "Halihazırda " +
     "şu şehirleri " +
     "ziyaret etmedim:",
     şehirler - gidilen
{% endhighlight %}
