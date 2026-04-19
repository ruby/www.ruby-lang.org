---
layout: news_post
title: "Phát hành Ruby 2.6.0-preview3"
author: "naruse"
translator:
date: 2018-11-06 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.6.0-preview3.

Ruby 2.6.0-preview3 là bản preview thứ ba hướng tới Ruby 2.6.0.
Bản preview3 này được phát hành để thử nghiệm các tính năng mới trước khi đến Release Candidate.

## JIT

Ruby 2.6 giới thiệu bản triển khai ban đầu của trình biên dịch JIT (Just-in-time).

Trình biên dịch JIT nhằm cải thiện hiệu suất thực thi của bất kỳ chương trình Ruby nào.
Không giống các trình biên dịch JIT thông thường cho các ngôn ngữ khác, trình biên dịch JIT của Ruby thực hiện biên dịch JIT theo cách độc đáo, in mã C ra đĩa và tạo tiến trình trình biên dịch C thông thường để sinh mã native.
Xem thêm: [Tổ chức MJIT bởi Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Cách sử dụng: Chỉ cần chỉ định `--jit` trong dòng lệnh hoặc biến môi trường `$RUBYOPT`.
Chỉ định `--jit-verbose=1` cho phép in thông tin cơ bản về quá trình biên dịch JIT đang diễn ra. Xem `ruby --help` để biết các tùy chọn khác.

Mục đích chính của bản phát hành JIT này là cung cấp cơ hội để kiểm tra xem nó có hoạt động trên nền tảng của bạn không và tìm ra các rủi ro bảo mật trước bản phát hành 2.6.
Trình biên dịch JIT được hỗ trợ khi Ruby được biên dịch bằng GCC, Clang, hoặc Microsoft VC++, cần có sẵn tại thời điểm chạy. Nếu không, bạn chưa thể sử dụng nó.

Tính đến Ruby 2.6.0 preview3, chúng tôi đã đạt được hiệu suất nhanh hơn 1.7 lần so với Ruby 2.5 trên benchmark khối lượng công việc nặng CPU không trivial có tên Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>. Chúng tôi cũng sẽ cải thiện hiệu suất trên khối lượng công việc nặng bộ nhớ như ứng dụng Rails.

Hãy đón chờ kỷ nguyên mới về hiệu suất của Ruby.

## RubyVM::AST [Thử nghiệm]

Ruby 2.6 giới thiệu module `RubyVM::AST`.

Module này có phương thức `parse` phân tích mã ruby cho trước dưới dạng chuỗi và trả về các nút AST (Abstract Syntax Tree), và phương thức `parse_file` phân tích tệp mã ruby cho trước và trả về các nút AST.
Lớp `RubyVM::AST::Node` cũng được giới thiệu. Bạn có thể lấy thông tin vị trí và các nút con từ các đối tượng `Node`. Tính năng này là thử nghiệm. Tính tương thích của cấu trúc các nút AST không được đảm bảo.

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

* Transient Heap (theap) được giới thiệu. [Bug #14858] [Feature #14989]
  theap là heap được quản lý cho các đối tượng bộ nhớ ngắn hạn được trỏ bởi
  các lớp cụ thể (Array, Hash, Object, và Struct). Ví dụ, tạo đối tượng Hash
  nhỏ và ngắn hạn nhanh hơn x2. Với benchmark rdoc, chúng tôi quan sát được
  cải thiện hiệu suất 6-7%.

## Các thay đổi đáng chú ý khác kể từ 2.5

* `$SAFE` là trạng thái toàn cục của tiến trình và chúng ta có thể đặt lại thành `0`. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Truyền `safe_level` cho `ERB.new` đã bị deprecated. Các tham số `trim_mode` và `eoutvar` được chuyển thành tham số từ khóa. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Tích hợp RubyGems 3.0.0.beta2. Các tùy chọn `--ri` và `--rdoc` đã bị xóa. Vui lòng sử dụng các tùy chọn `--document` và `--no-document` thay thế.

* Tích hợp [Bundler](https://github.com/bundler/bundler) làm gem mặc định.

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
để biết chi tiết.

Với các thay đổi đó,
[6474 tệp thay đổi, 171888 thêm(+), 46617 xóa(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
kể từ Ruby 2.5.0!

Hãy tận hưởng lập trình với Ruby 2.6.0-preview3!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
