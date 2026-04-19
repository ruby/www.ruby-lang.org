---
layout: page
title: "Câu hỏi thường gặp về Ruby"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <strong>7</strong>
    <span class="separator"> | </span>
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Phương thức

### Ruby chọn phương thức nào để gọi như thế nào?

Ruby liên kết tất cả các thông điệp với phương thức một cách động. Nó tìm kiếm
trước tiên các phương thức singleton trong bộ nhận, sau đó các phương thức được
định nghĩa trong lớp riêng của bộ nhận, và cuối cùng các phương thức được định
nghĩa trong các lớp cha của bộ nhận (bao gồm bất kỳ module nào đã được trộn
vào). Bạn có thể xem thứ tự tìm kiếm bằng cách hiển thị
`ClassName.ancestors`, cho thấy các lớp tổ tiên và module của `ClassName`.

Nếu sau khi tìm kiếm tất cả các phương án mà không tìm thấy phương thức phù
hợp, Ruby sẽ cố gắng gọi một phương thức có tên `method_missing`, lặp lại
cùng quy trình tìm kiếm để tìm nó. Điều này cho phép bạn xử lý các thông
điệp đến các phương thức không xác định, và thường được sử dụng để cung cấp
giao diện động cho các lớp.

~~~
module Emphasizable
  def emphasize
    "**#{self}**"
  end
end

class String
  include Emphasizable
end

String.ancestors
  # => [String, Emphasizable, Comparable, Object, Kernel, BasicObject]

"Wow!".emphasize  # => "**Wow!**"
~~~

Khi phương thức `emphasize` được tìm kiếm, nó không được tìm thấy trong lớp
`String`, nên Ruby tìm tiếp trong module `Emphasizable`.

Để ghi đè một phương thức đã tồn tại trong lớp của bộ nhận, ví dụ
`String#capitalize`, bạn cần chèn module vào chuỗi tổ tiên phía trước lớp đó,
bằng cách sử dụng `prepend`:

~~~
module PrettyCapitalize
  def capitalize
    "**#{super}**"
  end
end

class String
  prepend PrettyCapitalize
end

String.ancestors
  # => [PrettyCapitalize, String, Comparable, Object, Kernel, BasicObject]

"hello".capitalize  # => "**Hello**"
~~~

### `+`, `-`, `*`, ... có phải là toán tử không?

`+`, `-` và những thứ tương tự không phải là toán tử mà là lời gọi phương
thức. Do đó, chúng có thể được nạp chồng bằng các định nghĩa mới.

~~~
class MyString < String
  def -(other)
    self[0...other.size]  # self truncated to other's size
  end
end
~~~

Tuy nhiên, các cấu trúc điều khiển có sẵn sau đây không phải là phương thức
và không thể bị ghi đè:

~~~
=, .., ..., not, ||, &&, and, or, ::
~~~

Để nạp chồng hoặc định nghĩa toán tử `+` và `-` đơn nguyên,
bạn cần sử dụng `+@` và `-@` làm tên phương thức.

`=` được sử dụng để định nghĩa phương thức thiết lập thuộc tính của đối tượng:

~~~
class Test
  def attribute=(val)
    @attribute = val
  end
end

t = Test.new
t.attribute = 1
~~~

Nếu các toán tử như `+` và `-` được định nghĩa, Ruby sẽ tự động xử lý các
dạng tự gán (`+=`, `-=`, v.v.).

### `++` và `--` ở đâu?

Ruby không có toán tử tự tăng và tự giảm.
Bạn có thể sử dụng `+= 1` và `-= 1` thay thế.

