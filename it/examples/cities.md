---
layout: null
---

{% highlight ruby %}
# Ruby sa quello che vuoi
# dire, anche se vuoi
# fare delle operazioni
# con un intero Array
luoghi   = %w[ Londra
               Oslo
               Parigi
               Amsterdam
               Berlino ]
visitati = %w[Berlino Oslo]

puts "Devo ancora " +
     "visitare i " +
     "seguenti luoghi:",
     luoghi - visitati
{% endhighlight %}
