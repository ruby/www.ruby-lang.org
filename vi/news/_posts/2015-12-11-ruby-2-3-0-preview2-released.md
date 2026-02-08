---
layout: news_post
title: "Phát hành Ruby 2.3.0-preview2"
author: "naruse"
translator:
date: 2015-12-11 14:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.3.0-preview2.

Ruby 2.3.0-preview2 là bản xem trước thứ hai của Ruby 2.3.0.
Nhiều tính năng mới và cải tiến đã được bao gồm.

Một [Frozen String Literal Pragma](https://bugs.ruby-lang.org/issues/11473)
được giới thiệu.
Với Ruby 2.1, `"str".freeze` đã được tối ưu hóa để giảm việc cấp phát đối tượng.
Ruby 2.3 giới thiệu một magic comment mới và tùy chọn dòng lệnh để
đóng băng tất cả các chuỗi ký tự trong tập tin nguồn.
Ngoài ra để gỡ lỗi, bạn có thể biết đối tượng được tạo ở đâu khi gặp
lỗi `"can't modify frozen String"` bằng cách sử dụng tùy chọn dòng lệnh
`--debug=frozen-string-literal`.

Một [toán tử điều hướng an toàn](https://bugs.ruby-lang.org/issues/11537)
([còn gọi là toán tử cô đơn](https://instagram.com/p/-M9l6mRPLR/)) `&.`,
đã tồn tại trong C#, Groovy, và Swift, được giới thiệu để dễ dàng
xử lý `nil` với cú pháp `obj&.foo`. `Array#dig` và `Hash#dig` cũng được thêm vào.

[gem did_you_mean được đi kèm](https://bugs.ruby-lang.org/issues/11252).
Gem did_you_mean
hiển thị các ứng viên khi gặp `NameError` và `NoMethodError` để hỗ trợ
gỡ lỗi.

[RubyVM::InstructionSequence#to_binary và .load_from_binary](https://bugs.ruby-lang.org/issues/11788)
được giới thiệu như các tính năng thử nghiệm.
Với những tính năng này, chúng ta có thể tạo một hệ thống biên dịch trước ISeq (bytecode).

Ruby 2.3 bao gồm nhiều bản sửa lỗi cải thiện hiệu suất.
Ví dụ,
[tối ưu hóa Proc#call](https://bugs.ruby-lang.org/issues/11569),
[xem xét lại cấu trúc dữ liệu method entry](https://bugs.ruby-lang.org/issues/11278),
[giới thiệu cấu trúc dữ liệu bảng mới](https://bugs.ruby-lang.org/issues/11420),
tinh chỉnh mã máy cho việc cấp phát đối tượng và mã gọi phương thức,
và nhiều tối ưu hóa khác.

Hãy thử và tận hưởng lập trình với Ruby 2.3.0-preview2, và báo cáo cho chúng tôi
những gì bạn biết!

## Thay đổi đáng chú ý kể từ 2.2

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS)
và [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
để biết chi tiết.

Với những thay đổi đó, [1097 tập tin thay đổi, 97466 dòng thêm(+), 58685 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2) kể từ Ruby 2.2.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Ghi chú phát hành

Xem thêm lịch phát hành và thông tin khác:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
