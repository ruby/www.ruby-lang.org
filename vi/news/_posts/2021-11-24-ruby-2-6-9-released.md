---
layout: news_post
title: "Phát hành Ruby 2.6.9"
author: "usa"
translator:
date: 2021-11-24 12:00:00 +0000
lang: vi
---

Ruby 2.6.9 đã được phát hành.

Bản phát hành này bao gồm các bản vá bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết thêm chi tiết.

* [CVE-2021-41817: Lỗ hổng Regular Expression Denial of Service của các phương thức phân tích Date]({%link en/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41819: Giả mạo Cookie Prefix trong CGI::Cookie.parse]({%link en/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_8...v2_6_9) để biết thêm chi tiết.

Ruby 2.6 hiện đang trong giai đoạn bảo trì bảo mật, cho đến cuối tháng 3 năm 2022.
Sau ngày đó, việc bảo trì Ruby 2.6 sẽ kết thúc.
Chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch di chuyển sang các phiên bản Ruby mới hơn, chẳng hạn như 3.0 hoặc 2.7.

## Tải về

{% assign release = site.data.releases | where: "version", "2.6.9" | first %}

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

Nhiều committer, nhà phát triển và người dùng đã cung cấp các báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
