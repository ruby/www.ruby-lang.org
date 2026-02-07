---
layout: news_post
title: "Phát hành Ruby 2.4.0-rc1"
author: "naruse"
translator:
date: 2016-12-12 09:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.4.0-rc1.

Ruby 2.4.0-rc1 là bản release candidate đầu tiên của Ruby 2.4.0.
Bản rc1 này được phát hành để nhận phản hồi từ cộng đồng.
Hãy thoải mái
[gửi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)
vì bạn vẫn có thể sửa các tính năng.

## [Giới thiệu cải tiến bảng băm (bởi Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Cải tiến cấu trúc nội bộ của bảng băm (st_table) bằng cách giới thiệu địa chỉ mở
và một mảng thứ tự bao gồm.
Cải tiến này đã được thảo luận với nhiều người, đặc biệt là Yura Sokolov.

## Binding#irb: Bắt đầu phiên REPL tương tự `binding.pry`

Trong khi gỡ lỗi, bạn có thể thường sử dụng `p` để xem giá trị của biến.
Với [pry](https://github.com/pry/pry) bạn có thể sử dụng `binding.pry` trong ứng dụng
để khởi chạy REPL và chạy bất kỳ mã Ruby nào.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
giới thiệu `binding.irb` hoạt động tương tự với irb.

## [Hợp nhất Fixnum và Bignum thành Integer](https://bugs.ruby-lang.org/issues/12005)

Mặc dù [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
không chỉ định chi tiết về lớp Integer,
Ruby có hai lớp Integer hiển thị: Fixnum và Bignum.
Ruby 2.4 hợp nhất chúng thành Integer.
Tất cả các phần mở rộng C liên quan đến lớp Fixnum hoặc Bignum cần được sửa.

Xem thêm [ticket](https://bugs.ruby-lang.org/issues/12005) và [slide của akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

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
và về report-on-GC, hiển thị báo cáo khi một thread bị
thu gom rác mà không join.

### [Phát hiện deadlock Thread giờ đây hiển thị các thread với backtrace và dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby có khả năng phát hiện deadlock xung quanh các thread đang chờ, nhưng báo cáo không
bao gồm đủ thông tin để gỡ lỗi.
Phát hiện deadlock của Ruby 2.4 hiển thị các thread với backtrace và
các thread phụ thuộc.

Hãy thử và tận hưởng lập trình với Ruby 2.4.0-rc1, và
[gửi cho chúng tôi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Các thay đổi đáng chú ý khác kể từ 2.3

* Hỗ trợ OpenSSL 1.1.0 (ngừng hỗ trợ 0.9.7 trở về trước)
* ext/tk đã bị loại bỏ khỏi stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC đã bị loại bỏ khỏi stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
hoặc nhật ký commit để biết chi tiết.

Với những thay đổi đó,
[2519 tập tin thay đổi, 288606 dòng thêm(+), 83896 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
kể từ Ruby 2.3.0!

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

## Ghi chú phát hành

Xem thêm lịch phát hành và thông tin khác:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
