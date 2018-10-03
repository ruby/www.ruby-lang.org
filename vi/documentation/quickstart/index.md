---
layout: page
title: "Tìm hiểu Ruby trong 25 phút"
lang: vi

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Phần 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Phần 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Phần 4">4</a>
  </div>
  <h1>Tìm hiểu Ruby trong 25 phút</h1>

---

## Giới thiệu

Đây là một bài hướng dẫn nhỏ, chỉ cần không quá 20 phút để hoàn thành. Giả thiết
là bạn đã cài sẵn Ruby. (Nếu bạn chưa có Ruby, hãy [cài đặt][installation]
trước khi bắt đầu nhé.)

## Tương tác với Ruby

Ruby có một chương trình hiển thị kết quả của bất kỳ câu lệnh Ruby nào bạn gõ
vào. Thử sức với Ruby code theo cách tương tác như thế này là một cách tuyệt vời
để khám phá nó.

Mở IRB (hiểu là Tương tác với Ruby).

* Nếu bạn sử dụng **macOS**, mở `Terminal` và gõ `irb` rồi enter.
* Nếu bạn sử dụng **Linux**, mở một shell và gõ `irb` rồi enter.
* Nếu bạn sử dụng **Windows**, mở `Interactive Ruby` từ phần Ruby trên
  Start Menu.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Rồi, nó đã mở. Giờ ta phải làm gì?

Gõ: `"Xin chào thế giới"`

{% highlight irb %}
irb(main):001:0> "Xin chào thế giới"
=> "Xin chào thế giới"
{% endhighlight %}

## Ruby phục vụ bạn!

Điều gì đã xảy ra vậy? Chúng ta vừa viết chương trình "Xin chào thế giới" ngắn
nhất thế giới ư? Không phải vậy. Dòng thứ 2 chỉ là cách mà IRB nói cho ta biết
kết quả của phép toán cuối cùng nó nhận được. Nếu muốn in ra "Xin chào thế giới"
ta cần viết nhiều hơn:

{% highlight irb %}
irb(main):002:0> puts "Xin chào thế giới"
Xin chào thế giới
=> nil
{% endhighlight %}

`puts` là cú pháp cơ bản để in ra trong Ruby. Nhưng sau đó `=> nil` là gì? Nó là
kết quả của phép toán. `puts` luôn trả về nil - giá trị rỗng.

## Máy tính miễn phí của bạn đây

Rõ ràng, chúng ta có thể sử dụng IRB như một chiếc máy tính cơ bản:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Ba cộng hai. Quá dễ. Thế còn ba nhân hai thì sao? Bạn có thể gõ trực tiếp vì nó
rất ngắn, tuy nhiên bạn có thể sẽ sửa lại những gì mình vừa nhập vào. Bấm nút
**mũi tên lên** trên bàn phím và nó sẽ hiển thị dòng `3+2`. Nếu được, bạn có thể
sử dụng phím mũi tên trái để di chuyển đến dấu `+` và thay nó bằng dấu `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Tiếp theo, hãy thử tính 3 bình phương:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Trong Ruby, `**` nghĩa là "bình phương". Nhưng nếu bạn muốn tìm căn bậc hai thì
sao?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Bạn thấy gì ở kết quả? Nếu bạn nghĩ, đó là "căn bậc hai của 9" thì bạn đã đúng.
Nhưng hãy chú ý vào những thứ khác. Đầu tiên: `Math` là gì?

## Gộp nhóm mã module theo chủ đề

`Math` là một module của toán học. Các module phụ vụ hai vai trò trong Ruby. Ở
đây là một vai trò: nhóm các phương thức giống nhau lại với nhau dưới một cái
tên tương tự. `Math` còn có các phương thức như `sin()` và `tan()`.

Tiếp theo là dấu chấm. Dấu chấm có tác dụng gì? Dấu chấm dùng để xác định nơi
nhận của một câu lệnh. Câu lệnh là gì? Trong trường hợp này thì nó là `sqrt(9)`,
nghĩa là gọi phương thức `sqrt`, viết tắt của "căn bậc hai (square root)" với
tham số là 9.

Kết quả của việc gọi phương thức này là `3.0`. Chú ý rằng nó không chỉ là `3`
bởi vì phần lớn căn bậc 2 của một số không phải là một số nguyên, do đó phương
thức luôn trả về một số thực.

Nếu muốn lưu lại một vài kết quả của phép toán này, hãy gán kết quả cho một biến.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Tuyệt vời như một chiếc máy tính, chúng ta đang vượt xa thông điệp `Xin chào
thế giới` truyền thống mà ban đầu bài hướng dẫn giả sử...
[Vậy chúng ta hãy quay lại nào](2/)

[installation]: /vi/documentation/installation/
