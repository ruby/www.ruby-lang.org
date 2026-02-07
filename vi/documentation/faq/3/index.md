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
    <strong>3</strong>
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

## Cài đặt Ruby

Để biết thông tin mới nhất về tải xuống và cài đặt Ruby,
hãy xem trang [Cài đặt](/vi/documentation/installation/)
hoặc [Tải xuống](/vi/downloads/).

### Những hệ điều hành nào hỗ trợ Ruby?

{% include warnings/faq-out-of-date.html %}

Ruby được phát triển trên Linux, và được viết bằng C khá đơn giản.
Nó chạy trên Linux và các hệ điều hành tương tự UNIX khác, macOS,
Windows, DOS, BeOS, Amiga, Acorn Risc OS, và OS/2.

### Tôi có thể lấy mã nguồn Ruby ở đâu?

Phiên bản mới nhất của Ruby có thể được tải xuống từ:
[www.ruby-lang.org/vi/downloads/](/vi/downloads/).
Các trang mirror cũng được liệt kê trên trang này.

Ngoài ra trên trang này còn có liên kết đến bản snapshot hàng đêm của cây phát triển.

### Tôi có thể truy cập cây mã nguồn phát triển không?

{% include warnings/faq-out-of-date.html %}

Nếu bạn có ứng dụng CVS, bạn có thể lấy cây mã nguồn hiện tại bằng cách:

~~~
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs login
(Logging in to anonymous@cvs.netlab.co.jp)
CVS password: guest
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs co ruby
~~~

Nếu bạn không có CVS, bạn có thể lấy bản snapshot hàng đêm của mã nguồn
phát triển từ
[https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz](https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz).

### Làm thế nào để biên dịch Ruby?

Trên Unix, Ruby sử dụng hệ thống `autoconf` để cấu hình môi trường biên dịch.
Bạn không cần lệnh `autoconf` trên máy để biên dịch Ruby
từ bản phân phối; chỉ cần dùng các lệnh:

~~~
$ ./configure [configure options]
$ make
$ make test
$ make install
~~~

Bạn có thể cần quyền superuser để cài đặt Ruby nếu bạn không thay đổi
vị trí cài đặt mặc định (`/usr/local`). Bạn có thể xem danh sách đầy đủ
các tùy chọn `configure` bằng:

~~~
$ ./configure --help
~~~

Nếu bạn đang làm việc từ kho mã nguồn, bạn có thể cần chạy
`autoconf` trước khi chạy `configure`.

### Làm thế nào để cho Ruby biết thư viện của tôi ở đâu?

{% include warnings/faq-out-of-date.html %}

Trên một số hệ thống, quá trình biên dịch có thể không tìm thấy thư viện được sử dụng
bởi các module mở rộng (ví dụ các thư viện `dbm`).

Bạn có thể cho Ruby biết nơi tìm thư viện bằng các tùy chọn cho `configure`.
Từ [\[ruby-talk:5041\]][ruby-talk:5041]:

~~~
$ ./configure --with-xxx-yyy=DIR
~~~

trong đó xxx là

~~~
opt           đường dẫn phần mềm bổ sung nói chung
dbm           đường dẫn cho thư viện dbm
gdbm          đường dẫn cho thư viện gdbm
x11           ...cho X11..
tk            ...cho Tk...
tcl           ...cho Tcl...
~~~

và yyy là

~~~
dir           chỉ định -I DIR/include -L DIR/lib
include       chỉ định -I DIR
lib           chỉ định -L DIR
~~~

Trên HP-UX, có thể gặp vấn đề khi biên dịch với `gcc`. Hãy thử sử dụng trình
biên dịch gốc thay thế. WATANABE Tetsuya khuyến nghị:

~~~
$ CC="cc -Ae" CFLAGS=-O ./configure --prefix=/opt/gnu
~~~

Cũng có thể gặp vấn đề với `sed` gốc của HP.
Ông khuyến nghị cài đặt phiên bản GNU tương đương.

[ruby-talk:5041]: https://blade.ruby-lang.org/ruby-talk/5041

### Có sẵn các bản biên dịch sẵn không?

Một gói tải xuống duy nhất chứa mọi thứ bạn cần để chạy Ruby trên
các hệ điều hành Windows có sẵn tại [RubyInstaller](https://rubyinstaller.org/).

[Reuben Thomas](mailto:Reuben.Thomas@cl.cam.ac.uk) viết:

> You could mention that there's a port to Acorn RISC OS, currently of v1.4.3.
> I made the port, and have no plans to maintain it, but I did send the
> patches to matz, so newer versions may well compile too.

### "cygwin", "mingw", và "djgpp" là gì?

{% include warnings/faq-out-of-date.html %}

Ruby được viết để tận dụng bộ tính năng phong phú của môi trường Unix.
Thật không may, Windows thiếu một số hàm, và triển khai các hàm khác
theo cách khác. Vì vậy, cần có một lớp ánh xạ nào đó để chạy Ruby
(và các chương trình dựa trên Unix khác) trên Windows.

Bạn có thể gặp các phiên bản khác nhau của tệp thực thi Ruby sử dụng
các lớp ánh xạ wrapper khác nhau.

Phiên bản rbdj là phiên bản độc lập của bản nhị phân Windows của Ruby.
Nó sử dụng các công cụ DJ Delorie
([http://www.delorie.com](http://www.delorie.com)).

Phiên bản rbcw là bản nhị phân Windows của Ruby yêu cầu thư viện cygwin,
có tại [http://www.cygwin.com](http://www.cygwin.com) hoặc từ các
trang tải xuống Ruby. Cygwin vừa là một lớp giả lập vừa là một bộ
tiện ích ban đầu được sản xuất bởi Cygnus Solutions (nay thuộc Redhat).
Phiên bản cygwin của Ruby có lẽ có bộ tính năng đầy đủ nhất trên
Windows, nên hầu hết lập trình viên sẽ muốn sử dụng nó.

Để sử dụng phiên bản rbcw, bạn cần cài đặt tệp cygwin .dll riêng.
Sau khi cài đặt cygwin trên máy tính, hãy sao chép `cygwin1.dll` (nằm
trong thư mục con `bin` của bản phân phối cygwin) vào thư mục
`Windows\System32` (hoặc một nơi khác trên đường dẫn PATH của bạn).

Cảm ơn Anders Schneiderman đã cung cấp nền tảng cho phần mô tả này.

### Tại sao đồ họa Tk không hoạt động trên Windows?

{% include warnings/faq-out-of-date.html %}

Tk đã được cài đặt đúng trên máy Windows của bạn chưa? Truy cập
[https://wiki.tcl-lang.org/page/Binary+Distributions](https://wiki.tcl-lang.org/page/Binary+Distributions#85b8647b1ec80c2fa1698c3c7e76204a944a95db2487347c51773f26b9dad6ae)
để tìm bản phân phối nhị phân Tcl/Tk biên dịch sẵn cho máy của bạn.

Các biến môi trường `TCL_LIBRARY` và `TK_LIBRARY` có đang trỏ đến
các thư mục chứa tcl và tk không?

Thư viện tk có nằm trong đường dẫn PATH của bạn không?
