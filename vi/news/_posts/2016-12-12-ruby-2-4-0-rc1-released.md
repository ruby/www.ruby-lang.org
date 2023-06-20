---
layout: news_post
title: "Phát hành Ruby 2.4.0-rc1"
author: "naruse"
translator: "Hiền Vương"
date: 2016-12-12 09:00:00 +0000
lang: vi
---

Chúng tôi rất hân hạnh được thông báo về việc phát hành Ruby phiên bản 2.4.0-rc1.

Phiên bản 2.4.0-rc1 là phiên bản release candidate đầu tiên của Ruby 2.4.0.
Phiên bản rc1 này được phát hành để nhận phản hồi từ cộng đồng.
Hãy thoải mái
[gửi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)
vì bạn vẫn có thể sửa những tính năng.

## [Giới thiệu cải tiến hash table (bởi Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Cải tiến cấu trúc bên trong của hash table (st_table) bằng việc giới thiệu open addressing và một mảng bao hàm có thứ tự.
Cải thiện này đã được thảo luận với rất nhiều người, đặc biệt là với Yura Sokolov.

## Binding#irb: Bắt đầu một phiên REPL tương tự như `binding.pry`

Khi bạn debug, bạn có thể thường xuyên sử dụng `p` để xem giá trị của các biến.
Với [pry](https://github.com/pry/pry) bạn có thể sử dụng `binding.pry` trong ứng dụng của bạn để launch một REPL và chạy bất kỳ code Ruby nào.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
giới thiệu `binding.irb` cái mà hành xử giống như vậy với irb.

## [Hợp nhất Fixnum và Bignum vào Integer](https://bugs.ruby-lang.org/issues/12005)

Mặc dù chuẩn [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
không mô tả chi tiết nội dung của lớp Integer,
Ruby hiện đang có hai lớp Integer: Fixnum và Bignum.
Ruby 2.4 gộp hai lớp này thành một lớp là Integer.
Tất cả phần mở rộng của C mà có liên quan đến lớp Fixnum hoặc Bignum thì cần được sửa.

Xem thêm [the ticket](https://bugs.ruby-lang.org/issues/12005) và [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [Lớp String hỗ trợ Unicode trong xử lí hoa-thường](https://bugs.ruby-lang.org/issues/10085)

Hàm `String/Symbol#upcase/downcase/swapcase/capitalize(!)` bây giờ đã hỗ trợ xử lí hoa-thường cho Unicode thay vì chỉ cho ASCII.

## Các cải thiện về hiệu năng

Ruby 2.4 cũng bao gồm các cải thiện về hiệu năng song song với các thay đổi
về chức năng. Sau đây là nội dung của các cải thiện:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` và `[x, y].min` đã được cải tiến để không tạo ra một mảng tạm trong một số điều kiện nhất định.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Thêm hàm `Regexp#match?`, với chức năng thực hiện việc kiểm tra một biểu thức chính quy mà không tạo ra một đối tượng cho các tham chiếu ngược và thay đổi `$~` nhằm giảm việc khởi tạo các đối tượng.

### Những cải thiện về hiệu năng khác

* [Tăng tốc độ truy cập biến instance](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby sẽ bỏ qua các exception trong các thread trừ khi có một thread khác tham
gia vào tiến trình của thread có exception. Tuy nhiên với việc set `report_on_exception = true`, bạn có thể nhận biết được việc thread bị
kết thúc bởi một exception chưa được xử lý.

Hãy góp ý thêm cho chúng tôi về giá trị mặc định của `report_on_exception`
và về việc report-on-GC (thống kê ở Garbage Collection), cái mà đưa ra một báo cáo khi một thread được dọn dẹp mà không tham gia.

### [Khi phát hiện ra Thread Deadlock, Ruby sẽ hiển thị các threads bị lỗi với backtrace và dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby đã có cơ chế phát hiện deadlock của các threads, tuy nhiên các thông tin
được báo cáo về deadlock thường không đầy đủ cho việc debug.
Từ bản 2.4 trở đi, khi phát hiện ra Deadlock, Ruby sẽ hiển thị các thread cùng với backtrace và các threads liên quan.

Mời mọi người dùng thử và cảm nhận việc lập trình với Ruby 2.4.0-rc1, và
[gửi phản hồi cho chúng tôi](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Thay đổi đáng chú ý so với phiên bản 2.3

* Hỗ trợ OpenSSL 1.1.0 (ngừng hỗ trợ cho 0.9.7 hoặc cũ hơn)
* ext/tk được bỏ khỏi stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC được bỏ khỏi stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Xem thêm [Thông tin](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
hoặc lịch sử commit để biết thêm chi tiết.

Với những sự thay đổi này,
[2519 files changed, 288606 insertions(+), 83896 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
so với Ruby 2.3.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Lời nhắn của lần release này

Xem thêm thông tin về kế hoạch release và các nội dung khác ở đây:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
