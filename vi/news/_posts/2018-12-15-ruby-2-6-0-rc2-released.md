---
layout: news_post
title: "Phát hành Ruby 2.6.0-rc2"
author: "naruse"
translator:
date: 2018-12-15 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.6.0-rc2.

Ruby 2.6.0-rc2 là release candidate thứ hai của Ruby 2.6.0.
RC2 được phát hành để thử nghiệm Bundler 1.17 đi kèm thay vì 2.0.
Nó giới thiệu một số tính năng mới và cải thiện hiệu suất, ví dụ:

## JIT

Ruby 2.6 giới thiệu bản triển khai ban đầu của trình biên dịch JIT (Just-in-time).

Trình biên dịch JIT nhằm cải thiện hiệu suất thực thi của bất kỳ chương trình Ruby nào.
Không giống các trình biên dịch JIT thông thường cho các ngôn ngữ khác, trình biên dịch JIT của Ruby thực hiện biên dịch JIT theo cách độc đáo, viết mã C ra đĩa và tạo tiến trình trình biên dịch C thông thường để sinh mã native.
Xem thêm: [Tổ chức MJIT (bởi Vladimir Makarov)](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Cách sử dụng: Chỉ cần chỉ định `--jit` trong dòng lệnh hoặc biến môi trường `$RUBYOPT`.
Chỉ định `--jit-verbose=1` cho phép in thông tin cơ bản về quá trình biên dịch JIT đang diễn ra. Xem `ruby --help` để biết các tùy chọn khác.

Mục đích chính của bản phát hành JIT này là cung cấp cơ hội để kiểm tra xem nó có hoạt động trên nền tảng của bạn không và tìm ra các rủi ro bảo mật trước bản phát hành 2.6.
Trình biên dịch JIT được hỗ trợ khi Ruby được biên dịch bằng GCC, Clang, hoặc Microsoft VC++, cần có sẵn tại thời điểm chạy. Nếu không, bạn chưa thể sử dụng nó.

Tính đến Ruby 2.6.0-rc2, chúng tôi đã đạt được hiệu suất nhanh hơn 1.7 lần so với Ruby 2.5 trên benchmark khối lượng công việc nặng CPU không trivial có tên Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>. Chúng tôi cũng sẽ cải thiện hiệu suất trên khối lượng công việc nặng bộ nhớ như ứng dụng Rails.

Hãy đón chờ kỷ nguyên mới về hiệu suất của Ruby.

## RubyVM::AbstractSyntaxTree [Thử nghiệm]

Ruby 2.6 giới thiệu module `RubyVM::AbstractSyntaxTree`.

Module này có phương thức `parse` phân tích mã Ruby từ chuỗi cho trước và trả về các nút AST (Abstract Syntax Tree), và phương thức `parse_file` phân tích mã Ruby từ tệp cho trước và trả về các nút AST.
Lớp `RubyVM::AbstractSyntaxTree::Node` cũng được giới thiệu. Bạn có thể lấy thông tin vị trí và các nút con từ các đối tượng `Node`. Tính năng này là thử nghiệm. Tính tương thích của cấu trúc các nút AST không được đảm bảo.

## Tính năng mới

* Thêm bí danh mới `then` cho `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` không có `rescue` giờ sẽ gây ra lỗi cú pháp. [THỬ NGHIỆM][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

* Tên hằng số có thể bắt đầu bằng chữ cái viết hoa không phải ASCII. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Giới thiệu dãy vô tận. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Dãy vô tận `(1..)` được giới thiệu. Nó hoạt động như thể không có điểm kết thúc. Dưới đây là các trường hợp sử dụng tiêu biểu:

      ary[1..]                             # tương đương ary[1..-1] không cần số -1 đặc biệt
      (1..).each {|index| block }          # vòng lặp vô hạn từ chỉ số 1
      ary.zip(1..) {|elem, index| block }  # ary.each.with_index(1) { }

* Thêm `Binding#source_location`. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  Phương thức này trả về vị trí nguồn của binding, một mảng 2 phần tử gồm `__FILE__` và `__LINE__`. Theo truyền thống, cùng thông tin có thể được lấy bằng `eval("[__FILE__, __LINE__]", binding)`, nhưng chúng tôi đang lên kế hoạch thay đổi hành vi này để `Kernel#eval` bỏ qua vị trí nguồn của binding [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). Vì vậy, người dùng nên sử dụng phương thức mới được giới thiệu này thay vì `Kernel#eval`.

* Thêm tùy chọn `:exception` để `Kernel#system` ném ngoại lệ khi thất bại thay vì trả về `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Thêm chế độ oneshot cho `Coverage`. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * Chế độ này kiểm tra "liệu mỗi dòng đã được thực thi ít nhất một lần hay chưa", thay vì "mỗi dòng đã được thực thi bao nhiêu lần". Hook cho mỗi dòng được kích hoạt nhiều nhất một lần, và sau khi kích hoạt, cờ hook sẽ bị xóa, tức là chạy với chi phí bằng không.
  * Thêm tham số từ khóa `:oneshot_lines` cho Coverage.start.
  * Thêm tham số từ khóa `:stop` và `:clear` cho Coverage.result. Nếu `clear` là true, nó xóa bộ đếm về không. Nếu `stop` là true, nó tắt đo coverage.
  * Coverage.line_stub, một hàm helper đơn giản tạo "stub" của line coverage từ mã nguồn cho trước.

* Thêm `FileUtils#cp_lr`. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Cải thiện hiệu suất

* Tăng tốc `Proc#call` vì không còn cần quan tâm đến `$SAFE` nữa.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Với benchmark `lc_fizzbuzz` sử dụng `Proc#call` nhiều lần, chúng tôi có thể đo được
  cải thiện x1.4. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Tăng tốc `block.call` khi `block` là tham số block được truyền vào. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 cải thiện hiệu suất truyền block. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

  Thêm vào đó, Ruby 2.6 cải thiện hiệu suất gọi block được truyền.
  Với benchmark vi mô, chúng tôi có thể quan sát cải thiện x2.6.

* Transient Heap (theap) được giới thiệu. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  theap là heap được quản lý cho các đối tượng bộ nhớ ngắn hạn được trỏ bởi
  các lớp cụ thể (Array, Hash, Object, và Struct). Ví dụ, tạo đối tượng Hash
  nhỏ và ngắn hạn nhanh hơn x2. Với benchmark rdoc, chúng tôi quan sát được
  cải thiện hiệu suất 6-7%.

## Các thay đổi đáng chú ý khác kể từ 2.5

* `$SAFE` giờ là trạng thái toàn cục của tiến trình và có thể đặt lại thành `0`. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Truyền `safe_level` cho `ERB.new` đã bị deprecated. Các tham số `trim_mode` và `eoutvar` được chuyển thành tham số từ khóa. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Phiên bản Unicode được hỗ trợ đã cập nhật lên 11. Dự kiến sẽ cập nhật lên 12 và 12.1 trong các bản phát hành TEENY tương lai của Ruby 2.6.

* Tích hợp RubyGems 3.0.0.beta3. Các tùy chọn `--ri` và `--rdoc` đã bị xóa. Vui lòng sử dụng các tùy chọn `--document` và `--no-document` thay thế.

* Tích hợp [Bundler](https://github.com/bundler/bundler) làm gem mặc định.

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
để biết chi tiết.

Với các thay đổi đó,
[6411 tệp thay đổi, 228864 thêm(+), 97600 xóa(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
kể từ Ruby 2.5.0!

Hãy tận hưởng lập trình với Ruby 2.6.0-rc2!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
