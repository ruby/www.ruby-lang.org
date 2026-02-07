---
layout: page
title: "Về Ruby"
lang: vi
---

Bạn tự hỏi vì sao Ruby lại phổ biến đến vậy? Những người hâm mộ gọi nó
là một ngôn ngữ đẹp đẽ và tinh tế. Nhưng họ cũng nói nó tiện dụng và
thiết thực. Vậy điều gì làm nên sức hút đó?
{: .summary}

### Lý tưởng của người tạo ra Ruby

Ruby là một ngôn ngữ được cân bằng một cách cẩn thận. Người tạo ra nó,
[Yukihiro "Matz" Matsumoto][matz], đã kết hợp những phần tinh hoa từ các
ngôn ngữ yêu thích của ông (Perl, Smalltalk, Eiffel, Ada, và Lisp) để tạo
thành một ngôn ngữ mới cân bằng giữa lập trình hàm và lập trình mệnh lệnh.

Ông thường nói rằng ông "cố gắng làm cho Ruby tự nhiên, chứ không phải đơn
giản," theo cách phản ánh cuộc sống.

Dựa trên điều này, ông nói thêm:

> Ruby trông bề ngoài đơn giản, nhưng bên trong rất phức tạp, giống như
> cơ thể con người vậy<sup>[1](#fn1)</sup>.

### Về sự phát triển của Ruby

Kể từ khi được phát hành công khai vào năm 1995, Ruby đã thu hút những lập
trình viên tận tụy trên toàn thế giới. Vào năm 2006, Ruby đạt được sự chấp
nhận rộng rãi. Các nhóm người dùng hoạt động tích cực được thành lập ở các
thành phố lớn trên thế giới và các hội nghị liên quan đến Ruby luôn chật kín
chỗ.

Ruby-Talk, [danh sách thư](/vi/community/mailing-lists/) chính để thảo luận
về ngôn ngữ Ruby, đã đạt trung bình 200 tin nhắn mỗi ngày vào năm 2006. Con
số này đã giảm trong những năm gần đây khi quy mô cộng đồng đẩy các cuộc
thảo luận từ một danh sách trung tâm sang nhiều nhóm nhỏ hơn.

Ruby được xếp hạng trong top 10 trên hầu hết các chỉ số đo lường sự phát
triển và mức độ phổ biến của các ngôn ngữ lập trình trên toàn thế giới
(chẳng hạn như [chỉ số TIOBE][tiobe]). Phần lớn sự tăng trưởng được cho là
nhờ sự phổ biến của các phần mềm được viết bằng Ruby, đặc biệt là framework
web [Ruby on Rails][ror].

Ruby cũng [hoàn toàn miễn phí]({{ site.license.url }}). Không chỉ miễn phí
về chi phí, mà còn tự do sử dụng, sao chép, sửa đổi và phân phối.

### Mọi thứ đều là đối tượng

Ban đầu, Matz tìm hiểu các ngôn ngữ khác để tìm một cú pháp lý tưởng. Nhớ
lại quá trình tìm kiếm của mình, ông nói, "Tôi muốn một ngôn ngữ kịch bản
mạnh mẽ hơn Perl, và hướng đối tượng hơn
Python<sup>[2](#fn2)</sup>."

Trong Ruby, mọi thứ đều là đối tượng. Mỗi phần thông tin và mã nguồn đều có
thể được gán các thuộc tính và hành động riêng. Lập trình hướng đối tượng
gọi các thuộc tính bằng tên *biến thực thể* và các hành động được gọi là
*phương thức*. Cách tiếp cận hướng đối tượng thuần túy của Ruby thường được
minh họa rõ nhất qua một đoạn mã áp dụng hành động lên một số.

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

Trong nhiều ngôn ngữ, số và các kiểu nguyên thủy khác không phải là đối
tượng. Ruby theo ảnh hưởng của ngôn ngữ Smalltalk bằng cách cung cấp
phương thức và biến thực thể cho tất cả các kiểu dữ liệu. Điều này giúp
việc sử dụng Ruby trở nên dễ dàng hơn, vì các quy tắc áp dụng cho đối
tượng cũng áp dụng cho toàn bộ Ruby.

### Sự linh hoạt của Ruby

Ruby được xem là một ngôn ngữ linh hoạt, vì nó cho phép người dùng tự do
thay đổi các thành phần của nó. Các phần thiết yếu của Ruby có thể được gỡ
bỏ hoặc định nghĩa lại tùy ý. Các phần hiện có có thể được bổ sung thêm.
Ruby cố gắng không hạn chế lập trình viên.

Ví dụ, phép cộng được thực hiện bằng toán tử cộng (`+`). Nhưng nếu bạn
muốn sử dụng từ dễ đọc `plus`, bạn có thể thêm phương thức đó vào lớp
`Numeric` có sẵn của Ruby.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y is now equal to 11
{% endhighlight %}

Các toán tử của Ruby là cú pháp tiện lợi (syntactic sugar) cho các phương
thức. Bạn cũng có thể định nghĩa lại chúng.

### Block: một tính năng thực sự mạnh mẽ

Block của Ruby cũng được xem là nguồn mang lại sự linh hoạt lớn. Lập trình
viên có thể gắn một closure vào bất kỳ phương thức nào, mô tả cách phương
thức đó nên hoạt động. Closure này được gọi là *block* và đã trở thành một
trong những tính năng phổ biến nhất cho những người mới đến với Ruby từ các
ngôn ngữ mệnh lệnh khác như PHP hay Visual Basic.

Block được lấy cảm hứng từ các ngôn ngữ hàm. Matz nói, "trong các closure
của Ruby, tôi muốn tôn trọng văn hóa Lisp<sup>[3](#fn3)</sup>."

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

Trong đoạn mã trên, block được mô tả bên trong cấu trúc `do ... end`.
Phương thức `map` áp dụng block lên danh sách các từ được cung cấp. Nhiều
phương thức khác trong Ruby để mở một chỗ trống cho lập trình viên viết
block riêng của họ để điền vào chi tiết những gì phương thức đó nên làm.

### Ruby và Mixin

Không giống như nhiều ngôn ngữ hướng đối tượng khác, Ruby chỉ hỗ trợ đơn
kế thừa, và điều này là **có chủ đích**. Nhưng Ruby có khái niệm module
(gọi là Category trong Objective-C). Module là các tập hợp phương thức.

Các lớp có thể mixin một module và nhận tất cả các phương thức của nó miễn
phí. Ví dụ, bất kỳ lớp nào triển khai phương thức `each` đều có thể mixin
module `Enumerable`, module này bổ sung hàng loạt phương thức sử dụng `each`
để duyệt vòng lặp.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Nói chung, các Rubyist xem đây là cách rõ ràng hơn nhiều so với đa kế thừa,
vốn phức tạp và có thể quá hạn chế.

### Diện mạo trực quan của Ruby

Mặc dù Ruby thường sử dụng rất ít dấu câu và ưu tiên các từ khóa tiếng
Anh, một số dấu câu được dùng để trang trí Ruby. Ruby không cần khai báo
biến. Nó sử dụng các quy ước đặt tên đơn giản để biểu thị phạm vi của
biến.

* `var` có thể là biến cục bộ.
* `@var` là biến thực thể.
* `$var` là biến toàn cục.

Các ký hiệu này tăng tính dễ đọc bằng cách cho phép lập trình viên dễ dàng
nhận biết vai trò của từng biến. Nó cũng giúp loại bỏ sự cần thiết phải
thêm tiền tố `self.` trước mỗi thành viên thực thể.

### Ngoài những điều cơ bản

Ruby có rất nhiều tính năng khác, trong đó bao gồm:

* Ruby có các tính năng xử lý ngoại lệ, giống như Java hay Python, giúp
  xử lý lỗi một cách dễ dàng.

* Ruby có bộ thu gom rác (garbage collector) theo kiểu đánh dấu và quét
  (mark-and-sweep) thực thụ cho tất cả các đối tượng Ruby. Không cần phải
  duy trì bộ đếm tham chiếu trong các thư viện mở rộng. Như Matz nói,
  "Điều này tốt hơn cho sức khỏe của bạn."

* Viết các phần mở rộng C trong Ruby dễ dàng hơn so với Perl hay Python,
  với một API rất tinh tế để gọi Ruby từ C. Điều này bao gồm các lệnh gọi
  để nhúng Ruby vào phần mềm, sử dụng như một ngôn ngữ kịch bản. Giao diện
  SWIG cũng có sẵn.

* Ruby có thể tải các thư viện mở rộng một cách động nếu hệ điều hành
  cho phép.

* Ruby có luồng (threading) độc lập với hệ điều hành. Do đó, trên tất cả
  các nền tảng mà Ruby chạy, bạn cũng có đa luồng, bất kể hệ điều hành
  có hỗ trợ hay không, kể cả trên MS-DOS!

* Ruby có tính di động cao: nó được phát triển chủ yếu trên GNU/Linux,
  nhưng hoạt động trên nhiều loại UNIX, macOS, Windows, DOS, BeOS, OS/2,
  v.v.

### Các bản triển khai khác của Ruby

Ruby, với tư cách là một ngôn ngữ, có một số bản triển khai khác nhau.
Trang này đã thảo luận về bản triển khai tham chiếu, trong cộng đồng thường
được gọi là **MRI** ("Matz's Ruby Interpreter") hoặc **CRuby** (vì nó
được viết bằng C), nhưng cũng có những bản triển khai khác. Chúng thường
hữu ích trong các tình huống nhất định, cung cấp khả năng tích hợp thêm với
các ngôn ngữ hoặc môi trường khác, hoặc có các tính năng đặc biệt mà MRI
không có.

Dưới đây là danh sách:

* [JRuby][jruby] là Ruby chạy trên JVM (Java Virtual Machine), tận dụng
  các trình biên dịch JIT tối ưu, bộ thu gom rác, luồng đồng thời, hệ sinh
  thái công cụ, và bộ sưu tập thư viện đồ sộ của JVM.
* [Rubinius][rubinius] là 'Ruby được viết bằng Ruby'. Được xây dựng trên
  nền LLVM, Rubinius có một máy ảo tiện lợi mà các ngôn ngữ khác cũng đang
  được xây dựng trên đó.
* [TruffleRuby][truffleruby] là một bản triển khai Ruby hiệu năng cao trên
  nền GraalVM.
* [mruby][mruby] là một bản triển khai nhẹ của ngôn ngữ Ruby, có thể được
  liên kết và nhúng vào trong một ứng dụng. Việc phát triển được dẫn dắt
  bởi người tạo ra Ruby, Yukihiro "Matz" Matsumoto.
* [IronRuby][ironruby] là một bản triển khai "tích hợp chặt chẽ với .NET
  Framework".
* [MagLev][maglev] là "một bản triển khai Ruby nhanh, ổn định với tính năng
  lưu trữ đối tượng tích hợp và bộ nhớ đệm chia sẻ phân tán".
* [Cardinal][cardinal] là "trình biên dịch Ruby cho [Parrot][parrot] Virtual
  Machine" (Perl 6).

Để xem danh sách đầy đủ hơn, hãy tham khảo [Awesome Rubies][awesome-rubies].

### Tham khảo

<sup>1</sup> Matz, phát biểu trên danh sách thư Ruby-Talk, [ngày 12 tháng 5
năm 2000][blade].
{: #fn1}

<sup>2</sup> Matz, trong [An Interview with the Creator of Ruby][linuxdevcenter], ngày
29 tháng 11 năm 2001.
{: #fn2}

<sup>3</sup> Matz, trong [Blocks and Closures in Ruby][artima], ngày 22 tháng 12
năm 2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: https://rubinius.com
[truffleruby]: https://github.com/oracle/truffleruby
[mruby]: http://www.mruby.org/
[ironruby]: http://www.ironruby.net
[maglev]: http://maglev.github.io
[cardinal]: https://github.com/parrot/cardinal
[parrot]: http://parrot.org
[awesome-rubies]: https://github.com/planetruby/awesome-rubies
