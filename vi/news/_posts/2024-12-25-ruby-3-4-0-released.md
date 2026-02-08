---
layout: news_post
title: "Phát hành Ruby 3.4.0"
author: "naruse"
translator:
date: 2024-12-25 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}. Ruby 3.4 thêm tham chiếu tham số block `it`,
đổi Prism thành trình phân tích mặc định, thêm hỗ trợ Happy Eyeballs Version 2 cho thư viện socket, cải thiện YJIT,
thêm GC Mô-đun, và nhiều hơn nữa.

## Giới thiệu `it`

`it` được thêm để tham chiếu đến tham số block không có tên biến. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` hoạt động rất giống với `_1`. Khi mục đích chỉ là sử dụng `_1` trong một block, khả năng xuất hiện các tham số đánh số khác như `_2` tạo thêm gánh nặng nhận thức cho người đọc. Vì vậy `it` được giới thiệu như một bí danh tiện lợi. Sử dụng `it` trong các trường hợp đơn giản khi `it` tự giải thích được, chẳng hạn trong các block một dòng.

## Prism giờ đây là trình phân tích mặc định

Chuyển trình phân tích mặc định từ parse.y sang Prism. [[Feature #20564]]

Đây là một cải thiện nội bộ và người dùng sẽ thấy ít thay đổi. Nếu bạn phát hiện bất kỳ vấn đề tương thích nào, vui lòng báo cáo cho chúng tôi.

Để sử dụng trình phân tích truyền thống, sử dụng tham số dòng lệnh `--parser=parse.y`.

## Thư viện socket giờ đây hỗ trợ Happy Eyeballs Version 2 (RFC 8305)

Thư viện socket giờ đây hỗ trợ [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305), phiên bản chuẩn hóa mới nhất của phương pháp được áp dụng rộng rãi để cải thiện kết nối trong nhiều ngôn ngữ lập trình, trong `TCPSocket.new` (`TCPSocket.open`) và `Socket.tcp`.
Cải thiện này cho phép Ruby cung cấp các kết nối mạng hiệu quả và đáng tin cậy, thích ứng với môi trường internet hiện đại.

Cho đến Ruby 3.3, các phương thức này thực hiện phân giải tên và nỗ lực kết nối tuần tự. Với thuật toán này, chúng giờ đây hoạt động như sau:

1. Thực hiện phân giải tên IPv6 và IPv4 đồng thời
2. Nỗ lực kết nối đến các địa chỉ IP đã phân giải, ưu tiên IPv6, với các nỗ lực song song cách nhau 250ms
3. Trả về kết nối thành công đầu tiên trong khi hủy các kết nối khác

Điều này đảm bảo giảm thiểu độ trễ kết nối, ngay cả khi một giao thức hoặc địa chỉ IP cụ thể bị chậm hoặc không khả dụng.
Tính năng này được bật mặc định, vì vậy không cần cấu hình thêm để sử dụng. Để tắt toàn cục, đặt biến môi trường `RUBY_TCP_NO_FAST_FALLBACK=1` hoặc gọi `Socket.tcp_fast_fallback=false`. Hoặc để tắt trên từng phương thức, sử dụng tham số keyword `fast_fallback: false`.

## YJIT

### TL;DR

* Hiệu suất tốt hơn trên hầu hết các benchmark trên cả nền tảng x86-64 và arm64.
* Giảm sử dụng bộ nhớ thông qua metadata nén và giới hạn bộ nhớ thống nhất.
* Nhiều bản sửa lỗi: YJIT giờ đây ổn định hơn và được kiểm tra kỹ hơn.

### Tính năng mới

* Tùy chọn dòng lệnh
    * `--yjit-mem-size` giới thiệu giới hạn bộ nhớ thống nhất (mặc định 128MiB) để theo dõi tổng sử dụng bộ nhớ YJIT,
      cung cấp một phương án trực quan hơn so với tùy chọn cũ `--yjit-exec-mem-size`.
    * `--yjit-log` bật nhật ký biên dịch để theo dõi những gì được biên dịch.
* Ruby API
    * `RubyVM::YJIT.log` cung cấp quyền truy cập vào phần cuối nhật ký biên dịch tại thời điểm chạy.
* Thống kê YJIT
    * `RubyVM::YJIT.runtime_stats` giờ đây luôn cung cấp thêm thống kê về
       invalidation, inlining, và mã hóa metadata.

### Tối ưu hóa mới

* Context nén giảm bộ nhớ cần thiết để lưu trữ metadata YJIT
* Cấp phát thanh ghi cho biến cục bộ và tham số phương thức Ruby
* Khi YJIT được bật, sử dụng nhiều nguyên thủy Core hơn được viết bằng Ruby:
    * `Array#each`, `Array#select`, `Array#map` được viết lại bằng Ruby để có hiệu suất tốt hơn [[Feature #20182]].
