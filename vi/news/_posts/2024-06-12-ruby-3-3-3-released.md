---
layout: news_post
title: "Phát hành Ruby 3.3.3"
author: "k0kubun"
translator:
date: 2024-06-12 00:30:00 +0000
lang: vi
---

Ruby 3.3.3 đã được phát hành.

Bản phát hành này bao gồm:

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree` được thay thế bằng `--parser=prism --dump=parsetree`
* Các symbol encoding không hợp lệ ném `SyntaxError` thay vì `EncodingError`
* Sửa lỗi rò rỉ bộ nhớ trong Ripper parsing
* Sửa lỗi cho YJIT, `**{}`, `Ripper.tokenize`, `RubyVM::InstructionSequence#to_binary`, `--with-gmp`, và một số môi trường build

Vui lòng xem [các bản phát hành trên GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_3) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

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
