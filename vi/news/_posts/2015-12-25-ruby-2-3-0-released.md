---
layout: news_post
title: "Phát hành Ruby 2.3.0"
author: "naruse"
translator: "Nguyễn Đức Giang"
date: 2015-12-25 17:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo việc phát hành Ruby 2.3.0.

Đây là phiên bản ổn định đầu tiên của sê-ri Ruby 2.3.
Phiên bản này giới thiệu nhiều tính năng mới, như:

Giới thiệu
[Frozen String Literal Pragma](https://bugs.ruby-lang.org/issues/11473).
Trong Ruby 2.1, `"str".freeze` được tối ưu để giảm số lượng đối tượng tạo ra.
Ruby 2.3 giới thiệu một magic comment và một tùy chọn cho command line để đóng
băng tất cả các chuỗi trong tệp mã nguồn. Ngoài ra, bạn có thể sử dụng tùy
chọn `--debug=frozen-string-literal` trong command line để xem các đối được
tạo ra ở đâu khi debug lỗi `"can't modify frozen String"`.

[Safe navigation operator](https://bugs.ruby-lang.org/issues/11537)
([hay còn gọi là lonely operator](https://instagram.com/p/-M9l6mRPLR/)) `&.`,
đã hiện diện trong C#, Groovy, và Swift, được giới thiệu để làm giảm
thiểu sự phiền toái khi xử lý `nil` với cú pháp `obj&.foo`. `Array#dig` và
`Hash#dig` cũng mới được thêm vào, chúng hoạt động giống như
[try! trong Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
vốn được tạo ra để xử lý trường hợp `nil`.

[Tích hợp did_you_mean gem](https://bugs.ruby-lang.org/issues/11252).
did_you_mean gem đưa ra một số lời khuyên khi gặp `NameError` và
`NoMethodError`, giúp cho việc debug dễ dàng hơn.

[RubyVM::InstructionSequence#to_binary and .load_from_binary](https://bugs.ruby-lang.org/issues/11788)
là các tính năng thử nghiệm được giới thiệu trong phiên bản này. Với các chức
năng này chúng ta có thể tạo ra một hệ thống tiền biên dịch ISeq (bytecode).

Ruby 2.3.0 còn có rất nhiều cải thiện về hiệu suất, như
[xem xét lại phần cấu trúc dữ liệu hàm nhập](https://bugs.ruby-lang.org/issues/11278),
[giới thiệu kiểu cấu trúc dữ liệu bảng mới](https://bugs.ruby-lang.org/issues/11420),
[tối ưu Proc#call](https://bugs.ruby-lang.org/issues/11569),
hiệu chỉnh ở tầng mã máy cho việc gán phần tử và hàm gọi mã,
[cấu trúc dữ liệu instance variable thông minh hơn](https://bugs.ruby-lang.org/issues/11170),
[hỗ trợ keyword argument `exception: false` cho Socket#*_nonblock methods](https://bugs.ruby-lang.org/issues/11229).
Vui lòng xem phần "Implementation improvements" trong tệp tin NEWS.

Để biết đầy đủ danh sách các tính năng mới và các lưu ý về vấn đề tương thích,
vui lòng xem
[NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) và
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Để có những thay đổi trên,
[2946 tệp tin đã được thay đổi, 104057 dòng được thêm vào(+), 59478 dòng được xóa đi(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0)
kể từ Ruby 2.2.0!

Chúc mừng Giáng sinh, chúc các bạn có một kì nghỉ vui vẻ, và có những giây
phút lập trình đầy hứng khởi với Ruby 2.3!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
