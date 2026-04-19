---
layout: news_post
title: "Ruby 1.9.2-p320 đã được phát hành"
author: "NARUSE, Yui"
lang: vi
---

Ruby 1.9.2-p320 đã được phát hành.

Bản phát hành này bao gồm Bản vá Bảo mật cho RubyGems: Lỗi xác minh máy chủ SSL cho kho lưu trữ từ xa. Và nhiều lỗi đã được sửa trong bản phát hành này.

## Bản vá Bảo mật cho RubyGems: Lỗi xác minh máy chủ SSL cho kho lưu trữ từ xa

Bản phát hành này bao gồm hai bản vá bảo mật trong RubyGems.

* Bật xác minh chứng chỉ SSL của máy chủ
* Không cho phép chuyển hướng từ https sang http

Người dùng sử dụng nguồn https trong .gemrc hoặc /etc/gemrc được khuyến khích nâng cấp lên 1.9.2-p320 hoặc 1.9.3-p194.

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

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2&gt;][4]
  * SIZE: 8981382 bytes
  * MD5: b226dfe95d92750ee7163e899b33af00
  * SHA256: 6777f865cfa21ffdc167fcc4a7da05cb13aab1bd9e59bfcda82c4b32f75e6b51

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz&gt;][5]
  * SIZE: 11338691 bytes
  * MD5: 5ef5d9c07af207710bd9c2ad1cef4b42
  * SHA256: 39a1f046e8756c1885cde42b234bc608196e50feadf1d0f202f7634f4a4b1245

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip&gt;][6]
  * SIZE: 12730896 bytes
  * MD5: 0bdfd04bfeb0933c0bdcd00e4ea94c49
  * SHA256: 83db9c86d5cf20bb91e625c3c9c1da8e61d941e1bc8ff4a1b9ea70c12f2972d3



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-192/issues?set_filter=1&amp;status_id=5
[3]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_320/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip
