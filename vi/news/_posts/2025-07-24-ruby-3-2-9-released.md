---
layout: news_post
title: "Phát hành Ruby 3.2.9"
author: "hsbt"
translator:
date: 2025-07-24 08:51:53 +0000
lang: vi
---

Ruby 3.2.9 đã được phát hành.

Bản phát hành này bao gồm các bản sửa bảo mật sau:

* [CVE-2025-24294: Khả năng Từ chối Dịch vụ trong gem resolv](https://www.ruby-lang.org/en/news/2025/07/08/dos-resolv-cve-2025-24294/)
* [CVE-2025-43857: Lỗ hổng DoS trong net-imap](https://www.ruby-lang.org/en/news/2025/04/28/dos-net-imap-cve-2025-43857/)

và các bản sửa lỗi build sau:

* GCC 15.1
* Visual Studio 2022 Version 17.14

Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_9) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.2.9" | first %}

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
