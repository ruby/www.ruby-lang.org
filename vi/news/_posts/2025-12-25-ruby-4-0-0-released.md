---
layout: news_post
title: "Phát hành Ruby 4.0.0"
author: "naruse"
translator: "Ngọc Lê"
date: 2025-12-25 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}.
Ruby 4.0 giới thiệu "Ruby Box" và "ZJIT", cùng nhiều cải tiến khác.

## Ruby Box

Ruby Box là một tính năng mới (thử nghiệm) cung cấp sự phân tách về các định nghĩa. Ruby Box được kích hoạt khi biến môi trường `RUBY_BOX=1` được chỉ định. Lớp là `Ruby::Box`.

Các định nghĩa được tải trong một box được cô lập trong box đó. Ruby Box có thể cô lập/phân tách monkey patch, thay đổi biến toàn cục/biến lớp, định nghĩa lớp/module, và các thư viện native/ruby đã tải từ các box khác.

Các trường hợp sử dụng dự kiến là:

* Chạy các test case trong box để bảo vệ các test khác khi test case sử dụng monkey patch để ghi đè thứ gì đó
* Chạy các box ứng dụng web song song để thực hiện blue-green deployment trên app server trong một tiến trình Ruby
* Chạy các box ứng dụng web song song để đánh giá cập nhật dependency trong một khoảng thời gian nhất định bằng cách kiểm tra khác biệt response sử dụng mã Ruby
* Sử dụng làm API nền tảng (cấp thấp) để triển khai loại API "package" (cấp cao) (chưa được thiết kế)

