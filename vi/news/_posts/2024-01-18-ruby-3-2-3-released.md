---
layout: news_post
title: "Phát hành Ruby 3.2.3"
author: "nagachika"
translator:
date: 2024-01-18 09:00:00 +0000
lang: vi
---

Ruby 3.2.3 đã được phát hành.

Bản phát hành này bao gồm nhiều bản sửa lỗi.
Xem [bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_3) để biết thêm chi tiết.

Bản phát hành này cũng bao gồm cập nhật uri.gem lên 0.12.2 chứa bản vá bảo mật.
Vui lòng xem các chủ đề bên dưới để biết chi tiết.

* [CVE-2023-36617: Lỗ hổng ReDoS trong URI]({%link en/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

## Tải về

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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

Nhiều committer, nhà phát triển và người dùng đã báo cáo lỗi và giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn sự đóng góp của họ.
