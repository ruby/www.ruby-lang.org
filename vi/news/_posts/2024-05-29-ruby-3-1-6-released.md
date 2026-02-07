---
layout: news_post
title: "Phát hành Ruby 3.1.6"
author: "hsbt"
translator:
date: 2024-05-29 9:00:00 +0000
lang: vi
---

Ruby 3.1.6 đã được phát hành.

Dòng Ruby 3.1 hiện đang trong giai đoạn bảo trì bảo mật. Thông thường, chúng tôi chỉ sửa các vấn đề bảo mật trong giai đoạn này. Tuy nhiên, chúng tôi gặp một số vấn đề lỗi build sau khi phát hành Ruby 3.1.5. Chúng tôi quyết định phát hành Ruby 3.1.6 để sửa các vấn đề này.

Vui lòng xem các chủ đề dưới đây để biết chi tiết.

* [Bug #20151: Can't build Ruby 3.1 on FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Bad Ruby 3.1.5 backport causes fiddle to fail to build](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 build fail with make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

Xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_6) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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
