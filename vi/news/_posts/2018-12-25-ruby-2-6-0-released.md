---
layout: news_post
title: "Phát hành Ruby 2.6.0"
author: "naruse"
translator:
date: 2018-12-25 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.6.0.

Nó giới thiệu nhiều tính năng mới và cải thiện hiệu suất, đáng chú ý nhất là:

 * Trình biên dịch JIT mới.
 * Module `RubyVM::AbstractSyntaxTree`.

## JIT [Thử nghiệm]

Ruby 2.6 giới thiệu bản triển khai ban đầu của trình biên dịch JIT (Just-In-Time).

Trình biên dịch JIT nhằm cải thiện hiệu suất của các chương trình Ruby. Không giống các trình biên dịch JIT truyền thống hoạt động trong tiến trình, trình biên dịch JIT của Ruby viết mã C ra đĩa và tạo tiến trình trình biên dịch C thông thường để sinh mã native. Để biết thêm chi tiết, xem [tổ chức MJIT bởi Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization).

Để bật trình biên dịch JIT, chỉ định `--jit` trên dòng lệnh hoặc trong biến môi trường `$RUBYOPT`. Chỉ định `--jit-verbose=1` sẽ khiến trình biên dịch JIT in thông tin bổ sung. Đọc đầu ra của `ruby --help` hoặc [tài liệu](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage) để biết các tùy chọn khác.

Trình biên dịch JIT được hỗ trợ khi Ruby được biên dịch bằng GCC, Clang, hoặc Microsoft VC++, cần có sẵn tại thời điểm chạy.

