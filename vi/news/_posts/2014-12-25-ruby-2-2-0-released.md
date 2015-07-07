---
layout: news_post
title: "Phát hành Ruby 2.2.0"
author: "naruse"
translator: "Nhat Tan"
date: 2014-12-25 09:00:00 +0000
lang: vi
---

Rất vui khi được thông báo ấn bản Ruby 2.2.0.

Ruby 2.2 cung cấp nhiều tính năng và cải tiến mới nhằm phục vụ nhu cầu ngày càng đa dạng và mở rộng cho Ruby.

Ví dụ: Symbol GC giúp tự động thu hồi bộ nhớ cho Symbols. Nó giúp cho giảm tải
đáng kể dung lượng Symbols tạo ra, bởi vì trước bản Ruby 2.2 thì GC không thể
thu hồi bộ nhớ sử dụng của Symbols. Vì Rails 5.0 bắt buộc yêu cầu chức năng
Symbol GC, thế nên Rails 5.0 sẽ chỉ hỗ trợ Ruby 2.2.
(Xem [bài post trên Rails' blog](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)
để thêm chi tiết.)

Ngoài ra Incremental GC mới cũng giúp giảm thời tạm dừng của việc thu hồi bộ
nhớ, thực sự hữu dụng khi chạy các ứng dụng Rails. Gần đây các lập trình viên đã đề cập trên [Rails blog](http://weblog.rubyonrails.org/) cho rằng Rails 5.0 sẽ tận dụng lợi thế của Incremental GC cũng như Symbol GC.

Một tính năng khác liên quan đến việc quản lý bộ nhớ là một lựa chọn cho
configure.in để sử dụng jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Đây là là một tính năng thử nghiệm với mặc định không được bật lên cho đến khi chúng tôi thu thập được nhiều hơn use case và peformance data. Nếu tất cả đều ở
trạng thái hoạt động tốt và ổn định thì tính năng này sẽ mặc định được bật lên.

Hỗ trợ thực nghiệm cho việc sử dụng vfork(2) trong system() và spawn() cũng đã được thêm vào. Bạn có thể xem chi tiết hơn trên [tanaka-san’s blog bằng Tiếng Nhật](http://www.a-k-r.org/d/2014-09.html#a2014_09_06). Điều này giúp tăng tốc rất nhiều khi một tiến trình lớn thực hiện những lệnh bên ngoài nhiều lần. Tuy nhiên vfork(2) vẫn chưa được hiểu rõ và là một system call nguy hiểm tiềm ẩn. Chúng tôi muốn thực nghiệm để có thể biết được các lợi ích nó mang lại qua việc thu thập thông tin về peformance data và use cases.

Mong nhận được nhiều phản hồi trong qua trình sử dụng Ruby 2.2.0 từ các bạn.

## Các thay đổi đáng chú ý so với bản 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([bài diễn thuyết tại RubyConf 2014: “Incremental GC for Ruby interpreter”](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([bài diễn thuyết tại RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* core libraries:
  * Hỗ trợ Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Hàm mới:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bundled libraries:
  * Nâng cấp Psych 2.0.8
  * Nâng cấp Rake 10.4.2
  * Nâng cấp RDoc 4.2.0
  * Nâng cấp RubyGems 2.4.5
  * Nâng cấp test-unit 3.0.8 (xoá khỏi repository nhưng được kèm cùng tarball)
  * Nâng cấp minitest 5.4.3 (xoá khỏi repository nhưng được kèm cùng tarball)
  * Deprecate mathn
* C API
  * Xoá deprecated APIs

Xem thêm chi tiết tại
[NEWS trong Ruby repository](https://github.com/ruby/ruby/blob/v2_2_0/NEWS).

Với những thay đổi, 1557 file đã được thay đổi, 125039 insertions(+), 74376 deletions(-).

## Download

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
