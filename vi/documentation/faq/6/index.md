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
    <strong>6</strong>
    <span class="separator"> | </span>
    <a href="../7/" title="Part 7">7</a>
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

## Cú pháp

### Sự khác biệt giữa giá trị trực tiếp và tham chiếu là gì?
{: #immediate}

{% include warnings/faq-out-of-date.html %}

`Fixnum`, `true`, `nil` và `false` được triển khai dưới dạng giá trị trực
tiếp. Với giá trị trực tiếp, biến chứa chính đối tượng, thay vì tham chiếu
đến chúng.

Không thể định nghĩa phương thức singleton cho các đối tượng như vậy. Hai
`Fixnum` có cùng giá trị luôn đại diện cho cùng một thể hiện đối tượng,
nên (ví dụ) các biến thể hiện cho `Fixnum` có giá trị `1` được chia sẻ giữa
tất cả các `1` trong hệ thống. Điều này khiến việc định nghĩa phương thức
singleton cho chỉ một trong số chúng là không thể.

### Sự khác biệt giữa `nil` và `false` là gì?

Trước hết là điểm tương đồng: `nil` và `false` là hai đối tượng duy nhất
được đánh giá là `false` trong ngữ cảnh boolean.
(Nói cách khác: chúng là hai giá trị "falsy" duy nhất, tất cả các đối tượng
khác đều là "truthy".)

Tuy nhiên, `nil` và `false` là thể hiện của các lớp khác nhau
(`NilClass` và `FalseClass`), và có hành vi khác nhau ở những chỗ khác.

Chúng tôi khuyến nghị các phương thức vị ngữ (những phương thức có tên kết
thúc bằng dấu hỏi) nên trả về `true` hoặc `false`. Các phương thức khác cần
chỉ ra sự thất bại nên trả về `nil`.

### Tại sao chuỗi rỗng không phải là `false`?

H: Một chuỗi rỗng (`""`) trả về `true` trong biểu thức điều kiện!
Trong Perl, nó là `false`.

Đ: Nhưng Ruby không phải là Perl ;-). Rất đơn giản: trong Ruby, chỉ có `nil`
và `false` là false trong ngữ cảnh điều kiện.

Bạn có thể sử dụng `empty?`, so sánh chuỗi với `""`, hoặc so sánh `size`
hoặc `length` của chuỗi với `0` để kiểm tra xem một chuỗi có rỗng hay không.

### `:name` có ý nghĩa gì?

Một dấu hai chấm theo sau bởi một tên tạo ra một đối tượng Symbol tương ứng
một-một với định danh đó. Trong suốt thời gian thực thi chương trình, cùng
một đối tượng Symbol sẽ được tạo cho một tên hoặc chuỗi nhất định.
Symbol cũng có thể được tạo bằng `"name".intern` hoặc `"name".to_sym`.

Các đối tượng Symbol có thể đại diện cho các định danh của phương thức, biến,
v.v. Một số phương thức, như `define_method`, `method_missing` hoặc
`trace_var`, yêu cầu một symbol. Các phương thức khác, ví dụ `attr_accessor`,
`send` hoặc `autoload`, cũng chấp nhận chuỗi.

Do chỉ được tạo một lần, Symbol thường được sử dụng làm khóa hash.
Khóa hash dạng chuỗi sẽ tạo một đối tượng mới cho mỗi lần sử dụng, gây ra
một số chi phí bộ nhớ.
Thậm chí còn có cú pháp đặc biệt cho khóa hash dạng symbol:

~~~
person_1 = { :name => "John", :age => 42 }
person_2 = { name: "Jane", age: 24 }        # alternate syntax
~~~

Symbol cũng có thể được sử dụng làm giá trị liệt kê
hoặc để gán giá trị duy nhất cho các hằng số:

~~~
status = :open  # :closed, ...

NORTH = :NORTH
SOUTH = :SOUTH
~~~

### Làm thế nào để truy cập giá trị của symbol?

Để lấy giá trị của biến tương ứng với một symbol, bạn có thể sử dụng
`symbol.to_s` hoặc `"#{symbol}"` để lấy tên của biến, rồi eval nó trong phạm
vi của symbol để lấy nội dung của biến:

~~~
a = "This is the content of `a'"
b = eval("#{:a}")
a.object_id == b.object_id  # => true
~~~

Bạn cũng có thể sử dụng

~~~
b = binding.local_variable_get(:a)
~~~

Nếu symbol của bạn tương ứng với tên một phương thức, bạn có thể sử dụng
`send`:

~~~
class Demo
  def hello
    "Hello, world"
  end
end

demo = Demo.new
demo.send(:hello)
~~~

Hoặc bạn có thể sử dụng `Object#method` để trả về đối tượng `Method` tương
ứng, rồi gọi nó:

~~~
m = demo.method(:hello)  # => #<Method: Demo#hello>
m.call                   # => "Hello, world"
~~~

### `loop` có phải là cấu trúc điều khiển không?

Mặc dù `loop` trông giống như một cấu trúc điều khiển, nhưng thực chất nó là
một phương thức được định nghĩa trong `Kernel`. Khối theo sau tạo ra một phạm
vi mới cho các biến cục bộ.

