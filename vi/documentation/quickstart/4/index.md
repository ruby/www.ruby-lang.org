---
layout: page
title: "Tìm hiểu Ruby trong 25 phút"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Phần 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Phần 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Phần 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Tìm hiểu Ruby trong 25 phút</h1>

---

Vậy hãy nhìn sâu hơn vào chương tình mới của chúng ta, chú ý các dòng ban đầu,
bắt đầu bởi dấu thăng (#). Trong Ruby, bất cứ thứ gì trong một dòng phía sau
dấu thăng là một bình luận và trình biên dịch sẽ bỏ qua. Dòng đầu tiên của tập
tin là trường hợp đặc biệt, hệ điều hành nhân Unix sẽ cho shell biết cách chạy
tập tin. Mục đích của các bình luận là để làm rõ hơn.

Phương thức `xin_chao`đã trở nên phức tạp hơn một chút:

{% highlight ruby %}
# Say hi to everybody
def xin_chao
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names là danh sách tên, lặp đi lặp lại!
    @names.each do |name|
      puts "Xin chào #{name}!"
    end
  else
    puts "Xin chào #{@names}!"
  end
end
{% endhighlight %}

Chương trình sẽ dựa vào biến ví dụ `@names` để đưa ra quyết định. Nếu nó rỗng
thì chỉ in ra ba dấu chấm. Không có lý nào lại đi chào không ai cả, phải vậy
chứ?

## Chu kỳ và vòng lặp—a.k.a. lặp đi lặp lại

Nếu đối tượng `@names` phản hồi `each` (mỗi), nó nghĩa là bạn có thể lặp đi
lặp lại, vì thế nó lặp đi lặp lại và mỗi lần chào một người. Cuối cùng, nếu
`@names` là thứ gì đó, tự động chuyển nó thành xâu và thực hiện chào như mặc
định.

Chúng ta hãy nhìn sấu hơn vào phép lặp:

{% highlight ruby %}
@names.each do |name|
  puts "Xin chào #{name}!"
end
{% endhighlight %}

`each` là phương thức cho phép một khối lệnh chạy mỗi lần gặp một thành phần
trong danh sách, và đoạn ở giữa `do` và `end` là khối lệnh. Một khối lệnh
giống như một hàm bất định hay `lambda`. Biến nằm giữa 2 dấu gạch dọc là tham
số cho khối lệnh này.

Điều xảy ra ở đây là với tất cả các mục trong một danh sách, `name` ràng buộc
với các phần tử của danh sách, và cú pháp `puts "Xin chào #{name}!"` sẽ chạy
với cái tên đó.

Phần lớn các ngôn ngữ lập trình khác làm việc với một danh sách bằng vòng lặp
`for`, ví dụ trong C sẽ như này:

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

Nó vẫn hoạt động tuy nhiên không được hay cho lắm. Bạn cần một biến đếm `i`,
xác định được độ dài của danh sách, và cần phải giải thích làm thế nào để đi
hết danh sách. Cách của Ruby hay hơn nhiều, tất cả chi tiết quản lý được ẩn
trong phương thức `each`, tất cả những gì bạn cần làm là nói với vó cần phải
làm gì với các thành phần. Trong đó, phương thức `each` về cơ bản sẽ gọi
`yield "Albert"`, sau đó `yeld "Brenda"` rồi `yield "Charles"`, vv.

## Khối lệnh, ánh sáng lấp lánh trên các cạnh của Ruby

Sức mạnh thực sự của khối lệnh là khi xử lý các đối tượng phức tạp hơn danh
sách. Ngoài việc xử lý các chi tiết nội dung đơn giản trong phương thức, bạn
còn có thể xử lý thiết lập, teardown và lỗi - tất cả ẩn đi khỏi sự chú ý của
người dùng.

{% highlight ruby %}
# Tạm biệt mọi người
def tam_biet
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Gộp các thành phần của danh sách bằng dấu phẩy
    puts "Tạm biệt #{@names.join(", ")}.  Hẹn gặp lại!"
  else
    puts "Tạm biệt #{@names}.  Hẹn gặp lại!"
  end
end
{% endhighlight %}

Phương thức `tam_biet` không sử dụng `each`, thay vào đó nó kiểm tra xem nếu
`@names` có đáp ứng phương thức `join` không, nếu có thì sử dụng nó. Mặt khác
nó chỉ in ra các biến dưới dạng xâu. Phương thức này không quan tâm tới *kiểu*
của biến, chỉ dựa vào phương thức mà nó hỗ trợ được gọi là "Duck Typing",
giống như "nếu nó đi giống con vịt và quạc quạc giống con vịt...". Lợi ích của
điều này là không cần thiết phải hạn chế kiểu biến được hỗ trợ. Nếu ai đó đến
với một kiểu danh sách lớp mới, miễn là nó thực thi phương thức `join` với
cùng một ngữ nghĩa như các danh sách khác, mọi thứ sẽ hoạt động theo đúng kế
hoạch.

## Bắt đầu kịch bản

Vậy, đó là lớp MegaGreeter, phần còn lại của tập tin chỉ để gọi phương thức
trong lớp đó. Có một mẹọ cuối cùng để chú ý, đó là dòng

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` là biến kỳ diệu, nó chứa tên của tập tin hiện tại. `$0` là tên của
tập tin sử dụng để bắt đầu chương trình. Kiểm tra này nói rằng "Nếu đây là tập
tin chính được sử dụng..." nghĩa là nó cho phép một tập tin có thể sử dụng như
một thư viện và không phải thực thi mã bên trong, nhưng nếu nó là một tập tin
có thể thực thi thì mã sẽ được thực thi.

## Xem xét tự giới thiệu

Vì vậy, đó là nó sử dụng cho tour tham quan nhanh về Ruby. Có rất nhiều điều
cần khám phá, các cấu trúc điều khiển khác nhau mà Ruby cung cấp; cách sử dụng
của các khối lệnh và `yield`; các module như mixins; và còn nhiều hơn nữa. Tôi
hy vọng những thú vị ban đầu này của Ruby sẽ khiến bạn muốn học thêm nữa.

Nếu vậy, hãy đi đến khu vực [Tài liệu](/vi/documentation/) của chúng tôi, nơi
có vô vàn đường dẫn tới các bài chỉ dẫn và hướng dẫn sử dụng, tất cả đều miễn
phi trực tuyến.
