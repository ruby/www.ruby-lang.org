---
layout: news_post
title: "Phát hành Ruby 3.1.2"
author: "naruse and mame"
translator:
date: 2022-04-12 12:00:00 +0000
lang: vi
---

Ruby 3.1.2 đã được phát hành.

Bản phát hành này bao gồm các bản vá bảo mật.
Vui lòng xem các chủ đề dưới đây để biết chi tiết.

* [CVE-2022-28738: Giải phóng bộ nhớ kép trong biên dịch Regexp]({%link en/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: Tràn bộ đệm trong chuyển đổi String sang Float]({%link en/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v3_1_1...v3_1_2) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.1.2" | first %}

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

Nhiều committer, nhà phát triển và người dùng đã cung cấp báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