### Phương thức singleton là gì?
{: #singleton-method}

Phương thức singleton là một phương thức thể hiện được liên kết với một đối
tượng cụ thể.

Bạn tạo phương thức singleton bằng cách bao gồm đối tượng trong định nghĩa:

~~~
class Foo; end

foo = Foo.new
bar = Foo.new

def foo.hello
  puts "Hello"
end

foo.hello
bar.hello
~~~

Kết quả:

~~~
Hello
prog.rb:11:in `<main>': undefined method `hello' for #<Foo:0x000000010f5a40> (NoMethodError)
~~~

Phương thức singleton hữu ích khi bạn muốn thêm phương thức vào một đối tượng
và việc tạo một lớp con mới là không phù hợp.

### Tất cả các đối tượng này đều tốt, nhưng Ruby có hàm đơn giản không?

Có và không. Ruby có các phương thức trông giống như hàm trong các ngôn ngữ
như C hoặc Perl:

~~~
def hello(name)
  puts "Hello, #{name}!"
end

hello("World")
~~~

Kết quả:

~~~
Hello, World!
~~~

Tuy nhiên, chúng thực chất là lời gọi phương thức với bộ nhận bị bỏ qua.
Trong trường hợp này, Ruby giả định bộ nhận là self.

Vì vậy, `hello` giống như một hàm nhưng thực chất là một phương thức thuộc
lớp `Object` và được gửi dưới dạng thông điệp đến bộ nhận ẩn self.
Ruby là một ngôn ngữ hướng đối tượng thuần túy.

Tất nhiên bạn có thể sử dụng các phương thức như vậy như thể chúng là hàm.

### Vậy tất cả các phương thức giống hàm này đến từ đâu?

Hầu hết tất cả các lớp trong Ruby đều kế thừa từ lớp `Object`. Định nghĩa
của lớp `Object` trộn vào các phương thức được định nghĩa trong module
`Kernel`. Do đó, các phương thức này có sẵn trong mọi đối tượng trong hệ
thống.

Ngay cả khi bạn đang viết một chương trình Ruby đơn giản mà không có lớp,
bạn thực chất đang làm việc bên trong lớp `Object`.

### Tôi có thể truy cập biến thể hiện của đối tượng không?

Các biến thể hiện của đối tượng (những biến bắt đầu bằng `@`) không thể truy
cập trực tiếp từ bên ngoài đối tượng. Điều này thúc đẩy tính đóng gói tốt.
Tuy nhiên, Ruby giúp bạn dễ dàng định nghĩa các accessor cho các biến thể
hiện này theo cách mà người dùng lớp của bạn có thể xử lý biến thể hiện giống
như thuộc tính. Chỉ cần sử dụng một hoặc nhiều `attr_reader`, `attr_writer`
hoặc `attr_accessor`.

~~~
class Person
  attr_reader   :name           # read only
  attr_accessor :wearing_a_hat  # read/write

  def initialize(name)
    @name = name
  end
end

p = Person.new("Dave")
p.name           # => "Dave"
p.wearing_a_hat  # => nil
p.wearing_a_hat = true
p.wearing_a_hat  # => true
~~~

Bạn cũng có thể tự định nghĩa các hàm accessor (có thể để thực hiện kiểm
tra hợp lệ, hoặc để xử lý các thuộc tính dẫn xuất). Accessor đọc đơn giản
là một phương thức không nhận tham số, và accessor gán là một phương thức có
tên kết thúc bằng `=` nhận một tham số duy nhất. Mặc dù không thể có khoảng
trắng giữa tên phương thức và `=` trong định nghĩa phương thức, bạn có thể
chèn khoảng trắng ở đó khi gọi phương thức, làm cho nó trông giống như bất
kỳ phép gán nào khác. Bạn cũng có thể sử dụng các phép tự gán như `+=` và
`-=`, miễn là phương thức `+` hoặc `-` tương ứng đã được định nghĩa.

### Sự khác biệt giữa `private` và `protected` là gì?

Từ khóa khả năng hiển thị `private` làm cho phương thức chỉ có thể gọi được
dưới dạng hàm, không có bộ nhận tường minh, và do đó chỉ có thể có `self`
là bộ nhận. Phương thức private chỉ có thể gọi được trong lớp mà phương thức
được định nghĩa hoặc trong các lớp con của nó.

~~~
class Test
  def foo
    99
  end

  def test(other)
    p foo
    p other.foo
  end
end

t1 = Test.new
t2 = Test.new

t1.test(t2)

# Now make `foo' private

class Test
  private :foo
end

t1.test(t2)
~~~

Kết quả:

~~~
99
99
99
prog.rb:8:in `test': private method `foo' called for #<Test:0x00000000b57a48> (NoMethodError)
        from prog.rb:23:in `<main>'
~~~

Các phương thức protected cũng chỉ có thể gọi được từ bên trong lớp của
chúng hoặc các lớp con, nhưng chúng có thể được gọi cả dưới dạng hàm và
với bộ nhận. Ví dụ:

~~~
def <=>(other)
  age <=> other.age
end
~~~

Sẽ biên dịch được nếu `age` là phương thức protected, nhưng không nếu nó là
private.

Các tính năng này giúp bạn kiểm soát quyền truy cập vào nội bộ của lớp.

### Làm thế nào để thay đổi khả năng hiển thị của phương thức?

Bạn thay đổi khả năng hiển thị của phương thức bằng `private`, `protected`
và `public`. Khi được sử dụng không có tham số trong định nghĩa lớp, chúng
ảnh hưởng đến khả năng hiển thị của các phương thức tiếp theo. Khi được sử
dụng với tham số, chúng thay đổi khả năng hiển thị của các phương thức được
đặt tên.

~~~
class Foo
  def test
    puts "hello"
  end
  private :test
end

foo = Foo.new
foo.test
~~~

Kết quả:

~~~
prog.rb:9:in `<main>': private method `test' called for #<Foo:0x0000000284dda0> (NoMethodError)
~~~

Bạn có thể đặt phương thức lớp thành private bằng `private_class_method`.

~~~
class Foo
  def self.test
    puts "hello"
  end
  private_class_method :test
end

Foo.test
~~~

Kết quả:

~~~
prog.rb:8:in `<main>': private method `test' called for Foo:Class (NoMethodError)
~~~

Khả năng hiển thị mặc định cho các phương thức được định nghĩa trong lớp là
public. Ngoại lệ là phương thức khởi tạo thể hiện, `initialize`.

Các phương thức được định nghĩa ở cấp cao nhất cũng mặc định là public.

### Định danh bắt đầu bằng chữ hoa có thể là tên phương thức không?

Có, nhưng chúng ta không nên làm điều đó một cách thiếu cân nhắc! Nếu Ruby
thấy một tên viết hoa theo sau bởi khoảng trắng, nó có thể (tùy theo ngữ
cảnh) giả định đó là hằng số, không phải tên phương thức. Vì vậy, nếu bạn
sử dụng tên phương thức viết hoa, luôn nhớ đặt danh sách tham số trong ngoặc
đơn, và luôn đặt ngoặc đơn sát tên phương thức không có khoảng trắng xen
giữa. (Gợi ý cuối cùng này là ý tưởng tốt trong mọi trường hợp!)

### Gọi `super` bị lỗi `ArgumentError`.

Gọi `super` không có tham số trong một phương thức sẽ truyền tất cả các đối
số của phương thức đó đến phương thức cùng tên trong lớp cha. Nếu số lượng
đối số của phương thức gốc không khớp với phương thức cấp cao hơn, lỗi
`ArgumentError` sẽ được phát sinh. Để khắc phục điều này, chỉ cần gọi `super`
và truyền số lượng đối số phù hợp.

### Làm thế nào để gọi phương thức cùng tên hai cấp trên?

`super` gọi phương thức cùng tên một cấp trên. Nếu bạn đang nạp chồng một
phương thức trong lớp tổ tiên xa hơn, hãy sử dụng `alias` để đặt cho nó
một tên mới trước khi che phủ nó bằng định nghĩa phương thức của bạn. Sau đó
bạn có thể gọi nó bằng tên bí danh đó.

### Làm thế nào để gọi phương thức có sẵn gốc sau khi định nghĩa lại nó?

Trong định nghĩa phương thức, bạn có thể sử dụng `super`. Bạn cũng có thể
sử dụng `alias` để đặt cho nó một tên thay thế. Cuối cùng, bạn có thể gọi
phương thức gốc như một phương thức singleton của `Kernel`.

### Phương thức hủy là gì?
{: #destructive-method}

Phương thức hủy là phương thức thay đổi trạng thái của đối tượng. `String`,
`Array`, `Hash` và những lớp khác có các phương thức như vậy. Thường có hai
phiên bản của một phương thức, một với tên thường, phiên bản khác có cùng tên
nhưng theo sau bởi `!`. Phiên bản thường tạo một bản sao của bộ nhận, thực
hiện thay đổi trên đó và trả về bản sao. Phiên bản "bang" (có `!`) sửa đổi
bộ nhận tại chỗ.

Tuy nhiên, hãy lưu ý rằng có khá nhiều phương thức hủy không có `!`, bao gồm
các phương thức gán (`name=`), gán mảng (`[]=`), và các phương thức như
`Array.delete`.

### Tại sao phương thức hủy có thể nguy hiểm?

Hãy nhớ rằng phép gán trong hầu hết các trường hợp chỉ sao chép tham chiếu
đối tượng, và việc truyền tham số tương đương với phép gán. Điều này có nghĩa
là bạn có thể có nhiều biến tham chiếu đến cùng một đối tượng. Nếu một trong
những biến đó được sử dụng để gọi phương thức hủy, đối tượng được tham chiếu
bởi tất cả chúng sẽ bị thay đổi.

~~~
def foo(str)
  str.sub!(/foo/, "baz")
end

obj = "foo"
foo(obj)     # => "baz"
obj          # => "baz"
~~~

Trong trường hợp này, đối số thực tế bị thay đổi.

### Tôi có thể trả về nhiều giá trị từ phương thức không?

Có và không.

~~~
def m1
  return 1, 2, 3
end

def m2
  [1, 2, 3]
end

m1  # => [1, 2, 3]
m2  # => [1, 2, 3]
~~~

Vậy, chỉ một thứ được trả về, nhưng thứ đó có thể là một đối tượng phức tạp
tùy ý. Trong trường hợp mảng, bạn có thể sử dụng phép gán đa trị để có được
hiệu ứng trả về nhiều giá trị. Ví dụ:

~~~
def foo
  [20, 4, 17]
end

a, b, c = foo
a              # => 20
b              # => 4
c              # => 17
~~~