Để biết chi tiết về "Ruby Box", xem [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT là trình biên dịch just-in-time (JIT) mới, được phát triển như thế hệ tiếp theo của YJIT. Bạn cần Rust 1.85.0 hoặc mới hơn để biên dịch Ruby với hỗ trợ ZJIT, và ZJIT được kích hoạt khi `--zjit` được chỉ định.

Chúng tôi đang xây dựng trình biên dịch mới cho Ruby vì chúng tôi muốn vừa nâng cao trần hiệu suất (kích thước đơn vị biên dịch lớn hơn và SSA IR) vừa khuyến khích nhiều đóng góp từ bên ngoài hơn (bằng cách trở thành trình biên dịch phương thức truyền thống hơn). Xem [bài blog của chúng tôi](https://railsatscale.com/2025-12-24-launch-zjit/) để biết thêm chi tiết.
<!-- the blog post will be auto-published on 2025-12-24 9:00am UTC. -->

ZJIT nhanh hơn trình thông dịch, nhưng chưa nhanh bằng YJIT. Chúng tôi khuyến khích bạn thử nghiệm với ZJIT, nhưng có thể nên tạm hoãn triển khai trong môi trường production bây giờ. Hãy chờ ZJIT trong Ruby 4.1.

## Cải tiến Ractor

Ractor, cơ chế thực thi song song của Ruby, đã nhận được nhiều cải tiến. Lớp mới `Ractor::Port` được giới thiệu để giải quyết các vấn đề liên quan đến gửi và nhận tin nhắn (xem [bài blog của chúng tôi](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98)). Ngoài ra, `Ractor.shareable_proc` giúp chia sẻ đối tượng `Proc` giữa các Ractor dễ dàng hơn.

Về mặt hiệu suất, nhiều cấu trúc dữ liệu nội bộ đã được cải thiện để giảm đáng kể tranh chấp trên khóa toàn cục, mở khóa khả năng song song tốt hơn. Các Ractor cũng giờ chia sẻ ít dữ liệu nội bộ hơn, dẫn đến ít tranh chấp bộ nhớ đệm CPU hơn khi chạy song song.

Ractor được giới thiệu lần đầu trong Ruby 3.0 như một tính năng thử nghiệm. Chúng tôi nhắm đến việc loại bỏ trạng thái "thử nghiệm" của nó vào năm tới.

## Thay đổi ngôn ngữ

* `*nil` không còn gọi `nil.to_a`, tương tự như cách `**nil` không
  gọi `nil.to_hash`.  [[Feature #21047]]

* Các toán tử nhị phân logic (`||`, `&&`, `and` và `or`) ở đầu
  dòng tiếp tục dòng trước đó, giống như dấu chấm fluent.
  Các ví dụ mã sau là tương đương:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    Trước đây:

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## Cập nhật các lớp lõi

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật lớp đáng chú ý.

* Array

    * `Array#rfind` được thêm vào như một thay thế hiệu quả hơn cho `array.reverse_each.find` [[Feature #21678]]
    * `Array#find` được thêm vào như một override hiệu quả hơn của `Enumerable#find` [[Feature #21678]]
* Binding

    * `Binding#local_variables` không còn bao gồm các tham số được đánh số.
      Ngoài ra, `Binding#local_variable_get`, `Binding#local_variable_set`, và
      `Binding#local_variable_defined?` từ chối xử lý các tham số được đánh số.
      [[Bug #21049]]

    * `Binding#implicit_parameters`, `Binding#implicit_parameter_get`, và
      `Binding#implicit_parameter_defined?` được thêm vào để truy cập
      các tham số được đánh số và tham số "it". [[Bug #21049]]

* Enumerator

    * `Enumerator.produce` giờ chấp nhận đối số từ khóa `size` tùy chọn
      để chỉ định kích thước của enumerator. Nó có thể là một số nguyên,
      `Float::INFINITY`, một đối tượng callable (như lambda), hoặc `nil` để
      biểu thị kích thước không xác định. Khi không được chỉ định, kích thước
      mặc định là `Float::INFINITY`.

        ```ruby
        # Enumerator vô hạn
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # Enumerator hữu hạn với kích thước đã biết/có thể tính
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * Khi một ArgumentError được raise, giờ nó hiển thị các đoạn mã cho
      cả lời gọi phương thức (caller) và định nghĩa phương thức (callee).
      [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * Giới thiệu hỗ trợ cho đối số `Fiber#raise(cause:)` tương tự
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Giới thiệu `Fiber::Scheduler#fiber_interrupt` để ngắt một fiber với
      ngoại lệ cho trước. Trường hợp sử dụng ban đầu là ngắt một fiber đang
      chờ trên thao tác IO blocking khi thao tác IO bị đóng.
      [[Feature #21166]]

    * Giới thiệu `Fiber::Scheduler#yield` để cho phép fiber scheduler
      tiếp tục xử lý khi signal exception bị vô hiệu hóa.
      [[Bug #21633]]

    * Giới thiệu lại hook `Fiber::Scheduler#io_close` cho `IO#close` bất đồng bộ.

    * Gọi `Fiber::Scheduler#io_write` khi flush bộ đệm ghi IO.
      [[Bug #21789]]

* File

    * `File::Stat#birthtime` giờ khả dụng trên Linux thông qua lệnh hệ thống statx
      khi được hỗ trợ bởi kernel và hệ thống tệp.
      [[Feature #21205]]

* IO

    * `IO.select` chấp nhận `Float::INFINITY` làm đối số timeout.
      [[Feature #20610]]

    * Hành vi đã bị deprecated, tạo tiến trình bằng các phương thức lớp `IO`
      với ký tự `|` ở đầu, đã bị loại bỏ.  [[Feature #19630]]

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

* Math

    * `Math.log1p` và `Math.expm1` được thêm vào. [[Feature #21527]]

* Pathname

    * Pathname đã được thăng cấp từ gem mặc định thành lớp lõi của Ruby.
      [[Feature #17473]]

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

    * `Range#to_set` giờ thực hiện kiểm tra kích thước để ngăn các vấn đề với
      range vô tận. [[Bug #21654]]

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
      Để biết chi tiết về "Ruby Box", xem [doc/language/box.md](doc/language/box.md).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` giờ là một lớp lõi, thay vì một lớp stdlib được tải tự động.
      [[Feature #21216]]

    * `Set#inspect` giờ sử dụng hiển thị đơn giản hơn, tương tự như mảng literal.
      (ví dụ, `Set[1, 2, 3]` thay vì `#<Set: {1, 2, 3}>`). [[Feature #21389]]

    * Truyền đối số cho `Set#to_set` và `Enumerable#to_set` giờ đã bị deprecated.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` & `TCPSocket.new` chấp nhận đối số từ khóa `open_timeout` để chỉ định
      timeout cho kết nối ban đầu. [[Feature #21347]]
    * Khi timeout do người dùng chỉ định xảy ra trong `TCPSocket.new`, trước đây có thể
      raise `Errno::ETIMEDOUT` hoặc `IO::TimeoutError` tùy thuộc vào tình huống.
      Hành vi này đã được thống nhất để `IO::TimeoutError` giờ được raise nhất quán.
      (Xin lưu ý rằng, trong `Socket.tcp`, vẫn có các trường hợp `Errno::ETIMEDOUT`
      có thể được raise trong các tình huống tương tự, và trong cả hai trường hợp `Errno::ETIMEDOUT` có thể
      được raise khi timeout xảy ra ở cấp hệ điều hành.)

* String

    * Cập nhật Unicode lên Phiên bản 17.0.0 và Emoji Phiên bản 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (cũng áp dụng cho Regexp)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, và `rstrip!`
       được mở rộng để chấp nhận đối số `*selectors`. [[Feature #21552]]

* Thread

    * Giới thiệu hỗ trợ cho đối số `Thread#raise(cause:)` tương tự
      `Kernel#raise`. [[Feature #21360]]

## Cập nhật thư viện chuẩn

Chúng tôi chỉ liệt kê các thay đổi stdlib là các thay đổi tính năng đáng chú ý.

Các thay đổi khác được liệt kê trong các phần sau. Chúng tôi cũng liệt kê lịch sử phát hành từ phiên bản bundled trước đó là Ruby 3.4.0 nếu có GitHub releases.

Các bundled gem sau được thăng cấp từ default gem.

* ostruct 0.6.3
  * 0.6.1 to [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 to [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 to [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 to [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 to [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 to [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 to [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 to [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 to [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

Default gem sau được thêm vào.

* win32-registry 0.1.2

Các default gem sau được cập nhật.

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 to [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 to [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 to [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 to [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 to [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 to [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 to [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 to [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 to [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 to [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 to [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 to [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 to [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 to [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 to [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 to [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 to [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 to [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 to [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 to [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 to [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 to [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 to [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 to [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 to [v3.2.2][zlib-v3.2.2]

Các bundled gem sau được cập nhật.

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 to [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 to [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.5
  * 3.6.7 to [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 to [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 to [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 to [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 to [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 to [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 to [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 to [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 to [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 to [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 to [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 to [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 to [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 to [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12

### RubyGems và Bundler

Ruby 4.0 đóng gói RubyGems và Bundler phiên bản 4. Xem các liên kết sau để biết chi tiết.

* [Upgrading to RubyGems/Bundler 4 - RubyGems Blog](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## Nền tảng được hỗ trợ

* Windows

    * Ngừng hỗ trợ các phiên bản MSVC cũ hơn 14.0 (_MSC_VER 1900).
      Điều này có nghĩa là giờ cần Visual Studio 2015 hoặc mới hơn.

## Vấn đề tương thích

* Các phương thức sau đã bị loại bỏ khỏi Ractor do việc thêm `Ractor::Port`:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` đã bị deprecated. [[Feature #15408]]

* `Process::Status#&` và `Process::Status#>>` đã bị loại bỏ.
  Chúng đã bị deprecated trong Ruby 3.3. [[Bug #19868]]

* `rb_path_check` đã bị loại bỏ. Hàm này được sử dụng cho
  kiểm tra đường dẫn `$SAFE` đã bị loại bỏ trong Ruby 2.7,
  và đã bị deprecated.
  [[Feature #20971]]

* Backtrace cho `ArgumentError` của "wrong number of arguments" giờ
  bao gồm tên lớp hoặc module của receiver (ví dụ, trong `Foo#bar`
  thay vì trong `bar`). [[Bug #21698]]

* Backtrace không còn hiển thị các frame `internal`.
  Các phương thức này giờ xuất hiện như thể nằm trong tệp mã Ruby,
  nhất quán với các phương thức được triển khai bằng C khác. [[Bug #20968]]

  Trước:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  Sau:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

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


* Net::HTTP

    * Hành vi mặc định tự động đặt header `Content-Type`
      thành `application/x-www-form-urlencoded` cho các request có body
      (ví dụ, `POST`, `PUT`) khi header chưa được đặt rõ ràng đã bị
      loại bỏ. Nếu ứng dụng của bạn dựa vào giá trị mặc định tự động này,
      các request của bạn giờ sẽ được gửi mà không có header Content-Type, có thể
      gây ra vấn đề tương thích với một số server nhất định.
      [[GH-net-http #205]]

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

* `Class#new` (ví dụ, `Object.new`) nhanh hơn trong mọi trường hợp, nhưng đặc biệt khi truyền đối số từ khóa. Điều này cũng đã được tích hợp vào YJIT và ZJIT. [[Feature #21254]]
* Các heap GC của các pool kích thước khác nhau giờ phát triển độc lập, giảm sử dụng bộ nhớ khi chỉ một số pool chứa đối tượng tồn tại lâu
* Quét GC nhanh hơn trên các trang chứa đối tượng lớn
* Các đối tượng "generic ivar" (String, Array, `TypedData`, v.v.) giờ sử dụng đối tượng "fields" nội bộ mới để truy cập biến instance nhanh hơn
* GC tránh duy trì bảng `id2ref` nội bộ cho đến khi nó được sử dụng lần đầu, làm cho việc phân bổ `object_id` và quét GC nhanh hơn
* `object_id` và `hash` nhanh hơn trên các đối tượng Class và Module
* Các số nguyên bignum lớn hơn có thể vẫn được nhúng sử dụng phân bổ chiều rộng biến
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`,
  `StringScanner`, và một số đối tượng nội bộ giờ được bảo vệ bởi write-barrier,
  giúp giảm overhead GC.

### Ractor

Rất nhiều công việc đã được thực hiện để làm cho Ractor ổn định hơn, hiệu suất cao hơn và dễ sử dụng hơn. Những cải tiến này đưa triển khai Ractor gần hơn đến việc thoát khỏi trạng thái thử nghiệm.

* Cải thiện hiệu suất
    * Chuỗi đã đóng băng và bảng symbol nội bộ sử dụng hash set không cần khóa [[Feature #21268]]
    * Tra cứu bộ nhớ đệm phương thức tránh khóa trong hầu hết các trường hợp
    * Truy cập biến instance của lớp (và generic ivar) nhanh hơn và tránh khóa
    * Tránh tranh chấp bộ nhớ đệm CPU trong phân bổ đối tượng bằng cách sử dụng counter cho mỗi ractor
    * Tránh tranh chấp bộ nhớ đệm CPU trong xmalloc/xfree bằng cách sử dụng counter thread-local
    * `object_id` tránh khóa trong hầu hết các trường hợp
* Sửa lỗi và ổn định
    * Sửa các deadlock có thể xảy ra khi kết hợp Ractor và Thread
    * Sửa các vấn đề với require và autoload trong Ractor
    * Sửa các vấn đề encoding/transcoding giữa các Ractor
    * Sửa các race condition trong thao tác GC và vô hiệu hóa phương thức
    * Sửa các vấn đề với tiến trình fork sau khi khởi động Ractor
    * Số lượng phân bổ GC giờ chính xác dưới Ractor
    * Sửa TracePoint không hoạt động sau GC [[Bug #19112]]

## JIT

* ZJIT
    * Giới thiệu [trình biên dịch JIT dựa trên phương thức thử nghiệm](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
       Khi khả dụng, ZJIT có thể được kích hoạt tại runtime với tùy chọn `--zjit` hoặc bằng cách gọi `RubyVM::ZJIT.enable`.
      Khi biên dịch Ruby, cần Rust 1.85.0 hoặc mới hơn để bao gồm hỗ trợ ZJIT.
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

Xem [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi này, [{{ release.stats.files_changed }} tệp thay đổi, {{ release.stats.insertions }} thêm(+), {{ release.stats.deletions }} xóa(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.4.0!

Chúc Giáng sinh vui vẻ, Năm mới hạnh phúc, và Happy Hacking với Ruby 4.0!

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

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
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
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
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
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
