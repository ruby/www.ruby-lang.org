---
layout: news_post
title: "Phát hành Ruby 3.2.5"
author: "nagachika"
translator:
date: 2024-07-26 10:00:00 +0000
lang: vi
---

Ruby 3.2.5 đã được phát hành.

Bản phát hành này bao gồm nhiều bản sửa lỗi.
Và chúng tôi đã cập nhật phiên bản gem đi kèm `rexml` để bao gồm bản sửa bảo mật sau.
[CVE-2024-39908 : DoS trong REXML]({%link en/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}).

Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_5) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

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
