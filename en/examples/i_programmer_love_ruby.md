---
layout: null
---

{% highlight ruby %}
class Programmer
  def initialize(lang)
    @belief = "I love #{lang}"
    @belief['love'] = "❤️"
  end

  def proudly_say
    3.times { puts "#@belief"}
  end
end

I = Programmer.new("Ruby")
# Output "I ❤️ Ruby" three times
I.proudly_say
{% endhighlight %}
