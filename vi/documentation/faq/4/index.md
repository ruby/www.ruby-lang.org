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
    <strong>4</strong>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
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

## Biến, hằng số và đối số

### Phép gán có tạo ra một bản sao mới của đối tượng không?
{: #assignment}

Tất cả các biến và hằng số đều tham chiếu (trỏ đến) một đối tượng nào đó.
(Ngoại trừ các biến cục bộ chưa được khởi tạo, chúng không tham chiếu đến
bất kỳ thứ gì. Chúng sẽ phát sinh ngoại lệ `NameError` nếu được sử dụng).
Khi bạn gán giá trị cho một biến, hoặc khởi tạo một hằng số, bạn đang thiết
lập đối tượng mà biến hoặc hằng số đó tham chiếu đến.

Do đó, bản thân phép gán không bao giờ tạo ra một bản sao mới của đối tượng.

Có một giải thích sâu hơn một chút trong một số trường hợp đặc biệt. Các
thể hiện của `Fixnum`, `NilClass`, `TrueClass` và `FalseClass` được chứa trực
tiếp trong các biến hoặc hằng số---không có tham chiếu nào liên quan. Một biến
chứa số `42` hoặc hằng số `true` thực sự chứa giá trị đó, chứ không phải là
một tham chiếu đến nó. Do đó, phép gán về mặt vật lý tạo ra một bản sao của
các đối tượng thuộc các kiểu này. Chúng tôi thảo luận thêm về điều này trong
[Đối tượng trực tiếp và đối tượng tham chiếu](../6/#immediate).

### Phạm vi của biến cục bộ là gì?

Một phạm vi mới cho biến cục bộ được tạo ra trong (1) cấp cao nhất (main),
(2) định nghĩa lớp (hoặc module), hoặc (3) định nghĩa phương thức.

~~~
var = 1         # (1)
class Demo
  var = 2       # (2)
  def method
    var = 3     # (3)
    puts "in method: var = #{var}"
  end
  puts "in class: var = #{var}"
end
puts "at top level: var = #{var}"
Demo.new.method
~~~

Kết quả:

~~~
in class: var = 2
at top level: var = 1
in method: var = 3
~~~

(Lưu ý rằng định nghĩa lớp là mã thực thi: thông báo theo dõi mà nó chứa
được viết ra khi lớp được định nghĩa).

Một khối (`{ ... }` hoặc `do ... end`) gần như tạo ra một phạm vi mới ;-)
Các biến cục bộ được tạo bên trong một khối không thể truy cập được từ bên
ngoài khối. Tuy nhiên, nếu một biến cục bộ bên trong khối có cùng tên với một
biến cục bộ hiện có trong phạm vi của trình gọi, thì không có biến cục bộ mới
nào được tạo ra, và bạn có thể truy cập biến đó từ bên ngoài khối sau đó.

~~~
a = 0
1.upto(3) do |i|
  a += i
  b = i*i
end
a  # => 6
# b is not defined here
~~~

Điều này trở nên quan trọng khi bạn sử dụng đa luồng---mỗi luồng nhận được
bản sao riêng của các biến cục bộ trong khối của luồng đó:

~~~
threads = []

["one", "two"].each do |name|
  threads << Thread.new do
    local_name = name
    a = 0
    3.times do |i|
      Thread.pass
      a += i
      puts "#{local_name}: #{a}"
    end
  end
end

threads.each {|t| t.join }
~~~

Có thể cho kết quả (trong trường hợp bộ lập lịch chuyển đổi luồng như gợi ý
bởi `Thread.pass`; điều này phụ thuộc vào hệ điều hành và bộ xử lý):

~~~
one: 0
two: 0
one: 1
two: 1
one: 3
two: 3
~~~

`while`, `until` và `for` là các cấu trúc điều khiển, không phải khối, nên
các biến cục bộ bên trong chúng sẽ có thể truy cập được trong môi trường bao
ngoài. Tuy nhiên, `loop` là một phương thức và khối đi kèm tạo ra một phạm
vi mới.

### Khi nào biến cục bộ trở nên có thể truy cập được?

Thực ra, câu hỏi có thể được đặt tốt hơn là: "tại thời điểm nào Ruby nhận ra
rằng một thứ gì đó là biến?" Vấn đề phát sinh vì biểu thức đơn giản `a` có
thể là biến hoặc lời gọi phương thức không có tham số. Để quyết định trường
hợp nào, Ruby tìm các câu lệnh gán. Nếu tại một thời điểm nào đó trong mã
nguồn trước khi sử dụng `a`, Ruby thấy nó được gán giá trị, Ruby quyết định
phân tích `a` như một biến, nếu không thì xử lý nó như một phương thức.
Một trường hợp khá bệnh hoạn của điều này, hãy xem đoạn mã sau, ban đầu được
gửi bởi Clemens Hintze:

~~~
def a
  puts "method `a' called"

  99
end

[1, 2].each do |i|
  if i == 2
    puts "a = #{a}"
  else
    a = 1
    puts "a = #{a}"
  end
end
~~~

Kết quả:

~~~
a = 1
method `a' called
a = 99
~~~

Trong quá trình phân tích cú pháp, Ruby thấy việc sử dụng `a` trong câu lệnh
`puts` đầu tiên và vì chưa thấy bất kỳ phép gán nào cho `a`, giả định rằng
đó là một lời gọi phương thức. Khi đến câu lệnh `puts` thứ hai, Ruby đã thấy
một phép gán, và do đó xử lý `a` như một biến.

Lưu ý rằng phép gán không cần phải được thực thi---Ruby chỉ cần đã thấy nó.
Chương trình này không phát sinh lỗi:

~~~
a = 1 if false; a  # => nil
~~~

Vấn đề với biến này thường không phải là vấn đề lớn. Nếu bạn gặp phải nó,
hãy thử đặt một phép gán như `a = nil` trước lần truy cập đầu tiên đến biến.
Điều này còn có thêm lợi ích là tăng tốc thời gian truy cập biến cục bộ xuất
hiện sau đó trong các vòng lặp.

### Phạm vi của hằng số là gì?

Một hằng số được định nghĩa trong định nghĩa lớp hoặc module có thể được truy
cập trực tiếp bên trong định nghĩa của lớp hoặc module đó.

Bạn có thể truy cập trực tiếp các hằng số trong các lớp và module bên ngoài
từ bên trong các lớp và module lồng nhau.

Bạn cũng có thể truy cập trực tiếp các hằng số trong các lớp cha và các
module được include.

Ngoài các trường hợp này, bạn có thể truy cập các hằng số của lớp và module
bằng toán tử `::`, `ModuleName::CONST1` hoặc `ClassName::CONST2`.

### Đối số được truyền như thế nào?

Đối số thực tế được gán cho tham số hình thức khi phương thức được gọi.
(Xem [phép gán](#assignment) để biết thêm về ngữ nghĩa của phép gán.)

~~~
def add_one(number)
  number += 1
end

a = 1
add_one(a)  # => 2
a           # => 1
~~~

Vì bạn đang truyền tham chiếu đối tượng, nên một phương thức có thể thay đổi
nội dung của một đối tượng có thể thay đổi được truyền vào nó.

~~~
def downer(string)
  string.downcase!
end

a = "HELLO"  # => "HELLO"
downer(a)    # => "hello"
a            # => "hello"
~~~

Không có cơ chế tương đương với ngữ nghĩa truyền theo tham chiếu của các ngôn
ngữ khác.

### Gán giá trị cho tham số hình thức có ảnh hưởng đến đối số thực tế không?

Tham số hình thức là một biến cục bộ. Bên trong một phương thức, việc gán giá
trị cho tham số hình thức chỉ đơn giản là thay đổi tham số đó để tham chiếu
đến một đối tượng khác.

### Điều gì xảy ra khi tôi gọi một phương thức thông qua tham số hình thức?

Tất cả các biến Ruby (bao gồm đối số phương thức) đều hoạt động như tham chiếu
đến các đối tượng. Bạn có thể gọi các phương thức trên các đối tượng này để
lấy hoặc thay đổi trạng thái của đối tượng và để đối tượng thực hiện một việc
gì đó. Bạn có thể làm điều này với các đối tượng được truyền vào phương thức.
Bạn cần cẩn thận khi làm điều này, vì các loại tác dụng phụ này có thể làm
cho chương trình khó theo dõi.

### Dấu `*` đặt trước đối số có ý nghĩa gì?

Khi được sử dụng như một phần của danh sách tham số hình thức, dấu hoa thị cho
phép truyền số lượng đối số tùy ý cho một phương thức bằng cách thu thập chúng
vào một mảng và gán mảng đó cho tham số có dấu hoa thị.

~~~
def foo(prefix, *all)
  all.each do |element|
    puts "#{prefix}#{element}"
  end
end

foo("val = ", 1, 2, 3)
~~~

Kết quả:

~~~
val = 1
val = 2
val = 3
~~~

Khi được sử dụng trong lời gọi phương thức, `*` mở rộng một mảng, truyền các
phần tử riêng lẻ của nó như các đối số.

~~~
a = [1, 2, 3]
foo(*a)
~~~

Bạn có thể đặt `*` trước đối số cuối cùng của

1. Vế trái của phép gán đa trị.
2. Vế phải của phép gán đa trị.
3. Định nghĩa tham số hình thức của phương thức.
4. Đối số thực tế trong lời gọi phương thức.
5. Trong mệnh đề `when` của cấu trúc `case`.

Ví dụ:

~~~
x, *y = [7, 8, 9]
x                  # => 7
y                  # => [8, 9]
x,    = [7, 8, 9]
x                  # => 7
x     = [7, 8, 9]
x                  # => [7, 8, 9]
~~~

### Dấu `&` đặt trước đối số có ý nghĩa gì?

Nếu tham số hình thức cuối cùng của một phương thức được đặt trước bởi dấu và
(`&`), một khối theo sau lời gọi phương thức sẽ được chuyển đổi thành đối
tượng `Proc` và gán cho tham số hình thức đó.

Nếu đối số thực tế cuối cùng trong lời gọi phương thức là một đối tượng
`Proc`, bạn có thể đặt dấu và trước tên của nó để chuyển đổi nó thành một
khối. Phương thức sau đó có thể sử dụng `yield` để gọi nó.

~~~
def meth1(&b)
  puts b.call(9)
end

meth1 {|i| i + i }

def meth2
  puts yield(8)
end

square = proc {|i| i * i }

meth2 {|i| i + i }
meth2 &square
~~~

Kết quả:

~~~
18
16
64
~~~

### Làm thế nào để chỉ định giá trị mặc định cho tham số hình thức?

~~~
def greet(p1="hello", p2="world")
  puts "#{p1} #{p2}"
end

greet
greet("hi")
greet("morning", "mom")
~~~

Kết quả:

~~~
hello world
hi world
morning mom
~~~

Giá trị mặc định (có thể là một biểu thức tùy ý) được đánh giá khi phương
thức được gọi. Nó được đánh giá sử dụng phạm vi của phương thức.

### Làm thế nào để truyền đối số cho một khối?

Các tham số hình thức của một khối xuất hiện giữa các thanh dọc ở đầu khối:

~~~
proc {|a, b| a <=> b }
~~~

Các tham số này thực chất là các biến cục bộ. Nếu một biến cục bộ có cùng tên
đã tồn tại khi khối thực thi, biến đó sẽ bị thay đổi bởi lời gọi khối. Điều
này có thể là điều tốt hoặc không.

Thông thường, các đối số được truyền cho một khối bằng `yield` (hoặc một
iterator gọi `yield`), hoặc bằng phương thức `Proc.call`.

### Tại sao đối tượng của tôi bị thay đổi bất ngờ?

~~~
A = a = b = "abc"
b.concat("d")  # => "abcd"
a              # => "abcd"
A              # => "abcd"
~~~

Các biến chứa tham chiếu đến đối tượng. Phép gán `A = a = b = "abc"` đặt
một tham chiếu đến chuỗi `"abc"` vào `A`, `a` và `b`.

Khi bạn gọi `b.concat("d")`, bạn gọi phương thức concat trên đối tượng đó,
thay đổi nó từ `"abc"` thành `"abcd"`. Vì `a` và `A` cũng tham chiếu đến
cùng đối tượng đó, giá trị biểu kiến của chúng cũng thay đổi.

Điều này ít gặp vấn đề trong thực tế hơn so với những gì có thể tưởng tượng.

Ngoài ra, tất cả các đối tượng đều có thể được đóng băng, bảo vệ chúng khỏi
bị thay đổi.

### Giá trị của hằng số có bao giờ thay đổi không?

Hằng số là một biến có tên bắt đầu bằng chữ cái viết hoa.
Hằng số không thể được gán lại từ bên trong các phương thức thể hiện,
nhưng có thể được thay đổi trong các trường hợp khác.
Khi một hằng số được gán giá trị mới, một cảnh báo sẽ được phát ra.

### Tại sao tôi không thể nạp biến từ một tệp riêng biệt?

Giả sử `file1.rb` chứa:

~~~
var1 = 99
~~~

và một tệp khác nạp nó vào:

~~~
require_relative "file1"
puts var1
~~~

Kết quả:

~~~
prog.rb:2:in `<main>': undefined local variable or method `var1' for main:Object (NameError)
~~~

Bạn nhận được lỗi vì `load` và `require` sắp xếp cho các biến cục bộ được
lưu trữ vào một không gian tên riêng biệt, ẩn danh, thực tế là loại bỏ chúng.
Điều này được thiết kế để bảo vệ mã của bạn khỏi bị ô nhiễm.
