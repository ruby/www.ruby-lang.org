---
layout: news_post
title: "Phát hành Ruby 3.0.7"
author: "hsbt"
translator:
date: 2024-04-23 10:00:00 +0000
lang: vi
---

Ruby 3.0.7 đã được phát hành.

Bản phát hành này bao gồm các bản sửa lỗi bảo mật.
Vui lòng xem các chủ đề bên dưới để biết chi tiết.

* [CVE-2024-27282: Arbitrary memory address read vulnerability with Regex search]({%link en/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc]({%link en/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})
* [CVE-2024-27280: Buffer overread vulnerability in StringIO]({%link en/news/_posts/2024-03-21-buffer-overread-cve-2024-27280.md %})

Xem [bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_0_7) để biết thêm chi tiết.

Sau bản phát hành này, Ruby 3.0 đã kết thúc vòng đời (EOL). Nói cách khác, đây dự kiến là bản phát hành cuối cùng của dòng Ruby 3.0.
Chúng tôi sẽ không phát hành Ruby 3.0.8 ngay cả khi phát hiện lỗ hổng bảo mật (nhưng có thể phát hành nếu tìm thấy lỗi hồi quy nghiêm trọng).
Chúng tôi khuyến nghị tất cả người dùng Ruby 3.0 bắt đầu chuyển sang Ruby 3.3, 3.2, hoặc 3.1 ngay lập tức.

## Tải về

{% assign release = site.data.releases | where: "version", "3.0.7" | first %}

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

Nhiều committer, nhà phát triển và người dùng đã báo cáo lỗi và giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn sự đóng góp của họ.
