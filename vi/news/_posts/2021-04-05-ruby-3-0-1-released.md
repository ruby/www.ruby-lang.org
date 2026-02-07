---
layout: news_post
title: "Phát hành Ruby 3.0.1"
author: "naruse"
translator:
date: 2021-04-05 12:00:00 +0000
lang: vi
---

Ruby 3.0.1 đã được phát hành.

Bản phát hành này bao gồm các bản sửa lỗi bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Path traversal in Tempfile on Windows]({% link en/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1) để biết chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.0.1" | first %}

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
