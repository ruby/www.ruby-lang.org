---
layout: news_post
title: "Phát hành Ruby 3.2.8"
author: hsbt
translator:
date: 2025-03-26 04:45:01 +0000
lang: vi
---

Ruby 3.2.8 đã được phát hành. Bản phát hành này bao gồm [các bản sửa CVE-2025-27219, CVE-2025-27220 và CVE-2025-27221](https://www.ruby-lang.org/vi/news/2025/02/26/security-advisories/).

Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_8) để biết thêm chi tiết.

Phiên bản này là phiên bản cuối cùng của giai đoạn bảo trì thông thường cho dòng Ruby 3.2. Chúng tôi sẽ chỉ sửa các vấn đề bảo mật cho dòng Ruby 3.2 cho đến cuối tháng 3 năm 2026.

Vui lòng cân nhắc nâng cấp lên dòng Ruby 3.3 hoặc 3.4.

## Tải về

{% assign release = site.data.releases | where: "version", "3.2.8" | first %}

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
