---
layout: news_post
title: "Phát hành Ruby 2.4.0-preview3"
author: "naruse"
translator:
date: 2016-11-09 09:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.4.0-preview3.

Ruby 2.4.0-preview3 là bản xem trước thứ ba của Ruby 2.4.0.
Bản preview3 này được phát hành để nhận phản hồi từ cộng đồng.
Hãy thoải mái
[gửi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)
vì bạn vẫn có thể ảnh hưởng đến các tính năng.

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

Hãy thử và tận hưởng lập trình với Ruby 2.4.0-preview3, và
[gửi cho chúng tôi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Các thay đổi đáng chú ý khác kể từ 2.3

* Hỗ trợ OpenSSL 1.1.0
* ext/tk đã bị loại bỏ khỏi stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC đã bị loại bỏ khỏi stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
và [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
để biết chi tiết.

Với những thay đổi đó,
[2470 tập tin thay đổi, 283051 dòng thêm(+), 64902 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)
kể từ Ruby 2.3.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Ghi chú phát hành

Xem thêm lịch phát hành và thông tin khác:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
