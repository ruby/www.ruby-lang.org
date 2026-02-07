---
layout: news_post
title: "Phát hành Ruby 3.1.0 Preview 1"
author: "naruse"
translator:
date: 2021-11-09 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}.

## YJIT: Trình biên dịch JIT trong tiến trình thử nghiệm mới


Ruby 3.1 tích hợp YJIT, một trình biên dịch JIT trong tiến trình mới được phát triển bởi Shopify.

Kể từ khi [Ruby 2.6 giới thiệu MJIT vào năm 2018](https://www.ruby-lang.org/vi/news/2018/12/25/ruby-2-6-0-released/), hiệu năng đã được cải thiện đáng kể, và cuối cùng [chúng tôi đã đạt được Ruby3x3 vào năm ngoái](https://www.ruby-lang.org/vi/news/2020/12/25/ruby-3-0-0-released/). Nhưng mặc dù Optcarrot đã cho thấy tốc độ cải thiện ấn tượng, JIT chưa mang lại lợi ích cho các ứng dụng kinh doanh thực tế.

Gần đây Shopify đã đóng góp nhiều cải tiến Ruby để tăng tốc ứng dụng Rails của họ. YJIT là một đóng góp quan trọng, nhằm cải thiện hiệu năng của các ứng dụng Rails.

Trong khi MJIT là trình biên dịch JIT dựa trên phương thức và sử dụng trình biên dịch C bên ngoài, YJIT sử dụng Basic Block Versioning và bao gồm trình biên dịch JIT bên trong. Với Lazy Basic Block Versioning (LBBV), nó đầu tiên biên dịch phần đầu của phương thức, và biên dịch dần phần còn lại khi kiểu của tham số và biến được xác định động. Xem [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) để có giới thiệu chi tiết.

Với công nghệ này, YJIT đạt được cả thời gian khởi động nhanh và cải thiện hiệu năng trên hầu hết phần mềm thực tế, lên đến 22% trên railsbench, 39% trên liquid-render.

<!-- 試す人向けのお知らせ -->

YJIT vẫn là tính năng thử nghiệm, và do đó, nó bị tắt mặc định. Nếu bạn muốn sử dụng, hãy chỉ định tùy chọn dòng lệnh `--yjit` để bật YJIT. Hiện tại nó cũng chỉ giới hạn cho các nền tảng macOS & Linux trên x86-64.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: Trình gỡ lỗi mới

Một trình gỡ lỗi mới [debug.gem](https://github.com/ruby/debug) được đi kèm. debug.gem là triển khai trình gỡ lỗi nhanh và cung cấp nhiều tính năng như gỡ lỗi từ xa, REPL đầy màu sắc, tích hợp IDE (VSCode) và hơn thế nữa. Nó thay thế thư viện chuẩn `lib/debug.rb`.

## error_highlight: Vị trí lỗi chi tiết trong backtrace

Một gem tích hợp, error_highlight, đã được giới thiệu. Nó bao gồm vị trí lỗi chi tiết trong backtrace:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Gem này được bật mặc định. Bạn có thể tắt nó bằng tùy chọn dòng lệnh `--disable-error_highlight`. Xem [kho lưu trữ](https://github.com/ruby/error_highlight) để biết chi tiết.

## Cải tiến IRB

Sẽ được mô tả trong bản preview tiếp theo.

## Các tính năng mới đáng chú ý khác

### Ngôn ngữ

* Các giá trị trong Hash literal và tham số từ khóa có thể được bỏ qua. [Feature #14579]
  * `{x:, y:}` là cú pháp rút gọn của `{x: x, y: y}`.
  * `foo(x:, y:)` là cú pháp rút gọn của `foo(x: x, y: y)`.

* Toán tử pin trong khớp mẫu giờ nhận một biểu thức. [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```


### RBS

RBS là một ngôn ngữ để mô tả cấu trúc chương trình Ruby. Xem [kho lưu trữ](https://github.com/ruby/rbs) để biết chi tiết.

Cập nhật kể từ Ruby 3.0.0:

* `rbs collection` đã được giới thiệu để quản lý RBS của các gem. [doc](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Nhiều chữ ký cho thư viện tích hợp và thư viện chuẩn đã được thêm/cập nhật.
* Cũng bao gồm nhiều bản sửa lỗi và cải thiện hiệu năng.

Xem [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) để biết thêm thông tin.

### TypeProf

TypeProf là một công cụ phân tích kiểu tĩnh cho Ruby. Nó tạo ra bản mẫu RBS từ mã Ruby không có chú thích kiểu. Xem [tài liệu](https://github.com/ruby/typeprof/blob/master/doc/doc.md) để biết chi tiết.

Cập nhật kể từ Ruby 3.0.0:

* [Hỗ trợ IDE thử nghiệm](https://github.com/ruby/typeprof/blob/master/doc/ide.md) đã được triển khai.
* Nhiều bản sửa lỗi và cải thiện hiệu năng.

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
* Variable Width Allocation: Strings (thử nghiệm) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### Cập nhật thư viện chuẩn

* Một số thư viện chuẩn đã được cập nhật.
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* Các bundled gem sau đã được cập nhật.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* Các default gem sau giờ là bundled gem.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa bỏ(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.0.0!

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
