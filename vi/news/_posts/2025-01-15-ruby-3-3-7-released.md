---
layout: news_post
title: "Phát hành Ruby 3.3.7"
author: k0kubun
translator:
date: 2025-01-15 07:51:59 +0000
lang: vi
---

Ruby 3.3.7 đã được phát hành.

Đây là bản cập nhật định kỳ bao gồm các bản sửa lỗi nhỏ.
Vui lòng tham khảo [ghi chú phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_7) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

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
