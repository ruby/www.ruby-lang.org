---
layout: news_post
title: "Phát hành Ruby 2.4.0"
author: "naruse"
translator:
date: 2016-12-25 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.4.0.

Ruby 2.4.0 là bản phát hành ổn định đầu tiên của dòng Ruby 2.4.
Nó giới thiệu nhiều tính năng mới, ví dụ:

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

## Các thay đổi đáng chú ý khác kể từ 2.3

* Hỗ trợ OpenSSL 1.1.0 (ngừng hỗ trợ 0.9.7 trở về trước)
* ext/tk đã bị loại bỏ khỏi stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC đã bị loại bỏ khỏi stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
hoặc nhật ký commit để biết chi tiết.

Với những thay đổi đó,
[2523 tập tin thay đổi, 289129 dòng thêm(+), 84670 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
kể từ Ruby 2.3.0!

Chúc Giáng Sinh vui vẻ, Chúc mừng các ngày lễ, và hãy tận hưởng lập trình với Ruby 2.4!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
