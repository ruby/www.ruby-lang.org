---
layout: news_post
title: "Phát hành Ruby 3.1.0"
author: "naruse"
translator:
date: 2021-12-25 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}. Ruby 3.1 giữ tính tương thích với Ruby 3.0 và cũng bổ sung nhiều tính năng mới.


## YJIT: Trình biên dịch JIT trong tiến trình thử nghiệm mới

Ruby 3.1 tích hợp YJIT, một trình biên dịch JIT trong tiến trình mới được phát triển bởi Shopify.

Kể từ khi [Ruby 2.6 giới thiệu MJIT vào năm 2018](https://www.ruby-lang.org/vi/news/2018/12/25/ruby-2-6-0-released/), hiệu năng đã được cải thiện đáng kể, và cuối cùng [chúng tôi đã đạt được Ruby3x3 vào năm ngoái](https://www.ruby-lang.org/vi/news/2020/12/25/ruby-3-0-0-released/). Nhưng mặc dù benchmark Optcarrot đã cho thấy tốc độ cải thiện ấn tượng, JIT chưa mang lại lợi ích cho các ứng dụng kinh doanh thực tế.

Gần đây Shopify đã đóng góp nhiều cải tiến Ruby để tăng tốc ứng dụng Rails của họ. YJIT là một đóng góp quan trọng, nhằm cải thiện hiệu năng của các ứng dụng Rails.

Trong khi MJIT là trình biên dịch JIT dựa trên phương thức và sử dụng trình biên dịch C bên ngoài, YJIT sử dụng Basic Block Versioning và bao gồm trình biên dịch JIT bên trong. Với Lazy Basic Block Versioning (LBBV), nó đầu tiên biên dịch phần đầu của phương thức, và biên dịch dần phần còn lại khi kiểu của tham số và biến được xác định động. Xem [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) để có giới thiệu chi tiết.

Với công nghệ này, YJIT đạt được cả thời gian khởi động nhanh và cải thiện hiệu năng trên hầu hết phần mềm thực tế, lên đến 22% trên railsbench, 39% trên liquid-render.

YJIT vẫn là tính năng thử nghiệm, và do đó, nó bị tắt mặc định. Nếu bạn muốn sử dụng, hãy chỉ định tùy chọn dòng lệnh `--yjit` để bật YJIT. Hiện tại nó cũng chỉ giới hạn cho các nền tảng Unix-like x86-64.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Trình gỡ lỗi mới

Một trình gỡ lỗi được viết lại hoàn toàn [debug.gem](https://github.com/ruby/debug) được đi kèm. debug.gem có các tính năng sau:

* Cải thiện hiệu suất gỡ lỗi (không làm chậm ứng dụng ngay cả khi có trình gỡ lỗi).
* Hỗ trợ gỡ lỗi từ xa.
* Hỗ trợ giao diện gỡ lỗi phong phú (hiện hỗ trợ VS Code và trình duyệt Chrome).
* Hỗ trợ gỡ lỗi đa tiến trình/đa luồng.
* REPL đầy màu sắc.
* Và các tính năng hữu ích khác như tính năng ghi lại & phát lại, tính năng theo dõi, v.v.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby trước đó đi kèm lib/debug.rb, nhưng nó không được bảo trì tốt và có vấn đề về hiệu năng và tính năng. debug.gem thay thế hoàn toàn lib/debug.rb.

## error_highlight: Vị trí lỗi chi tiết trong backtrace

Một gem tích hợp, error_highlight, đã được giới thiệu. Nó bao gồm vị trí lỗi chi tiết trong backtrace:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Hiện tại chỉ có `NameError` được hỗ trợ.

Gem này được bật mặc định. Bạn có thể tắt nó bằng tùy chọn dòng lệnh `--disable-error_highlight`. Xem [kho lưu trữ error_highlight](https://github.com/ruby/error_highlight) để biết chi tiết.

## Tự động hoàn thành và hiển thị tài liệu trong IRB

IRB giờ đã có tính năng tự động hoàn thành, bạn chỉ cần nhập mã và hộp thoại ứng viên hoàn thành sẽ xuất hiện. Bạn có thể sử dụng Tab và Shift+Tab để di chuyển lên xuống.

Nếu tài liệu đã được cài đặt, khi bạn chọn một ứng viên hoàn thành, hộp thoại tài liệu sẽ xuất hiện bên cạnh hộp thoại ứng viên hoàn thành, hiển thị một phần nội dung. Bạn có thể đọc toàn bộ tài liệu bằng cách nhấn Alt+d.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## Các tính năng mới đáng chú ý khác

### Ngôn ngữ

* Các giá trị trong Hash literal và tham số từ khóa có thể được bỏ qua. [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}` là cú pháp rút gọn của `{x: x, y: y}`.
  * `foo(x:, y:)` là cú pháp rút gọn của `foo(x: x, y: y)`.

* Toán tử pin (`^`) trong khớp mẫu giờ nhận một biểu thức. [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

  ```ruby
  Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
  #=> [[3, 5], [5, 7], [11, 13]]
  ```

* Có thể bỏ dấu ngoặc đơn trong khớp mẫu một dòng. [[Feature #16182]](https://bugs.ruby-lang.org/issues/16182)

  ```ruby
  [0, 1] => _, x
  {y: 2} => y:
  x #=> 1
  y #=> 2
  ```

### RBS

RBS là một ngôn ngữ để mô tả cấu trúc chương trình Ruby. Xem [kho lưu trữ RBS](https://github.com/ruby/rbs) để biết chi tiết.

Cập nhật kể từ Ruby 3.0.0:

* Tham số kiểu generic có thể bị ràng buộc. ([PR](https://github.com/ruby/rbs/pull/844))
* Bí danh kiểu generic được hỗ trợ. ([PR](https://github.com/ruby/rbs/pull/823))
* `rbs collection` đã được giới thiệu để quản lý RBS của các gem. ([doc](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* Nhiều chữ ký cho thư viện tích hợp và thư viện chuẩn đã được thêm/cập nhật.
* Cũng bao gồm nhiều bản sửa lỗi và cải thiện hiệu năng.

Xem [nhật ký thay đổi RBS](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) để biết thêm thông tin.

### TypeProf

TypeProf là một công cụ phân tích kiểu tĩnh cho Ruby. Nó tạo ra bản mẫu RBS từ mã Ruby không có chú thích kiểu. Xem [tài liệu](https://github.com/ruby/typeprof/blob/master/doc/doc.md) để biết chi tiết.

Cập nhật chính kể từ Ruby 3.0.0 là hỗ trợ IDE thử nghiệm có tên "TypeProf for IDE".

![Demo of TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

Phần mở rộng VS Code hiển thị chữ ký phương thức được suy luận (hoặc viết rõ ràng trong tệp RBS) phía trên mỗi định nghĩa phương thức, vẽ gạch chân đỏ dưới mã có thể gây lỗi tên hoặc lỗi kiểu, và hoàn thành tên phương thức (tức là hiển thị danh sách ứng viên phương thức). Xem [tài liệu](https://github.com/ruby/typeprof/blob/master/doc/ide.md) để biết chi tiết.

Ngoài ra, bản phát hành bao gồm nhiều bản sửa lỗi và cải thiện hiệu năng.

## Cải thiện hiệu năng

* MJIT
  * Cho các khối lượng công việc như Rails, giá trị mặc định `--jit-max-cache` được thay đổi từ 100 thành 10000.
    Trình biên dịch JIT không còn bỏ qua biên dịch các phương thức dài hơn 1000 instruction.
  * Để hỗ trợ Zeitwerk của Rails, mã JIT-ed không còn bị hủy bỏ
    khi TracePoint cho sự kiện class được bật.

## Các thay đổi đáng chú ý khác kể từ 3.0

* Khớp mẫu một dòng, ví dụ `ary => [x, y, z]`, không còn là thử nghiệm.
* Thứ tự đánh giá phép gán đa biến đã được thay đổi một chút. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` được đánh giá theo thứ tự `baz`, `qux`, `foo`, rồi `bar` trong Ruby 3.0. Trong Ruby 3.1, được đánh giá theo thứ tự `foo`, `bar`, `baz`, rồi `qux`.
* Variable Width Allocation: Strings (thử nghiệm). [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0 thay đổi `Psych.load` để sử dụng `safe_load` mặc định.
  Bạn có thể cần sử dụng Psych 3.3.2 để chuyển đổi sang hành vi này.
  [[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

### Cập nhật thư viện chuẩn

*   Các default gem sau đã được cập nhật.
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
*   Các bundled gem sau đã được cập nhật.
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
*   Các default gem sau giờ là bundled gem. Bạn cần thêm các thư viện sau vào `Gemfile` khi sử dụng trong môi trường bundler.
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa bỏ(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.0.0!

Chúc Giáng sinh vui vẻ, Kỳ nghỉ hạnh phúc, và hãy tận hưởng lập trình với Ruby 3.1!

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
