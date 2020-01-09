---
layout: news_post
title: "Phát hành Ruby 2.2.0-preview2"
author: "naruse"
translator: "Cuong Nguyen"
date: 2014-11-28 09:00:00 +0000
lang: vi
---

Rất vui khi được thông báo ấn bản Ruby 2.2.0-preview2.

Ruby 2.2.0-preview2 là bản thử nghiệm thứ 2 của Ruby 2.2.0.
Với nhu cầu ngày càng nhiều và mở rộng của Ruby thì ở bản thử nghiệm thứ 2 này
Ruby cung cấp cho bạn nhiều tính năng và cải tiến.

Ví dụ: Symbol GC giúp tự động thu hồi bộ nhớ cho Symbols. Nó giúp cho giảm tải
đáng kể dung lượng Symbols tạo ra, bởi vì trước bản Ruby 2.2 thì GC không thể
thu hồi bộ nhớ sử dụng của Symbols. Vì Rails 5.0 bắt buộc yêu cầu chức năng
Symbols GC, thế nên Rails 5.0 sẽ chỉ hỗ trợ Ruby 2.2.
(Xem [bài post trên Rails' blog](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)
để thêm chi tiết.)

Ngoài ra Incremental GC mới cũng giúp giảm thời tạm dừng của việc thu hồi bộ
nhớ, thực sự hữu dụng khi chạy các ứng dụng Rails.

Các tính năng khác liên quan đến việc quản lý bộ nhớ là một lựa chọn cho
configure.in để sử dụng jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Đây là là một tính năng thử nghiệm với mặc định không được bật lên. Vì vậy
chúng tôi cần thu thập thêm use case và peformance data. Nếu tất cả đều ở
trạng thái hoạt động tốt và ổn định thì tính năng này sẽ tự động được mặc định
bật lên.

Ngoài ra còn có 1 chủ đề về [sử dụng vfork(2) trong system() và spawn() (Tiếng Nhật)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Nó được kỳ vọng sẽ đạt được 1 tốc độ cao từ các cuộc truy xuất lớn bên ngoài 1
cách nhiều lần. Nhưng vfork(2) là một system call nguy hiểm nên chúng tôi
muốn biết các lợi ích nó mang lại qua việc thu thập thông tin về use case và
peformance data.

Mong nhận được nhiều phản hồi trong qua trình sử dụng Ruby 2.2.0-preview từ các bạn.

## Các thay đổi đáng chú ý so với bản 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* core libraries:
  * Hỗ trợ Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Hàm mới:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bundled libraries:
  * Nâng cấp Psych 2.0.6
  * Nâng cấp Rake 10.4.0
  * Nâng cấp RDoc 4.2.0.alpha (21b241a)
  * Nâng cấp RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * Nâng cấp test-unit 3.0.7 (xoá khỏi repository nhưng được kèm cùng tarball)
  * Nâng cấp minitest 5.4.3 (xoá khỏi repository nhưng được kèm cùng tarball)
  * Deprecate mathn
* C API
  * Xoá deprecated APIs

Xem thêm chi tiết tại
[NEWS trong Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS).

Với những thay đổi, 1239 file đã được thay đổi, 98343 insertions(+), 61858 deletions(-).

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## Chú thích

* [2.2.0 Known issues](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Lịch phát hành các phiên bản tiếp theo và các thông tin khác tại:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
