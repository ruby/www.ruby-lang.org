---
layout: news_post
title: "Phát hành Ruby 3.4.3"
author: k0kubun
translator:
date: 2025-04-14 08:06:57 +0000
lang: vi
---

Ruby 3.4.3 đã được phát hành.

Đây là bản cập nhật định kỳ bao gồm các bản sửa lỗi. Vui lòng tham khảo
[ghi chú phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_3) để biết thêm chi tiết.

## Lịch trình phát hành

Chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 3.4) mỗi 2 tháng.
Ruby 3.4.4 sẽ được phát hành vào tháng 6, 3.4.5 vào tháng 8, 3.4.6 vào tháng 10, và 3.4.7 vào tháng 12.

Nếu có bất kỳ thay đổi nào ảnh hưởng đến số lượng lớn người dùng, các phiên bản đó có thể được phát hành sớm hơn dự kiến.

## Tải về

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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
