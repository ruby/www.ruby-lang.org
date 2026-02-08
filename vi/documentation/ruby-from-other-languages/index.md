---
layout: page
title: "Đến với Ruby từ các ngôn ngữ khác"
lang: vi
---

Khi bạn lần đầu nhìn vào mã Ruby, nó có thể sẽ gợi nhớ đến
các ngôn ngữ lập trình mà bạn đã từng sử dụng. Điều này là có chủ đích.
Phần lớn cú pháp quen thuộc với người dùng Perl, Python, và Java
(cùng nhiều ngôn ngữ khác), vì vậy nếu bạn đã từng sử dụng chúng,
việc học Ruby sẽ rất dễ dàng.
{: .summary}

Tài liệu này bao gồm hai phần chính. Phần đầu tiên cố gắng tóm tắt
nhanh những gì bạn có thể mong đợi khi chuyển từ ngôn ngữ *X* sang Ruby.
Phần thứ hai đề cập đến các tính năng chính của ngôn ngữ và so sánh
chúng với những gì bạn đã quen thuộc.

## Điều gì sẽ xảy ra: Từ *ngôn ngữ X* đến Ruby

* [Đến với Ruby từ C và C++](to-ruby-from-c-and-cpp/)
* [Đến với Ruby từ Java](to-ruby-from-java/)
* [Đến với Ruby từ Perl](to-ruby-from-perl/)
* [Đến với Ruby từ PHP](to-ruby-from-php/)
* [Đến với Ruby từ Python](to-ruby-from-python/)

## Các tính năng quan trọng của ngôn ngữ và một số điều cần lưu ý

Dưới đây là một số gợi ý và chỉ dẫn về các tính năng chính của Ruby mà
bạn sẽ gặp khi học Ruby.

### Vòng lặp

Hai tính năng của Ruby hơi khác so với những gì bạn có thể đã thấy trước
đây, và cần một chút thời gian để làm quen, đó là "block" và iterator.
Thay vì lặp qua một chỉ số (như với C, C++, hoặc Java trước phiên bản 1.5),
hoặc lặp qua một danh sách (như `for (@a) {...}` của Perl, hoặc
`for i in aList: ...` của Python), với Ruby bạn sẽ thường thấy

{% highlight ruby %}
some_list.each do |this_item|
  # We're inside the block.
  # deal with this_item.
end
{% endhighlight %}

Để biết thêm thông tin về `each` (và các hàm liên quan `collect`, `find`,
`inject`, `sort`, v.v.), hãy xem `ri Enumerable`
(và sau đó `ri Enumerable#some_method`).

### Mọi thứ đều có giá trị

Không có sự khác biệt giữa biểu thức và câu lệnh. Mọi thứ
đều có giá trị, ngay cả khi giá trị đó là `nil`. Điều này hoàn toàn hợp lệ:

{% highlight ruby %}
x = 10
y = 11
z = if x < y
      true
    else
      false
    end
z # => true
{% endhighlight %}

### Symbol không phải là String nhẹ

Nhiều người mới học Ruby gặp khó khăn trong việc hiểu Symbol là gì và
chúng có thể được sử dụng để làm gì.

Symbol có thể được mô tả tốt nhất như là định danh. Một symbol quan trọng
ở **nó là ai**, không phải **nó là gì**. Hãy mở `irb` lên và xem sự
khác biệt:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Phương thức `object_id` trả về định danh của một Object. Nếu hai
đối tượng có cùng `object_id`, chúng là một (trỏ đến cùng một
Object trong bộ nhớ).

Như bạn thấy, khi bạn đã sử dụng một Symbol, bất kỳ Symbol nào có cùng
ký tự đều tham chiếu đến cùng một Object trong bộ nhớ. Với bất kỳ hai
Symbol nào đại diện cho cùng các ký tự, `object_id` của chúng khớp nhau.

Bây giờ hãy nhìn vào String ("george"). Các `object_id` không khớp nhau.
Điều đó có nghĩa là chúng đang tham chiếu đến hai đối tượng khác nhau
trong bộ nhớ. Mỗi khi bạn sử dụng một String mới, Ruby cấp phát bộ nhớ
cho nó.

Nếu bạn phân vân nên sử dụng Symbol hay String, hãy xem xét điều gì
quan trọng hơn: định danh của một đối tượng (ví dụ: một khóa Hash), hay
nội dung (trong ví dụ trên, "george").

### Mọi thứ đều là Object

