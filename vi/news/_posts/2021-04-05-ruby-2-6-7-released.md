---
layout: news_post
title: "Phát hành Ruby 2.6.7"
author: "usa"
translator:
date: 2021-04-05 12:00:00 +0000
lang: vi
---

Ruby 2.6.7 đã được phát hành.

Bản phát hành này bao gồm các bản vá bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết thêm chi tiết.

* [CVE-2020-25613: Lỗ hổng HTTP Request Smuggling tiềm ẩn trong WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Lỗ hổng round-trip XML trong REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) để biết thêm chi tiết.

Với bản phát hành này, chúng tôi kết thúc giai đoạn bảo trì thông thường của Ruby 2.6,
và Ruby 2.6 bước vào giai đoạn bảo trì bảo mật.
Điều này có nghĩa là chúng tôi sẽ không còn backport bất kỳ bản sửa lỗi nào cho Ruby 2.6 ngoại trừ các bản vá bảo mật.
Thời hạn của giai đoạn bảo trì bảo mật được lên kế hoạch là một năm.
Ruby 2.6 sẽ đạt EOL và hỗ trợ chính thức kết thúc vào cuối giai đoạn bảo trì bảo mật.
Do đó, chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch nâng cấp lên Ruby 2.7 hoặc 3.0.

## Tải về

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

Việc bảo trì Ruby 2.6, bao gồm bản phát hành này, dựa trên "Thỏa thuận về phiên bản ổn định của Ruby" của Hiệp hội Ruby.
