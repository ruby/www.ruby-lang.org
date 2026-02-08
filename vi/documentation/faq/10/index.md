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
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <strong>10</strong>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Thư viện mở rộng

### Làm thế nào để sử dụng Ruby tương tác?
{: #irb}

{% include warnings/faq-out-of-date.html %}

Bạn có thể thử sử dụng `irb`. Nội dung sau đây được diễn giải lại từ
Kentaro Goto (Gotoken), và ban đầu xuất hiện trong
[\[ruby-talk:444\]][ruby-talk:444].

1. Lấy tarball mới nhất của `irb` từ
   [thư mục contrib](ftp://ftp.netlab.co.jp/pub/lang/ruby/contrib/)
   trong kho lưu trữ Ruby.
2. Giải nén cây thư mục `irb`.
3. Thêm vị trí của thư mục `irb/` vào biến môi trường `$RUBYLIB`.
4. Tạo liên kết tượng trưng từ `$RUBYLIB/irb/irb.rb` đến một tệp có tên
   `irb` ở đâu đó trong path của bạn.
5. `chmod +x $RUBYLIB/irb/irb.rb`
6. Có thể sử dụng `rehash` để thông báo cho shell đăng nhập về lệnh mới.
7. Gõ `irb`.

Nếu module mở rộng readline hoạt động với trình thông dịch của bạn, nó sẽ
làm cho việc sử dụng `irb` thú vị hơn nhiều.

Cũng có một chương trình đơn giản, `eval`, trong thư mục `samples/` của
bản phân phối Ruby. Nó cho phép bạn nhập biểu thức và xem giá trị của chúng.
Bạn có thể sao chép `eval` vào thư mục `site_ruby` trong cây Ruby, và
sau đó gọi nó bằng:

~~~
ruby -r eval -e0
~~~

[ruby-talk:444]: https://blade.ruby-lang.org/ruby-talk/444

### Có trình gỡ lỗi cho Ruby không?

Có một trình gỡ lỗi giống gdb cho Ruby.

~~~
ruby -r debug your_program
~~~

### Làm thế nào để sử dụng thư viện viết bằng C từ Ruby?

Trong tất cả các ngôn ngữ kịch bản, Ruby có lẽ là dễ mở rộng nhất.
Không có vấn đề gì với đếm tham chiếu và kiểu biến, và rất ít giao diện
cần học. Thực tế, mã C dùng để mở rộng Ruby thường trông giống mã Ruby
một cách đáng ngạc nhiên.

Trước tiên, đọc tệp `doc/extension.rdoc` trong mã nguồn Ruby,
hoặc đọc [extension.rdoc trên docs.ruby-lang.org][extension-rdoc].
Đây là một tài liệu tốt, không chỉ khi bạn đang viết thư viện mở rộng,
mà còn nếu bạn muốn hiểu sâu hơn về Ruby.

Sau đó, trang web RubyGems cung cấp
[hướng dẫn tạo gem với phần mở rộng][rubygems-guide].
Nó chỉ cách thiết lập gem với các phần mở rộng C được biên dịch khi cài đặt.
Nó cũng có liên kết đến một số gem hiện có bọc các thư viện C và
đến tài liệu đọc thêm.

Bạn cũng có thể muốn xem mã nguồn của trình thông dịch,
và các phần mở rộng đi kèm trong thư mục `ext/`
(bạn có thể duyệt [kho Ruby trên GitHub][ruby-github]).

[extension-rdoc]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[rubygems-guide]: http://guides.rubygems.org/gems-with-extensions/
[ruby-github]:    https://github.com/ruby/ruby

### Có thể sử dụng Tcl/Tk trong Ruby không?

{% include warnings/faq-out-of-date.html %}

Có hai giao diện cho Tcl/Tk đi kèm trong bản phân phối chuẩn.
Một cái nằm trong `ext/tcltk/` và được tải bằng `require "tcltk"`. Cú pháp
rất gần với Tcl và được truyền cho trình thông dịch Tcl.
Tiếc là tài liệu cho thư viện này được viết bằng tiếng Nhật.

Cái còn lại nằm trong `ext/tk/` và được tải bằng `require "tk"`. Cú pháp
của nó gần với kiểu giao diện Tk được cung cấp bởi các giao diện Perl và
Python.

### Tk không hoạt động. Tại sao?

{% include warnings/faq-out-of-date.html %}

Phiên bản Tk của bạn có thể đã cũ, hãy thử phiên bản mới hơn.

### Có thể sử dụng giao diện gtk+ hoặc xforms trong Ruby không?

{% include warnings/faq-out-of-date.html %}

Bạn sẽ tìm thấy `ruby-gtk-x.xx.tar.gz` và `ruby-forms-x.x.tar.gz`
trong `contrib/` trên các trang ftp của Ruby.

### Làm thế nào để thực hiện tính toán ngày tháng?

{% include warnings/faq-out-of-date.html %}

Đối tượng `Time` chỉ có thể biểu diễn các ngày từ 1 tháng 1, 1970 đến
19 tháng 1, 2038.

Hai module thư viện mở rộng chuẩn được cung cấp:
`require "date"`, đơn giản và sử dụng lịch Anh,
và `require "date2"`, tổng quát hơn.

Cũng xem `sample/cal.rb`.
