---
layout: news_post
title: "Phát hành Ruby 4.0.1"
author: k0kubun
translator: "Ngọc Lê"
date: 2026-01-13 02:28:48 +0000
lang: vi
---

Ruby 4.0.1 đã được phát hành.

Bản phát hành này bao gồm bản sửa lỗi cho hiện tượng đánh thức giả từ `Kernel#sleep` khi tiến trình con kết thúc trong một thread khác,
cùng với các bản sửa lỗi khác. Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.1) để biết thêm chi tiết.

## Lịch trình phát hành

Chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 4.0) hai tháng một lần sau bản phát hành gần nhất.
Ruby 4.0.2 sẽ được phát hành vào tháng 3, 4.0.3 vào tháng 5, 4.0.4 vào tháng 7, 4.0.5 vào tháng 9, và 4.0.6 vào tháng 11.

Nếu có thay đổi ảnh hưởng đáng kể đến người dùng, bản phát hành có thể được thực hiện sớm hơn dự kiến, và lịch trình tiếp theo có thể thay đổi tương ứng.

## Tải về

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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

Nhiều committer, nhà phát triển, và người dùng đã cung cấp các báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
