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
    <strong>2</strong>
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

## Ruby so với các ngôn ngữ khác như thế nào?

### Ruby so với Python thế nào?

Python và Ruby đều là ngôn ngữ hướng đối tượng cung cấp sự chuyển đổi mượt mà
từ phong cách lập trình thủ tục sang OO. Smalltalk thì ngược lại,
chỉ có đối tượng---bạn không thể làm gì cho đến khi hiểu đối tượng,
kế thừa và hệ thống phân cấp lớp đồ sộ của Smalltalk. Bằng cách cung cấp
bánh xe hỗ trợ kiểu thủ tục, Python và Ruby "sửa chữa" một trong những đặc điểm
có thể đã giữ Smalltalk ngoài dòng chính. Hai ngôn ngữ khác nhau ở cách tiếp cận
giải pháp này từ hai hướng ngược nhau.

Python là một ngôn ngữ lai. Nó có hàm cho lập trình thủ tục và
đối tượng cho lập trình OO. Python kết nối hai thế giới bằng cách cho phép
hàm và phương thức chuyển đổi qua lại nhờ tham số `self` tường minh
trong mỗi định nghĩa phương thức. Khi một hàm được chèn vào đối tượng, tham số
đầu tiên tự động trở thành tham chiếu đến đối tượng nhận.

Ruby là một ngôn ngữ OO thuần túy có thể ngụy trang thành ngôn ngữ thủ tục. Nó không
có hàm, chỉ có lời gọi phương thức. Trong một phương thức Ruby, đối tượng nhận, còn gọi là
`self`, là tham số ẩn giống như `this` trong C++. Câu lệnh `def` nằm ngoài
định nghĩa lớp, vốn định nghĩa một hàm trong Python, thực chất định nghĩa một phương thức
trong Ruby. Các hàm giả này trở thành phương thức private của lớp Object, gốc
của hệ thống phân cấp lớp Ruby. Lập trình thủ tục được giải quyết gọn gàng từ
hướng ngược lại---mọi thứ đều là đối tượng. Nếu người dùng chưa hiểu
đối tượng, họ có thể giả vờ rằng `def` là định nghĩa hàm và
vẫn làm việc hiệu quả được.

Tính thuần túy OO của Ruby cung cấp nhiều tính năng mà Python thiếu hoặc vẫn đang
phát triển: hệ thống phân cấp kiểu/lớp thống nhất, metaclass, khả năng
kế thừa mọi thứ, và cách gọi phương thức đồng nhất (không có chuyện `len()` là
hàm nhưng `items()` là phương thức). Ruby, giống như Smalltalk, chỉ
hỗ trợ đơn kế thừa, nhưng nó có khái niệm mixin rất mạnh mẽ:
một định nghĩa lớp có thể include một module, từ đó chèn các phương thức,
hằng số, v.v. của module đó vào lớp.

Ruby, cũng giống như Smalltalk, cung cấp closure và block mã và sử dụng chúng
một cách hiệu quả. Các lớp collection và iterator của Ruby rất
xuất sắc, mạnh mẽ và tinh tế hơn nhiều so với các giải pháp tạm thời
mà Python đang phát triển (lambda và list comprehension).

Cú pháp và triết lý thiết kế của Ruby chịu ảnh hưởng nặng nề từ Perl. Nó có
rất nhiều biến thể cú pháp. Các bổ ngữ câu lệnh (`if`, `unless`, `while`,
`until`, v.v.) có thể xuất hiện ở cuối bất kỳ câu lệnh nào. Một số từ khóa
là tùy chọn (ví dụ `then` trong câu lệnh `if`). Dấu ngoặc đơn đôi khi
có thể bỏ qua trong lời gọi phương thức. Đối tượng nhận của phương thức thường có thể
được lược bỏ.
Rất nhiều thứ được lấy trực tiếp từ Perl.
Biểu thức chính quy tích hợp sẵn, `$_` và các biến liên quan, here document,
phân biệt chuỗi nháy đơn / nháy kép, tiền tố `$` và `@` để
phân biệt các loại tên khác nhau, v.v.

Nếu bạn thích Perl, bạn sẽ thích Ruby và cảm thấy quen thuộc với cú pháp của nó.
Nếu bạn thích Smalltalk, bạn sẽ thích Ruby và cảm thấy quen thuộc với ngữ nghĩa
của nó. Nếu bạn thích Python, bạn có thể hoặc không bị khó chịu bởi sự khác biệt
lớn trong triết lý thiết kế giữa Python và Ruby/Perl.

Ruby phức tạp hơn Python nhiều nhưng các tính năng của nó, phần lớn,
phối hợp tốt với nhau. Ruby được thiết kế tốt và đầy những ý tưởng hay có thể
được khai thác cho P3K. Tôi không chắc bao nhiêu lập trình viên Python sẽ bị thu hút
bởi nó---nó chưa thuyết phục được tôi (chưa). Nhưng nó xứng đáng được nghiên cứu
nghiêm túc và có thể là mối đe dọa thực sự đối với Perl.

Đăng bởi [John Dell'Aquila](mailto:jbd@alum.mit.edu) trên comp.lang.python,
ngày 17/11/2000. Đăng lại với sự cho phép.
