---
layout: news_post
title: "Phát hành Ruby 3.0.0 Preview 1"
author: "naruse"
translator:
date: 2020-09-25 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 3.0.0-preview1.

Phiên bản này giới thiệu nhiều tính năng mới và cải thiện hiệu năng.

## RBS

RBS là một ngôn ngữ để mô tả kiểu dữ liệu của chương trình Ruby.
Các công cụ kiểm tra kiểu bao gồm type-profiler và các công cụ khác hỗ trợ RBS sẽ hiểu chương trình Ruby tốt hơn nhiều với các định nghĩa RBS.

Bạn có thể viết định nghĩa cho các lớp và module: các phương thức được định nghĩa trong lớp, biến instance và kiểu dữ liệu của chúng, cũng như các quan hệ kế thừa/mix-in.
Mục tiêu của RBS là hỗ trợ các mẫu thường thấy trong chương trình Ruby và cho phép viết các kiểu nâng cao bao gồm kiểu union, nạp chồng phương thức và generic. RBS cũng hỗ trợ duck typing với _kiểu interface_.

Ruby 3.0 đi kèm với gem `rbs`, cho phép phân tích và xử lý các định nghĩa kiểu được viết bằng RBS.

Dưới đây là một ví dụ nhỏ về RBS.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

Xem [README của gem rbs](https://github.com/ruby/rbs) để biết thêm chi tiết.

## Ractor (thử nghiệm)

Ractor là một abstraction đồng thời theo mô hình Actor, được thiết kế để cung cấp tính năng thực thi song song mà không lo ngại về an toàn luồng.

Bạn có thể tạo nhiều ractor và chạy chúng song song. Ractor cho phép tạo các chương trình song song an toàn luồng vì các ractor không thể chia sẻ các đối tượng thông thường. Giao tiếp giữa các ractor được hỗ trợ thông qua truyền tin nhắn.

Để giới hạn việc chia sẻ đối tượng, Ractor đưa ra một số hạn chế đối với cú pháp Ruby (không có nhiều Ractor thì không có thay đổi).

Đặc tả và triển khai chưa hoàn thiện và có thể thay đổi trong tương lai, vì vậy tính năng này được đánh dấu là thử nghiệm và hiển thị cảnh báo tính năng thử nghiệm khi tạo Ractor.

Chương trình nhỏ sau tính `prime?` song song với hai ractor và nhanh hơn khoảng x2 lần với hai lõi trở lên so với chương trình tuần tự.

``` ruby
require 'prime'

# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# send parameters
r1.send 2**61 - 1
r2.send 2**61 + 15

# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Xem [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) để biết thêm chi tiết.

## Scheduler (Thử nghiệm)

`Thread#scheduler` được giới thiệu để chặn các thao tác blocking. Điều này cho phép đồng thời nhẹ mà không cần thay đổi mã hiện tại.

Các lớp/phương thức hiện đang được hỗ trợ:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` và các phương thức liên quan (ví dụ: `#wait_readable`, `#gets`, `#puts` v.v.).
- `IO#select` *không được hỗ trợ*.

Điểm vào hiện tại cho đồng thời là `Fiber.schedule{...}` nhưng điều này có thể thay đổi trước khi Ruby 3 được phát hành.

Hiện tại, có một test scheduler tại [`Async::Scheduler`](https://github.com/socketry/async/pull/56). Xem [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md) để biết thêm chi tiết. [Feature #16786]

**CHÚ Ý**: Tính năng này đang trong giai đoạn thử nghiệm. Cả tên và tính năng sẽ thay đổi trong bản preview tiếp theo.

## Các tính năng mới đáng chú ý khác

* Câu lệnh gán hướng phải đã được thêm vào.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Định nghĩa phương thức không kết thúc đã được thêm vào.

  ``` ruby
  def square(x) = x * x
  ```

* Mẫu tìm kiếm (find pattern) đã được thêm vào.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` giờ đã có sẵn.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory view đã được thêm như một tính năng thử nghiệm

    * Đây là một bộ C-API mới để trao đổi vùng bộ nhớ thô, chẳng hạn như mảng số và ảnh bitmap, giữa các thư viện mở rộng. Các thư viện mở rộng cũng có thể chia sẻ metadata của vùng bộ nhớ bao gồm hình dạng, định dạng phần tử, v.v. Sử dụng những loại metadata này, các thư viện mở rộng có thể chia sẻ ngay cả mảng đa chiều một cách phù hợp. Tính năng này được thiết kế tham khảo từ buffer protocol của Python.

## Cải thiện hiệu năng

* Nhiều cải tiến đã được thực hiện trong MJIT. Xem NEWS để biết chi tiết.

## Các thay đổi đáng chú ý khác kể từ 2.7

* Tham số từ khóa được tách riêng khỏi các tham số khác.
  * Về nguyên tắc, mã hiển thị cảnh báo trên Ruby 2.7 sẽ không hoạt động. Xem [tài liệu](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) để biết chi tiết.
  * Ngoài ra, chuyển tiếp tham số (arguments forwarding) giờ đã hỗ trợ tham số đứng đầu.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Tính năng `$SAFE` đã bị loại bỏ hoàn toàn; giờ nó là một biến toàn cục bình thường.

* Thứ tự backtrace đã bị đảo ngược ở Ruby 2.5, nhưng đã được hoàn tác. Giờ nó hoạt động như Ruby 2.4; thông báo lỗi và số dòng nơi ngoại lệ xảy ra được in trước, và các hàm gọi được in sau.

* Một số thư viện chuẩn đã được cập nhật.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Các thư viện sau không còn là bundled gem.
  Cài đặt các gem tương ứng để sử dụng các tính năng này.
  * net-telnet
  * xmlrpc

* Chuyển các default gem thành bundled gem.
  * rexml
  * rss

* Chuyển stdlib thành default gem. Các default gem sau đã được xuất bản trên rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Xem [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
để biết thêm chi tiết.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa bỏ(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
kể từ Ruby 2.7.0!

Hãy thử Ruby 3.0.0-preview1, và gửi phản hồi cho chúng tôi!

## Tải về

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Trailer 3.0.0-preview2

Chúng tôi dự kiến bao gồm ["type-profiler"](https://github.com/mame/ruby-type-profiler), một tính năng phân tích kiểu tĩnh. Hãy đón chờ!

## Ruby là gì

Ruby được phát triển lần đầu bởi Matz (Yukihiro Matsumoto) vào năm 1993,
và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.
