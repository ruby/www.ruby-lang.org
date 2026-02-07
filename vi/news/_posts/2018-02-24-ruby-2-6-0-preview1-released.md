---
layout: news_post
title: "Phát hành Ruby 2.6.0-preview1"
author: "naruse"
translator:
date: 2018-02-24 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.6.0-preview1.

Ruby 2.6.0-preview1 là bản xem trước đầu tiên hướng tới Ruby 2.6.0.
Bản preview1 này được phát hành sớm hơn bình thường vì nó bao gồm một tính năng mới quan trọng, JIT.

## JIT

Ruby 2.6 giới thiệu bản triển khai ban đầu của trình biên dịch JIT (Just-in-time).

Trình biên dịch JIT nhằm cải thiện hiệu suất thực thi của bất kỳ chương trình Ruby nào.
Không giống như các trình biên dịch JIT thông thường cho các ngôn ngữ khác, trình biên dịch JIT của Ruby thực hiện biên dịch JIT theo cách độc đáo, in mã C ra đĩa và tạo tiến trình trình biên dịch C thông thường để sinh mã gốc (native code).
Xem thêm: [Tổ chức MJIT bởi Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Cách sử dụng: Chỉ cần thêm `--jit` vào dòng lệnh hoặc biến môi trường `$RUBYOPT`. Thêm `--jit-verbose=1` cho phép in thông tin cơ bản về quá trình biên dịch JIT đang diễn ra. Xem `ruby --help` để biết các tùy chọn khác.

Mục đích chính của bản phát hành JIT này là cung cấp cơ hội để kiểm tra xem nó có hoạt động trên nền tảng của bạn không và phát hiện các rủi ro bảo mật trước bản phát hành 2.6.
Hiện tại, trình biên dịch JIT chỉ được hỗ trợ khi Ruby được xây dựng bởi gcc hoặc clang và trình biên dịch có sẵn tại thời điểm chạy. Nếu không, bạn chưa thể sử dụng nó.

Tính đến phiên bản 2.6.0-preview1, chúng tôi mới chỉ chuẩn bị cơ sở hạ tầng cho JIT và rất ít tối ưu hóa được triển khai. Bạn có thể đo lường một số cải thiện tiềm năng trong các benchmark nhỏ với bản phát hành này, nhưng nó CHƯA sẵn sàng để benchmark hiệu suất cuối cùng của trình biên dịch JIT của Ruby, đặc biệt là cho các chương trình lớn như ứng dụng Rails.

Chúng tôi sẽ triển khai method inlining trong trình biên dịch JIT, điều này được kỳ vọng sẽ tăng hiệu suất Ruby đáng kể.

Ngoài ra, chúng tôi đang lên kế hoạch tăng số nền tảng được hỗ trợ, và kế hoạch tiếp theo là hỗ trợ Visual Studio.

Hãy đón chờ kỷ nguyên mới về hiệu suất của Ruby.

## Tính năng mới

* Thêm `Random.bytes`. [Feature #4938]
* Thêm `Binding#source_location`.  [Feature #14230]

  Phương thức này trả về vị trí nguồn của binding, một mảng 2 phần tử gồm `__FILE__` và `__LINE__`.  Theo truyền thống, cùng thông tin này có thể được lấy bằng `eval("[__FILE__, __LINE__]", binding)`, nhưng chúng tôi đang lên kế hoạch thay đổi hành vi này để `Kernel#eval` bỏ qua vị trí nguồn của binding [Bug #4352].  Vì vậy, người dùng nên sử dụng phương thức mới này thay vì `Kernel#eval`.

* Thêm tùy chọn `:exception` để `Kernel.#system` đưa ra lỗi thay vì trả về `false`. [Feature #14386]

## Cải thiện hiệu suất

* Tăng tốc `Proc#call` vì chúng ta không cần quan tâm đến `$SAFE` nữa.
  [Feature #14318]

  Với benchmark `lc_fizzbuzz` sử dụng `Proc#call` rất nhiều lần, chúng tôi đo được
  cải thiện x1.4 [Bug #10212].

* Tăng tốc `block.call` khi `block` là tham số block được truyền vào. [Feature #14330]

  Ruby 2.5 cải thiện hiệu suất truyền block. [Feature #14045]
  Thêm vào đó, Ruby 2.6 cải thiện hiệu suất gọi block được truyền vào.
  Với micro-benchmark, chúng tôi quan sát được cải thiện 2.6x.

## Các thay đổi đáng chú ý khác kể từ 2.5

* `$SAFE` là trạng thái toàn cục của tiến trình và chúng ta có thể đặt lại về `0`. [Feature #14250]

* Truyền `safe_level` cho `ERB.new` đã bị deprecated. Các đối số `trim_mode` và `eoutvar` được chuyển thành keyword argument. [Feature #14256]

* Tích hợp RubyGems 2.7.6

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
để biết chi tiết.

Với những thay đổi đó,
[1115 tệp thay đổi, 23023 thêm(+), 14748 xóa(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
kể từ Ruby 2.5.0!

Hôm nay, ngày 24 tháng 2, là sinh nhật lần thứ 25 của Ruby.
Chúc mừng sinh nhật Ruby, và hãy tận hưởng lập trình với Ruby 2.6.0-preview1!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
