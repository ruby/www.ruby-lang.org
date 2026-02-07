---
layout: news_post
title: "Phát hành Ruby 2.4.0-preview2"
author: "naruse"
translator:
date: 2016-09-08 09:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 là bản xem trước thứ hai của Ruby 2.4.0.
Bản preview2 này được phát hành để nhận phản hồi từ cộng đồng.
Hãy thoải mái
[gửi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)
vì bạn vẫn có thể ảnh hưởng đến các tính năng.

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

Hãy thử và tận hưởng lập trình với Ruby 2.4.0-preview2, và
[gửi cho chúng tôi phản hồi](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Các thay đổi đáng chú ý khác kể từ 2.3

* Hỗ trợ OpenSSL 1.1.0
* ext/tk đã bị loại bỏ khỏi stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
và [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
để biết chi tiết.

Với những thay đổi đó,
[2353 tập tin thay đổi, 289057 dòng thêm(+), 73847 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
kể từ Ruby 2.3.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Ghi chú phát hành

Xem thêm lịch phát hành và thông tin khác:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
