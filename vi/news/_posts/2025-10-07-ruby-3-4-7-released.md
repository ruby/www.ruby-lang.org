---
layout: news_post
title: "Phát hành Ruby 3.4.7"
author: k0kubun
translator: "Ngọc Lê"
date: 2025-10-07 17:14:11 +0000
lang: vi
---

Ruby 3.4.7 đã được phát hành.

Bản phát hành này bao gồm [bản cập nhật gem uri xử lý CVE-2025-61594](https://www.ruby-lang.org/en/news/2025/10/07/uri-cve-2025-61594/),
cùng với các bản sửa lỗi khác. Vui lòng tham khảo [ghi chú phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_7) để biết thêm chi tiết.

Chúng tôi khuyến nghị cập nhật phiên bản gem uri của bạn. Bản phát hành này được thực hiện để thuận tiện cho những ai muốn tiếp tục sử dụng nó như một gem mặc định.

## Lịch trình phát hành

Chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 3.4) hai tháng một lần sau bản phát hành gần nhất.
Ruby 3.4.8 dự kiến phát hành vào tháng 12 và 3.4.9 vào tháng 2.

Nếu có thay đổi ảnh hưởng đáng kể đến người dùng, bản phát hành có thể được thực hiện sớm hơn dự kiến, và lịch trình tiếp theo có thể thay đổi tương ứng.

## Tải về

{% assign release = site.data.releases | where: "version", "3.4.7" | first %}

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
