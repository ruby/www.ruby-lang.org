---
layout: news_post
title: "Ruby 1.9.1-p376 đã được phát hành"
author: "Yugui"
lang: vi
---

Ruby 1.9.1-p376 vừa được phát hành. Đây là bản phát hành patch level
của Ruby 1.9.1 và bao gồm bản sửa cho CVE-2009-4124.

#### CVE-2009-4124

Bản phát hành trước, Ruby 1.9.1-p243 có một [lỗ hổng bảo mật cho phép
tràn bộ nhớ heap][1]. Lỗ hổng này được phát hiện bởi Emmanouel
Kellinis, KPMG London.

Tôi khuyến nghị tất cả người dùng Ruby 1.9.1 nâng cấp lên p376. Tuy
nhiên lỗ hổng không ảnh hưởng đến dòng Ruby 1.8.

#### Các bản sửa lỗi khác

Ngoài ra, 1.9.1-p376 bao gồm &gt; 100 bản sửa lỗi.

* Các lệnh mở rộng Irb đã bị hỏng. Đã được sửa.
* Ripper không thể phân tích một số mã Ruby. Đã được sửa.
* Sửa lỗi build trên AIX.
* Một số bản sửa lỗi của Matrix.
* Có thể tải gems được cài đặt trong thư mục home của người dùng.
* Một số phương thức đã trả về chuỗi với encoding chính xác.

Xem ChangeLog để biết thêm chi tiết.

* [&lt;URL:https://git.ruby-lang.org/ruby.git/plain/ChangeLog&gt;][2]?id=refs/heads/ruby\_1\_9\_1

#### Địa chỉ tải về

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2&gt;][3]
  SIZE
  : 7293106 bytes

  MD5
  : e019ae9c643c5efe91be49e29781fb94

  SHA256
  : 79164e647e23bb7c705195e0075ce6020c30dd5ec4f8c8a12a100fe0eb0d6783

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz&gt;][4]
  SIZE
  : 9073007 bytes

  MD5
  : ebb20550a11e7f1a2fbd6fdec2a3e0a3

  SHA256
  : 58b8fc1645283fcf3d5be195dffcaf55b7c85cbc210074273b57b835409b21ca

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip&gt;][5]
  SIZE
  : 10337871 bytes

  MD5
  : d4d5e62f65cb92a281f1569a7f25371b

  SHA256
  : 486d3efdab269040ce7142964ba3a4e0d46f0a5b812136bcac7e5bafc726c14e



[1]: {{ site.url }}/vi/news/2009/12/07/heap-overflow-in-string/
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/heads/ruby_1_9_1
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip
