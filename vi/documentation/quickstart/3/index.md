---
layout: page
title: "Ruby trong 20 phút"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Phần 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Phần 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Phần 4">4</a>
  </div>
  <h1>Ruby trong 20 phút</h1>

---

Bây giờ hãy tạo một đối tượng greeter và sử dụng nó:

{% highlight irb %}
irb(main):035:0> greeter = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> greeter.say_hi
Hi Pat!
=> nil
irb(main):037:0> greeter.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Sau khi đối tượng `greeter` được tạo, nó ghi nhớ rằng tên là Pat. Hmm,
nếu chúng ta muốn truy cập trực tiếp vào tên thì sao?

{% highlight irb %}
irb(main):038:0> greeter.@name
SyntaxError: (irb):38: syntax error, unexpected tIVAR, expecting '('
{% endhighlight %}

Không, không làm được.

## Bên trong đối tượng

Các biến thực thể được ẩn bên trong đối tượng. Chúng không bị ẩn hoàn
toàn, bạn vẫn thấy chúng khi kiểm tra đối tượng, và cũng có những cách
khác để truy cập chúng, nhưng Ruby sử dụng phương pháp hướng đối tượng
tốt là giữ dữ liệu ở mức tương đối ẩn.

Vậy những method nào tồn tại cho các đối tượng Greeter?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> [:say_hi, :say_bye, :instance_of?, :public_send,
    :instance_variable_get, :instance_variable_set,
    :instance_variable_defined?, :remove_instance_variable,
    :private_methods, :kind_of?, :instance_variables, :tap,
    :is_a?, :extend, :define_singleton_method, :to_enum,
    :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?,
    :freeze, :inspect, :display, :send, :object_id, :to_s,
    :method, :public_method, :singleton_method, :nil?, :hash,
    :class, :singleton_class, :clone, :dup, :itself, :taint,
    :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods,
    :protected_methods, :frozen?, :public_methods, :singleton_methods,
    :!, :==, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

Ồ. Nhiều method quá. Chúng ta chỉ định nghĩa có hai method thôi mà.
Chuyện gì đang xảy ra ở đây vậy? Đây là **tất cả** các method của đối
tượng Greeter, một danh sách đầy đủ, bao gồm cả các method được định
nghĩa bởi các class cha. Nếu chúng ta chỉ muốn liệt kê các method
được định nghĩa riêng cho Greeter, chúng ta có thể yêu cầu không bao
gồm các class cha bằng cách truyền tham số `false`, nghĩa là chúng ta
không muốn các method được định nghĩa bởi các class cha.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> [:say_hi, :say_bye]
{% endhighlight %}

À, thế mới đúng. Vậy hãy xem đối tượng greeter của chúng ta phản hồi
những method nào:

{% highlight irb %}
irb(main):041:0> greeter.respond_to?("name")
=> false
irb(main):042:0> greeter.respond_to?("say_hi")
=> true
irb(main):043:0> greeter.respond_to?("to_s")
=> true
{% endhighlight %}

Vậy là nó biết `say_hi` và `to_s` (nghĩa là chuyển đổi một thứ gì đó
thành chuỗi ký tự, một method được định nghĩa mặc định cho mọi đối
tượng), nhưng nó không biết `name`.

## Thay đổi class — Không bao giờ là quá muộn

Nhưng nếu bạn muốn xem hoặc thay đổi tên thì sao? Ruby cung cấp một
cách dễ dàng để truy cập các biến của đối tượng.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

Trong Ruby, bạn có thể mở lại một class và sửa đổi nó. Những thay đổi
sẽ có mặt trong mọi đối tượng mới bạn tạo và thậm chí có sẵn trong các
đối tượng đã tồn tại của class đó. Vậy, hãy tạo một đối tượng mới và
thử nghiệm với thuộc tính `@name` của nó.

{% highlight irb %}
irb(main):047:0> greeter = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> greeter.respond_to?("name")
=> true
irb(main):049:0> greeter.respond_to?("name=")
=> true
irb(main):050:0> greeter.say_hi
Hi Andy!
=> nil
irb(main):051:0> greeter.name="Betty"
=> "Betty"
irb(main):052:0> greeter
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> greeter.name
=> "Betty"
irb(main):054:0> greeter.say_hi
Hi Betty!
=> nil
{% endhighlight %}

Sử dụng `attr_accessor` đã định nghĩa hai method mới cho chúng ta,
`name` để lấy giá trị, và `name=` để đặt giá trị.

## Chào hỏi mọi thứ và mọi người, MegaGreeter không bỏ sót ai!

Tuy nhiên, greeter này chưa thực sự thú vị lắm, nó chỉ có thể xử lý
một người tại một thời điểm. Nếu chúng ta có một loại MegaGreeter nào
đó có thể chào cả thế giới, một người, hoặc cả một danh sách người thì
sao?

Hãy viết cái này trong một tệp thay vì trực tiếp trong trình thông dịch
Ruby tương tác IRB.

Để thoát IRB, gõ "quit", "exit" hoặc chỉ cần nhấn Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end
end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Lưu tệp này với tên "ri20min.rb", và chạy bằng lệnh "ruby ri20min.rb".
Kết quả đầu ra sẽ là:

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

Có rất nhiều thứ mới trong ví dụ cuối cùng này mà chúng ta
[có thể tìm hiểu sâu hơn.](../4/)
