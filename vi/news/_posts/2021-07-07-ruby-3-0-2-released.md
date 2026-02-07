---
layout: news_post
title: "Phát hành Ruby 3.0.2"
author: "nagachika"
translator:
date: 2021-07-07 09:00:00 +0000
lang: vi
---

Ruby 3.0.2 đã được phát hành.

Bản phát hành này bao gồm các bản vá bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết thêm chi tiết.

* [CVE-2021-31810: Lỗ hổng tin tưởng phản hồi FTP PASV trong Net::FTP]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Lỗ hổng tước bỏ StartTLS trong Net::IMAP]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Lỗ hổng chèn lệnh trong RDoc]({%link en/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v3_0_1...v3_0_2) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.0.2" | first %}

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

Nhiều committer, nhà phát triển và người dùng đã cung cấp các báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
