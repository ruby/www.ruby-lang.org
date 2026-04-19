---
layout: news_post
title: "FileUtils dễ bị tấn công race condition symlink"
author: "Urabe Shyouhei"
lang: vi
---

Một lỗ hổng race condition symlink đã được phát hiện trong
FileUtils.remove\_entry\_secure. Lỗ hổng cho phép người dùng cục bộ xóa
các tập tin và thư mục tùy ý.

### Các phiên bản bị ảnh hưởng

* Ruby 1.8.6 patchlevel 420 và tất cả các phiên bản trước đó
* Ruby 1.8.7 patchlevel 330 và tất cả các phiên bản trước đó
* Các phiên bản phát triển của Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 430 và tất cả các phiên bản trước đó
* Ruby 1.9.2 patchlevel 136 và tất cả các phiên bản trước đó
* Các phiên bản phát triển của Ruby 1.9 (1.9.3dev)

### Giải pháp

Chúng tôi đã sửa tình trạng này. Tất cả người dùng bị ảnh hưởng được
khuyến khích nâng cấp bản cài đặt ruby của mình.

Nhưng cũng xin lưu ý rằng, các cuộc tấn công race condition symlink
không thể tránh được khi bất kỳ thư mục cha nào từ vị trí bạn muốn xóa
thuộc sở hữu của người mà bạn không thể tin tưởng. Vì vậy nếu bạn muốn
an toàn, bạn phải đảm bảo rằng **TẤT CẢ** các thư mục cha không thể
bị di chuyển bởi những người dùng không đáng tin cậy khác. Ví dụ, các
thư mục cha không nên thuộc sở hữu của người dùng không đáng tin cậy,
và không nên có quyền ghi cho mọi người trừ khi bit sticky được đặt.

### Cập nhật

* Sửa lỗi chính tả. (vulnerabile -&gt; vulnerable)
* 1\.8.7-334 đã được phát hành để sửa vấn đề này. Người dùng 1.8.7
  được khuyến khích nâng cấp.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]

* 1\.9.1-p431 đã được phát hành để sửa vấn đề này. Người dùng 1.9.1
  được khuyến khích nâng cấp.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz][4]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip][6]

* 1\.9.2-p180 đã được phát hành để sửa vấn đề này. Người dùng 1.9.2
  được khuyến khích nâng cấp.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz][7]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2][8]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip][9]

* Sửa các phiên bản bị ảnh hưởng cho dòng 1.9.



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip
