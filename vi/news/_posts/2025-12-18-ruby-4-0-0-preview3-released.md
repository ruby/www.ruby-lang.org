---
layout: news_post
title: "Phát hành Ruby 4.0.0 preview3"
author: "naruse"
translator: "Ngọc Lê"
date: 2025-12-18 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}.
Ruby 4.0 giới thiệu Ruby::Box và "ZJIT", cùng nhiều cải tiến khác.

## Ruby::Box

Một tính năng mới (thử nghiệm) cung cấp sự phân tách về các định nghĩa.
Để biết chi tiết về "Ruby Box", xem [doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html).
[[Feature #21311]] [[Misc #21385]]

## Thay đổi ngôn ngữ

* `*nil` không còn gọi `nil.to_a`, tương tự như cách `**nil` không
  gọi `nil.to_hash`.  [[Feature #21047]]

* Các toán tử nhị phân logic (`||`, `&&`, `and` và `or`) ở đầu
  dòng tiếp tục dòng trước đó, giống như dấu chấm fluent.
  Hai đoạn mã sau là tương đương:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    [[Feature #20925]]

## Cập nhật các lớp lõi

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật lớp đáng chú ý.

* Kernel

    * `Kernel#inspect` giờ kiểm tra sự tồn tại của phương thức `#instance_variables_to_inspect`,
      cho phép kiểm soát các biến instance nào được hiển thị trong chuỗi `#inspect`:

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * Hành vi đã bị deprecated, tạo tiến trình bằng `Kernel#open` với
      ký tự `|` ở đầu, đã bị loại bỏ.  [[Feature #19630]]

* Binding

    * `Binding#local_variables` không còn bao gồm các tham số được đánh số.
      Ngoài ra, `Binding#local_variable_get` và `Binding#local_variable_set` từ chối
      xử lý các tham số được đánh số.  [[Bug #21049]]

* File

    * `File::Stat#birthtime` giờ khả dụng trên Linux thông qua lệnh hệ thống statx
      khi được hỗ trợ bởi kernel và hệ thống tệp.
      [[Feature #21205]]

* IO

    * `IO.select` chấp nhận `Float::INFINITY` làm đối số timeout.
      [[Feature #20610]]

    * Hành vi đã bị deprecated, tạo tiến trình bằng các phương thức lớp `IO`
      với ký tự `|` ở đầu, đã bị loại bỏ.  [[Feature #19630]]

* Math

    * `Math.log1p` và `Math.expm1` được thêm vào. [[Feature #21527]]

* Method

    * `Method#source_location`, `Proc#source_location`, và
      `UnboundMethod#source_location` giờ trả về thông tin vị trí mở rộng
      với 5 phần tử: `[path, start_line, start_column,
      end_line, end_column]`. Định dạng 2 phần tử trước đó `[path,
      line]` vẫn có thể lấy được bằng cách gọi `.take(2)` trên kết quả.
      [[Feature #6012]]

* Proc

    * `Proc#parameters` giờ hiển thị các tham số tùy chọn ẩn danh là `[:opt]`
      thay vì `[:opt, nil]`, làm cho đầu ra nhất quán với khi tham số
      ẩn danh là bắt buộc. [[Bug #20974]]

* Ractor

    * Lớp `Ractor::Port` được thêm vào như cơ chế đồng bộ mới
      để giao tiếp giữa các Ractor. [[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` cung cấp các phương thức sau:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (hoặc `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        Kết quả là, `Ractor.yield` và `Ractor#take` đã bị loại bỏ.

    * `Ractor#join` và `Ractor#value` được thêm vào để chờ
      kết thúc của một Ractor. Chúng tương tự như `Thread#join`
      và `Thread#value`.

    * `Ractor#monitor` và `Ractor#unmonitor` được thêm vào như các giao diện
      cấp thấp được sử dụng nội bộ để triển khai `Ractor#join`.

    * `Ractor.select` giờ chỉ chấp nhận Ractor và Port. Nếu Ractor được truyền vào,
      nó trả về khi một Ractor kết thúc.

    * `Ractor#default_port` được thêm vào. Mỗi `Ractor` có một port mặc định,
      được sử dụng bởi `Ractor.send`, `Ractor.receive`.

    * `Ractor#close_incoming` và `Ractor#close_outgoing` đã bị loại bỏ.

    * `Ractor.shareable_proc` và `Ractor.shareable_lambda` được giới thiệu
      để tạo Proc hoặc lambda có thể chia sẻ.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` và `Enumerator#to_set` giờ thực hiện kiểm tra kích thước để ngăn
      các vấn đề với range vô tận. [[Bug #21654]]

    * `Range#overlap?` giờ xử lý đúng các range vô hạn (không có giới hạn).
      [[Bug #21185]]

    * Hành vi `Range#max` trên các range số nguyên không có điểm bắt đầu đã được sửa.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Module cấp cao nhất `Ruby` mới đã được định nghĩa, chứa
      các hằng số liên quan đến Ruby. Module này được dành riêng trong Ruby 3.4
      và giờ được định nghĩa chính thức. [[Feature #20884]]

* Ruby::Box

    * Một tính năng mới (thử nghiệm) cung cấp sự phân tách về các định nghĩa.
      Để biết chi tiết về "Ruby Box", xem [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` giờ là một lớp lõi, thay vì một lớp stdlib được tải tự động.
      [[Feature #21216]]

    * `Set#inspect` giờ trả về chuỗi phù hợp cho `eval`, sử dụng
      cú pháp `Set[]` (ví dụ, `Set[1, 2, 3]` thay vì
      `#<Set: {1, 2, 3}>`). Điều này làm cho nó nhất quán với các lớp
      collection lõi khác như Array và Hash. [[Feature #21389]]

    * Truyền đối số cho `Set#to_set` và `Enumerable#to_set` giờ đã bị deprecated.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` & `TCPSocket.new` chấp nhận đối số từ khóa `open_timeout` để chỉ định
      timeout cho kết nối ban đầu. [[Feature #21347]]

* String

    * Cập nhật Unicode lên Phiên bản 17.0.0 và Emoji Phiên bản 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (cũng áp dụng cho Regexp)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, và `rstrip!`
       được mở rộng để chấp nhận đối số `*selectors`. [[Feature #21552]]

* Thread

    * Giới thiệu hỗ trợ cho đối số `Thread#raise(cause:)` tương tự
      `Kernel#raise`. [[Feature #21360]]

* Fiber

    * Giới thiệu hỗ trợ cho đối số `Fiber#raise(cause:)` tương tự
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Giới thiệu `Fiber::Scheduler#fiber_interrupt` để ngắt một fiber với
      ngoại lệ cho trước. Trường hợp sử dụng ban đầu là ngắt một fiber đang
      chờ trên thao tác IO blocking khi thao tác IO bị đóng.
      [[Feature #21166]]

* Pathname

    * Pathname đã được thăng cấp từ gem mặc định thành lớp lõi của Ruby.
      [[Feature #17473]]

## Cập nhật thư viện chuẩn

Các bundled gem sau được thăng cấp từ default gem.

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 6.17.0
* win32ole 1.9.2
* irb 1.16.0
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

Chúng tôi chỉ liệt kê các thay đổi stdlib là các thay đổi tính năng đáng chú ý.

Các thay đổi khác được liệt kê trong các phần sau. Chúng tôi cũng liệt kê lịch sử
phát hành từ phiên bản bundled trước đó là Ruby 3.3.0 nếu có GitHub
releases.

Default gem sau được thêm vào.

* win32-registry 0.1.2

Các default gem sau được cập nhật.

* RubyGems 4.0.2
* bundler 4.0.2
* date 3.5.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.1
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.2
* io-nonblock 0.3.2
* io-wait 0.4.0
* ipaddr 1.2.8
* json 2.18.0
* net-http 0.9.1
* openssl 4.0.0
* optparse 0.8.1
* pp 0.6.3
* prism 1.6.0
* psych 5.3.1
* resolv 0.7.0
* stringio 3.2.0
* strscan 3.1.6
* time 0.4.2
* timeout 0.6.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

Các bundled gem sau được cập nhật.

* minitest 5.27.0
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.3
* rexml 3.4.4
* net-ftp 0.3.9
* net-imap 0.6.1
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.10.0.pre.2
* typeprof 0.31.0
* debug 1.11.0
* base64 0.3.0
* bigdecimal 4.0.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

## Nền tảng được hỗ trợ

* Windows

    * Ngừng hỗ trợ các phiên bản MSVC cũ hơn 14.0 (_MSC_VER 1900).
      Điều này có nghĩa là giờ cần Visual Studio 2015 hoặc mới hơn.

## Vấn đề tương thích

* Các phương thức sau đã bị loại bỏ khỏi Ractor do việc thêm `Ractor::Port`:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* `ObjectSpace._id2ref` đã bị deprecated. [[Feature #15408]]

* `Process::Status#&` và `Process::Status#>>` đã bị loại bỏ.
  Chúng đã bị deprecated trong Ruby 3.3. [[Bug #19868]]

* `rb_path_check` đã bị loại bỏ. Hàm này được sử dụng cho
  kiểm tra đường dẫn `$SAFE` đã bị loại bỏ trong Ruby 2.7,
  và đã bị deprecated,.
  [[Feature #20971]]

## Vấn đề tương thích thư viện chuẩn

* Thư viện CGI đã bị loại bỏ khỏi default gem. Giờ chúng tôi chỉ cung cấp `cgi/escape` cho
  các phương thức sau:

    * `CGI.escape` và `CGI.unescape`
    * `CGI.escapeHTML` và `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` và `CGI.unescapeURIComponent`
    * `CGI.escapeElement` và `CGI.unescapeElement`

    [[Feature #21258]]

* Với việc chuyển `Set` từ stdlib thành lớp lõi, `set/sorted_set.rb` đã
  bị loại bỏ, và `SortedSet` không còn là hằng số được tải tự động. Vui lòng
  cài đặt gem `sorted_set` và `require 'sorted_set'` để sử dụng `SortedSet`.
  [[Feature #21287]]

## Cập nhật C API

* IO

    * `rb_thread_fd_close` đã bị deprecated và giờ là no-op. Nếu bạn cần expose
      file descriptor từ C extension cho mã Ruby, tạo một instance `IO`
      sử dụng `RUBY_IO_MODE_EXTERNAL` và dùng `rb_io_close(io)` để đóng nó (điều này
      cũng ngắt và chờ tất cả các thao tác đang chờ trên instance `IO`).
      Đóng trực tiếp file descriptor không ngắt các thao tác đang chờ,
      và có thể dẫn đến hành vi không xác định. Nói cách khác, nếu hai
      đối tượng `IO` chia sẻ cùng file descriptor, đóng một đối tượng không ảnh hưởng
      đến đối tượng kia. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` giờ hoạt động có hoặc không có GVL.
      Điều này cho phép các gem tránh kiểm tra `ruby_thread_has_gvl_p`.
      Vui lòng vẫn cẩn thận với GVL. [[Feature #20750]]

* Set

    * C API cho `Set` đã được thêm vào. Các phương thức sau được hỗ trợ:
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## Cải thiện triển khai

### Ractor

Rất nhiều công việc đã được thực hiện để làm cho Ractor ổn định hơn, hiệu suất cao hơn và dễ sử dụng hơn. Những cải tiến này đưa triển khai Ractor gần hơn đến việc thoát khỏi trạng thái thử nghiệm.

* Cải thiện hiệu suất
    * Chuỗi đã đóng băng và bảng symbol nội bộ sử dụng hash set không cần khóa
    * Tra cứu bộ nhớ đệm phương thức tránh khóa trong hầu hết các trường hợp
    * Truy cập biến instance của lớp (và geniv) nhanh hơn và tránh khóa
    * Tránh tranh chấp bộ nhớ đệm trong quá trình phân bổ đối tượng
    * `object_id` tránh khóa trong hầu hết các trường hợp
* Sửa lỗi và ổn định
    * Sửa các deadlock có thể xảy ra khi kết hợp Ractor và Thread
    * Sửa các vấn đề với require và autoload trong Ractor
    * Sửa các vấn đề encoding/transcoding giữa các Ractor
    * Sửa các race condition trong thao tác GC và vô hiệu hóa phương thức
    * Sửa các vấn đề với tiến trình fork sau khi khởi động Ractor

## JIT

* ZJIT
    * Giới thiệu [trình biên dịch JIT dựa trên phương thức thử nghiệm](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
      Để kích hoạt hỗ trợ `--zjit`, biên dịch Ruby với Rust 1.85.0 hoặc mới hơn.
    * Tính đến Ruby 4.0.0, ZJIT nhanh hơn trình thông dịch, nhưng chưa nhanh bằng YJIT.
      Chúng tôi khuyến khích thử nghiệm với ZJIT, nhưng khuyên không nên triển khai trong môi trường production bây giờ.
    * Mục tiêu của chúng tôi là làm cho ZJIT nhanh hơn YJIT và sẵn sàng cho production trong Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` không còn hoạt động trong bản build mặc định.
          Sử dụng `--enable-yjit=stats` khi `configure` để kích hoạt nó với `--yjit-stats`.
        * Thêm `invalidate_everything` vào thống kê mặc định, được
          tăng lên khi mọi mã bị vô hiệu hóa bởi TracePoint.
    * Thêm các tùy chọn `mem_size:` và `call_threshold:` cho `RubyVM::YJIT.enable`.
* RJIT
    * `--rjit` đã bị loại bỏ. Chúng tôi sẽ chuyển triển khai API JIT bên thứ ba
      sang kho lưu trữ [ruby/rjit](https://github.com/ruby/rjit).

## Thay đổi khác

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi này, [{{ release.stats.files_changed }} tệp thay đổi, {{ release.stats.insertions }} thêm(+), {{ release.stats.deletions }} xóa(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.4.0!

## Tải về

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby là gì

Ruby được phát triển lần đầu bởi Matz (Yukihiro Matsumoto) vào năm 1993,
và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.

[Feature #6012]: https://bugs.ruby-lang.org/issues/6012
[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
