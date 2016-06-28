---
layout: news_post
title: "Phát hành Ruby 2.4.0-preview1"
author: "naruse"
translator: "Tạ Duy Anh"
date: 2016-06-20 18:00:00 +0900
lang: vi
---

Chúng tôi rất hân hạnh được thông báo về việc phát hành Ruby phiên bản
2.4.0-preview1.

Phiên bản Ruby 2.4.0-preview1 là phiên bản preview đầu tiên của Ruby 2.4.0.
Bản preview1 lần này được phát hành sớm hơn so với thông thường vì nó bao gồm rất
nhiều chức năng và cải tiến. Mọi người đừng ngại
[phản hồi](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport) lại cho
chúng tôi về phiên bản này, vì các chức năng vẫn có thể được thay đổi và cập nhật.

## [Hợp nhất Fixnum và Bignum vào Integer](https://bugs.ruby-lang.org/issues/12005)

Mặc dù chuẩn [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) không mô tả chi tiết nội dung của lớp (class) Integer, CRuby
hiện đang tồn tại hai lớp `Integer` : `Fixnum` và `Bignum`. Ruby 2.4 đã thống
nhất lại và gộp chung 2 lớp này thành 1 lớp có tên là `Integer`.

## [Lớp String hỗ trợ Unicode trong việc xử lý hoa-thường](https://bugs.ruby-lang.org/issues/10085)

Hàm `String/Symbol#upcase/downcase/swapcase/capitalize(!)` ở phiên bản 2.4.0 đã
hỗ trợ việc biến đổi hoa - thường cho các ký tự Unicode
(vi du: `'Türkiye'.upcase 'tr' # => 'TÜRKİYE'`)

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
đồng thời [gửi phản hồi cho chúng tôi](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)!

## Thay đổi đáng chú ý so với phiên bản 2.3

Chi tiết mời xem [Thông tin](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS) và
[Changelog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog).

Với lần cập nhật này, [1140 files đã được cập nhật, bao gồm 33126 insertion và 50933 deletions so với phiên bản 2.3.0](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)!

## Tải về

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.tar.bz2)

      SIZE:   12015299 bytes
      SHA1:   22dcd759d8cbb14c8735988fbc7ee5c35f9d4720
      SHA256: a74675578a9a801ac25eb7152bef3023432d6267f875b198eb9cd6944a5bf4f1
      SHA512: 4b7213695416876e4de3cbce912f61ac89db052c74f0daa8424477991cfc49b07300e960177ff576b634a97ee8afef3c5aded5d5806329dbd01d0ce7b42b9b63

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.tar.gz)

      SIZE:   15165837 bytes
      SHA1:   2a5194b1fd42a3f1f23f1e0844ae78332a9efd5d
      SHA256: fb2e454d7a5e5a39eb54db0ec666f53eeb6edc593d1d2b970ae4d150b831dd20
      SHA512: 5f9c0cc3d10b4e04c63f001b4add782c34b9f260368f48b443b397cea57680d328f7c28cbb2a9be4c2f5acd114bac07dacb100d57018fa4d2a1792fc03083418

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.tar.xz)

      SIZE:   9362868 bytes
      SHA1:   adcc9e10b8f7add0e19f8c70afc134c069a862ca
      SHA256: 5be9f8d5d29d252cd7f969ab7550e31bbb001feb4a83532301c0dd3b5006e148
      SHA512: 72406ac133af7f057d4633d2a300e49e133881f6b36ff4cdf6c72b4ff4325de332fc5a45c96ea407140a8bf09cdc307e13107c539196902e5b67b7d24cd72dc9

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.10.zip)

      SIZE:   16706304 bytes
      SHA1:   402158192b7673cb4e7a67f48f6d93945bc9fd13
      SHA256: 21cf83156ec782d17827fb9c8a945626dfd68cf0d9eb5ca7a78b12eb91c6f1fb
      SHA512: 5490fc4726a1efaea8c7c541ca3102013b00a0af2903d15009307265c93b218bb13aab0007d279823c740a9b173d957ca79f2d8f25932f04763ec1aa18d164e8

## Lời nhắn của lần release này

Xem thêm thông tin về kế hoạch release và các nội dung khác ở đây:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering24)