---
layout: page
title: "Về Ruby"
lang: vi
---

Bạn tự hỏi tại sao Ruby quá phổ dụng? Các fan gọi nó một ngôn ngữ tao nhã và tinh tế
nhưng lại rất lợi hại và thực dụng. Điều gì khiến họ nghĩ vậy?
{: .summary}

### Lý tưởng của cha đẻ của Ruby

Ruby là một ngôn ngữ của sự cân đối. Nhà phát minh của nó [Yukihiro “Matz”
Matsumoto][matz] kết hợp các đặc điểm hay từ các ngôn ngữ khác (Perl, Smalltalk,
Eiffel, Ada, và Lisp) để tạo ra một ngôn ngữ cân bằng giữa
lập trình hướng chức năng (functional programming) và lập trình hướng thủ tục (imperative programming).

Ông khẳng định ông "muốn tạo ra một Ruby gần gũi và tinh tế".

Dựa trên nền tảng này, ông thêm:

> Ruby nhìn phía ngoài thì đơn giản nhưng rất phức tạp bên trong,
> giống như cơ thể con người vậy<sup>[1](#fn1)</sup>.

### Về sự phát triển của Ruby

Sau khi được phát hành ra công chúng năm 1995, Ruby đã thu hút nhiều lập trình
viên. Vào 2006, Ruby đã được chấp nhận ở mức phổ cập, điều này được chứng minh
qua số lượng lớn các nhóm người dùng hoạt động tích cực ở các thành phố trên thế giới
và cả các hội nghị liên quan Ruby luôn bán hết vé.

Ruby-Talk là [mailing list](/vi/community/mailing-lists/) chính để thảo luận về
ngôn ngữ Ruby. Theo thống kê trung bình có trên 200 bài mỗi ngày trong năm 2006.
Con số này có giảm sút trong những năm gần đây vì xu hướng người dùng gửi bài
vào những nhóm nhỏ riêng thay vì gửi vào đây.

Chỉ số [TIOBE index][tiobe], đo đạt sự phát triển của các ngôn ngữ lập trình, xếp
Ruby hạng 9 nhờ vào số lượng lớn các phần mềm áp dụng ngôn ngữ này, tiêu biểu
là framework viết web tên [Ruby on Rails][ror].

Ruby hoàn toàn [miễn phí]({{ site.license.url }}). Không đòi hỏi phí bản
quyển, và không cấm đoán chuyện sử dụng, sao chép, sửa đổi và phân phối.

### Mọi thứ là đối tượng

Khi bắt đầu viết Matz tham khảo những ngôn ngữ khác để tìm những cú pháp lý
tưởng cho ngôn ngữ mới của ông. Ông nói "Tôi muốn tìm một ngôn ngữ scripting lợi hại
hơn Perl, và hướng đối tượng hơn Python<sup>[2](#fn2)</sup>.”

Trong Ruby, mọi thứ đều là đối tượng (object). Tất cả thông tin và mã đều có thể gán
thuộc tính (properties) và hành động (actions). Lập trình hướng đối tượng (Object-Oriented Programming)
gọi thuộc tính với tên *biến địa phương (instance variables)* và gọi hành động là *hàm (method)*.
Cách tiếp cận thuần hướng đối tượng có thể được thấy rõ ở những đoạn mã áp dụng một
hành động lên một con số.

{% highlight ruby %}
5.times { print "Tôi *yêu* Ruby!" }
{% endhighlight %}

Ở nhiều ngôn ngữ khác, số và một số kiểu mẫu nguyên thủy (primitive types) không phải là
đối tượng. Ruby chịu ảnh hưởng của ngôn ngữ Smalltalk qua việc gán hàm và biến đối tượng
cho tất cả các kiểu mẫu (type). Điều này làm cho Ruby dể dùng hơn vì tất cả nguyên
tắc về đối tượng được áp dụng thống nhất.

### Tính linh hoạt của Ruby

Ruby được xem là một ngôn ngữ linh hoạt, vì nó cho phép người dùng thay đổi
các phần tử của nó. Các phần tử tất yếu của Ruby có thể được xoá, định nghĩa lại tuy theo
ý người dùng. Các phần hiện hữu có thể thêm vào. Ruby không cố gắng kìm chể lập
trình viên.

Lấy một ví dụ, phép cộng (toán học) có thể được thực hiện với toán tử (`+`). Nhưng nếu
bạn muốn diễn đạt với từ `cộng`, bạn có thể thêm một hàm vào lớp `Numeric`
của Ruby:

{% highlight ruby %}
class Numeric
  def cộng(x)
    self.+(x)
  end
end

y = 5.cộng 6
# y sẽ là 11
{% endhighlight %}

Các toán tử của Ruby chỉ là cách viết dễ đọc của các hàm. Bạn có thể định nghĩa lại chúng nếu cần.

### Block, một cách đặc trưng để diễn đạt

Block trong Ruby là một cách diễn đạt rất linh động. Lập trình viên
có thể kèm một closure vào bất cứ hàm nào, để miêu tả cách hàm đấy chạy ra sao.
Closure này được gọi là *block* và là lựa chọn phổ dụng cho các lập trình viên
mới nhập môn từ các ngôn ngữ hướng thủ tục khác (imperative programmming)
khác như PHP hay Visual Basic.

Block được tạo ra với cảm hứng từ các ngôn ngữ lập trình hướng chức năng (functional programming).
Matz nói, trong Ruby, tôi muốn tạo ra loại closures theo phong cách Lisp<sup>[3](#fn3)</sup>.”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

Ở đoạn mã trên, block được miêu tả bên trong hàm dựng `do ... end`.
Hàm `map` áp dụng block tới một danh sách các từ. Nhiều hàm khác trong Ruby chừa
ra chỗ trống để lập trình viên điền vào với các thông tin hàm này nên
làm gì.

### Ruby và Mixin

Mixin là thuật ngữ chỉ cách một ngôn ngữ đính kèm phần tử (vd hàm) vào một tập hợp (vd lớp).

Không như những ngôn ngữ hướng đối tượng khác, Ruby chỉ hỗ trợ kế thừa đơn (single inheritance),
và thiết kế này có **chủ đích**. Tuy thế, Ruby biết các khái niệm về module (còn
được gọi là Categories trong Objective-C). Module là tổ hợp của nhiều hàm.

Lớp (class) có thể mixin một module và tiếp nhận tất cả hàm của module đó. Ví dụ,
bất kì lớp nào triển khai hàm `each` đều có thể mixin module `Enumerable`. Module
này có những hàm sử dụng `each` để chạy vòng lặp.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Nói chung thì đa số Rubyist xem thiết kế này rõ ràng hơn đa kê thừa (multiple
inheritance) vốn dĩ phức tạp và có nhiều hạn chế.

### Diện mạo của Ruby

Trong khi Ruby rất ít dùng dấu và thay vào đó dùng từ tiếng Anh, có một vài
dấu được sử dụng để miêu tả Ruby. Ruby không có cần cú pháp để khai báo biến.
Nó sử dụng cách đặt tên đơn giản để diễn tả mục tiêu (scope) của biến.

* `var` là biến địa phương (local variable).
* `@var` là biến đối tượng (instance variable).
* `$var` là biến toàn cục (global variable).

Các dấu trên tăng khả năng đọc bằng cách giúp lập trình viên xác định vai trò
của từng biến. Bên cạnh đó, bạn không nhất thiết chèn `self.` vào trước các phần tử
đối tượng.

### Nâng cao

Ruby có rất nhiều chức năng khác, trong số đó bao gồm:

* Ruby có chức năng xử lý biệt lệ (exception) giống như Java hay Python, giúp
dễ dàng đối phó với lỗi.

* Ruby có một bộ thu gom rác kiểu đánh dấu-và-dọn dẹp (mark-and-sweep garbage collector)
cho toàn bộ đối tượng Ruby. Không cần phải bảo trì các biến đếm liên quan (reference count)
ở trong các thư viện mở rộng. Như Matz nói, "Cái này tốt cho sức khoẻ của bạn hơn"

* Viết mở rộng kiểu C (C extension) với Ruby dễ hơn Perl hay Python. Ruby có một
thư viện API để gọi Ruby từ C. Cái này bao gồm các hàm gọi tích hợp Ruby vào
phần mềm để sử dụng như là một ngôn ngữ scripting. Một giao diện SWIG cũng sẵn có
để sử dụng.

* Ruby có thể đọc các thư viện mở rộng (extension library) kiểu động nếu OS cho phép.

* Ruby rất dễ port: nó được phát triển chủ yếu cho GNU/Linux, nhưng có làm việc
với các hệ UNIX khác, như macOS, Windows, vân vân.

### Tham khảo

<sup>1</sup> Matz, nói về Ruby-Talk mailing list, [12/05/2000][blade].
{: #fn1}

<sup>2</sup> Matz, trong [Phỏng vấn cha đẻ của Ruby][linuxdevcenter], 29/11/2001.
{: #fn2}

<sup>3</sup> Matz, trong [Blocks và Closures trong Ruby][artima], 12/12/2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