Tính đến Ruby 2.6.0, chúng tôi đã đạt được [hiệu suất nhanh hơn 1.7 lần](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208) so với Ruby 2.5 trên benchmark nặng CPU không trivial có tên [Optcarrot](https://github.com/mame/optcarrot). Tuy nhiên, nó vẫn là thử nghiệm và nhiều khối lượng công việc nặng bộ nhớ khác như ứng dụng Rails có thể chưa được hưởng lợi tại thời điểm này. Để biết thêm chi tiết, xem [Ruby 2.6 JIT - Tiến độ và Tương lai](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Hãy đón chờ kỷ nguyên mới về hiệu suất của Ruby.

## `RubyVM::AbstractSyntaxTree` [Thử nghiệm]

Ruby 2.6 giới thiệu module `RubyVM::AbstractSyntaxTree`. **Tính tương thích trong tương lai của module này không được đảm bảo**.

Module này có phương thức `parse`, phân tích chuỗi cho trước dưới dạng mã Ruby và trả về các nút AST (Abstract Syntax Tree) của mã đó. Phương thức `parse_file` mở và phân tích tệp cho trước dưới dạng mã Ruby và trả về các nút AST.

Lớp `RubyVM::AbstractSyntaxTree::Node` cũng được giới thiệu. Bạn có thể lấy vị trí nguồn và các nút con từ các đối tượng `Node`. Tính năng này là thử nghiệm.

## Các tính năng mới đáng chú ý khác

* Thêm bí danh `#then` cho `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* Tên hằng số có thể bắt đầu bằng chữ cái viết hoa không phải ASCII. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Giới thiệu dãy vô tận. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Dãy vô tận `(1..)` hoạt động như thể không có điểm kết thúc. Dưới đây là một số trường hợp sử dụng tiêu biểu:

      ary[1..]                          # tương đương ary[1..-1] không cần số -1 đặc biệt
      (1..).each {|index| ... }         # liệt kê các giá trị bắt đầu từ chỉ số 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Thêm `Enumerable#chain` và `Enumerator#+`. [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Thêm toán tử kết hợp hàm `<<` và `>>` cho `Proc` và `Method`. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; tương đương f(g(3))
      (f >> g).call(3) # -> 15; tương đương g(f(3))

* Thêm `Binding#source_location`. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  Phương thức này trả về vị trí nguồn của binding, một mảng 2 phần tử gồm `__FILE__` và `__LINE__`. Về mặt kỹ thuật, điều này tương đương với `eval("[__FILE__, __LINE__]", binding)`. Tuy nhiên, chúng tôi đang lên kế hoạch thay đổi hành vi này để `Kernel#eval` bỏ qua vị trí nguồn của binding [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). Vì vậy, khuyến nghị sử dụng `Binding#source_location` thay vì `Kernel#eval`.

* Thêm tùy chọn `exception:` cho `Kernel#system` khiến nó ném ngoại lệ khi thất bại thay vì trả về `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Thêm chế độ oneshot cho `Coverage`. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * Chế độ này kiểm tra "liệu mỗi dòng đã được thực thi ít nhất một lần hay chưa", thay vì "mỗi dòng đã được thực thi bao nhiêu lần". Hook cho mỗi dòng chỉ được kích hoạt một lần, và sau khi kích hoạt, cờ hook sẽ bị xóa, tức là chạy với chi phí bằng không.
  * Thêm tham số từ khóa `oneshot_lines:` cho `Coverage.start`.
  * Thêm tham số từ khóa `stop:` và `clear:` cho `Coverage.result`. Nếu `clear` là true, nó xóa bộ đếm về không. Nếu `stop` là true, nó tắt đo coverage.
  * `Coverage.line_stub` là một hàm helper đơn giản tạo "stub" của line coverage từ mã nguồn cho trước.

* Thêm `FileUtils#cp_lr`. Nó hoạt động giống `cp_r` nhưng tạo liên kết thay vì sao chép. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Cải thiện hiệu suất

* Tăng tốc `Proc#call` bằng cách loại bỏ phân bổ tạm thời cho `$SAFE`.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Chúng tôi đã quan sát được cải thiện hiệu suất 1.4 lần trong benchmark `lc_fizzbuzz` gọi `Proc#call` nhiều lần. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* Tăng tốc `block.call` khi `block` được truyền vào dưới dạng tham số block. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Kết hợp với các cải tiến xử lý block được giới thiệu trong Ruby 2.5, đánh giá block giờ nhanh hơn 2.6 lần trong benchmark vi mô trong Ruby 2.6. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

* Transient Heap (`theap`) được giới thiệu. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap` là heap được quản lý cho các đối tượng bộ nhớ ngắn hạn được trỏ bởi các lớp cụ thể (`Array`, `Hash`, `Object`, và `Struct`). Tạo đối tượng Hash nhỏ và ngắn hạn nhanh hơn 2 lần. Với benchmark rdoc, chúng tôi quan sát được cải thiện hiệu suất 6-7%.

* Triển khai native (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) của coroutine để cải thiện đáng kể hiệu suất chuyển ngữ cảnh của Fiber. [[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` và `Fiber#resume` nhanh hơn khoảng 5 lần trên Linux 64-bit. Các chương trình sử dụng nhiều Fiber có thể kỳ vọng cải thiện tổng thể lên đến 5%.

## Các thay đổi đáng chú ý khác kể từ 2.5

* `$SAFE` giờ là trạng thái toàn cục của tiến trình và có thể đặt lại thành `0`. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Truyền `safe_level` cho `ERB.new` đã bị deprecated. Các tham số `trim_mode` và `eoutvar` được chuyển thành tham số từ khóa. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Hỗ trợ Unicode được cập nhật lên phiên bản 11. Chúng tôi dự kiến thêm hỗ trợ cho Unicode phiên bản 12 và 12.1 trong bản phát hành TEENY tương lai của Ruby 2.6. Điều này sẽ bao gồm hỗ trợ cho [niên hiệu mới của Nhật Bản](http://blog.unicode.org/2018/09/new-japanese-era.html).

* Tích hợp RubyGems 3.0.1. Các tùy chọn `--ri` và `--rdoc` đã bị xóa. Vui lòng sử dụng các tùy chọn `--document` và `--no-document` thay thế.

* [Bundler](https://github.com/bundler/bundler) giờ được cài đặt như gem mặc định.

* Trong các khối xử lý ngoại lệ, `else` không có `rescue` giờ sẽ gây ra lỗi cú pháp. [THỬ NGHIỆM][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) để biết thêm chi tiết.

Với các thay đổi đó, [6437 tệp thay đổi, 231471 thêm(+), 98498 xóa(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) kể từ Ruby 2.5.0!

Giáng Sinh vui vẻ, Chúc mừng ngày lễ, và hãy tận hưởng lập trình với Ruby 2.6!

## Vấn đề đã biết

_(Phần này được thêm vào ngày 28 tháng 1, 2019.)_

* [Net::Protocol::BufferedIO#write ném NoMethodError khi gửi chuỗi multi-byte lớn](https://github.com/ruby/ruby/pull/2058)

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
