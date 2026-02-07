---
layout: news_post
title: "Phát hành Ruby 2.2.0-rc1"
author: "naruse"
translator:
date: 2014-12-18 09:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.2.0-rc1.
Sau RC1, tất cả các thay đổi sẽ chỉ giới hạn ở sửa lỗi.
Bản phát hành chính thức của Ruby 2.2.0 được lên lịch vào ngày 25 tháng 12 năm 2014.

Ruby 2.2 bao gồm nhiều tính năng mới và cải tiến cho các nhu cầu ngày càng
đa dạng và mở rộng của Ruby.

Ví dụ, Garbage Collector của Ruby giờ đây có thể thu gom các đối tượng kiểu Symbol.
Điều này giảm sử dụng bộ nhớ cho Symbol; vì GC trước đó không thể thu gom chúng trước 2.2.
Vì Rails 5.0 sẽ yêu cầu Symbol GC, nó sẽ chỉ hỗ trợ Ruby 2.2 trở lên.
(Xem [bài đăng phát hành Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) để biết chi tiết.)

Ngoài ra, thời gian tạm dừng giảm nhờ Incremental Garbage Collector mới sẽ hữu ích cho việc chạy các ứng dụng Rails. Các phát triển gần đây được đề cập trên [blog Rails](http://weblog.rubyonrails.org/) cho thấy Rails 5.0 sẽ tận dụng Incremental GC cũng như Symbol GC.

Một tính năng khác liên quan đến quản lý bộ nhớ là tùy chọn bổ sung cho `configure.in` để sử dụng jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Tính năng này vẫn đang thử nghiệm và hiện được tắt theo mặc định cho đến khi chúng tôi thu thập dữ liệu hiệu suất và thêm các trường hợp sử dụng. Khi chúng tôi tin tưởng vào lợi ích, tính năng này sẽ được bật theo mặc định.

Hỗ trợ thử nghiệm cho việc sử dụng vfork(2) với system() và spawn() cũng đã được thêm vào. Bạn có thể đọc thêm chi tiết trên [blog của tanaka-san bằng tiếng Nhật](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Điều này có thể mang lại tăng tốc lớn khi một tiến trình lớn thực thi các lệnh bên ngoài nhiều lần.
Tuy nhiên vfork(2) vẫn chưa được hiểu rõ và là một lời gọi hệ thống có thể gây hại. Chúng tôi muốn thử nghiệm để tìm hiểu bao nhiêu lợi ích có thể đạt được qua việc thu thập dữ liệu hiệu suất và các trường hợp sử dụng.

Hãy thử và tận hưởng lập trình với Ruby 2.2.0-rc1, và báo cáo cho chúng tôi những phát hiện của bạn!

## Thay đổi đáng chú ý so với 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([bài thuyết trình tại RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* thư viện core:
  * Hỗ trợ Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Phương thức mới:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* thư viện đi kèm:
  * Cập nhật Psych 2.0.8
  * Cập nhật Rake 10.4.0
  * Cập nhật RDoc 4.2.0.alpha (21b241a)
  * Cập nhật RubyGems 2.4.5
  * Cập nhật test-unit 3.0.8 (xóa khỏi repository nhưng đi kèm
trong tarball)
  * Cập nhật minitest 5.4.3 (xóa khỏi repository nhưng đi kèm trong tarball)
  * Deprecated mathn
* C API
  * Loại bỏ các API đã deprecated

Xem [NEWS trong kho Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) để biết chi tiết.

Với các thay đổi đó, 1548 file đã thay đổi, 123658 dòng thêm(+), 74306 dòng xóa(-) so với v2.1.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Ghi chú phát hành

* [Các vấn đề đã biết của 2.2.0](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Xem thêm lịch trình phát hành và thông tin khác:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