### Ruby không có vòng lặp kiểm tra điều kiện sau

H: Ruby không có cấu trúc `do { ... } while`, vậy làm thế nào để triển khai
các vòng lặp kiểm tra điều kiện ở cuối?

Clemens Hintze nói: Bạn có thể sử dụng kết hợp `begin ... end` của Ruby
và bổ ngữ `while` hoặc `until` để đạt được hiệu quả tương tự:

~~~
i = 0
begin
  puts "i = #{i}"
  i += 1
end until i > 4
~~~

Kết quả:

~~~
i = 0
i = 1
i = 2
i = 3
i = 4
~~~

### Tại sao tôi không thể truyền hash literal cho phương thức: `p {}`?

`{}` được phân tích cú pháp như một khối, không phải hàm tạo `Hash`. Bạn có
thể buộc `{}` được xử lý như một biểu thức bằng cách chỉ rõ rằng nó là một
tham số: `p({})`.

### Tôi không thể làm cho `def pos=(val)` hoạt động!

Tôi có đoạn mã sau, nhưng không thể sử dụng phương thức `pos = 1`.

~~~
def pos=(val)
  @pos = val
  puts @pos
end
~~~

Các phương thức có `=` ở cuối phải được gọi với bộ nhận tường minh
(nếu không có bộ nhận, bạn chỉ đang gán cho một biến cục bộ).
Gọi nó bằng `self.pos = 1`.

### Sự khác biệt giữa `'\1'` và `'\\1'` là gì?

Chúng có cùng ý nghĩa. Trong chuỗi nháy đơn, chỉ `\'` và `\\`
được chuyển đổi và các tổ hợp khác giữ nguyên.

Tuy nhiên, trong chuỗi nháy kép, `"\1"` là byte `\001`
(một mẫu bit bát phân), trong khi `"\\1"` là chuỗi hai ký tự
chứa một dấu gạch chéo ngược và ký tự `"1"`.

### Sự khác biệt giữa `..` và `...` là gì?

`..` bao gồm giá trị bên phải trong phạm vi, `...` thì không:

~~~
(5..8).to_a   # => [5, 6, 7, 8]
(5...8).to_a  # => [5, 6, 7]
~~~

### Sự khác biệt giữa `or` và `||` là gì?

H: `p(nil || "Hello")` in ra `"Hello"`, trong khi `p(nil or "Hello")` gây ra
lỗi phân tích cú pháp. Tại sao?

Đ: `or` có mức ưu tiên rất thấp, `p( (nil or "Hello") )` sẽ hoạt động.

Mức ưu tiên của `or` ví dụ cũng thấp hơn so với `=`,
trong khi `||` có mức ưu tiên cao hơn:

~~~
foo = nil || "Hello"  # parsed as: foo = (nil || "Hello")
foo  # => "Hello"

# but perhaps surprisingly:

foo = nil or "Hello"  # parsed as: (foo = nil) or "Hello"
foo  # => nil
~~~

`or` (và tương tự `and`) tốt nhất nên được sử dụng **không** phải để kết hợp
các biểu thức boolean, mà cho luồng điều khiển, như trong

~~~
do_something  or raise "some error!"
~~~

trong đó `do_something` trả về `false` hoặc `nil` khi có lỗi xảy ra.

### Ruby có con trỏ hàm không?

Đối tượng `Proc` được tạo bởi `Proc.new`, `proc` hoặc `lambda` có thể được
tham chiếu từ một biến, nên biến đó có thể được coi là một con trỏ hàm. Bạn
cũng có thể lấy tham chiếu đến các phương thức trong một thể hiện đối tượng
cụ thể bằng `object.method`.

### Sự khác biệt giữa `load` và `require` là gì?

`load` sẽ nạp và thực thi một chương trình Ruby (`*.rb`).

`require` cũng nạp các chương trình Ruby, nhưng còn nạp các module mở rộng
Ruby dạng nhị phân (thư viện chia sẻ hoặc DLL). Ngoài ra,
`require` đảm bảo rằng một tính năng không bao giờ được nạp nhiều hơn một lần.

### Ruby có xử lý ngoại lệ không?

Ruby hỗ trợ cơ chế xử lý ngoại lệ linh hoạt:

~~~
begin
  statements which may raise exceptions
rescue [exception class names]
  statements when an exception occurred
rescue [exception class names]
  statements when an exception occurred
ensure
  statements that will always run
end
~~~

Nếu một ngoại lệ xảy ra trong mệnh đề `begin`, mệnh đề `rescue` có tên
ngoại lệ phù hợp sẽ được thực thi. Mệnh đề `ensure` được thực thi bất kể
có ngoại lệ xảy ra hay không. Các mệnh đề `rescue` và `ensure` có thể được
bỏ qua.

Nếu không có lớp ngoại lệ nào được chỉ định cho mệnh đề `rescue`, ngoại lệ
`StandardError` được ngụ ý, và các ngoại lệ có quan hệ `is_a?` với
`StandardError` sẽ được bắt.

Biểu thức này trả về giá trị của mệnh đề `begin`.

Ngoại lệ mới nhất được truy cập bằng biến toàn cục `$!`
(và do đó kiểu của nó có thể được xác định bằng `$!.type`).
