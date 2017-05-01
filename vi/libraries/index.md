---
layout: page
title: "Thư viện"
lang: vi
---

Như những ngôn ngữ lập trình khác, Ruby có một lượng lớn thư viện không thuộc
thư viện lõi.
{: .summary}

Hầu hết được phát hành dưới dạng **gem**. [**RubyGems**][1] là hệ thống đóng gói
Ruby giúp tạo, chia sẻ và cài đặt thư viện (ở dưới một góc độ nào đó thì nó là
hệ thống phân phối gói, giống như `apt-get`, nhưng tập trung chỉ vào phần mềm Ruby).
Từ phiên bản 1.9, Ruby có kèm RubyGems vào cùng, trong khi đó những phiên bản thì
phải [cài đặt riêng][2].

Nhiều thư viện khác được phát hành dưới hình thức gói lưu trữ (.zip hay .tar.gz)
của **mã nguồn**. Phương thức cài đặt có thể khác nhưng hầu hết hướng dẫn cài
đặt được viết trong `README` hay `INSTALL`.

Nào bây giờ hãy cùng tìm thư viện và cài đặt chúng theo yêu cầu sử dụng của bạn.

### Tìm thư viện

Địa điểm chính nơi thư viện được phát hành là [**RubyGems.org**][1],
hệ thống này cung cấp thư viện Ruby dưới dạng gem. Bạn có thể xem trang web trực
tiếp hoặc thông qua lệnh `gem`.

Sử dụng `gem search -r` để tra cứu repository của RubyGems. Ví dụ,
`gem search -r rails` sẽ trả về một danh sách những gem liên quan đến Rails.
Nếu khai báo lệnh với lựa chọn `--local` (`-l`) để tìm kiếm trong những gem đã
được cài đặt trên máy. Để cài một gem, dùng `gem install
[gem]`. Xem những gem đã cài trên máy với lệnh `gem list`. Để biết thêm chi tiết
về lệnh `gem`, xin hãy tham khảo ở dưới hoặc xem [Tài liệu RubyGems][3].

Có nhiều nguồn thư viện. [RubyForge][4] từng là nhà của rất nhiều thư viện phổ
dụng, nhưng nhũng năm gần đây chứng kiến [**GitHub**][5] lên ngôi như là một
trung tâm lưu trữ tất cả nội dung liên quan đến Ruby. Hầu hết mã nguồn của gem
đều được để trên GitHub trong khi gem ở dạng đóng gói thì được phát hành trên
RubyGems.org.

[Ruby Application Archive][6] (hay RAA) là danh mục tất cả mọi thứ về phần mềm
Ruby, sắp xếp theo chức năng. Tuy nhưng trang này không còn được sử dụng nữa. Có
lẽ bạn không bỏ qua trang này.

### Một vài lời về RubyGems

Sau đây là một bài hướng dẫn nhanh về lệnh `gem` trong sử dụng hàng ngày.
[Nhiều tài liệu chi tiết hơn][7] chỉ ra những khía cạnh sâu của hệ thống gói này.

#### Tìm kiếm gem

Lệnh **search** được dùng để tìm gem, theo một từ khoá.
Gems mà tên bắt đầu với từ chỉ định sẽ được trả về.
Ví dụ, tìm những gem liên quan từ khoá “html”:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

Cờ `--remote` / `-r` chỉ định là chúng ta muốn kiểm tra trên repository
của RubyGems.org (mặc định).
Với cờ `--local` / `-l` bạn sẽ tìm gem chỉ được cài trên máyc của bạn.

#### Cài đặt gem

Khi bạn biết gem nào cần **cài đặt**, ví dụ gem Rails:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Bạn có thể cài một phiên bản nhất định của gem, với cờ `--version` / `-v`:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Liệt kê tất cả gem

Muốn có một **danh sách** gem đã cài trên máy:

{% highlight sh %}
$ gem list
{% endhighlight %}

Để lấy danh sách các gem trên RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Giúp!

Tài liệu có thể được truy cập trong terminal với:

{% highlight sh %}
$ gem help
{% endhighlight %}

Ví dụ, `gem help commands` sẽ liệt kê ra các lệnh của `gem`.

#### Tạo ra gem riêng của bạn

RubyGems.org có một vài [hướng dẫn][3] về chủ đề này. Bạn có thể tra khảo về
[Bundler][9], một công cụ giúp quản lý các phần mềm yêu cầu và có thể sử dụng
cùng với RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: http://raa.ruby-lang.org/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
