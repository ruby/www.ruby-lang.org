---
layout: news_post
title: "Phát hành Ruby 3.0.6"
author: "usa"
translator:
date: 2023-03-30 12:00:00 +0000
lang: vi
---

Ruby 3.0.6 đã được phát hành.

Bản phát hành này bao gồm các bản vá bảo mật.
Vui lòng xem các chủ đề dưới đây để biết chi tiết.

* [CVE-2023-28755: Lỗ hổng ReDoS trong URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Lỗ hổng ReDoS trong Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Bản phát hành này cũng bao gồm một số bản sửa lỗi.
Xem [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_6) để biết thêm chi tiết.

Sau bản phát hành này, chúng tôi kết thúc giai đoạn bảo trì bình thường của Ruby 3.0, và Ruby 3.0 bước vào giai đoạn bảo trì bảo mật.
Điều này có nghĩa là chúng tôi sẽ không còn backport bất kỳ bản sửa lỗi nào cho Ruby 3.0 ngoại trừ các bản sửa lỗi bảo mật.

Giai đoạn bảo trì bảo mật được lên lịch trong một năm.
Ruby 3.0 đạt đến EOL và hỗ trợ chính thức của nó kết thúc khi giai đoạn bảo trì bảo mật kết thúc.
Do đó, chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch nâng cấp lên Ruby 3.1 hoặc 3.2.

## Tải về

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

Việc bảo trì Ruby 3.0, bao gồm cả bản phát hành này, dựa trên "Thỏa thuận cho phiên bản ổn định của Ruby" của Hiệp hội Ruby.
