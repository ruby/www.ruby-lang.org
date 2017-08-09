---
layout: news_post
title: "Phát hành Ruby 2.4.0"
author: "naruse"
translator:
date: 2016-12-25 00:00:00 +0000
lang: vi
---

Chúng tôi rất hân hạnh được thông báo về việc phát hành Ruby phiên bản 2.4.0.

Ruby 2.4.0 là phiên bản stable đầu tiên của Ruby 2.4.0 gồm nhiều tính năng mới như:

## [Giới thiệu cải tiến hash table (bởi Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Cải thiện cấu trúc bên trong của hash table (st_table) bằng việc giới thiệu
open addressing và một mảng bao hàm có thứ tự.
Cải thiện này đã được rất nhiều người chấp nhận, đặc biệt là Yura Sokolov.

## Binding#irb: Bắt đầu một REPL session tương tự như `binding.pry`

Thông thường bạn có thể dùng `p` để xem giá trị của các biến trong quá trình debug.
Với [pry](https://github.com/pry/pry) bạn có thể dùng `binding.pry` để chạy REPL và
debug ở bất kỳ dòng code nào.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
 giới thiệu `binding.irb` có tính năng tương tự trong IRB.

## [Hợp nhất Fixnum và Bignum vào Integer](https://bugs.ruby-lang.org/issues/12005)

Mặc dù chuẩn [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
không mô tả chi tiết nội dung của lớp Integer,
Ruby hiện đang có hai lớp Integer: Fixnum và Bignum.
Ruby 2.4 gộp hai lớp này thành một lớp là Integer.
Tất cả các extensions của C mà có liên quan đến lớp Fixnum hoặc Bignum
thì cần được thay đổi.

Xem thêm [the ticket](https://bugs.ruby-lang.org/issues/12005) và [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [Class String hỗ trợ Unicode trong xử lí chữ hoa, chữ thường](https://bugs.ruby-lang.org/issues/10085)

Hàm `String/Symbol#upcase/downcase/swapcase/capitalize(!)` bây giờ đã có thể xử lý hoa-thường cho cả Unicode (thay vì chỉ cho ASCII).

## Các cải thiện về hiệu năng

Ruby 2.4 cũng bao gồm các cải thiện về hiệu năng như sau:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` và `[x, y].min` đã được cải tiến để không tạo ra một mảng tạm trong một số trường hợp.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Hàm `Regexp#match?` đã được thêm vào với chức năng thực hiện việc kiểm tra một
biểu thức chính quy mà không tạo ra một đối tượng cho các tham chiếu ngược lai
và thay đổi `$~` nhằm giảm việc khởi tạo các đối tượng.

### Những sự cải thiện về hiệu năng khác

* [Tăng tốc độ truy cập biến instance](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby sẽ bỏ qua các exception trong các thread nếu không có một thread khác tham
gia vào tiến trình của thread có exception. Tuy nhiên với việc set `report_on_exception = true`,
bạn có thể nhận biết được việc thread bị kết thúc bởi một exception chưa được xử lý.

Gửi góp ý cho chúng tôi về giá trị mặc định của `report_on_exception`
và report-on-GC (tính năng sẽ đưa ra báo cáo khi một thread được dọn dẹp mà không tham gia).

### [Khi phát hiện ra Thread Deadlock, Ruby sẽ hiển thị các threads bị lỗi với backtrace và dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby đã có cơ chế phát hiện deadlock của các threads, tuy nhiên các thông tin
được báo cáo về deadlock thường không đầy đủ cho việc debug.
Từ bản 2.4 trở đi, khi phát hiện ra Deadlock, Ruby sẽ hiển thị các thread cùng với
backtrace và các threads liên quan.

## Thay đổi đáng chú ý so với phiên bản 2.3

* Hỗ trợ OpenSSL 1.1.0 (ngừng hỗ trợ cho 0.9.7 hoặc cũ hơn)
* ext/tk được bỏ khỏi stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC được bỏ khỏi stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Xem thêm [Thông tin](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
hoặc lịch sử commit để biết thêm chi tiết.

Với những sự thay đổi này,
[2519 files changed, 288606 insertions(+), 83896 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
so với Ruby 2.3.0!

Giáng sinh vui vẻ :) đừng quên Ruby 2.4!

## Download

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
