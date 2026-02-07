---
layout: news_post
title: "Ruby 1.9.1-p429 đã được phát hành"
author: "Yugui"
lang: vi
---

Ruby 1.9.1-p429 vừa được phát hành. Đây là bản phát hành patchlevel cho
Ruby 1.9.1. Bản này sửa nhiều lỗi và bao gồm bản sửa cho một lỗ hổng
bảo mật cho phép kẻ tấn công thực thi mã tùy ý.

## Lỗ hổng

### Mô tả

Một lỗ hổng bảo mật gây tràn bộ đệm khi bạn gán một giá trị nguy hiểm
cho `ARGF.inplace_mode` trên Windows. Nó có thể cho phép kẻ tấn công
thực thi mã tùy ý.

Các phiên bản bị ảnh hưởng:

* Ruby 1.9.1 patchlevel 378 và tất cả các phiên bản trước đó;
* Ruby 1.9.2 preview 3 và tất cả các phiên bản trước đó;
* Các phiên bản phát triển của Ruby 1.9 (1.9.3dev).

Tôi khuyến nghị bạn nâng cấp ruby 1.9 lên 1.9.1-p429 hoặc 1.9.2-rc1.

Lỗ hổng không ảnh hưởng trực tiếp đến dòng Ruby 1.8.

### Ghi nhận

Lỗ hổng được phát hiện và báo cáo bởi Masaya TARUI.

## Tải về

* [ruby-1.9.1-p429.tar.bz2][1]
  * SIZE: 7300923 bytes
  * MD5: 09df32ae51b6337f7a2e3b1909b26213
  * SHA256: e0b9471d77354628a8041068f45734eb2d99f5b5df08fe5a76d785d989a47bfb

* [ruby-1.9.1-p429.tar.gz][2]
  * SIZE: 9078126 bytes
  * MD5: 0f6d7630f26042e00bc59875755cf879
  * SHA256: fdd97f52873b70f378ac73c76a1b2778e210582ce5fe1e1c241c37bd906b43b2

* [ruby-1.9.1-p429.zip][3]
  * SIZE: 10347659 bytes
  * MD5: fcd031414e5e4534f97aa195bb586d6c
  * SHA256: c9fe2364b477ad004030f4feeb89aeaa2a01675ff95db1bed31a932806f85680



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.zip
