---
layout: null
---

{% highlight ruby %}
# O Ruby sabe o que você
# quer dizer, mesmo que isso
# seja fazer contas em
# um Array completo
cidades   = %w[ Londres
                Oslo
                Paris
                Amsterdão
                Berlim ]
visitadas = %w[Berlim Oslo]

puts "Ainda me falta " +
     "visitar " +
     "as cidades:",
     cidades - visitadas
{% endhighlight %}
