---
layout: page
title: "Đến với Ruby từ các ngôn ngữ khác"
lang: vi
---

Khi bạn xem các đoạn mã của Ruby, nó sẽ làm bạn liên tưởng tới các
ngôn ngữ khác mà bạn đã sử dụng qua. Đây chính là chủ đích. Đa số
cú pháp đều quen thuộc với những ngưởi sử dụng Perl, Python, và Java,
vì vậy nếu bạn đã từng sử dụng qua thì việc làm quen với Ruby sẽ không
mấy khó khăn.
{: .summary}

Tài liệu này có 2 phần chính. Phần đầu tiên là tóm tắt những gì
bạn mong muốn khi chuyển từ ngôn ngữ *X* sang Ruby. Phần thứ hai thảo
luận về các đặc điểm chính của Ruby và so sánh với những ngôn ngữ
mà bạn đã quen thuộc.

## Mong đợi gì: từ *ngôn ngữ X* đến Ruby

* [Đến với Ruby từ C và C++](to-ruby-from-c-and-cpp/)
* [Đến với Ruby từ Java](to-ruby-from-java/)
* [Đến với Ruby từ Perl](to-ruby-from-perl/)
* [Đến với Ruby từ PHP](to-ruby-from-php/)
* [Đến với Ruby từ Python](to-ruby-from-python/)

## Một số vấn đề và tính năng quan trọng của ngôn ngữ

Dưới đây là một số ghi chú và gợi ý về tính năng của Ruby mà bạn sẽ thấy
khi học Ruby.

### Bước lặp

