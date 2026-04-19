---
layout: news_post
title: "Phát hành Ruby 3.4.5"
author: k0kubun
translator:
date: 2025-07-15 17:00:00 +0000
lang: vi
---

Ruby 3.4.5 đã được phát hành.

Đây là bản cập nhật định kỳ bao gồm các bản sửa lỗi và hỗ trợ GCC 15. Vui lòng tham khảo
[ghi chú phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_5) để biết thêm chi tiết.

## Lịch trình phát hành

Chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 3.4) mỗi hai tháng sau bản phát hành gần nhất.
Ruby 3.4.6 dự kiến vào tháng 9, 3.4.7 vào tháng 11, và 3.4.8 vào tháng 1.

Nếu có thay đổi ảnh hưởng đáng kể đến người dùng, bản phát hành có thể được đưa ra sớm hơn kế hoạch, và lịch trình tiếp theo có thể thay đổi tương ứng.

## Tải về

{% assign release = site.data.releases | where: "version", "3.4.5" | first %}

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
