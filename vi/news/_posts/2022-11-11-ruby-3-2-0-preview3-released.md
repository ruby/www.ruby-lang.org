---
layout: news_post
title: "Phát hành Ruby 3.2.0 Preview 3"
author: "naruse"
translator:
date: 2022-11-11 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}

Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}. Ruby 3.2 bổ sung nhiều tính năng và cải thiện hiệu suất.


## Hỗ trợ WebAssembly dựa trên WASI

Đây là bản port ban đầu của hỗ trợ WebAssembly dựa trên WASI. Bản port này cho phép tệp nhị phân CRuby có thể sử dụng trên trình duyệt Web, môi trường Serverless Edge và các trình nhúng WebAssembly/WASI khác. Hiện tại bản port này vượt qua các bộ test cơ bản và bootstrap mà không sử dụng Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Bối cảnh

[WebAssembly (Wasm)](https://webassembly.org/) ban đầu được giới thiệu để chạy chương trình một cách an toàn và nhanh chóng trên trình duyệt web. Nhưng mục tiêu của nó - chạy chương trình hiệu quả với bảo mật trên nhiều môi trường khác nhau - đã được mong đợi từ lâu không chỉ cho web mà còn cho các ứng dụng nói chung.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) được thiết kế cho các trường hợp sử dụng như vậy. Mặc dù các ứng dụng này cần giao tiếp với hệ điều hành, WebAssembly chạy trên một máy ảo không có giao diện hệ thống. WASI chuẩn hóa điều đó.

Hỗ trợ WebAssembly/WASI trong Ruby nhằm tận dụng các dự án này. Nó cho phép các nhà phát triển Ruby viết ứng dụng chạy trên nền tảng đầy hứa hẹn đó.

### Trường hợp sử dụng

Hỗ trợ này khuyến khích các nhà phát triển có thể sử dụng CRuby trong môi trường WebAssembly. Một ví dụ trường hợp sử dụng là hỗ trợ CRuby của [TryRuby playground](https://try.ruby-lang.org/playground/). Bây giờ bạn có thể thử CRuby gốc ngay trong trình duyệt web của mình.

### Các điểm kỹ thuật

WASI và WebAssembly hiện tại vẫn thiếu một số tính năng để triển khai Fiber, exception và GC vì nó vẫn đang phát triển và cũng vì lý do bảo mật. Vì vậy CRuby lấp đầy khoảng trống bằng cách sử dụng Asyncify, một kỹ thuật chuyển đổi nhị phân để điều khiển thực thi trong userland.

Ngoài ra, chúng tôi đã xây dựng [VFS trên WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby) để có thể dễ dàng đóng gói ứng dụng Ruby thành một tệp .wasm duy nhất. Điều này giúp việc phân phối ứng dụng Ruby dễ dàng hơn một chút.


### Liên kết liên quan

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Cải thiện Regexp chống ReDoS

Được biết rằng việc khớp Regexp có thể mất thời gian dài bất ngờ. Nếu mã của bạn cố gắng khớp một Regexp có thể không hiệu quả với đầu vào không tin cậy, kẻ tấn công có thể khai thác nó để tấn công từ chối dịch vụ hiệu quả (gọi là Regular expression DoS, hoặc ReDoS).

Chúng tôi đã giới thiệu hai cải tiến giúp giảm thiểu đáng kể ReDoS.

### Cải thiện thuật toán khớp Regexp

Kể từ Ruby 3.2, thuật toán khớp của Regexp đã được cải thiện đáng kể bằng kỹ thuật ghi nhớ (memoization).

```
# This matching takes 10 sec. in Ruby 3.1, and does 0.003 sec. in Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

Thuật toán khớp cải tiến cho phép hầu hết các phép khớp Regexp (khoảng 90% trong các thí nghiệm của chúng tôi) được hoàn thành trong thời gian tuyến tính.

(Cho người dùng preview: tối ưu hóa này có thể tiêu thụ bộ nhớ tỷ lệ thuận với độ dài đầu vào cho mỗi lần khớp. Chúng tôi dự kiến không có vấn đề thực tế nào phát sinh vì việc cấp phát bộ nhớ này thường bị trì hoãn, và một phép khớp Regexp bình thường nên tiêu thụ tối đa 10 lần bộ nhớ so với độ dài đầu vào. Nếu bạn hết bộ nhớ khi khớp Regexp trong ứng dụng thực tế, vui lòng báo cáo.)

Đề xuất ban đầu là <https://bugs.ruby-lang.org/issues/19104>

### Thời gian chờ Regexp

Tối ưu hóa ở trên không thể áp dụng cho một số loại biểu thức chính quy, chẳng hạn như những biểu thức bao gồm các tính năng nâng cao (ví dụ: tham chiếu ngược hoặc look-around), hoặc với số lần lặp cố định lớn. Như một biện pháp dự phòng, tính năng thời gian chờ cho khớp Regexp cũng được giới thiệu.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Lưu ý rằng `Regexp.timeout` là cấu hình toàn cục. Nếu bạn muốn sử dụng các cài đặt thời gian chờ khác nhau cho một số Regexp đặc biệt, bạn có thể sử dụng từ khóa `timeout` cho `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

Đề xuất ban đầu là <https://bugs.ruby-lang.org/issues/17837>

## Các tính năng mới đáng chú ý khác

### Không còn đi kèm mã nguồn bên thứ ba

* Chúng tôi không còn đi kèm mã nguồn bên thứ ba như `libyaml`, `libffi`.

    * Mã nguồn libyaml đã được xóa khỏi psych. Bạn có thể cần cài đặt `libyaml-dev` trên nền tảng Ubuntu/Debian. Tên gói khác nhau trên mỗi nền tảng.

    * Mã nguồn libffi đi kèm cũng đã được xóa khỏi `fiddle`

### Ngôn ngữ

* Các tham số rest và keyword rest ẩn danh giờ đây có thể được truyền
  làm đối số, thay vì chỉ được sử dụng trong tham số phương thức.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Một proc nhận một tham số vị trí duy nhất và từ khóa sẽ
  không còn tự động tách (autosplat). [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* Thứ tự đánh giá gán hằng số cho các hằng số được đặt trên đối tượng
  tường minh đã được làm nhất quán với thứ tự đánh giá gán thuộc tính
  đơn. Với mã này:

    ```ruby
    foo::BAR = baz
    ```

  `foo` giờ được gọi trước `baz`. Tương tự, cho các phép gán đa hằng số,
  thứ tự đánh giá từ trái sang phải được sử dụng. Với mã này:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Thứ tự đánh giá sau đây được sử dụng:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Find pattern không còn là tính năng thử nghiệm.
  [[Feature #18585]]

* Các phương thức nhận tham số rest (như `*args`) và muốn ủy quyền tham số
  từ khóa qua `foo(*args)` giờ phải được đánh dấu bằng `ruby2_keywords`
  (nếu chưa có). Nói cách khác, tất cả các phương thức muốn ủy quyền
  tham số từ khóa qua `*args` giờ phải được đánh dấu bằng `ruby2_keywords`,
  không có ngoại lệ. Điều này sẽ giúp dễ dàng chuyển sang các cách ủy quyền
  khác khi thư viện có thể yêu cầu Ruby 3+. Trước đây, cờ `ruby2_keywords`
  được giữ lại nếu phương thức nhận nhận `*args`, nhưng đây là lỗi và
  không nhất quán. Một kỹ thuật tốt để tìm các `ruby2_keywords` có thể
  bị thiếu là chạy bộ test, tìm nơi test thất bại và tìm phương thức cuối
  phải nhận tham số từ khóa, sử dụng `puts nil, caller, nil` ở đó, rồi kiểm
  tra từng phương thức/block trên chuỗi gọi phải ủy quyền từ khóa được đánh
  dấu đúng bằng `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentally worked without ruby2_keywords in Ruby 2.7-3.1, ruby2_keywords
    # needed in 3.2+. Just like (*args, **kwargs) or (...) would be needed on
    # both #foo and #bar when migrating away from ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Cải thiện hiệu suất

### YJIT

* Hỗ trợ arm64 / aarch64 trên các nền tảng UNIX.
* Xây dựng YJIT yêu cầu Rust 1.58.1+. [[Feature #18481]]

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

* RubyVM::AbstractSyntaxTree
    * Add `error_tolerant` option for `parse`, `parse_file` and `of`. [[Feature #19013]]

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

## Vấn đề tương thích

Lưu ý: Không bao gồm các bản sửa lỗi tính năng.

### Các hằng số đã bị xóa

Các hằng số không dùng nữa sau đã bị xóa.

* `Fixnum` and `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Các phương thức đã bị xóa

Các phương thức không dùng nữa sau đã bị xóa.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Vấn đề tương thích Stdlib

* `Psych` không còn đi kèm mã nguồn libyaml.
  Người dùng cần tự cài đặt thư viện libyaml qua hệ thống gói.
  [[Feature #18571]]

## Cập nhật C API

### Các C API đã cập nhật

Các API sau đã được cập nhật.

* PRNG update
  `rb_random_interface_t` updated and versioned.
  Extension libraries which use this interface and built for older versions.
  Also `init_int32` function needs to be defined.

### Các C API đã bị xóa

Các API không dùng nữa sau đã bị xóa.

* `rb_cData` variable.
* "taintedness" and "trustedness" functions. [[Feature #16131]]

### Cập nhật thư viện chuẩn

* SyntaxSuggest

  * Tính năng `syntax_suggest` trước đây là `dead_end` đã được tích hợp vào Ruby.
    [[Feature #18159]]

* ErrorHighlight
  * Giờ nó chỉ ra (các) đối số của TypeError và ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

*   Các gem mặc định sau đã được cập nhật.
    * RubyGems 3.4.0.dev
    * bigdecimal 3.1.2
    * bundler 2.4.0.dev
    * cgi 0.3.2
    * date 3.2.3
    * error_highlight 0.4.0
    * etc 1.4.0
    * io-console 0.5.11
    * io-nonblock 0.1.1
    * io-wait 0.3.0.pre
    * ipaddr 1.2.4
    * json 2.6.2
    * logger 1.5.1
    * net-http 0.2.2
    * net-protocol 0.1.3
    * ostruct 0.5.5
    * psych 5.0.0.dev
    * reline 0.3.1
    * securerandom 0.2.0
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 0.0.1
    * timeout 0.3.0
*   Các gem đi kèm sau đã được cập nhật.
    * minitest 5.16.3
    * net-imap 0.2.3
    * rbs 2.6.0
    * typeprof 0.21.3
    * debug 1.6.2
*   Các gem mặc định sau giờ là gem đi kèm.

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



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Feature #19013]: https://bugs.ruby-lang.org/issues/19013
