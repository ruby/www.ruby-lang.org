---
layout: page
title: "Thư viện"
lang: vi
---

Giống như hầu hết các ngôn ngữ lập trình, Ruby tận dụng một bộ thư viện
bên thứ ba phong phú.
{: .summary}

Hầu như tất cả các thư viện này được phát hành dưới dạng **gem**,
một thư viện hoặc ứng dụng được đóng gói có thể được cài đặt bằng công cụ
có tên [**RubyGems**][1].

RubyGems là hệ thống đóng gói Ruby được thiết kế để hỗ trợ việc tạo,
chia sẻ và cài đặt thư viện (theo một cách nào đó, nó là hệ thống đóng gói
phân phối tương tự như `apt-get`, nhưng nhắm đến phần mềm Ruby).
Ruby đi kèm với RubyGems mặc định từ phiên bản 1.9, các phiên bản Ruby
trước đó cần [cài đặt RubyGems thủ công][2].

Một số thư viện khác được phát hành dưới dạng thư mục nén (.zip hoặc .tar.gz)
chứa **mã nguồn**. Quy trình cài đặt có thể khác nhau,
thường sẽ có tệp `README` hoặc `INSTALL` kèm hướng dẫn.

Hãy cùng tìm hiểu cách tìm kiếm thư viện và cài đặt chúng để sử dụng.

### Tìm kiếm thư viện

Nơi chính để lưu trữ thư viện là [**RubyGems.org**][1], một kho gem công khai
có thể tìm kiếm và cài đặt vào máy của bạn.
Bạn có thể duyệt và tìm kiếm gem qua trang web RubyGems,
hoặc sử dụng lệnh `gem`.

Sử dụng `gem search -r`, bạn có thể tìm kiếm trong kho RubyGems. Ví dụ,
`gem search -r rails` sẽ trả về danh sách các gem liên quan đến Rails.
Với tùy chọn `--local` (`-l`), bạn có thể tìm kiếm cục bộ trong các gem
đã cài đặt. Để cài đặt một gem, sử dụng `gem install [gem]`.
Xem danh sách gem đã cài đặt bằng `gem list`. Để biết thêm thông tin
về lệnh `gem`, xem phần bên dưới hoặc truy cập
[tài liệu RubyGems][3].

Ngoài ra còn có các nguồn thư viện khác.
[**GitHub**][5] là kho lưu trữ nội dung liên quan đến Ruby chính.
Thông thường mã nguồn của gem sẽ được lưu trữ trên GitHub đồng thời
được phát hành dưới dạng gem đầy đủ trên RubyGems.org.

[**The Ruby Toolbox**][6] là một dự án giúp dễ dàng khám phá các dự án
Ruby mã nguồn mở. Nó có các danh mục cho nhiều tác vụ phát triển phổ biến,
thu thập nhiều thông tin về các dự án như hoạt động phát hành, commit
hay các phụ thuộc và đánh giá các dự án dựa trên mức độ phổ biến trên
RubyGems.org và GitHub. Điều này giúp dễ dàng tìm được gem giải quyết
một vấn đề cụ thể như framework web, công cụ tài liệu và
thư viện kiểm tra chất lượng mã.

### Thêm vài điều về RubyGems

Dưới đây là tổng quan nhanh về lệnh `gem` cho việc sử dụng hàng ngày.
[Tài liệu chi tiết hơn][7] có sẵn, bao gồm mọi khía cạnh
của hệ thống đóng gói này.

#### Tìm kiếm trong các gem có sẵn

Lệnh **search** có thể được dùng để tìm gem, dựa trên một chuỗi ký tự.
Các gem có tên bắt đầu bằng chuỗi được chỉ định sẽ được liệt kê.
Ví dụ, để tìm các gem liên quan đến "html":

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

Cờ `--remote` / `-r` cho biết rằng chúng ta muốn tìm trong
kho RubyGems.org chính thức (hành vi mặc định).
Với cờ `--local` / `-l`, bạn có thể tìm kiếm cục bộ
trong các gem đã cài đặt.

#### Cài đặt một gem

Khi bạn đã biết gem nào muốn **cài đặt**, ví dụ framework
Ruby on Rails phổ biến:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Bạn thậm chí có thể cài đặt một phiên bản cụ thể của thư viện, sử dụng
cờ `--version` / `-v`:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Liệt kê tất cả gem

Để xem **danh sách** tất cả gem đã cài đặt cục bộ:

{% highlight sh %}
$ gem list
{% endhighlight %}

Để xem danh sách (rất dài) tất cả gem có sẵn trên RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Trợ giúp!

Tài liệu hướng dẫn có sẵn ngay trong terminal của bạn:

{% highlight sh %}
$ gem help
{% endhighlight %}

Ví dụ, `gem help commands` rất hữu ích vì nó hiển thị danh sách
tất cả các lệnh của `gem`.

#### Tạo gem của riêng bạn

RubyGems.org có [một số hướng dẫn][3] về chủ đề này. Bạn cũng có thể
muốn tìm hiểu [Bundler][9], một công cụ đa năng giúp bạn quản lý
các phụ thuộc của ứng dụng và có thể sử dụng cùng với RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
