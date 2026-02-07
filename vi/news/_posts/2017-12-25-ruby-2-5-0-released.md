---
layout: news_post
title: "Phát hành Ruby 2.5.0"
author: "naruse"
translator:
date: 2017-12-25 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.5.0.

Ruby 2.5.0 là phiên bản ổn định đầu tiên của dòng Ruby 2.5.
Phiên bản này giới thiệu nhiều tính năng mới và cải thiện hiệu suất.
Các thay đổi đáng chú ý bao gồm:

## Tính năng mới

* `rescue`/`else`/`ensure` hiện được phép sử dụng trực tiếp với
  khối `do`/`end`.
  [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
* Thêm `yield_self` để yield block đã cho trong ngữ cảnh của nó.
  Khác với `tap`, nó trả về kết quả của block.
  [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
* Hỗ trợ đo lường độ phủ nhánh và độ phủ phương thức.
  Độ phủ nhánh cho biết nhánh nào được thực thi và nhánh nào không.
  Độ phủ phương thức cho biết phương thức nào được gọi và phương thức nào không.
  Bằng cách chạy bộ test với các tính năng mới này, bạn sẽ biết được
  nhánh và phương thức nào được thực thi, và đánh giá tổng độ phủ của bộ test
  một cách chặt chẽ hơn.
  [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)
  và Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new có thể tạo các lớp chấp nhận đối số từ khóa.
  [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none?, và one? chấp nhận đối số pattern.
  [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
* Tìm kiếm hằng số cấp cao nhất không còn khả dụng.
  [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
* Một trong những thư viện được yêu thích nhất, pp.rb, hiện được tải tự động.
  Bạn không cần phải viết `require "pp"` nữa.
  [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
* In backtrace và thông báo lỗi theo thứ tự ngược (lời gọi cũ nhất trước,
  lời gọi gần nhất sau). Khi một backtrace dài xuất hiện trên terminal (TTY) của bạn,
  bạn có thể dễ dàng tìm dòng gây lỗi ở cuối backtrace.
  Lưu ý rằng thứ tự chỉ được đảo ngược khi backtrace được in trực tiếp
  ra terminal.
  [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [thử nghiệm]

## Cải thiện hiệu suất

* Cải thiện hiệu suất khoảng 5-10% bằng cách loại bỏ tất cả lệnh `trace`
  khỏi toàn bộ bytecode (chuỗi lệnh).
  Lệnh `trace` được thêm để hỗ trợ `TracePoint`.
  Tuy nhiên, trong hầu hết các trường hợp, `TracePoint` không được sử dụng và lệnh `trace`
  là chi phí thuần túy. Thay vào đó, bây giờ chúng tôi sử dụng kỹ thuật instrumentation động.
  Xem [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104) để biết thêm chi tiết.
* Truyền block bằng tham số block (ví dụ `def foo(&b); bar(&b); end`)
  nhanh hơn khoảng 3 lần so với Ruby 2.4 nhờ kỹ thuật "Lazy Proc allocation".
  [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
* Mutex được viết lại nhỏ hơn và nhanh hơn.
  [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB hiện tạo mã từ template nhanh gấp đôi so với Ruby 2.4.
* Cải thiện hiệu suất của một số phương thức tích hợp bao gồm `Array#concat`,
  `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+`, và nhiều hơn nữa.
* IO.copy_stream sử dụng copy_file_range(2) để giảm tải sao chép.
  [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## Các thay đổi đáng chú ý khác kể từ 2.4

* SecureRandom hiện ưu tiên nguồn do hệ điều hành cung cấp thay vì OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* Nâng cấp cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib từ thư viện chuẩn
  thành gem mặc định.
* Cập nhật [Onigmo](https://github.com/k-takata/Onigmo/) lên 6.1.3.
  * Nó thêm [toán tử vắng mặt](https://github.com/k-takata/Onigmo/issues/87).
  * Lưu ý rằng [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/) cũng bao gồm thay đổi này.
* Cập nhật Psych lên 3.0.2.
* Cập nhật RubyGems lên 2.7.3.
* Cập nhật RDoc lên 6.0.1.
  * [Chuyển lexer từ dựa trên IRB sang Ripper](https://github.com/ruby/rdoc/pull/512).
    Điều này cải thiện đáng kể hiệu suất tạo tài liệu.
  * Sửa một lượng lớn lỗi tồn tại hơn mười năm.
  * Thêm hỗ trợ cú pháp Ruby mới từ các phiên bản gần đây.
* Cập nhật phiên bản Unicode được hỗ trợ lên 10.0.0.
* `Thread.report_on_exception` hiện được đặt thành true theo mặc định.
  Thay đổi này giúp gỡ lỗi các chương trình đa luồng.
  [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write hiện nhận nhiều đối số.
  [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
hoặc [nhật ký thay đổi](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
để biết chi tiết.

Với những thay đổi đó,
[6158 tập tin thay đổi, 348484 dòng thêm(+), 82747 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
kể từ Ruby 2.4.0!

Chúc Giáng sinh vui vẻ, Chúc mừng ngày lễ, và hãy tận hưởng lập trình với Ruby 2.5!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
