---
layout: news_post
title: "Phát hành Ruby 2.6.6"
author: "nagachika"
translator:
date: 2020-03-31 12:00:00 +0000
lang: vi
---

Ruby 2.6.6 đã được phát hành.

Bản phát hành này bao gồm các bản sửa lỗi bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [CVE-2020-10663: Unsafe Object Creation Vulnerability in JSON (Additional fix)]({% link en/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: Heap exposure vulnerability in the socket library]({% link en/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_5...v2_6_6) để biết chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "2.6.6" | first %}

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
