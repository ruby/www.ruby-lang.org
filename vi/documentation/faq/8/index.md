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
    <a href="../7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <strong>8</strong>
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

## Lớp và module

### Có thể định nghĩa lại một lớp không?

Một lớp có thể được định nghĩa lại nhiều lần. Mỗi lần định nghĩa sẽ được
bổ sung vào định nghĩa trước đó. Nếu một phương thức được định nghĩa lại,
phương thức cũ sẽ bị ghi đè và mất đi.

### Có biến lớp không?

Có. Một biến có tiền tố là hai dấu at (`@@`) là biến lớp,
có thể truy cập được trong cả phương thức instance và phương thức lớp
của lớp đó.

~~~
class Entity

  @@instances = 0

  def initialize
    @@instances += 1
    @number = @@instances
  end

  def who_am_i
   "I'm #{@number} of #{@@instances}"
  end

  def self.total
    @@instances
  end
end

entities = Array.new(9) { Entity.new }

entities[6].who_am_i  # => "I'm 7 of 9"
Entity.total          # => 9
~~~

Tuy nhiên, bạn có lẽ nên sử dụng _biến instance của lớp_ thay thế.

### Biến instance của lớp là gì?

Đây là ví dụ của phần trước được viết lại
sử dụng biến instance của lớp:

~~~
class Entity

  @instances = 0

  class << self
    attr_accessor :instances  # provide class methods for reading/writing
  end

  def initialize
    self.class.instances += 1
    @number = self.class.instances
  end

  def who_am_i
   "I'm #{@number} of #{self.class.instances}"
  end

  def self.total
    @instances
  end
end

entities = Array.new(9) { Entity.new }

entities[6].who_am_i  # => "I'm 7 of 9"
Entity.instances      # => 9
Entity.total          # => 9
~~~

Ở đây, `@instances` là một biến instance _của lớp_. Nó không thuộc về
một instance của lớp `Entity`, mà thuộc về đối tượng lớp `Entity`,
vốn là một instance của lớp `Class`.

Biến instance của lớp chỉ có thể truy cập trực tiếp trong các phương thức
lớp của lớp đó.

### Sự khác biệt giữa biến lớp và biến instance của lớp là gì?

Sự khác biệt chính là hành vi liên quan đến kế thừa:
biến lớp được chia sẻ giữa một lớp và tất cả các lớp con của nó,
trong khi biến instance của lớp chỉ thuộc về một lớp cụ thể.

Biến lớp theo một cách nào đó có thể được xem như biến toàn cục trong
ngữ cảnh của một cây kế thừa, với tất cả các vấn đề
đi kèm với biến toàn cục.
Ví dụ, một biến lớp có thể (vô tình) bị gán lại
bởi bất kỳ lớp con nào, ảnh hưởng đến tất cả các lớp khác:

~~~
class Woof

  @@sound = "woof"

  def self.sound
    @@sound
  end
end

Woof.sound  # => "woof"

class LoudWoof < Woof
  @@sound = "WOOF"
end

LoudWoof.sound  # => "WOOF"
Woof.sound      # => "WOOF" (!)
~~~

Hoặc, một lớp cha có thể sau đó được mở lại và thay đổi,
với các hiệu ứng có thể gây bất ngờ:

~~~
class Foo

  @@var = "foo"

  def self.var
    @@var
  end
end

Foo.var  # => "foo" (as expected)

class Object
  @@var = "object"
end

Foo.var  # => "object" (!)
~~~

Vì vậy, trừ khi bạn biết chính xác mình đang làm gì và thực sự cần
kiểu hành vi này, bạn nên sử dụng biến instance của lớp.

