---
layout: news_post
title: "Phát hành Ruby 2.2.0-rc1"
author: "naruse"
translator: "Nhat Tan"
date: 2014-12-18 09:00:00 +0000
lang: vi
---

Rất vui mừng khi được thông báo ấn bản Ruby 2.2.0-rc1. Sau bản RC1, không có những thay đổi nào đáng kể ngoài những bản vá lỗi. Bản cuối cùng của Ruby 2.2.0 được dự kiến phát hành vào ngày 25-12-2014 tới.

Ruby 2.2 cung cấp nhiều tính năng và cải tiến mới nhằm phục vụ nhu cầu ngày càng đa dạng và mở rộng của Ruby.

Ví dụ: Symbol GC giúp tự động thu hồi bộ nhớ cho Symbols. Nó giúp giảm tải
đáng kể bộ nhớ sử dụng do Symbols tạo ra, bởi vì trước bản Ruby 2.2 thì GC không thể
thu hồi bộ nhớ sử dụng của Symbols. Kể từ khi Rails 5.0 yêu cầu chức năng
Symbols GC nên Rails 5.0 sẽ chỉ hỗ trợ cho Ruby 2.2 trở đi.
(Xem [bài post trên Rails' blog](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)
để biết thêm chi tiết.)

Ngoài ra Incremental GC mới cũng giúp giảm thời gian tạm dừng của việc thu hồi bộ
nhớ, thực sự hữu dụng khi chạy các ứng dụng Rails. Gần đây các lập trình viên đã đề cập trên Rails blog cho rằng Rails 5.0 sẽ tận dụng lợi thế của Incremental GC cũng như Symbol GC.

Một tính năng khác liên quan đến việc quản lý bộ nhớ là một lựa chọn cho
configure.in để sử dụng jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Đây là là một tính năng thử nghiệm và mặc định không được bật lên cho đến khi chúng tôi thu thập được nhiều hơn use case và peformance data. Nếu tất cả đều ở
trạng thái hoạt động tốt và ổn định thì tính năng này sẽ mặc định được bật lên.

Hỗ trợ thực nghiệm cho việc sử dụng vfork(2) trong system() và spawn() cũng đã được thêm vào. Bạn có thể xem chi tiết ở [tanaka-san’s blog viết bằng Tiếng Nhật](http://www.a-k-r.org/d/2014-09.html#a2014_09_06). Điều này giúp tăng tốc rất nhiều khi một tiến trình lớn thực hiện những lệnh bên ngoài nhiều lần. Tuy nhiên vfork(2) vẫn chưa được hiểu rõ và là một system call nguy hiểm tiềm ẩn. Chúng tôi muốn thực nghiệm để có thể biết được các lợi ích nó mang lại qua việc thu thập thông tin về peformance data và use case.

Hãy trải nghiệm Ruby 2.2.0-rc1 và chúng tôi mong nhận được nhiều phản hồi từ các bạn.

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
  * Nâng cấp Psych 2.0.8
  * Nâng cấp Rake 10.4.0
  * Nâng cấp RDoc 4.2.0.alpha (21b241a)
  * Nâng cấp RubyGems 2.4.5
  * Nâng cấp test-unit 3.0.8 (xoá khỏi repository nhưng được kèm cùng tarball)
  * Nâng cấp minitest 5.4.3 (xoá khỏi repository nhưng được kèm cùng tarball)
  * Deprecate mathn
* C API
  * Xoá deprecated APIs

Xem thêm chi tiết tại
[NEWS trong Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS).

Với những thay đổi như sau: 1548 file đã được thay đổi, 123658 insertions(+), 74306 deletions(-) so với bản 2.1.0!

## Download

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