"Mọi thứ đều là object" không chỉ là cường điệu. Ngay cả các lớp và
số nguyên cũng là object, và bạn có thể làm những điều tương tự với chúng
như với bất kỳ object nào khác:

{% highlight ruby %}
# This is the same as
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Hằng số có thể thay đổi

Hằng số không thực sự là hằng số. Nếu bạn thay đổi một hằng số đã được
khởi tạo, nó sẽ kích hoạt cảnh báo, nhưng không dừng chương trình của bạn.
Tuy nhiên, điều đó không có nghĩa là bạn **nên** định nghĩa lại hằng số.

### Quy ước đặt tên

Ruby áp dụng một số quy ước đặt tên. Nếu một định danh bắt đầu bằng
chữ hoa, nó là hằng số. Nếu nó bắt đầu bằng dấu đô la (`$`), nó là
biến toàn cục. Nếu nó bắt đầu bằng `@`, nó là biến instance. Nếu nó
bắt đầu bằng `@@`, nó là biến lớp.

Tuy nhiên, tên phương thức được phép bắt đầu bằng chữ hoa. Điều này
có thể gây nhầm lẫn, như ví dụ dưới đây cho thấy:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Bây giờ `Constant` là 10, nhưng `Constant()` là 11.

### Tham số từ khóa

Giống như Python, từ Ruby 2.0 các phương thức có thể được định nghĩa
sử dụng tham số từ khóa:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### Sự thật tuyệt đối

Trong Ruby, mọi thứ trừ `nil` và `false` đều được coi là true. Trong
C, Python và nhiều ngôn ngữ khác, 0 và có thể các giá trị khác, chẳng hạn
như danh sách rỗng, được coi là false. Hãy xem đoạn mã Python sau
(ví dụ cũng áp dụng cho các ngôn ngữ khác):

{% highlight python %}
# in Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

Đoạn mã này sẽ in ra "0 is false". Tương đương trong Ruby:

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

In ra "0 is true".

### Phạm vi truy cập áp dụng đến cuối phạm vi

Trong đoạn mã Ruby sau,

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

Bạn có thể nghĩ rằng `another_method` là public. Nhưng không phải vậy.
Bộ điều chỉnh truy cập `private` tiếp tục có hiệu lực cho đến cuối
phạm vi, hoặc cho đến khi một bộ điều chỉnh truy cập khác xuất hiện,
tùy điều nào đến trước. Mặc định, các phương thức là public:

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method is private
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` và `protected` thực ra là các phương thức, vì vậy chúng
có thể nhận tham số. Nếu bạn truyền một Symbol cho một trong số chúng,
phạm vi truy cập của phương thức đó sẽ được thay đổi.

### Quyền truy cập phương thức

Trong Java, `public` có nghĩa là phương thức có thể được truy cập bởi
bất kỳ ai. `protected` có nghĩa là các instance của lớp, các instance
của lớp con, và các instance của các lớp trong cùng package có thể truy
cập, nhưng không ai khác, và `private` có nghĩa là không ai ngoài các
instance của lớp có thể truy cập phương thức.

Ruby có một chút khác biệt. `public` thì tự nhiên là public. `private`
có nghĩa là phương thức chỉ có thể được truy cập khi chúng có thể được
gọi mà không cần bộ nhận (receiver) tường minh. Chỉ `self` được phép
là bộ nhận của lệnh gọi phương thức private.

`protected` là cái cần chú ý. Một phương thức protected có thể được gọi
từ các instance của lớp hoặc lớp con, nhưng cũng có thể với một instance
khác làm bộ nhận.
Đây là một ví dụ (chuyển thể từ [The Ruby Language FAQ][faq]):

{% highlight ruby %}
class Test
  # public by default
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# now make `identifier' protected; it still works
# because protected allows `other' as receiver

class Test
  protected :identifier
end

t1 == t2  # => true

# now make `identifier' private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Lớp mở

Các lớp trong Ruby là mở. Bạn có thể mở chúng ra, thêm vào, và thay đổi
chúng bất cứ lúc nào. Ngay cả các lớp lõi, như `Integer` hoặc thậm chí
`Object`, lớp cha của tất cả các đối tượng. Ruby on Rails định nghĩa
nhiều phương thức xử lý thời gian trên `Integer`. Hãy xem:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # number of seconds in an hour
  end
  alias hour hours
end

# 14 hours from 00:00 January 1st
# (aka when you finally wake up ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Tên phương thức thú vị

