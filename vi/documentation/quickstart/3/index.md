---
layout: page
title: "Tìm hiểu Ruby trong 25 phút"
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
  <h1>Tìm hiểu Ruby trong 25 phút</h1>

---

Bây giờ, chúng ta hãy tạo một đối tượng ChàoMừng và sử dụng nó:

{% highlight irb %}
irb(main):035:0> g = ChàoMừng.new("Pat")
=> #<ChàoMừng:0x16cac @tên="Pat">
irb(main):036:0> g.xin_chào
Xin chào Pat!
=> nil
irb(main):037:0> g.tạm_biệt
Tạm biệt Pat, hẹn gặp lại.
=> nil
{% endhighlight %}

Khi đối tượng `g` được tạo, nó nhớ rằng cái tên là Pat. Vậy nếu chúng ta muốn
lấy một cái tên trực tiếp thì sao?

{% highlight irb %}
irb(main):038:0> g.@tên
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Ồ, không thể làm được.

## Bên trong của đối tượng

Các biến đối tượng thường ẩn trong trong đối tượng. Chúng không ẩn hoàn toàn,
bạn sẽ thấy chúng mỗi khi khởi tạo một đối tượng và có nhiều cách để gọi chúng,
nhưng Ruby sử dụng phương pháp tiếp cận hướng đối tượng tốt trong việc giữ dữ
liệu ẩn đi phần nào.

Vậy những phương thức nào tồn tại cho đối tượng ChàoMừng?

{% highlight irb %}
irb(main):039:0> ChàoMừng.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "xin_chào", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "tạm_biệt", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Quá tuyệt! Có rất nhiều method hay phương thức. Chúng ta chỉ định nghĩa 2 phương
thức, vậy cái gì đây? Đó là **tất cả** các phương thức cho đối tượng Người chào
đón, một danh sách hoàn chỉnh bao gồm cả những phương thức được kế thừa. Nếu
chúng ta muốn một danh sách chỉ có các phương thức định nghĩa cho ChàoMừng,
chúng ta có thể loại bỏ các phương thức được kế thừa bằng cách thêm tham số
`false`, nghĩa là chúng ta không muốn bất kỳ phương thức được kế thừa nào.

{% highlight irb %}
irb(main):040:0> ChàoMừng.instance_methods(false)
=> ["xin_chào", "tạm_biệt"]
{% endhighlight %}

A, được hơn rồi đó. Bây giờ chúng ta hãy xem phương thức nào được đối tượng
ChàoMừng phản hồi:

{% highlight irb %}
irb(main):041:0> g.respond_to?("tên")
=> false
irb(main):042:0> g.respond_to?("xin_chào")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Nó hiểu được `xin_chào` và `to_s` (to string - chuyển sang chuỗi kí tự, một
phương thức mặc định cho mọi đối tượng), nhưng không biết `tên`.

## Thay thế các lớp - Không bao giờ là quá muộn

Nếu bạn muốn có thể xem hoặc thay đổi tên? Ruby cung cấp một cách dễ dàng để
truy xuất dữ liệu tới các biến của một đối tượng.

{% highlight irb %}
irb(main):044:0> class ChàoMừng
irb(main):045:1>   attr_accessor :tên
irb(main):046:1> end
=> [:tên, :tên=]
{% endhighlight %}

Trong Ruby, bạn có thể mở một lớp ở phía trên và sửa nó. Sự thay đổi sẽ xuất
hiện trong các đối tượng mới mà bạn tạo và cả những đối tượng đã tồn tại của
lớp này. Vậy thì chúng ta hãy tạo một đối tượng mới và thử với thuộc tính
`@tên` của nó.

{% highlight irb %}
irb(main):047:0> g = ChàoMừng.new("Andy")
=> #<ChàoMừng:0x3c9b0 @tên="Andy">
irb(main):048:0> g.respond_to?("tên")
=> true
irb(main):049:0> g.respond_to?("tên=")
=> true
irb(main):050:0> g.xin_chào
Xin chào Andy!
=> nil
irb(main):051:0> g.tên="Betty"
=> "Betty"
irb(main):052:0> g
=> #<ChàoMừng:0x3c9b0 @tên="Betty">
irb(main):053:0> g.tên
=> "Betty"
irb(main):054:0> g.xin_chào
Xin chào Betty!
=> nil
{% endhighlight %}

Sử dụng `attr_accessor` định nghĩa 2 phương thức mới cho chúng ta: `tên` để
lấy giá trị và `tên=` để gán giá trị.

## MegaChàoMừng chào mừng tất cả mọi thứ

Trình chào mừng này không thú vị gì nếu nó chỉ chào được một người trong cùng
một thời điểm. Sẽ thế nào nếu chúng ta có thể vài kiểu MegaChàoMừng có thể đồng
thời chào Thế giới, chào một người nào đó hay một danh sách cá nhân?

Chúng ta sẽ viết trong một tập tin thay vì gõ trực tiếp trên IRB.

Để thoát IRB, gõ "quit", "exit" hoặc tổ hợp phím Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaChàoMừng
  attr_accessor :danh_sách_tên

  # Create the object
  def initialize(danh_sách_tên = "Thế giới")
    @danh_sách_tên = danh_sách_tên
  end

  # Nói xin chào tới mọi người
  def xin_chào
    if @danh_sách_tên.nil?
      puts "..."
    elsif @danh_sách_tên.respond_to?("each")
      # @danh_sách_tên là danh sách tên, lặp đi lặp lại!
      @danh_sách_tên.each do |name|
        puts "Xin chào #{name}!"
      end
    else
      puts "Xin chào #{@danh_sách_tên}!"
    end
  end

  # Tạm biệt mọi người
  def tạm_biệt
    if @danh_sách_tên.nil?
      puts "..."
    elsif @danh_sách_tên.respond_to?("join")
      # Gộp các thành phần của danh sách bằng dấu phẩy
      puts "Tạm biệt #{@danh_sách_tên.join(", ")}.  Hẹn gặp lại!"
    else
      puts "Tạm biệt #{@danh_sách_tên}.  Hẹn gặp lại!"
    end
  end

end


if __FILE__ == $0
  mg = MegaChàoMừng.new
  mg.xin_chào
  mg.tạm_biệt

  # Đổi tên thành "Zeke"
  mg.danh_sách_tên = "Zeke"
  mg.xin_chào
  mg.tạm_biệt

  # Đổi tên thành danh sách tên
  mg.danh_sách_tên = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.xin_chào
  mg.tạm_biệt

  # Đổi thành rỗng
  mg.danh_sách_tên = nil
  mg.xin_chào
  mg.tạm_biệt
end
{% endhighlight %}

Lưu tập tin này với tên “ri20min.rb”, và chạy nó “ruby ri20min.rb”. Màn hình sẽ
hiện như này:

    Xin chào Thế giới!
    Tạm biệt Thế giới.  Hẹn gặp lại!
    Xin chào Zeke!
    Tạm biệt Zeke.  Hẹn gặp lại!
    Xin chào Albert!
    Xin chào Brenda!
    Xin chào Charles!
    Xin chào Dave!
    Xin chào Engelbert!
    Tạm biệt Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

Có rất nhiều thứ mới trong ví dụ cuối cùng này và chúng ta
[có thể có cái nhìn sâu hơn tại.](../4/)
