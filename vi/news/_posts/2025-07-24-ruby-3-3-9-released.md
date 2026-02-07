---
layout: news_post
title: "Phát hành Ruby 3.3.9"
author: nagachika
translator: "Ngọc Lê"
date: 2025-07-24 11:00:00 +0000
lang: vi
---

Ruby 3.3.9 đã được phát hành.

Bản phát hành này bao gồm bản sửa lỗi bảo mật sau của các gem mặc định:

* [CVE-2025-24294: Khả năng tấn công từ chối dịch vụ trong gem resolv](https://www.ruby-lang.org/vi/news/2025/07/08/dos-resolv-cve-2025-24294/)

và các bản sửa lỗi sau cho các vấn đề biên dịch:

* GCC 15.1
* Visual Studio 2022 Version 17.14

Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_9) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.3.9" | first %}

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

Nhiều committer, nhà phát triển, và người dùng đã cung cấp các báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
