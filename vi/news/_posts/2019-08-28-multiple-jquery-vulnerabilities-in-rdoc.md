---
layout: news_post
title: "Nhiều lỗ hổng jQuery trong RDoc"
author: "aycabta"
translator:
date: 2019-08-28 09:00:00 +0000
tags: security
lang: vi
---


Có nhiều lỗ hổng về Cross-Site Scripting (XSS) trong jQuery được đi kèm với RDoc, được đóng gói trong Ruby.
Tất cả người dùng Ruby được khuyến nghị cập nhật Ruby lên bản phát hành mới nhất có bao gồm phiên bản RDoc đã được sửa.

## Chi tiết

Các lỗ hổng sau đã được báo cáo.

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

Tất cả người dùng Ruby được khuyến nghị mạnh mẽ nâng cấp cài đặt Ruby của bạn hoặc áp dụng một trong các biện pháp khắc phục sau càng sớm càng tốt.
Bạn cũng cần tạo lại các tài liệu RDoc hiện có để khắc phục hoàn toàn các lỗ hổng.

## Phiên bản bị ảnh hưởng

* Dòng Ruby 2.3: tất cả
* Dòng Ruby 2.4: 2.4.6 và trước đó
* Dòng Ruby 2.5: 2.5.5 và trước đó
* Dòng Ruby 2.6: 2.6.3 và trước đó
* trước commit master f308ab2131ee675000926540cbb8c13c91dc3be5

## Hành động cần thiết

RDoc là một công cụ tạo tài liệu tĩnh.
Chỉ vá bản thân công cụ là không đủ để khắc phục các lỗ hổng này.

Vì vậy, các tài liệu RDoc được tạo bằng các phiên bản trước cần được tạo lại với RDoc mới hơn.

## Biện pháp khắc phục

Về nguyên tắc, bạn nên nâng cấp cài đặt Ruby của bạn lên phiên bản mới nhất.
RDoc 6.1.2 hoặc mới hơn bao gồm bản sửa cho các lỗ hổng, vì vậy hãy nâng cấp RDoc lên phiên bản mới nhất nếu bạn không thể nâng cấp Ruby.

Lưu ý rằng như đã đề cập trước đó, bạn cần tạo lại các tài liệu RDoc hiện có.

```
gem install rdoc -f
```

*Cập nhật:* Phiên bản đầu tiên của bài viết này có đề cập một phần đến rdoc-6.1.1.gem, phiên bản vẫn còn lỗ hổng. Vui lòng đảm bảo rằng bạn cài đặt rdoc-6.1.2 hoặc mới hơn.

Đối với phiên bản phát triển, hãy cập nhật lên HEAD mới nhất của nhánh master.

## Ghi nhận

Cảm ơn [Chris Seaton](https://hackerone.com/chrisseaton) đã báo cáo vấn đề này.

## Lịch sử

* Được công bố lần đầu vào 2019-08-28 09:00:00 UTC
* Phiên bản RDoc được sửa vào 2019-08-28 11:50:00 UTC
* Sửa ngôn ngữ nhỏ vào 2019-08-28 12:30:00 UTC
