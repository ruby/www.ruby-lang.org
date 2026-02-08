---
layout: news_post
title: "Phát hành Ruby 3.3.6"
author: k0kubun
translator:
date: 2024-11-05 04:25:00 +0000
lang: vi
---

Ruby 3.3.6 đã được phát hành.

Đây là bản cập nhật định kỳ bao gồm các bản sửa lỗi nhỏ.
Bản phát hành này cũng ngừng cảnh báo về các dependency gem mặc định bị thiếu sẽ trở thành gem đi kèm trong Ruby 3.5.
Để biết thêm chi tiết, vui lòng tham khảo [ghi chú phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_6).

## Lịch trình phát hành

Như đã [thông báo](https://www.ruby-lang.org/vi/news/2024/07/09/ruby-3-3-4-released/) trước đó, chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 3.3) mỗi 2 tháng sau bản phát hành `.1`.

Chúng tôi dự kiến phát hành Ruby 3.3.7 vào ngày 7 tháng 1. Nếu có bất kỳ thay đổi đáng kể nào ảnh hưởng đến số lượng lớn người dùng, chúng tôi có thể phát hành phiên bản mới sớm hơn lịch trình.

## Tải về

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
