---
layout: page
title: "Tìm hiểu Ruby trong 25 phút"
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
  <h1>Tìm hiểu Ruby trong 25 phút</h1>

---

Nếu muốn nói "Xin chào" rất nhiều mà không muốn mỏi tay, ta cần định nghĩa một
phương thức!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Xin chào Thế giới!"
irb(main):012:1> end
=> nil
{% endhighlight %}

Đoạn mã `def h` bắt đầu định nghĩa phương thức. Nó báo với Ruby rằng "Chúng tôi
đang định nghĩa một phương thức tên là `h`". Dòng tiếp theo là phần thân của
phương thức, tương tự với dòng chúng ta đã thấy trước đây: `puts "Xin chào Thế
giới"`. Cuối cùng, dòng cuối cùng `end` thông báo với Ruby rằng ta đã định nghĩa
xong phương thức. Ruby trả lại `=> nil` để xác nhận.

## Tóm tắt, vòng đời của một phương thức

Bây giờ ta sẽ chạy phương thức vừa rồi vài lần:

{% highlight irb %}
irb(main):013:0> h
Xin chào Thế giới!
=> nil
irb(main):014:0> h()
Xin chào Thế giới!
=> nil
{% endhighlight %}

Tốt rồi, rất đơn giản. Gọi một phương thức trong Ruby rất dễ dàng, chỉ cần gõ
tên của nó vào. Nếu phương thức không cần tham số, bạn có thể thêm cặp ngoặc đơn
trống nếu thích vì chúng cũng không cần thiết.

Nếu bạn muốn nói xin chào tới một người mà không phải là cả thế giới, hãy định
nghĩa lại `h` để thêm tên là tham số truyền vào.

{% highlight irb %}
irb(main):015:0> def h(tên)
irb(main):016:1>   puts "Xin chào #{tên}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Xin chào Matz!
=> nil
{% endhighlight %}

Nó đã hoạt động... nhưng hãy dành vài giây để xem có gì ở đây.

## Giữ các đoạn trong xâu

Đoạn `#{tên}` nghĩa là gì? Đó là cách mà Ruby chèn thứ gì đó vao trong một xâu.
Đoạn ở giữa cặp ngoặc nhọn được chuyển thành một xâu (nếu nó chưa phải) sau đó
chèn vào xâu bên ngoài tại chỗ mà đoạn đó được viết. Bạn có thể sử dụng cái này
để chắc chắn rằng tên của ai đó đã được viết hoa:

{% highlight irb %}
irb(main):019:0> def h(tên = "Thế giới")
irb(main):020:1> puts "Xin chào #{tên.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Xin chào Chris!
=> nil
irb(main):023:0> h
Xin chào Thế giới!
=> nil
{% endhighlight %}

Ta thấy có hai cách gọi khác nhau ở đây. Một là gọi phương thức không cần ngoặc
đơn một lần nữa. Nếu đó là mục đích của bạn thì ngoặc đơn chỉ là tùy chọn. Cách
còn lại là lấy tham số mặc định là "Thế giới". Điều này nghĩa là "Nếu không cung
cấp tên thì ta sử dụng tên mặc định là 'Thế giới'"

## Phát triển thành ChàoMừng

Phải làm gì nếu chúng ta muốn có những ChàoMừng thực sự ở xung quanh, nhớ tên
bạn, chào đón bạn và luôn kính trọng bạn. Bạn sẽ phải dùng đối tượng! Chúng ta
sẽ tạo một lớp ChàoMừng.

{% highlight irb %}
irb(main):024:0> class ChàoMừng
irb(main):025:1>   def initialize(tên = "Thế giới")
irb(main):026:2>     @tên = tên
irb(main):027:2>   end
irb(main):028:1>   def xin_chào
irb(main):029:2>     puts "Xin chào #{@tên}!"
irb(main):030:2>   end
irb(main):031:1>   def tạm_biệt
irb(main):032:2>     puts "Tạm biệt #{@tên}, hẹn gặp lại."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

Từ khóa mới ở đây là `class` nghĩa là `lớp`. Nó định nghĩa một lớp mới tên là
ChàoMừng và một vài phương thức thuộc lớp. Thông báo tới `@tên`, đây là một biến
đối tượng và nó có thể sử dụng trong tất cả các phương thức của lớp, như trong
đối tượng được sử dụng với `xin_chào` và `tạm_biệt`.

Vậy, làm thế nào để chúng ta thiết lập lớp ChàoMừng này?
[Tạo một đối tượng](../3/)
