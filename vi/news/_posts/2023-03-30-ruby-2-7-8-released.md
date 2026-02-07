---
layout: news_post
title: "Phát hành Ruby 2.7.8"
author: "usa"
translator:
date: 2023-03-30 12:00:00 +0000
lang: vi
---

Ruby 2.7.8 đã được phát hành.

Bản phát hành này bao gồm các bản vá bảo mật.
Vui lòng xem các chủ đề dưới đây để biết chi tiết.

* [CVE-2023-28755: Lỗ hổng ReDoS trong URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Lỗ hổng ReDoS trong Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Bản phát hành này cũng bao gồm một số bản sửa lỗi biên dịch.
Xem [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_8) để biết thêm chi tiết.

Sau bản phát hành này, Ruby 2.7 đạt đến EOL (kết thúc vòng đời). Nói cách khác, đây dự kiến là bản phát hành cuối cùng của dòng Ruby 2.7.
Chúng tôi sẽ không phát hành Ruby 2.7.9 ngay cả khi phát hiện lỗ hổng bảo mật (nhưng có thể phát hành nếu phát hiện lỗi hồi quy nghiêm trọng).
Chúng tôi khuyến nghị tất cả người dùng Ruby 2.7 bắt đầu chuyển sang Ruby 3.2, 3.1 hoặc 3.0 ngay lập tức.

## Tải về

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

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
