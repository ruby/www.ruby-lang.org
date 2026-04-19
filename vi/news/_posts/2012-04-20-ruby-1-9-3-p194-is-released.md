---
layout: news_post
title: "Ruby 1.9.3-p194 đã được phát hành"
author: "NARUSE, Yui"
lang: vi
---

Ruby 1.9.3-p194 đã được phát hành.

Bản phát hành này bao gồm Bản vá Bảo mật cho RubyGems: Lỗi xác minh máy chủ SSL cho kho lưu trữ từ xa. Và nhiều lỗi đã được sửa trong bản phát hành này.

## Bản vá Bảo mật cho RubyGems: Lỗi xác minh máy chủ SSL cho kho lưu trữ từ xa

Bản phát hành này bao gồm hai bản vá bảo mật trong RubyGems.

* Bật xác minh chứng chỉ SSL của máy chủ
* Không cho phép chuyển hướng từ https sang http

Người dùng sử dụng nguồn https trong .gemrc hoặc /etc/gemrc được khuyến khích nâng cấp lên 1.9.3-p194.

Sau đây là trích dẫn từ ghi chú phát hành RubyGems 1.8.23 \[1\].

"Bản phát hành này tăng cường bảo mật khi RubyGems giao tiếp với máy chủ https. Nếu bạn sử dụng máy chủ RubyGems tùy chỉnh qua SSL, bản phát hành này sẽ khiến RubyGems không còn kết nối trừ khi chứng chỉ SSL của bạn có hiệu lực toàn cầu.

Bạn có thể cấu hình sử dụng chứng chỉ SSL trong RubyGems thông qua các tùy chọn :ssl\_ca\_cert và :ssl\_verify\_mode trong ~/.gemrc và /etc/gemrc. Cách khuyến nghị là đặt :ssl\_ca\_cert thành chứng chỉ CA cho máy chủ của bạn hoặc gói chứng chỉ chứa chứng nhận CA của bạn.

Bạn cũng có thể đặt :ssl\_verify\_mode thành 0 để tắt hoàn toàn kiểm tra chứng chỉ SSL, nhưng điều này không được khuyến nghị."

Cảm ơn John Firebaugh đã báo cáo vấn đề này.

\[1\]
[&lt;URL:https://github.com/rubygems/rubygems/blob/1.8/History.txt&gt;][1]

## Sửa lỗi

* Bản vá Bảo mật cho RubyGems: Lỗi xác minh máy chủ SSL cho kho lưu trữ
  từ xa
* các bản sửa lỗi khác

Xem [tickets][2] và [ChangeLog][3] để biết chi tiết.

## Tải về

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;][4]
  * SIZE: 9841223 bytes
  * MD5: 2278eff4cfed3cbc0653bc73085caa34
  * SHA256: a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;][5]
  * SIZE: 12432239 bytes
  * MD5: bc0c715c69da4d1d8bd57069c19f6c0e
  * SHA256: 46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;][6]
  * SIZE: 13898712 bytes
  * MD5: 77e67b15234e442d4a3dcc450bc70fea
  * SHA256: 77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_194/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