Hai đặc điểm của Ruby có một chút khác biệt với những gì bạn biết trước
đây, trong số đó có một số thường hay được sử dụng, là "blocks" và vòng lặp.
Thay vì phải lặp trên một index (như C, C++, hoặc Java 1.5 trở về trước),
hoặc lặp trên một danh sách (như Perl `for (@a) {...}`, hay Python
`for i in aList: ...`, thì với Ruby bạn sẽ thường xuyên thấy

{% highlight ruby %}
some_list.each do |this_item|
  # chúng ta đang ở trong block.
  # làm việc với biến this_item.
end
{% endhighlight %}

Để hiểu thêm về `each` (và cũng như `collect`, `find`, `inject`,
`sort`, v.v..), xem `ri Enumerable` (và `ri Enumerable#some_method`).

### Tất cả mọi thứ đều có giá trị

Không có sự khác nhau giữa biểu thức và mệnh đề. Tất cả đều có giá trị,
thậm chí giá trị đó là **nil**. Đều có thể:

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

### Các Symbol không phải là String

Những người mới học đều cố gắng hiểu được Symbol là gì, và nó được dùng
cho việc gì.

Symbol có thể được mô tả như là định danh. Symbol là thông tin về **ai**
đó, chứ không phải về **cái gì** đó. Xem `irb` để thấy sự khác biệt:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

`object_id` của phương thức trả về định danh của đối tượng. Nếu hai
đối tượng có chung một `object_id`, thì như nhau (đều trỏ đến cùng
một đối tượng trong vùng nhớ).

Như bạn có thể thấy, một khi đã sử dụng Symbol một lần, thì những
Symbol có cùng ký tự đều tham chiếu đến cùng một đối tượng trong bộ
nhớ. Với bất kỳ 2 Symbol nào có ký tự giống nhau, thì `object_id`
cũng giống nhau.

Bây giờ hãy xem chuỗi String (“george”). Hai `object_id` không giống nhau.
Điều đó nghĩa là nó được tham chiếu tới 2 đối tượng khác nhau trong vùng
nhớ. Bất cứ khi nào bạn sử dụng new String, Ruby sẽ cấp phát vùng nhớ
mới cho nó.

Nếu bạn phân vân trong việc sử dụng Symbol hay String, hãy xem xét xem
cái gì quan trọng hơn: định danh của một đối tượng (i.e một Hash key),
hay là nội dung của nó (như ví dụ bên trên là “george”).

### Mọi thứ đều là đối tượng (Object)

“Mọi thứ đều là đối tượng” không hề nói quá. Thậm chí lớp (Class) và số
đều là đối tượng, và bạn có thể làm việc với chúng giống như các đối
tượng khác:

{% highlight ruby %}
# Lệnh này tương đương với
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Các biến hằng số (Constant)

Các hằng số không thực sự cố định. Nếu bạn chỉnh sửa một hằng số đã được
khởi tạo, nó sẽ kích hoạt cảnh báo, nhưng không ngăn chương trình thực thi.
Nó sẽ không báo rằng bạn **cần** định nghĩa lại hằng số.

### Những quy tắc chung

Ruby áp dụng một số quy ước đặt tên. Nếu một định danh bắt đầu bằng ký
tự hoa, thì đó là hằng số. Nếu nó bắt đầu bằng dấu `$`, thì đó là
biến toàn cục. Nếu như bắt đầu với `@`, thì đó là một thể hiện của biến.
Nếu như bắt đầu với `@@`, thì đó là biến của lớp.

Các tên phương thức, đều có thể bắt đầu với các ký tự hoa.
Điều này có thể dẫn đến sự nhầm lẫn, như ví dụ dưới đây:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Bây giờ `Constant` là 10, nhưng `Constant()` là 11.

### Các từ khóa đối số

Giống như Python, khi các phương thức của Ruby 2.0 có
thể được định nghĩa qua việc sử dụng các tư khóa đối số:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Gửi từ #{from} đến #{to} qua #{via}."
end

deliver(to: "B")
# => "Gửi từ A đến B qua mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Gửi từ B đến A qua Pony Express."
{% endhighlight %}

### Các chân lý tổng quát

Trong Ruby, tất cả mọi thứ ngoài trừ **nil** và **false** thì đều được
xem là true. Trong C, Python và các ngôn ngữ khác, 0 và các giá trị khác,
như các danh sách rỗng, đều được xem là false. Hãy xem đoạn mã Python
dưới đây (ví dụ cũng được áp dụng với các ngôn ngữ khác):

{% highlight python %}
# trong Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

Sẽ trả về kết quả “0 is false”. tương tự với Ruby:

{% highlight ruby %}
# trong Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

Sẽ in ra “0 is true”.

### Phạm vi áp dụng của các truy cập

Trong đoạn mã dưới đây,

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

Bạn muốn `another_method` là public. Nhưng không. Truy cập `private`
có phạm vi ảnh hướng đến toàn bộ các phương thức, hoặc cho đến khi
xuất hiện truy cập khác. Mặc định, các phương thức đều public:

{% highlight ruby %}
class MyClass
  # bây giờ phương thức a_method là public
  def a_method; true; end

  private

  # phương thức another_method là private
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` và `protected` đều là các phương thức, vì vậy nó có thể
có tham số. Nếu bạn truyền một symbol vào thì phương thức đó sẽ bị thay đổi.

### Truy cập phương thức

Trong Java, `public` nghĩa là phương thức có thể được truy cập từ bất
cứ đâu. `protected` nghĩa là thể hiện của lớp đó, và các lớp con của
lớp đó, và không có lớp nào có thể truy cập ngoại trừ lớp con của nó,
và `private` nghĩa là không có bất cứ lớp nào ngoài nó có thể truy cập
vào phương thức đó.

Ruby thì hơi khác một chút. `public` có nghĩa là phương thức công khai.
`private` nghĩa là các phương thức được truy cập khi nó có thể được gọi
mà không có một tiếp nhận rõ ràng. Chỉ có **self** được cho phép là nơi
tiếp nhận khi gọi phương thức private.

`protected` là một truy cập cần được xem xét. Một phương thức protected có thể
được gọi từ một lớp con của lớp thể hiện (lớp cha), nhưng cũng có thề được gọi
bởi lớp thể hiện khác như là một lớp tiếp nhận của nó.
Ví dụ, từ [Ruby Language FAQ][faq]:

{% highlight ruby %}
class Test
  # mặc định là public
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

# bây giờ chuyển `identifier' thành protected, và nó
# vẫn hoạt động vì protected cho phép tham chiếu

class Test
  protected :identifier
end

t1 == t2  # => true

# bây giờ chuyển `identifier' thành private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Các lớp đều mở

Các lớp trong Ruby đều mở. Bạn có thể mở, thêm vào, và thay đổi nó bất cứ lúc nào.
Thậm chí các lớp lõi, như `Integer` hoặc thậm chí là `Object`, lớp chính của mọi
đối tượng. Ruby on Rails định nghĩa một loạt các phương thức để xử lý thời gian
trên `Integer`. Xem bên dưới:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # số giây trong 1 giờ
  end
  alias hour hours
end

# 14 tiếng tính từ 00:00 ngày 1 tháng 1
# (khi bạn thực sự thức dậy ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Các tên phương thức hài hước

Trong Ruby, các phương thức có thể được kết thúc với dấu hỏi hoặc chấm than.
theo quy ước, các phương thức mà trả lời các câu hỏi (ví dụ `Array#empty?`
trả về **true** nếu mảng đó rỗng) kết thúc với dấu hỏi. Các phương thức có khả
năng “nguy hiểm” (ví dụ các phương thức thay đổi **self** hay các đối số,
`exit!` v.v) theo quy ước kết thúc với dấu chấm than. Tất cả các phương thức
thay đổi các đối số không kết thúc với dấu chấm than. `Array#replace`
thay đổi nội dung của mảng với nội dụng của mảng khác. Nó không có ý nghĩa nhiều
để có một phương thức như thế mà **không phải** thay đổi chính nó.

### Các phương thức đơn

Các phương thức đơn là các phương thức cho từng đối tượng. Nó chỉ có trên
đối tượng mà bạn viết riêng cho nó.

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

# Các đối tượng khác không bị ảnh hưởng
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Các phương thức bị thiếu

Ruby không từ bỏ nếu nó không thể tìm được một phương thức để phản
hồi lại một thông điệp cụ thể. Nó được gọi là phương thức `method_missing`
với tên phương thức và các đối số không thể tìm thấy. Mặc định, phương
thức bị thiếu sẽ hiển thị ngoại lệ NameError, nhưng bạn có thể tái định
nghĩa để phù hợp với ứng dụng cũng như thư viện của mình. Đây là một ví dụ:

{% highlight ruby %}
# id là tên của phương thức được gọi, cú pháp * là tập hợp
# tất cả các tham số của mảng có tên 'arguments'
def method_missing(id, *arguments)
  puts "Phương thức #{id} được gọi, nhưng không tìm thấy. Nó có " +
       "các tham số: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Phương thức __ được gọi, nhưng không tìm thấy. Nó có các
# tham số: a, b, 10
{% endhighlight %}

Đoạn mã bên trên chỉ in ra chi tiết của phương thức được gọi,
nhưng bạn có thể xử lý thông điệp theo bất kỳ cách nào mà bạn
cho là phù hợp.

### Truyền thông điệp, không phải gọi chức năng

Gọi một phương thức thực chất là gửi **thông điệp** đến đối tượng khác:

{% highlight ruby %}
# Lệnh này
1 + 2
# tương đương với lệnh
1.+(2)
# và cũng tương đương với lệnh
1.send "+", 2
{% endhighlight %}

### Block cũng là đối tượng

Blocks (bao đóng) được sử dụng nhiều bởi các thư viện chuẩn.
Để gọi một block, bạn cũng có thể dùng `yield`, hoặc làm cho
nó thành một `Proc` bằng các thêm các đối số đặc biệt vào danh
sách đối số, như thế này:

{% highlight ruby %}
def block(&the_block)
  # Bên trong này, the_block là block được truyền vào phương thức
  the_block # đồng thời trả về chính nó
end
adder = block { |a, b| a + b }
# adder bây giờ là một đối tượng Proc
adder.class # => Proc
{% endhighlight %}

Bạn cũng có thể tạo các block bên ngoài phương thức được gọi,
bằng cách gọi `Proc.new` với một block hoặc gọi phương thức `lambda`.

Tương tự như vậy, các phương thức cũng được tạo như đối tượng:

{% highlight ruby %}
method(:puts).call "puts là một đối tượng!"
# => puts là một đối tượng!
{% endhighlight %}

### Toán tử và cú pháp

Hầu hết các toán tử trong Ruby chỉ là cú pháp (với một số quy tắc ưu tiên)
để gọi phương thức. Ví dụ, bạn có thể viết lại phương thức Integers +

{% highlight ruby %}
class Integer
  # Bạn có thể, nhưng tốt nhất là đừng sửa
  def +(other)
    self - other
  end
end
{% endhighlight %}

Bạn không cần `toán tử +` của C++.

Thậm chí bạn cũng có thể truy cập kiểu mảng nếu bạn định nghĩa
các phương thức `[]` và `[]=`. Để định nghĩa toán tử nguyên phân + và -
(như +1 và -2), bạn phải định nghĩa phương thức `+@` và `-@` tương ứng.
Các toán tử dưới đây **không** có cú pháp. Nó không phải là các
phương thức, và không thể tái định nghĩa:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Thêm vào đó, `+=`, `*=` v.v. chỉ là cách viết tắt cho `var = var + other_var`,
`var = var * other_var` v.v và cũng không thể tái định nghĩa.

## Tham khảo thêm

Khi bạn đã sẵn sàng để nâng cao kiến thức về Ruby, xem phần
[Tài liệu](/vi/documentation/) của chúng tôi.



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
