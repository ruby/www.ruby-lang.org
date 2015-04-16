---
layout: null
---

{% highlight ruby %}
# Greeter 클래스
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    puts "Hello #{@name}!"
  end
end

# 새 객체 생성
g = Greeter.new("world")

# "Hello World!" 출력
g.salute
{% endhighlight %}
