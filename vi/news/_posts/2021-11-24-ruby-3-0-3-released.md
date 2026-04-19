---
layout: news_post
title: "Phát hành Ruby 3.0.3"
author: "nagachika"
translator:
date: 2021-11-24 12:00:00 +0000
lang: vi
---

Ruby 3.0.3 đã được phát hành.

Bản phát hành này bao gồm các bản sửa lỗi bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [CVE-2021-41817: Regular Expression Denial of Service Vulnerability of Date Parsing Methods]({%link en/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41816: Buffer Overrun in CGI.escape_html]({%link en/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})
* [CVE-2021-41819: Cookie Prefix Spoofing in CGI::Cookie.parse]({%link en/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v3_0_2...v3_0_3) để biết chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.0.3" | first %}

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
