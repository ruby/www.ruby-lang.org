---
layout: page
title: "Ruby trong 20 phút"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Phần 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Phần 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Phần 4">4</a>
  </div>
  <h1>Ruby trong 20 phút</h1>

---

Nếu chúng ta muốn nói "Hello" thật nhiều lần mà không phải gõ mỏi tay
thì sao? Chúng ta cần định nghĩa một method!

{% highlight irb %}
irb(main):010:0> def hi
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> :hi
{% endhighlight %}

Đoạn mã `def hi` bắt đầu việc định nghĩa method. Nó cho Ruby biết rằng
chúng ta đang định nghĩa một method có tên là `hi`. Dòng tiếp theo là
phần thân của method, cùng dòng mà chúng ta đã thấy trước đó:
`puts "Hello World"`. Cuối cùng, dòng `end` cho Ruby biết chúng ta đã
hoàn tất việc định nghĩa method. Phản hồi `=> :hi` của Ruby cho chúng
ta biết rằng nó đã nhận biết method vừa được định nghĩa. Phản hồi này
có thể là `=> nil` đối với Ruby 2.0 và các phiên bản trước đó. Tuy
nhiên, điều đó không quan trọng ở đây, hãy tiếp tục nào.

## Cuộc đời ngắn ngủi và lặp đi lặp lại của một method

Bây giờ hãy thử chạy method đó vài lần:

{% highlight irb %}
irb(main):013:0> hi
Hello World!
=> nil
irb(main):014:0> hi()
Hello World!
=> nil
{% endhighlight %}

Dễ quá. Gọi một method trong Ruby đơn giản chỉ cần nhắc đến tên của nó
với Ruby. Nếu method không nhận tham số thì chỉ cần thế là đủ. Bạn có
thể thêm dấu ngoặc đơn trống nếu muốn, nhưng chúng không bắt buộc.

Nếu chúng ta muốn chào một người cụ thể chứ không phải cả thế giới thì
sao? Chỉ cần định nghĩa lại `hi` để nhận một tên làm tham số.

{% highlight irb %}
irb(main):015:0> def hi(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> :hi
irb(main):018:0> hi("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Vậy là nó hoạt động rồi... nhưng hãy dừng lại một chút để xem chuyện
gì đang xảy ra ở đây.

## Giữ chỗ trong chuỗi ký tự

Phần `#{name}` là gì? Đó là cách Ruby chèn nội dung vào một chuỗi ký
tự. Phần nằm giữa dấu ngoặc nhọn được chuyển thành chuỗi ký tự (nếu
nó chưa phải là chuỗi) và sau đó được thay thế vào chuỗi bên ngoài tại
vị trí đó. Bạn cũng có thể dùng cách này để đảm bảo tên của ai đó được
viết hoa đúng cách:

{% highlight irb %}
irb(main):019:0> def hi(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> :hi
irb(main):022:0> hi "chris"
Hello Chris!
=> nil
irb(main):023:0> hi
Hello World!
=> nil
{% endhighlight %}

Có vài thủ thuật cần chú ý ở đây. Một là chúng ta lại gọi method mà
không dùng dấu ngoặc đơn. Nếu những gì bạn đang làm là rõ ràng thì dấu
ngoặc đơn là tùy chọn. Thủ thuật kia là tham số mặc định `World`.
Ý nghĩa của nó là "Nếu tên không được cung cấp, hãy dùng tên mặc định
là `"World"`".

## Tiến hóa thành Greeter

Nếu chúng ta muốn một người chào hỏi thực thụ, một người nhớ tên bạn
và luôn chào đón bạn, đối xử với bạn bằng sự tôn trọng thì sao? Bạn có
thể dùng một đối tượng cho việc đó. Hãy tạo một class "Greeter".

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> :say_bye
{% endhighlight %}

Từ khóa mới ở đây là `class`. Nó định nghĩa một class mới có tên là
Greeter và một loạt các method cho class đó. Cũng hãy chú ý `@name`.
Đây là một biến thực thể (instance variable), và nó có thể được truy
cập bởi tất cả các method của class. Như bạn có thể thấy, nó được sử
dụng bởi `say_hi` và `say_bye`.

Vậy làm thế nào để đưa class Greeter này vào hoạt động?
[Hãy tạo một đối tượng.](../3/)
