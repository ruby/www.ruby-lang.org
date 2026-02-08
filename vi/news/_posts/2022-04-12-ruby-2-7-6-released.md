---
layout: news_post
title: "Phát hành Ruby 2.7.6"
author: "usa and mame"
translator:
date: 2022-04-12 12:00:00 +0000
lang: vi
---

Ruby 2.7.6 đã được phát hành.

Bản phát hành này bao gồm bản vá bảo mật.
Vui lòng xem các chủ đề dưới đây để biết chi tiết.

* [CVE-2022-28739: Tràn bộ đệm trong chuyển đổi String sang Float]({%link en/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Bản phát hành này cũng bao gồm một số bản sửa lỗi.
Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6) để biết thêm chi tiết.

Sau bản phát hành này, chúng tôi kết thúc giai đoạn bảo trì bình thường của Ruby 2.7, và Ruby 2.7 bước vào giai đoạn bảo trì bảo mật.
Điều này có nghĩa là chúng tôi sẽ không còn backport bất kỳ bản sửa lỗi nào cho Ruby 2.7 ngoại trừ các bản sửa lỗi bảo mật.

Giai đoạn bảo trì bảo mật được lên lịch trong một năm.
Ruby 2.7 đạt đến EOL và hỗ trợ chính thức của nó kết thúc khi giai đoạn bảo trì bảo mật kết thúc.
Do đó, chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch nâng cấp lên Ruby 3.0 hoặc 3.1.

## Tải về

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

Việc bảo trì Ruby 2.7, bao gồm cả bản phát hành này, dựa trên "Thỏa thuận cho phiên bản ổn định của Ruby" của Hiệp hội Ruby.
