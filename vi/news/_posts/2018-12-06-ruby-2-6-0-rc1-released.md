---
layout: news_post
title: "Phát hành Ruby 2.6.0-rc1"
author: "naruse"
translator:
date: 2018-12-06 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.6.0-rc1.

Ruby 2.6.0-rc1 là release candidate đầu tiên của Ruby 2.6.0.
Nó giới thiệu một số tính năng mới và cải thiện hiệu suất, ví dụ:

## JIT

Ruby 2.6 giới thiệu bản triển khai ban đầu của trình biên dịch JIT (Just-in-time).

Trình biên dịch JIT nhằm cải thiện hiệu suất thực thi của bất kỳ chương trình Ruby nào.
Không giống các trình biên dịch JIT thông thường cho các ngôn ngữ khác, trình biên dịch JIT của Ruby thực hiện biên dịch JIT theo cách độc đáo, in mã C ra đĩa và tạo tiến trình trình biên dịch C thông thường để sinh mã native.
Xem thêm: [Tổ chức MJIT bởi Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Cách sử dụng: Chỉ cần chỉ định `--jit` trong dòng lệnh hoặc biến môi trường `$RUBYOPT`.
Chỉ định `--jit-verbose=1` cho phép in thông tin cơ bản về quá trình biên dịch JIT đang diễn ra. Xem `ruby --help` để biết các tùy chọn khác.

Mục đích chính của bản phát hành JIT này là cung cấp cơ hội để kiểm tra xem nó có hoạt động trên nền tảng của bạn không và tìm ra các rủi ro bảo mật trước bản phát hành 2.6.
Trình biên dịch JIT được hỗ trợ khi Ruby được biên dịch bằng GCC, Clang, hoặc Microsoft VC++, cần có sẵn tại thời điểm chạy. Nếu không, bạn chưa thể sử dụng nó.

Tính đến Ruby 2.6.0-rc1, chúng tôi đã đạt được hiệu suất nhanh hơn 1.7 lần so với Ruby 2.5 trên benchmark khối lượng công việc nặng CPU không trivial có tên Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>. Chúng tôi cũng sẽ cải thiện hiệu suất trên khối lượng công việc nặng bộ nhớ như ứng dụng Rails.

Hãy đón chờ kỷ nguyên mới về hiệu suất của Ruby.

## RubyVM::AbstractSyntaxTree [Thử nghiệm]

Ruby 2.6 giới thiệu module `RubyVM::AbstractSyntaxTree`.

Module này có phương thức `parse` phân tích mã ruby cho trước dưới dạng chuỗi và trả về các nút AST (Abstract Syntax Tree), và phương thức `parse_file` phân tích tệp mã ruby cho trước và trả về các nút AST.
Lớp `RubyVM::AbstractSyntaxTree::Node` cũng được giới thiệu. Bạn có thể lấy thông tin vị trí và các nút con từ các đối tượng `Node`. Tính năng này là thử nghiệm. Tính tương thích của cấu trúc các nút AST không được đảm bảo.

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

* Thêm tùy chọn `:exception` để `Kernel#system` ném lỗi thay vì trả về `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Thêm chế độ oneshot [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)
  * Chế độ này kiểm tra "liệu mỗi dòng đã được thực thi ít nhất một lần hay chưa", thay vì "mỗi dòng đã được thực thi bao nhiêu lần". Hook cho mỗi dòng được kích hoạt nhiều nhất một lần, và sau khi kích hoạt, cờ hook sẽ bị xóa, tức là chạy với chi phí bằng không.
  * Thêm tham số từ khóa `:oneshot_lines` cho Coverage.start.
  * Thêm tham số từ khóa `:stop` và `:clear` cho Coverage.result. Nếu `clear` là true, nó xóa bộ đếm về không. Nếu `stop` là true, nó tắt đo coverage.
  * Coverage.line_stub, một hàm helper đơn giản tạo "stub" của line coverage từ mã nguồn cho trước.

* `FileUtils#cp_lr`. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Cải thiện hiệu suất

* Tăng tốc `Proc#call` vì không còn cần quan tâm đến `$SAFE` nữa.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Với benchmark `lc_fizzbuzz` sử dụng `Proc#call` rất nhiều lần, chúng tôi có thể đo được
  cải thiện x1.4 [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

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

* `$SAFE` là trạng thái toàn cục của tiến trình và chúng ta có thể đặt lại thành `0`. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Truyền `safe_level` cho `ERB.new` đã bị deprecated. Các tham số `trim_mode` và `eoutvar` được chuyển thành tham số từ khóa. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Phiên bản Unicode được hỗ trợ đã cập nhật lên 11. Dự kiến sẽ cập nhật lên 12 và 12.1 trong các bản phát hành TEENY tương lai của Ruby 2.6.

* Tích hợp RubyGems 3.0.0.beta3. Các tùy chọn `--ri` và `--rdoc` đã bị xóa. Vui lòng sử dụng các tùy chọn `--document` và `--no-document` thay thế.

* Tích hợp [Bundler](https://github.com/bundler/bundler) làm gem mặc định.

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
để biết chi tiết.

Với các thay đổi đó,
[6376 tệp thay đổi, 227364 thêm(+), 51599 xóa(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
kể từ Ruby 2.5.0!

Hãy tận hưởng lập trình với Ruby 2.6.0-rc1!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
