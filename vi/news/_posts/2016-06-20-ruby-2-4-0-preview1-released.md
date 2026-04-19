---
layout: news_post
title: "Phát hành Ruby 2.4.0-preview1"
author: "naruse"
translator:
date: 2016-06-20 09:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.4.0-preview1.

Ruby 2.4.0-preview1 là bản xem trước đầu tiên của Ruby 2.4.0.
Bản preview1 này được phát hành sớm hơn bình thường vì nó bao gồm rất
nhiều tính năng mới và cải tiến.
Hãy thoải mái
[gửi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)
vì bạn vẫn có thể thay đổi các tính năng.

## [Hợp nhất Fixnum và Bignum thành Integer](https://bugs.ruby-lang.org/issues/12005)

Mặc dù [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
không chỉ định chi tiết về lớp Integer,
CRuby có hai lớp Integer hiển thị: Fixnum và Bignum.
Ruby 2.4 hợp nhất chúng thành Integer.

## [String hỗ trợ ánh xạ chữ hoa/thường Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` giờ đây xử lý
ánh xạ chữ hoa/thường Unicode thay vì chỉ ánh xạ ASCII.

## Cải thiện hiệu suất

Ruby 2.4 cũng bao gồm các cải thiện hiệu suất sau bao gồm
các thay đổi ngôn ngữ:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` và `[x, y].min` được tối ưu hóa để không tạo mảng tạm thời
trong một số điều kiện nhất định.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Thêm `Regexp#match?`, thực thi khớp biểu thức chính quy mà không tạo
đối tượng tham chiếu ngược và thay đổi `$~` để giảm cấp phát đối tượng.

### Các cải thiện hiệu suất khác

* [tăng tốc truy cập biến instance](https://bugs.ruby-lang.org/issues/12274)

## Gỡ lỗi

### [Thread#report_on_exception và Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby bỏ qua các ngoại lệ trong thread trừ khi một thread khác tường minh join chúng.
Với `report_on_exception = true`,
bạn có thể nhận biết nếu một thread đã chết do một ngoại lệ không được xử lý.

Gửi cho chúng tôi phản hồi về giá trị mặc định nên là gì cho `report_on_exception`
và về report-on-GC.

### [Phát hiện deadlock Thread giờ đây hiển thị các thread với backtrace và dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby có khả năng phát hiện deadlock xung quanh các thread đang chờ, nhưng báo cáo không
bao gồm đủ thông tin để gỡ lỗi.
Phát hiện deadlock của Ruby 2.4 hiển thị các thread với backtrace và
các thread phụ thuộc.

Hãy thử và tận hưởng lập trình với Ruby 2.4.0-preview1, và
[gửi cho chúng tôi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Thay đổi đáng chú ý kể từ 2.3

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
và [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
để biết chi tiết.

Với những thay đổi đó,
[1140 tập tin thay đổi, 33126 dòng thêm(+), 50993 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)
kể từ Ruby 2.3.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Ghi chú phát hành

Xem thêm lịch phát hành và thông tin khác:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
