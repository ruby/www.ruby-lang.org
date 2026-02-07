---
layout: news_post
title: "Ruby 1.9.3 preview1 đã được phát hành"
author: "Moru"
lang: vi
---

Ruby 1.9.3 preview1 đã được phát hành. Đây là bản xem trước đầu tiên
của phiên bản tiếp theo và vẫn còn một số vấn đề nhỏ đã biết. Nhưng
chúng sẽ được sửa trong bản phát hành tiếp theo, Ruby 1.9.3-p0.

Xem [ChangeLogs][1] và [NEWS][2] để biết mô tả.

Ruby Inside đã đăng [bài đánh giá về bản phát hành này][3].

## Tải về

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2&gt;][4]
  SIZE: 9507455 bytes
  MD5: 7d93dc773c5824f05c6e6630d8c4bf9b
  SHA256: a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz&gt;][5]
  SIZE: 12186410 bytes
  MD5: 0f0220be4cc7c51a82c1bd8f6a0969f3
  SHA256: 75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip&gt;][6]
  SIZE: 13696708 bytes
  MD5: 960e08b2dc866c9987f17d0480de63a1
  SHA256: 249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

## Khác biệt so với phiên bản trước

Các phiên bản Ruby trước đó được cấp phép theo "GPLv2" và giấy phép
"Ruby" nhưng "2-clause BSDL" (hay còn gọi là Simplified BSD License) và
giấy phép "Ruby" đã thay thế chúng.

### Encoding

SJIS đã thay đổi thành bí danh cho Windows-31J, thay vì Shift\_JIS.

### Thư viện chuẩn

* io/console: Thêm khả năng cho các instance IO.
* openssl
* test/unit: hỗ trợ test song song

### Các thay đổi khác

* pathname và date được triển khai lại trong bản xem trước hiện tại.
* Mục đích của VM locking đã thay đổi.



[1]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_preview1/ChangeLog
[2]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_preview1/NEWS
[3]: http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
