---
layout: nil
---

{% highlight ruby %}
# O Ruby sabe o que
# pretende dizer, mesmo que
# queira usar matemática num
# an Array inteiro
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
