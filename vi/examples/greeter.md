---
layout: null
---

{% highlight ruby %}
# class ChàoMừng
class ChàoMừng
  def initialize(tên)
    @tên = tên.capitalize
  end

  def chào
    puts "Xin chào #{@tên}!"
  end
end

# Tạo một đối tượng mới
g = ChàoMừng.new("thế giới")

# In ra "Xin chào thế giới!"
g.chào
{% endhighlight %}