### Ruby có phương thức lớp không?
{: #class-method}

Một [phương thức singleton](../7/#singleton-method) của một đối tượng lớp
được gọi là phương thức lớp.
(Thực ra, phương thức lớp được định nghĩa trong metaclass, nhưng điều đó
khá trong suốt). Một cách nhìn khác là nói rằng phương thức lớp
là phương thức có receiver là một lớp.

Tất cả đều quy về việc bạn có thể gọi phương thức lớp mà không cần
có instance của lớp đó (đối tượng) làm receiver.

Hãy tạo một phương thức singleton của lớp `Foo`:

~~~
class Foo
  def self.test
    "this is foo"
  end
end

# It is invoked this way.

Foo.test  # => "this is foo"
~~~

Trong ví dụ này, `Foo.test` là một phương thức lớp.

Các phương thức instance được định nghĩa trong lớp `Class` có thể được sử dụng
làm phương thức lớp cho mọi(!) lớp.

### Singleton class là gì?

Singleton class là một lớp ẩn danh được tạo ra bằng cách kế thừa từ
lớp gắn liền với một đối tượng cụ thể. Singleton class là một cách khác
để mở rộng chức năng chỉ cho một đối tượng duy nhất.

Lấy lớp `Foo` đơn giản:

~~~
class Foo
  def hello
    "hello"
  end
end

foo = Foo.new
foo.hello  # => "hello"
~~~

Bây giờ giả sử chúng ta cần thêm chức năng cấp lớp chỉ cho một
instance cụ thể này:

~~~
class << foo
  attr_accessor :name

  def hello
    "hello, I'm #{name}"
  end
end

foo.name = "Tom"
foo.hello         # => "hello, I'm Tom"
Foo.new.hello     # => "hello"
~~~

Chúng ta đã tùy chỉnh `foo` mà không thay đổi các đặc tính của `Foo`.

### Hàm module là gì?

{% include warnings/faq-out-of-date.html %}

Hàm module là một phương thức singleton riêng tư được định nghĩa trong một
module. Về bản chất, nó tương tự như [phương thức lớp](#class-method),
ở chỗ có thể được gọi bằng ký pháp `Module.method`:

~~~
Math.sqrt(2)  # => 1.414213562
~~~

Tuy nhiên, vì module có thể được trộn vào các lớp, hàm module cũng có thể
được sử dụng mà không cần tiền tố (đó là cách mà tất cả các hàm `Kernel`
được cung cấp cho các đối tượng):

~~~
include Math
sqrt(2)  # => 1.414213562
~~~

Sử dụng `module_function` để biến một phương thức thành hàm module.

~~~
module Test
  def thing
    # ...
  end
  module_function :thing
end
~~~

### Sự khác biệt giữa lớp và module là gì?

Module là tập hợp các phương thức và hằng số. Chúng không thể tạo ra
instance. Lớp có thể tạo ra instance (đối tượng), và có trạng thái
riêng cho từng instance (biến instance).

Module có thể được trộn vào các lớp và module khác. Các hằng số và phương
thức của module được trộn vào sẽ hòa trộn vào lớp đó, bổ sung thêm chức
năng cho lớp. Tuy nhiên, lớp không thể được trộn vào bất cứ thứ gì.

Một lớp có thể kế thừa từ một lớp khác, nhưng không thể kế thừa từ module.

Một module không thể kế thừa từ bất cứ thứ gì.

### Có thể tạo lớp con từ module không?

Không. Tuy nhiên, một module có thể được include vào một lớp hoặc module khác
để mô phỏng đa kế thừa (cơ chế mixin).

Điều này không tạo ra một lớp con (vì điều đó đòi hỏi kế thừa), nhưng
tạo ra mối quan hệ `is_a?` giữa lớp và module.

### Cho tôi một ví dụ về mixin

Module `Comparable` cung cấp nhiều toán tử so sánh
(`<`, `<=`, `==`, `>=`, `>`, `between?`). Nó định nghĩa các toán tử này
dựa trên lời gọi đến phương thức so sánh tổng quát `<=>`. Tuy nhiên, bản thân
nó không định nghĩa `<=>`.

Giả sử bạn muốn tạo một lớp mà phép so sánh dựa trên số chân
của một con vật:

~~~
class Animal
  include Comparable

  attr_reader :legs

  def initialize(name, legs)
    @name, @legs = name, legs
  end

  def <=>(other)
    legs <=> other.legs
  end

  def inspect
    @name
  end
end

c = Animal.new("cat", 4)
s = Animal.new("snake", 0)
p = Animal.new("parrot", 2)

c < s             # => false
s < c             # => true
p >= s            # => true
p.between?(s, c)  # => true
[p, s, c].sort    # => [snake, parrot, cat]
~~~

Tất cả những gì `Animal` cần làm là định nghĩa ngữ nghĩa riêng cho toán tử
`<=>`, và trộn vào module `Comparable`. Các phương thức của `Comparable` giờ
trở nên không thể phân biệt với các phương thức của `Animal` và lớp của bạn
bỗng nhiên có thêm chức năng mới. Và vì cùng một module `Comparable` được
sử dụng bởi nhiều lớp, lớp mới của bạn sẽ chia sẻ ngữ nghĩa nhất quán
và được hiểu rõ.

### Tại sao có hai cách định nghĩa phương thức lớp?

Bạn có thể định nghĩa phương thức lớp trong phần định nghĩa lớp, và bạn
có thể định nghĩa phương thức lớp ở cấp cao nhất.

~~~
class Demo
  def self.class_method
  end
end

def Demo.another_class_method
end
~~~

Chỉ có một sự khác biệt đáng kể giữa hai cách.
Trong phần định nghĩa lớp, bạn có thể tham chiếu trực tiếp đến các hằng số
của lớp, vì các hằng số nằm trong phạm vi. Ở cấp cao nhất, bạn phải sử dụng
ký pháp `Class::CONST`.

### Sự khác biệt giữa `include` và `extend` là gì?

{% include warnings/faq-out-of-date.html %}

`include` trộn một module vào một lớp hoặc module khác. Các phương thức từ
module đó được gọi theo kiểu hàm (không có receiver).

`extend` được sử dụng để include một module vào một đối tượng (instance).
Các phương thức trong module trở thành phương thức của đối tượng.

### `self` có nghĩa là gì?

`self` là receiver đang thực thi hiện tại, đối tượng mà phương thức
được áp dụng lên. Lời gọi phương thức theo kiểu hàm ngầm hiểu `self`
là receiver.
