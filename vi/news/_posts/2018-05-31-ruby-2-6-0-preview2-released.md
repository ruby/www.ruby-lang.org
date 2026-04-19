---
layout: news_post
title: "Phát hành Ruby 2.6.0-preview2"
author: "naruse"
translator:
date: 2018-05-31 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.6.0-preview2.

Ruby 2.6.0-preview2 là bản preview thứ hai hướng tới Ruby 2.6.0.
Bản preview2 này được phát hành sớm hơn thường lệ vì nó bao gồm một tính năng mới quan trọng, JIT.

## JIT

Ruby 2.6 giới thiệu bản triển khai ban đầu của trình biên dịch JIT (Just-in-time).

Trình biên dịch JIT nhằm cải thiện hiệu suất thực thi của bất kỳ chương trình Ruby nào.
Không giống các trình biên dịch JIT thông thường cho các ngôn ngữ khác, trình biên dịch JIT của Ruby thực hiện biên dịch JIT theo cách độc đáo, in mã C ra đĩa và tạo tiến trình trình biên dịch C thông thường để sinh mã native.
Xem thêm: [Tổ chức MJIT bởi Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Cách sử dụng: Chỉ cần chỉ định `--jit` trong dòng lệnh hoặc biến môi trường `$RUBYOPT`.
Chỉ định `--jit-verbose=1` cho phép in thông tin cơ bản về quá trình biên dịch JIT đang diễn ra. Xem `ruby --help` để biết các tùy chọn khác.

Mục đích chính của bản phát hành JIT này là cung cấp cơ hội để kiểm tra xem nó có hoạt động trên nền tảng của bạn không và tìm ra các rủi ro bảo mật trước bản phát hành 2.6.
Hiện tại trình biên dịch JIT chỉ được hỗ trợ khi Ruby được biên dịch bằng gcc hoặc clang và trình biên dịch có sẵn tại thời điểm chạy. Nếu không, bạn chưa thể sử dụng nó.

Tính đến 2.6.0-preview2, chúng tôi chỉ mới chuẩn bị cơ sở hạ tầng cho JIT và rất ít tối ưu hóa được triển khai.
Bạn có thể đo lường một số cải thiện tiềm năng trong các benchmark vi mô với bản phát hành này, nhưng nó CHƯA sẵn sàng để đánh giá hiệu suất cuối cùng của trình biên dịch JIT của Ruby, đặc biệt cho các chương trình lớn hơn như ứng dụng Rails.

Chúng tôi sẽ triển khai method inlining trong trình biên dịch JIT, dự kiến sẽ tăng hiệu suất Ruby lên đáng kể.
Ngoài ra, chúng tôi đang lên kế hoạch tăng số nền tảng được hỗ trợ, và kế hoạch tiếp theo là hỗ trợ Visual Studio.

Hãy đón chờ kỷ nguyên mới về hiệu suất của Ruby.

## RubyVM::AST [Thử nghiệm]

Ruby 2.6 giới thiệu module `RubyVM::AST`.

Module này có phương thức `parse` phân tích mã ruby cho trước dưới dạng chuỗi và trả về các nút AST (Abstract Syntax Tree), và phương thức `parse_file` phân tích tệp mã ruby cho trước và trả về các nút AST.

Lớp `RubyVM::AST::Node` cũng được giới thiệu, bạn có thể lấy thông tin vị trí và các nút con từ các đối tượng `Node`. Tính năng này là thử nghiệm. Tính tương thích của cấu trúc các nút AST không được đảm bảo.

## Tính năng mới

* Thêm bí danh mới `then` cho `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` không có `rescue` giờ sẽ gây ra lỗi cú pháp. [THỬ NGHIỆM]

* Tên hằng số có thể bắt đầu bằng chữ cái viết hoa không phải ASCII. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Dãy vô tận [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Dãy vô tận `(1..)` được giới thiệu. Nó hoạt động như thể không có điểm kết thúc. Dưới đây là các trường hợp sử dụng tiêu biểu:

      ary[1..]                          # tương đương ary[1..-1] không cần số -1 đặc biệt
      (1..).each {|index| ... }         # vòng lặp vô hạn từ chỉ số 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Thêm `Binding#source_location`. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  Phương thức này trả về vị trí nguồn của binding, một mảng 2 phần tử gồm `__FILE__` và `__LINE__`. Theo truyền thống, cùng thông tin có thể được lấy bằng `eval("[__FILE__, __LINE__]", binding)`, nhưng chúng tôi đang lên kế hoạch thay đổi hành vi này để `Kernel#eval` bỏ qua vị trí nguồn của binding [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). Vì vậy, người dùng nên sử dụng phương thức mới được giới thiệu này thay vì `Kernel#eval`.

* Thêm tùy chọn `:exception` để `Kernel.#system` ném lỗi thay vì trả về `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

## Cải thiện hiệu suất

* Tăng tốc `Proc#call` vì không còn cần quan tâm đến `$SAFE` nữa.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Với benchmark `lc_fizzbuzz` sử dụng `Proc#call` rất nhiều lần, chúng tôi có thể đo được
  cải thiện x1.4 [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Tăng tốc `block.call` khi `block` là tham số block được truyền vào. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 cải thiện hiệu suất truyền block. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
  Thêm vào đó, Ruby 2.6 cải thiện hiệu suất gọi block được truyền.
  Với benchmark vi mô, chúng tôi có thể quan sát cải thiện x2.6.

## Các thay đổi đáng chú ý khác kể từ 2.5

* `$SAFE` là trạng thái toàn cục của tiến trình và chúng ta có thể đặt lại thành `0`. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Truyền `safe_level` cho `ERB.new` đã bị deprecated. Các tham số `trim_mode` và `eoutvar` được chuyển thành tham số từ khóa. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Tích hợp RubyGems 3.0.0.beta1

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
để biết thêm chi tiết.

Với các thay đổi đó,
[4699 tệp thay đổi, 45744 thêm(+), 30885 xóa(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
kể từ Ruby 2.5.0!

Hãy tận hưởng lập trình với Ruby 2.6.0-preview2!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
