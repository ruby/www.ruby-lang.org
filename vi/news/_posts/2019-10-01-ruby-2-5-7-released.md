---
layout: news_post
title: "Ruby 2.5.7 Đã Phát Hành"
author: "usa"
translator:
date: 2019-10-01 11:00:00 +0000
lang: vi
---

Ruby 2.5.7 đã được phát hành.

Bản phát hành này bao gồm các bản sửa bảo mật được liệt kê bên dưới.
Vui lòng kiểm tra các chủ đề bên dưới để biết chi tiết.

* [CVE-2019-16255: Lỗ hổng chèn mã trong Shell#[] và Shell#test]({% link en/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: Tách phản hồi HTTP trong WEBrick (Bản sửa bổ sung)]({% link en/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Lỗ hổng chèn NUL trong File.fnmatch và File.fnmatch?]({% link en/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Lỗ hổng từ chối dịch vụ biểu thức chính quy trong xác thực Digest của WEBrick]({% link en/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_6...v2_5_7) để biết chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "2.5.7" | first %}

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

## Ghi chú phát hành

Cảm ơn tất cả những ai đã giúp đỡ cho bản phát hành này.

Việc bảo trì Ruby 2.5, bao gồm bản phát hành này, dựa trên "Thỏa thuận cho phiên bản ổn định của Ruby" của Ruby Association.
