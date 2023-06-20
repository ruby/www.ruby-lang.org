---
layout: news_post
title: "Phát hành Ruby 2.4.0-preview1"
author: "naruse"
translator: "Tạ Duy Anh"
date: 2016-06-20 09:00:00 +0000
lang: vi
---

Chúng tôi rất hân hạnh được thông báo về việc phát hành Ruby phiên bản
2.4.0-preview1.

Phiên bản Ruby 2.4.0-preview1 là phiên bản preview đầu tiên của Ruby 2.4.0.
Bản preview1 lần này được phát hành sớm hơn so với thông thường vì nó bao gồm rất
nhiều chức năng và cải tiến. Mọi người đừng ngại
[phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report) lại cho
chúng tôi về phiên bản này, vì các chức năng vẫn có thể được thay đổi và cập nhật.

## [Hợp nhất Fixnum và Bignum vào Integer](https://bugs.ruby-lang.org/issues/12005)

Mặc dù chuẩn [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
không mô tả chi tiết nội dung của lớp (class) Integer, CRuby
hiện đang tồn tại hai lớp `Integer` : `Fixnum` và `Bignum`. Ruby 2.4 đã thống
nhất lại và gộp chung 2 lớp này thành 1 lớp có tên là `Integer`.

## [Lớp String hỗ trợ Unicode trong việc xử lý hoa-thường](https://bugs.ruby-lang.org/issues/10085)

Hàm `String/Symbol#upcase/downcase/swapcase/capitalize(!)` ở phiên bản 2.4.0 đã
hỗ trợ việc biến đổi hoa - thường cho các ký tự Unicode
(vi du: `'Türkiye'.upcase 'tr' # => 'TÜRKİYE'`).

## Cải thiện hiệu năng

Ruby 2.4 cũng bao gồm các cải thiện về hiệu năng song song với các thay đổi
về chức năng. Sau đây là nội dung của các cải thiện:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` và `[x, y].min` đã được tinh chỉnh lại để ko tạo các mảng
tạm (temporary array) trong một số  trường hợp.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Thêm hàm `Regexp#match?`, với chức năng thực hiện việc kiểm tra (match)
một biểu thức chính quy mà không tạo ra object cho các tham chiếu ngược
(`back reference`) và thay đổi `$~` nhằm giảm việc khởi tạo các đối tượng.

### Một số cải tiến khác

* [Tăng tốc độ truy cập biến instance](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception và Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby sẽ bỏ qua các exception trong các thread trừ khi có một thread khác tham
gia vào tiến trình của thread có exception. Tuy nhiên với việc
set `report_on_exception = true`, bạn có thể nhận biết được việc thread bị
kết thúc bởi một exception chưa  được xử lý.

Hãy góp ý thêm cho chúng tôi về giá trị mặc định của `report_on_exception`
và về việc report-on-GC (thống kê ở Garbage Collection).

### [Khi phát hiện ra Thread Deadlock, Ruby sẽ hiển thị các threads bị lỗi với backtrace và dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby đã có cơ chế phát hiện deadlock của các threads, tuy nhiên các thông tin
được báo cáo về deadlock thường không đầy đủ cho việc debug. Từ bản 2.4 trở đi,
khi phát hiện ra Deadlock, Ruby sẽ hiển thị các thread cùng với backtrace
và các threads liên quan.

Mời mọi người dùng thử và cảm nhận việc lập trình với Ruby 2.4.0-preview1,
đồng thời [gửi phản hồi cho chúng tôi](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Thay đổi đáng chú ý so với phiên bản 2.3

Chi tiết mời xem [Thông tin](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS) và
[ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog).

Với lần cập nhật này, [1140 files đã được cập nhật, bao gồm 33126 insertion và 50993 deletions so với phiên bản 2.3.0](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)!

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

## Lời nhắn của lần release này

Xem thêm thông tin về kế hoạch release và các nội dung khác ở đây:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
