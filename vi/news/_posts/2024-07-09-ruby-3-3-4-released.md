---
layout: news_post
title: "Phát hành Ruby 3.3.4"
author: "k0kubun"
translator:
date: 2024-07-09 00:30:00 +0000
lang: vi
---

Ruby 3.3.4 đã được phát hành.

Bản phát hành này sửa một lỗi hồi quy trong Ruby 3.3.3 khi thiếu các dependency trong gemspec
của một số gem đi kèm: `net-pop`, `net-ftp`, `net-imap`, và `prime`
[[Bug #20581]](https://bugs.ruby-lang.org/issues/20581).
Bản sửa lỗi cho phép Bundler cài đặt thành công các gem đó trên các nền tảng như Heroku.
Nếu `bundle install` của bạn chạy bình thường, bạn có thể không gặp vấn đề này.

Các thay đổi khác chủ yếu là sửa lỗi nhỏ.
Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_4) để biết thêm chi tiết.

## Lịch trình phát hành

Trong thời gian tới, chúng tôi dự định phát hành phiên bản Ruby ổn định mới nhất (hiện tại là Ruby 3.3) mỗi 2 tháng sau bản phát hành `.1`.
Với Ruby 3.3, 3.3.5 dự kiến phát hành vào ngày 3 tháng 9, 3.3.6 vào ngày 5 tháng 11, và 3.3.7 vào ngày 7 tháng 1.

Nếu có bất kỳ thay đổi nào ảnh hưởng đến một số lượng lớn người dùng, ví dụ như người dùng Ruby 3.3.3 trên Heroku cho bản phát hành này,
chúng tôi có thể phát hành phiên bản mới sớm hơn dự kiến.

## Tải về

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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
