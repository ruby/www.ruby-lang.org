---
layout: nil
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
g = ChàoMừng.new("Việt Nam")

# In ra "Xin chào Việt Nam!"
g.chào
{% endhighlight %}
