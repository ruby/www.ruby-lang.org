---
layout: news_post
title: "Phát hành Ruby 2.6.8"
author: "usa"
translator:
date: 2021-07-07 09:00:00 +0000
lang: vi
---

Ruby 2.6.8 đã được phát hành.

Bản phát hành này bao gồm các bản sửa lỗi bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: A command injection vulnerability in RDoc]({%link en/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Thông thường chúng tôi không sửa Ruby 2.6 ngoại trừ các bản sửa bảo mật, nhưng bản phát hành này cũng bao gồm một số bản sửa lỗi hồi quy và sửa lỗi build.
Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8) để biết chi tiết.

Ruby 2.6 hiện đang trong giai đoạn bảo trì bảo mật, cho đến cuối tháng 3 năm 2022.
Sau ngày đó, việc bảo trì Ruby 2.6 sẽ kết thúc.
Chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch chuyển đổi sang các phiên bản Ruby mới hơn, chẳng hạn như 3.0 hoặc 2.7.

## Tải về

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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

Nhiều committer, nhà phát triển và người dùng đã cung cấp các báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
