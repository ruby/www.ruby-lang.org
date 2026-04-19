---
layout: page
title: "Ruby trong 20 phút"
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
  <h1>Ruby trong 20 phút</h1>

---

## Giới thiệu

Đây là một hướng dẫn Ruby nhỏ, chỉ mất không quá 20 phút để hoàn
thành. Hướng dẫn này giả định rằng bạn đã cài đặt Ruby trên máy.
(Nếu bạn chưa có Ruby trên máy tính, hãy [cài đặt][installation]
trước khi bắt đầu.)

## Ruby tương tác

Ruby đi kèm với một chương trình cho phép bạn thấy ngay kết quả của
bất kỳ câu lệnh Ruby nào bạn nhập vào. Thử nghiệm với mã Ruby trong
các phiên tương tác như thế này là một cách tuyệt vời để học ngôn ngữ.

Hãy mở IRB (viết tắt của Interactive Ruby).

* Nếu bạn đang dùng **macOS**, hãy mở `Terminal` và gõ `irb`, sau đó
  nhấn enter.
* Nếu bạn đang dùng **Linux**, hãy mở một shell và gõ `irb` rồi nhấn
  enter.
* Nếu bạn đang dùng **Windows**, hãy mở `Interactive Ruby` từ phần
  Ruby trong Start Menu.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

OK, vậy là đã mở rồi. Bây giờ thì sao?

Hãy gõ như sau: `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby đã nghe lời bạn!

Chuyện gì vừa xảy ra vậy? Chúng ta vừa viết chương trình "Hello World"
ngắn nhất thế giới ư? Không hẳn vậy. Dòng thứ hai chỉ là cách IRB cho
chúng ta biết kết quả của biểu thức cuối cùng mà nó đã thực thi. Nếu
chúng ta muốn in ra "Hello World" thì cần thêm một chút nữa:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` là lệnh cơ bản để in nội dung ra màn hình trong Ruby. Nhưng vậy
thì phần `=> nil` là gì? Đó là kết quả của biểu thức. `puts` luôn trả
về nil, đây là giá trị "hoàn-toàn-không-có-gì" trong Ruby.

## Máy tính miễn phí đây

Chúng ta đã có đủ để dùng IRB như một máy tính cơ bản:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Ba cộng hai. Đơn giản quá. Vậy còn ba *nhân* hai thì sao? Bạn có thể gõ
trực tiếp, nó đủ ngắn, nhưng bạn cũng có thể quay lại và sửa lại dòng
vừa nhập. Hãy thử nhấn phím **mũi tên lên** trên bàn phím và xem nó có
hiện lại dòng `3+2` không. Nếu có, bạn có thể dùng phím mũi tên trái
để di chuyển đến ngay sau dấu `+` rồi dùng phím xóa lùi để đổi thành
dấu `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Tiếp theo, hãy thử ba bình phương:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Trong Ruby, `**` là cách bạn viết "lũy thừa". Nhưng nếu bạn muốn làm
ngược lại và tìm căn bậc hai của một số thì sao?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

OK, khoan đã, cái cuối cùng đó là gì vậy? Nếu bạn đoán "nó đang tìm
căn bậc hai của chín" thì bạn đúng rồi. Nhưng hãy nhìn kỹ hơn một chút.
Trước hết, `Math` là gì?

## Module nhóm mã theo chủ đề

`Math` là một module có sẵn dành cho toán học. Trong Ruby, module đóng
hai vai trò. Đây là một vai trò: nhóm các method tương tự lại với nhau
dưới một tên quen thuộc. `Math` cũng chứa các method như `sin()` và
`tan()`.

Tiếp theo là dấu chấm. Dấu chấm dùng để làm gì? Dấu chấm là cách bạn
xác định đối tượng nhận thông điệp. Thông điệp là gì? Trong trường hợp
này là `sqrt(9)`, nghĩa là gọi method `sqrt`, viết tắt của "square root"
(căn bậc hai) với tham số là `9`.

Kết quả của lời gọi method này là giá trị `3.0`. Bạn có thể nhận thấy
nó không phải chỉ là `3`. Đó là vì trong hầu hết trường hợp, căn bậc
hai của một số sẽ không phải là số nguyên, nên method này luôn trả về
một số thực dấu phẩy động.

Nếu chúng ta muốn ghi nhớ kết quả của các phép tính thì sao? Hãy gán
kết quả vào một biến.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Dù máy tính này khá tuyệt, nhưng chúng ta đang đi xa khỏi thông điệp
`Hello World` truyền thống mà các hướng dẫn nhập môn thường tập trung
vào... [vậy hãy quay lại với nó nào.](2/)

[installation]: /vi/documentation/installation/