Trong Ruby, các phương thức được phép kết thúc bằng dấu hỏi hoặc dấu chấm
than. Theo quy ước, các phương thức trả lời câu hỏi kết thúc bằng dấu hỏi
(ví dụ `Array#empty?`, trả về `true` nếu bộ nhận rỗng). Các phương thức
có thể "nguy hiểm" theo quy ước kết thúc bằng dấu chấm than (ví dụ
các phương thức thay đổi `self` hoặc các tham số, `exit!`, v.v.).
Tuy nhiên, không phải tất cả các phương thức thay đổi tham số đều kết thúc
bằng dấu chấm than. `Array#replace` thay thế nội dung của một mảng bằng
nội dung của một mảng khác. Sẽ không hợp lý nếu có một phương thức như vậy
mà lại **không** thay đổi self.

### Phương thức singleton

Phương thức singleton là các phương thức dành riêng cho từng đối tượng.
Chúng chỉ có sẵn trên Object mà bạn đã định nghĩa nó.

{% highlight ruby %}
class Car
  def inspect
    "Cheap car"
  end
end

porsche = Car.new
porsche.inspect # => Cheap car
def porsche.inspect
  "Expensive car"
end

porsche.inspect # => Expensive car

# Other objects are not affected
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Phương thức bị thiếu

Ruby không bỏ cuộc nếu nó không tìm thấy phương thức phản hồi một
thông điệp cụ thể. Nó gọi phương thức `method_missing` với tên của
phương thức không tìm thấy và các tham số. Mặc định, `method_missing`
ném ra ngoại lệ NameError, nhưng bạn có thể định nghĩa lại nó cho phù
hợp với ứng dụng của bạn, và nhiều thư viện làm như vậy. Đây là một ví dụ:

{% highlight ruby %}
# id is the name of the method called, the * syntax collects
# all the arguments in an array named 'arguments'
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

Đoạn mã trên chỉ in ra chi tiết của lệnh gọi, nhưng bạn hoàn toàn
tự do xử lý thông điệp theo bất kỳ cách nào phù hợp.

### Truyền thông điệp, không phải gọi hàm

Một lệnh gọi phương thức thực chất là một **thông điệp** gửi đến đối
tượng khác:

{% highlight ruby %}
# This
1 + 2
# Is the same as this ...
1.+(2)
# Which is the same as this:
1.send "+", 2
{% endhighlight %}

### Block là Object, chúng chỉ chưa biết điều đó

Block (thực chất là closure) được sử dụng rất nhiều bởi thư viện chuẩn.
Để gọi một block, bạn có thể sử dụng `yield`, hoặc biến nó thành `Proc`
bằng cách thêm một tham số đặc biệt vào danh sách tham số, như sau:

{% highlight ruby %}
def block(&the_block)
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder is now a Proc object
adder.class # => Proc
{% endhighlight %}

Bạn cũng có thể tạo block bên ngoài lệnh gọi phương thức bằng cách gọi
`Proc.new` với một block hoặc gọi phương thức `lambda`.

Tương tự, các phương thức cũng là Object đang hình thành:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Toán tử là cú pháp ngọt

Hầu hết các toán tử trong Ruby chỉ là cú pháp ngọt (syntactic sugar)
(với một số quy tắc ưu tiên) cho lệnh gọi phương thức. Ví dụ, bạn có thể
ghi đè phương thức `+` của Integer:

{% highlight ruby %}
class Integer
  # You can, but please don't do this
  def +(other)
    self - other
  end
end
{% endhighlight %}

Bạn không cần `operator+` của C++, v.v.

Bạn thậm chí có thể có truy cập kiểu mảng nếu bạn định nghĩa các phương
thức `[]` và `[]=`. Để định nghĩa toán tử một ngôi + và - (ví dụ +1 và -2),
bạn phải định nghĩa các phương thức `+@` và `-@`, tương ứng. Tuy nhiên,
các toán tử dưới đây **không** phải là cú pháp ngọt. Chúng không phải là
phương thức, và không thể được định nghĩa lại:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Ngoài ra, `+=`, `*=` v.v. chỉ là viết tắt cho `var = var + other_var`,
`var = var * other_var`, v.v. và do đó không thể được định nghĩa lại.

## Tìm hiểu thêm

Khi bạn đã sẵn sàng để tìm hiểu thêm về Ruby, hãy xem phần
[Tài liệu](/vi/documentation/) của chúng tôi.



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
