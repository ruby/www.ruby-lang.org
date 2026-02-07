---
layout: news_post
title: "Phát hành Ruby 3.0.5"
author: "usa"
translator:
date: 2022-11-24 12:00:00 +0000
lang: vi
---

Ruby 3.0.5 đã được phát hành.

Bản phát hành này bao gồm bản vá bảo mật.
Vui lòng xem các chủ đề dưới đây để biết chi tiết.

* [CVE-2021-33621: Tách phản hồi HTTP trong CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Bản phát hành này cũng bao gồm một số bản sửa lỗi.
Xem [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_5) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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

Việc bảo trì Ruby 3.0, bao gồm cả bản phát hành này, dựa trên "Thỏa thuận cho phiên bản ổn định của Ruby" của Hiệp hội Ruby.
