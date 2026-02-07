---
layout: news_post
title: "Ruby 2.4.9 Đã Phát Hành"
author: "usa"
translator:
date: 2019-10-02 09:00:00 +0000
lang: vi
---

Ruby 2.4.9 đã được phát hành.

Bản phát hành này là một đóng gói lại của 2.4.8 vì tarball phát hành Ruby 2.4.8
trước đó không cài đặt được.
(Xem [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) để biết chi tiết.)
Không có thay đổi thiết yếu nào ngoài số phiên bản giữa 2.4.8 và 2.4.9.

Ruby 2.4 hiện đang trong giai đoạn bảo trì bảo mật, cho đến
cuối tháng 3 năm 2020. Sau ngày đó, việc bảo trì Ruby 2.4
sẽ kết thúc. Chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch di chuyển sang các
phiên bản Ruby mới hơn, như 2.6 hoặc 2.5.

## Tải về

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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

## Ghi chú phát hành

Cảm ơn tất cả những ai đã giúp đỡ cho bản phát hành này.
