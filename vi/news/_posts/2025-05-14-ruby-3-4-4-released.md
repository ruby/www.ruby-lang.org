---
layout: news_post
title: "Phát hành Ruby 3.4.4"
author: k0kubun
translator:
date: 2025-05-14 18:20:00 +0000
lang: vi
---

Ruby 3.4.4 đã được phát hành.

Bản phát hành này bao gồm bản sửa lỗi YJIT liên quan đến biến cục bộ và giải quyết vấn đề build trên Windows khi sử dụng GCC 15.
Bản phát hành được đưa ra trước lịch trình để cung cấp các bản sửa lỗi này sớm nhất có thể.
Một số bản sửa lỗi khác cũng được bao gồm.

Vui lòng xem [ghi chú phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_4) để biết thêm chi tiết.

## Lịch trình phát hành

Chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 3.4) mỗi hai tháng sau bản phát hành gần nhất.
Theo bản phát hành này (3.4.4), Ruby 3.4.5 dự kiến vào tháng 7, 3.4.6 vào tháng 9, 3.4.7 vào tháng 11, và 3.4.8 vào tháng 1.

Nếu có thay đổi ảnh hưởng đáng kể đến người dùng, bản phát hành có thể được đưa ra sớm hơn kế hoạch, và lịch trình tiếp theo có thể thay đổi tương ứng.

## Tải về

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

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
