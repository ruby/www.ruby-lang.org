---
layout: news_post
title: "Phát hành Ruby 2.7.2"
author: "nagachika"
translator:
date: 2020-10-02 11:00:00 +0000
lang: vi
---

Ruby 2.7.2 đã được phát hành.

Bản phát hành này chứa sự thay đổi không tương thích có chủ đích. Các cảnh báo deprecation được tắt mặc định trên 2.7.2 và các phiên bản sau.
Bạn có thể bật các cảnh báo deprecation bằng cách chỉ định tùy chọn dòng lệnh -w hoặc -W:deprecated.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

Bản phát hành này chứa phiên bản mới của webrick với bản sửa bảo mật được mô tả trong bài viết.

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick](/en/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) để biết các thay đổi khác.

## Tải về

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Lời nhắn phát hành

Cảm ơn nhiều committer, nhà phát triển và người dùng đã cung cấp các báo cáo lỗi và đóng góp giúp cho bản phát hành này trở thành hiện thực.
