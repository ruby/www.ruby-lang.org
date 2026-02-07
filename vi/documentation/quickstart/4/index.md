---
layout: page
title: "Ruby trong 20 phút"
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
  <h1>Ruby trong 20 phút</h1>

---

Bây giờ, hãy nhìn sâu hơn vào chương trình mới của chúng ta, chú ý các
dòng đầu tiên bắt đầu bằng dấu thăng (#). Trong Ruby, bất cứ thứ gì
trên một dòng sau dấu thăng đều là chú thích và bị trình thông dịch bỏ
qua. Dòng đầu tiên của tệp là một trường hợp đặc biệt, trên các hệ
điều hành giống Unix, nó cho shell biết cách chạy tệp. Các chú thích
còn lại chỉ để giải thích rõ ràng hơn.

Method `say_hi` của chúng ta đã trở nên phức tạp hơn một chút:

{% highlight ruby %}
# Say hi to everybody
def say_hi
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names is a list of some kind, iterate!
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
{% endhighlight %}

Bây giờ nó kiểm tra biến thực thể `@names` để đưa ra quyết định. Nếu
giá trị là nil, nó chỉ in ra ba dấu chấm. Chẳng có lý do gì để chào
không ai cả, đúng không?

## Lặp vòng — hay còn gọi là Iteration

Nếu đối tượng `@names` phản hồi method `each`, thì đó là thứ có thể
lặp qua được, vậy hãy lặp qua nó và chào từng người một. Cuối cùng,
nếu `@names` là bất cứ thứ gì khác, cứ để nó tự động được chuyển thành
chuỗi ký tự và thực hiện lời chào mặc định.

Hãy xem kỹ hơn bộ lặp đó:

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` là một method nhận một khối mã (block) rồi chạy khối mã đó cho
mỗi phần tử trong danh sách, và phần nằm giữa `do` và `end` chính là
khối mã đó. Một block giống như một hàm ẩn danh hoặc `lambda`. Biến nằm
giữa hai dấu gạch đứng là tham số của block này.

Điều xảy ra ở đây là với mỗi phần tử trong danh sách, `name` được gán
bằng phần tử đó, và sau đó biểu thức `puts "Hello #{name}!"` được thực
thi với tên đó.

Hầu hết các ngôn ngữ lập trình khác xử lý việc duyệt qua một danh sách
bằng vòng lặp `for`, trong C trông giống như thế này:

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

Cách này hoạt động được, nhưng không thanh lịch lắm. Bạn cần một biến
tạm như `i`, phải tính xem danh sách dài bao nhiêu, và phải giải thích
cách duyệt qua danh sách. Cách của Ruby thanh lịch hơn nhiều, tất cả
các chi tiết xử lý được ẩn bên trong method `each`, bạn chỉ cần nói cho
nó biết phải làm gì với mỗi phần tử. Bên trong, method `each` về cơ bản
sẽ gọi `yield "Albert"`, rồi `yield "Brenda"`, rồi `yield "Charles"`,
và cứ tiếp tục như vậy.

## Block, viên ngọc sáng lấp lánh của Ruby

Sức mạnh thực sự của block là khi xử lý những thứ phức tạp hơn danh
sách. Ngoài việc xử lý các chi tiết đơn giản bên trong method, bạn còn
có thể xử lý thiết lập, dọn dẹp, và lỗi — tất cả đều được ẩn đi khỏi
sự quan tâm của người dùng.

{% highlight ruby %}
# Say bye to everybody
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Join the list elements with commas
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
{% endhighlight %}

Method `say_bye` không sử dụng `each`, thay vào đó nó kiểm tra xem
`@names` có phản hồi method `join` hay không, và nếu có thì sử dụng nó.
Nếu không, nó chỉ đơn giản in biến đó ra dưới dạng chuỗi ký tự. Cách
không quan tâm đến *kiểu* thực sự của biến, mà chỉ dựa vào các method
mà nó hỗ trợ, được gọi là "Duck Typing", như câu nói "nếu nó đi như
vịt và kêu như vịt...". Lợi ích của điều này là không hạn chế một cách
không cần thiết các kiểu biến được hỗ trợ. Nếu ai đó tạo ra một loại
class danh sách mới, miễn là nó triển khai method `join` với cùng ngữ
nghĩa như các danh sách khác, mọi thứ sẽ hoạt động đúng như dự kiến.

## Khởi chạy script

Vậy đó là class MegaGreeter, phần còn lại của tệp chỉ gọi các method
trên class đó. Có một thủ thuật cuối cùng cần chú ý, đó là dòng:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` là biến đặc biệt chứa tên của tệp hiện tại. `$0` là tên của
tệp được dùng để khởi chạy chương trình. Kiểm tra này có nghĩa là "Nếu
đây là tệp chính đang được chạy..." Điều này cho phép một tệp được sử
dụng như một thư viện mà không thực thi mã trong ngữ cảnh đó, nhưng nếu
tệp đang được sử dụng như một chương trình thực thi, thì hãy thực thi
mã đó.

## Coi như đã làm quen xong

Vậy là kết thúc chuyến tham quan nhanh về Ruby. Còn rất nhiều thứ để
khám phá: các cấu trúc điều khiển khác nhau mà Ruby cung cấp; cách sử
dụng block và `yield`; module dùng như mixin; và nhiều hơn nữa. Tôi hy
vọng trải nghiệm Ruby vừa rồi đã khiến bạn muốn tìm hiểu thêm.

Nếu vậy, hãy ghé thăm khu vực [Tài liệu](/vi/documentation/) của chúng
tôi, nơi tổng hợp các liên kết đến sách hướng dẫn và tài liệu học, tất
cả đều miễn phí trực tuyến.
