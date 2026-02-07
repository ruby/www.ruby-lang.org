---
layout: news_post
title: "Phát hành Ruby 3.2.0 Preview 1"
author: "naruse"
translator:
date: 2022-04-03 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}. Ruby 3.2 bổ sung nhiều tính năng và cải thiện hiệu suất.


## Hỗ trợ WebAssembly dựa trên WASI

Đây là bản port ban đầu của hỗ trợ WebAssembly dựa trên WASI. Bản port này cho phép tệp nhị phân CRuby có thể sử dụng trên trình duyệt Web, môi trường Serverless Edge và các trình nhúng WebAssembly/WASI khác. Hiện tại bản port này vượt qua các bộ test cơ bản và bootstrap mà không sử dụng Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Bối cảnh

[WebAssembly (Wasm)](https://webassembly.org/) ban đầu được giới thiệu để chạy chương trình một cách an toàn và nhanh chóng trên trình duyệt web. Nhưng mục tiêu của nó - chạy chương trình hiệu quả với bảo mật trên nhiều môi trường khác nhau - đã được mong đợi từ lâu không chỉ cho web mà còn cho các ứng dụng nói chung.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) được thiết kế cho các trường hợp sử dụng như vậy. Mặc dù các ứng dụng này cần giao tiếp với hệ điều hành, WebAssembly chạy trên một máy ảo không có giao diện hệ thống. WASI chuẩn hóa điều đó.

Hỗ trợ WebAssembly/WASI trong Ruby nhằm tận dụng các dự án này. Nó cho phép các nhà phát triển Ruby viết ứng dụng chạy trên nền tảng đầy hứa hẹn đó.

### Trường hợp sử dụng

Hỗ trợ này cho phép các nhà phát triển sử dụng CRuby trong môi trường WebAssembly. Một ví dụ trường hợp sử dụng là hỗ trợ CRuby của [TryRuby playground](https://try.ruby-lang.org/playground/). Bây giờ bạn có thể thử CRuby gốc ngay trong trình duyệt web của mình.

### Các điểm kỹ thuật

WASI và WebAssembly hiện tại vẫn thiếu một số tính năng để triển khai Fiber, exception và GC vì nó vẫn đang phát triển và cũng vì lý do bảo mật. Vì vậy CRuby lấp đầy khoảng trống bằng cách sử dụng Asyncify, một kỹ thuật chuyển đổi nhị phân để điều khiển thực thi trong userland.

Ngoài ra, chúng tôi đã xây dựng [VFS trên WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby) để có thể dễ dàng đóng gói ứng dụng Ruby thành một tệp .wasm duy nhất. Điều này giúp việc phân phối ứng dụng Ruby dễ dàng hơn một chút.


### Liên kết liên quan

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Thời gian chờ Regexp

Tính năng thời gian chờ cho việc khớp Regexp đã được giới thiệu.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Được biết rằng việc khớp Regexp có thể mất thời gian dài bất ngờ. Nếu mã của bạn cố gắng khớp một Regexp có thể không hiệu quả với đầu vào không tin cậy, kẻ tấn công có thể khai thác nó để tấn công từ chối dịch vụ hiệu quả (gọi là Regular expression DoS, hoặc ReDoS).

Rủi ro DoS có thể được ngăn chặn hoặc giảm thiểu đáng kể bằng cách cấu hình `Regexp.timeout` theo yêu cầu của ứng dụng Ruby của bạn. Vui lòng thử nghiệm trong ứng dụng của bạn và chào đón phản hồi của bạn.

Lưu ý rằng `Regexp.timeout` là cấu hình toàn cục. Nếu bạn muốn sử dụng các cài đặt thời gian chờ khác nhau cho một số Regexp đặc biệt, bạn có thể sử dụng từ khóa `timeout` cho `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

Đề xuất ban đầu là https://bugs.ruby-lang.org/issues/17837


## Các tính năng mới đáng chú ý khác

### Không còn đi kèm mã nguồn bên thứ ba

* Chúng tôi không còn đi kèm mã nguồn bên thứ ba như `libyaml`, `libffi`.

    * Mã nguồn libyaml đã được xóa khỏi psych. Bạn có thể cần cài đặt `libyaml-dev` trên nền tảng Ubuntu/Debian. Tên gói có thể khác trên các nền tảng khác.

    * libffi sẽ được xóa khỏi `fiddle` trong preview2

### Ngôn ngữ

* Find pattern không còn là tính năng thử nghiệm.


## Cải thiện hiệu suất



## Các thay đổi đáng chú ý khác kể từ 3.1

* Hash
    * Hash#shift now always returns nil if the hash is
      empty, instead of returning the default value or
      calling the default proc. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset has been added. [[Feature #13110]]

* Module
    * Module.used_refinements has been added. [[Feature #14332]]
    * Module#refinements has been added. [[Feature #12737]]
    * Module#const_added has been added. [[Feature #17881]]

* Proc
    * Proc#dup returns an instance of subclass. [[Bug #17545]]
    * Proc#parameters now accepts lambda keyword. [[Feature #15357]]

* Refinement
    * Refinement#refined_class has been added. [[Feature #12737]]

* Set
    * Set is now available as a builtin class without the need for `require "set"`. [[Feature #16989]]
      It is currently autoloaded via the `Set` constant or a call to `Enumerable#to_set`.

* String
    * String#byteindex and String#byterindex have been added. [[Feature #13110]]
    * Update Unicode to Version 14.0.0 and Emoji Version 14.0. [[Feature #18037]]
      (also applies to Regexp)
    * String#bytesplice has been added.  [[Feature #18598]]

* Struct
    * A Struct class can also be initialized with keyword arguments
      without `keyword_init: true` on `Struct.new` [[Feature #16806]]


### Cập nhật thư viện chuẩn

*   Các gem mặc định sau đã được cập nhật.

    * TBD

*   Các gem đi kèm sau đã được cập nhật.

    * TBD

*   Các gem mặc định sau giờ là gem đi kèm. Bạn cần thêm các thư viện sau vào `Gemfile` trong môi trường bundler.

    * TBD

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm(+), {{ release.stats.deletions }} xóa(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.1.0!

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
