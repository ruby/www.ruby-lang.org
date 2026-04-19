---
layout: news_post
title: "Phát hành Ruby 2.5.9"
author: "usa"
translator:
date: 2021-04-05 12:00:00 +0000
lang: vi
---

Ruby 2.5.9 đã được phát hành.

Bản phát hành này bao gồm các bản sửa lỗi bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) để biết chi tiết.

Sau bản phát hành này, Ruby 2.5 đạt đến EOL (kết thúc vòng đời). Nói cách khác, đây là bản phát hành cuối cùng của dòng Ruby 2.5.
Chúng tôi sẽ không phát hành Ruby 2.5.10 ngay cả khi phát hiện lỗ hổng bảo mật.
Chúng tôi khuyến nghị tất cả người dùng Ruby 2.5 nâng cấp lên Ruby 3.0, 2.7 hoặc 2.6 ngay lập tức.

## Tải về

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

Cảm ơn tất cả những người đã giúp đỡ cho bản phát hành này, đặc biệt là những người đã báo cáo lỗ hổng bảo mật.