* Khả năng inline các phương thức nhỏ/đơn giản như:
    * Phương thức rỗng
    * Phương thức trả về hằng số
    * Phương thức trả về `self`
    * Phương thức trực tiếp trả về một tham số
* Codegen chuyên biệt cho nhiều phương thức runtime hơn
* Tối ưu hóa `String#getbyte`, `String#setbyte` và các phương thức chuỗi khác
* Tối ưu hóa các phép toán bitwise để tăng tốc thao tác bit/byte cấp thấp
* Hỗ trợ hằng số chia sẻ trong chế độ multi-ractor
* Nhiều tối ưu hóa gia tăng khác

## GC Mô-đun

* Các triển khai bộ thu gom rác (GC) thay thế có thể được tải động
  thông qua tính năng bộ thu gom rác mô-đun. Để bật tính năng này,
  cấu hình Ruby với `--with-modular-gc` khi build. Các thư viện GC có thể được
  tải tại thời điểm chạy bằng biến môi trường `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* Bộ thu gom rác tích hợp của Ruby đã được tách ra thành một tập tin riêng tại
  `gc/default/default.c` và tương tác với Ruby thông qua API được định nghĩa trong
  `gc/gc_impl.h`. Bộ thu gom rác tích hợp giờ đây cũng có thể được build dưới dạng
  thư viện bằng `make modular-gc MODULAR_GC=default` và được bật bằng
  biến môi trường `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* Một thư viện GC thử nghiệm được cung cấp dựa trên [MMTk](https://www.mmtk.io/).
  Thư viện GC này có thể được build bằng `make modular-gc MODULAR_GC=mmtk` và
  được bật bằng biến môi trường `RUBY_GC_LIBRARY=mmtk`. Điều này yêu cầu
  bộ công cụ Rust trên máy build. [[Feature #20860]]

## Thay đổi ngôn ngữ

* Các chuỗi ký tự trong các tập tin không có comment `frozen_string_literal` giờ đây phát ra cảnh báo deprecation
  khi chúng bị thay đổi.
  Các cảnh báo này có thể được bật với `-W:deprecated` hoặc bằng cách đặt `Warning[:deprecated] = true`.
  Để tắt thay đổi này, bạn có thể chạy Ruby với tham số dòng lệnh `--disable-frozen-string-literal`.
  [[Feature #20205]]

* Giờ đây hỗ trợ keyword splatting `nil` khi gọi phương thức.
  `**nil` được xử lý tương tự như `**{}`, không truyền keyword nào,
  và không gọi bất kỳ phương thức chuyển đổi nào.  [[Bug #20064]]

* Không còn cho phép truyền block trong index.  [[Bug #19918]]

* Không còn cho phép keyword arguments trong index.  [[Bug #20218]]

* Tên cấp cao nhất `::Ruby` giờ đây được dành riêng, và định nghĩa sẽ bị cảnh báo khi `Warning[:deprecated]`.  [[Feature #20884]]

## Cập nhật các lớp lõi

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật lớp lõi đáng chú ý.

* Exception

  * `Exception#set_backtrace` giờ đây chấp nhận mảng `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` và `Fiber#raise` cũng chấp nhận định dạng mới này. [[Feature #13557]]

* GC

    * `GC.config` được thêm để cho phép đặt các biến cấu hình trên
      Bộ thu gom rác. [[Feature #20443]]

    * Tham số cấu hình GC `rgengc_allow_full_mark` được giới thiệu. Khi `false`
      GC sẽ chỉ đánh dấu các đối tượng trẻ. Mặc định là `true`.  [[Feature #20443]]

* Ractor

    * `require` trong Ractor được cho phép. Quá trình require sẽ được chạy trên
      Ractor chính.
      `Ractor._require(feature)` được thêm để chạy quá trình require trên
      Ractor chính.
      [[Feature #20627]]

    * `Ractor.main?` được thêm. [[Feature #20627]]

    * `Ractor.[]` và `Ractor.[]=` được thêm để truy cập bộ nhớ cục bộ ractor
      của Ractor hiện tại. [[Feature #20715]]

    * `Ractor.store_if_absent(key){ init }` được thêm để khởi tạo biến cục bộ
      ractor một cách an toàn luồng. [[Feature #20875]]

* Range

  * `Range#size` giờ đây ném `TypeError` nếu range không thể lặp. [[Misc #18984]]


## Cập nhật thư viện chuẩn

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật thư viện chuẩn đáng chú ý.

* RubyGems
    * Thêm tùy chọn `--attestation` cho gem push. Cho phép lưu chữ ký vào [sigstore.dev]

* Bundler
    * Thêm cấu hình `lockfile_checksums` để bao gồm checksum trong lockfile mới
    * Thêm bundle lock `--add-checksums` để thêm checksum vào lockfile hiện có

* JSON

    * Cải thiện hiệu suất `JSON.parse` nhanh hơn khoảng 1.5 lần so với json-2.7.x.

* Tempfile

    * Tham số keyword `anonymous: true` được triển khai cho Tempfile.create.
      `Tempfile.create(anonymous: true)` xóa tập tin tạm đã tạo ngay lập tức.
      Vì vậy ứng dụng không cần phải xóa tập tin.
      [[Feature #20497]]

* win32/sspi.rb

    * Thư viện này giờ đây được tách ra từ kho Ruby vào [ruby/net-http-sspi].
      [[Feature #20775]]

Các gem đi kèm sau đây được nâng cấp từ gem mặc định.

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## Vấn đề tương thích

Lưu ý: Không bao gồm các bản sửa lỗi tính năng.

* Thông báo lỗi và hiển thị backtrace đã được thay đổi.
  * Sử dụng dấu nháy đơn thay vì dấu backtick làm dấu mở ngoặc. [[Feature #16495]]
  * Hiển thị tên lớp trước tên phương thức (chỉ khi lớp có tên cố định). [[Feature #19117]]
  * `Kernel#caller`, các phương thức của `Thread::Backtrace::Location`, v.v. cũng được thay đổi tương ứng.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* Hiển thị Hash#inspect đã được thay đổi. [[Bug #20433]]

    * Các khóa Symbol được hiển thị bằng cú pháp khóa symbol hiện đại: `"{user: 1}"`
    * Các khóa khác giờ đây có khoảng trắng xung quanh `=>`: `'{"user" => 1}'`, trong khi trước đó không có: `'{"user"=>1}'`

* Kernel#Float() giờ đây chấp nhận chuỗi thập phân với phần thập phân bị bỏ qua. [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (trước đây, ArgumentError được ném)
  Float("1.E-1") #=> 0.1 (trước đây, ArgumentError được ném)
  ```

* String#to_f giờ đây chấp nhận chuỗi thập phân với phần thập phân bị bỏ qua. Lưu ý rằng kết quả thay đổi khi chỉ định số mũ. [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (trước đây, 1.0 được trả về)
  ```

* Refinement#refined_class đã được loại bỏ. [[Feature #19714]]

## Vấn đề tương thích thư viện chuẩn

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=` và `DidYouMean::SPELL_CHECKERS.merge!` được loại bỏ.

* Net::HTTP

    * Loại bỏ các hằng số deprecated sau:
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      Các hằng số này đã bị deprecated từ năm 2012.

* Timeout

    * Từ chối giá trị âm cho Timeout.timeout. [[Bug #20795]]

* URI

    * Chuyển trình phân tích mặc định sang tuân thủ RFC 3986 thay vì tuân thủ RFC 2396.
      [[Bug #19266]]

## Cập nhật C API

* `rb_newobj` và `rb_newobj_of` (và các macro tương ứng `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) đã được loại bỏ. [[Feature #20265]]
* Loại bỏ hàm deprecated `rb_gc_force_recycle`. [[Feature #18290]]

## Thay đổi khác

* Truyền block cho một phương thức không sử dụng block đã truyền sẽ hiển thị
  cảnh báo ở chế độ verbose (`-w`).
  [[Feature #15554]]

* Định nghĩa lại một số phương thức lõi được tối ưu hóa đặc biệt bởi trình thông dịch
  và JIT như `String.freeze` hoặc `Integer#+` giờ đây sẽ phát ra cảnh báo hiệu suất
  (`-W:performance` hoặc `Warning[:performance] = true`).
  [[Feature #20429]]

Xem [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tập tin thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa đi(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.3.0!

Giáng sinh vui vẻ, Chúc mừng ngày lễ, và hãy tận hưởng lập trình với Ruby 3.4!

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

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
