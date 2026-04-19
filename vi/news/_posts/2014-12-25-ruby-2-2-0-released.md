---
layout: news_post
title: "Phát hành Ruby 2.2.0"
author: "naruse"
translator:
date: 2014-12-25 09:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.2.0.

Ruby 2.2 bao gồm nhiều tính năng mới và cải tiến cho các nhu cầu ngày càng
đa dạng và mở rộng của Ruby.

Ví dụ, Garbage Collector của Ruby giờ đây có thể thu gom các đối tượng kiểu Symbol.
Điều này giảm sử dụng bộ nhớ cho Symbol; vì GC trước đó không thể
thu gom chúng trước 2.2.
Vì Rails 5.0 sẽ yêu cầu Symbol GC, nó sẽ chỉ hỗ trợ Ruby 2.2 trở lên.
(Xem [bài đăng phát hành Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) để biết chi tiết.)

Ngoài ra, thời gian tạm dừng giảm nhờ Incremental Garbage Collector mới sẽ
hữu ích cho việc chạy các ứng dụng Rails. Các phát triển gần đây được đề cập trên
[blog Rails](http://weblog.rubyonrails.org/)
cho thấy Rails 5.0 sẽ tận dụng Incremental GC cũng như
Symbol GC.

Một tính năng khác liên quan đến quản lý bộ nhớ là tùy chọn bổ sung
cho `configure.in` để sử dụng jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Tính năng này vẫn đang thử nghiệm và hiện được tắt theo mặc định cho đến khi chúng tôi
thu thập dữ liệu hiệu suất và thêm các trường hợp sử dụng. Khi chúng tôi tin tưởng vào
lợi ích, tính năng này sẽ được bật theo mặc định.

Hỗ trợ thử nghiệm cho việc sử dụng vfork(2) với system() và spawn() cũng đã
được thêm vào. Bạn có thể đọc thêm chi tiết trên
[blog của tanaka-san bằng tiếng Nhật](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Điều này có thể mang lại tăng tốc lớn khi một tiến trình lớn thực thi
các lệnh bên ngoài nhiều lần.
Tuy nhiên vfork(2) vẫn chưa được hiểu rõ và là một lời gọi hệ thống có thể
gây hại. Chúng tôi muốn thử nghiệm để tìm hiểu bao nhiêu lợi ích có thể
đạt được qua việc thu thập dữ liệu hiệu suất và các trường hợp sử dụng.

Hãy thử và tận hưởng lập trình với Ruby 2.2.0, và báo cáo cho chúng tôi những phát hiện của bạn!

## Thay đổi đáng chú ý so với 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([bài thuyết trình tại RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([bài thuyết trình tại RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc
  [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* thư viện core:
  * Hỗ trợ Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Phương thức mới:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* thư viện đi kèm:
  * Cập nhật Psych 2.0.8
  * Cập nhật Rake 10.4.2
  * Cập nhật RDoc 4.2.0
  * Cập nhật RubyGems 2.4.5
  * Cập nhật test-unit 3.0.8 (xóa khỏi repository nhưng đi kèm trong tarball)
  * Cập nhật minitest 5.4.3 (xóa khỏi repository nhưng đi kèm trong tarball)
  * Deprecated mathn
* C API
  * Loại bỏ các API đã deprecated

Xem [NEWS trong kho Ruby](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
để biết chi tiết.

Với các thay đổi đó, 1557 file đã thay đổi, 125039 dòng thêm(+), 74376 dòng xóa(-)
so với v2.1.0!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
