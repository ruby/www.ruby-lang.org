---
layout: news_post
title: "CVE-2021-31799: Lỗ hổng chèn lệnh trong RDoc"
author: "aycabta"
translator:
date: 2021-05-02 09:00:00 +0000
tags: security
lang: vi
---

Có một lỗ hổng về chèn lệnh trong RDoc được đi kèm với Ruby.
Tất cả người dùng Ruby được khuyến nghị cập nhật RDoc lên phiên bản mới nhất để khắc phục vấn đề này.

## Chi tiết

Lỗ hổng sau đã được báo cáo.

* [CVE-2021-31799](https://www.cve.org/CVERecord?id=CVE-2021-31799)

RDoc đã từng gọi `Kernel#open` để mở một tệp cục bộ. Nếu một dự án Ruby có một tệp có tên bắt đầu bằng `|` và kết thúc bằng `tags`, lệnh theo sau ký tự pipe sẽ được thực thi. Một dự án Ruby độc hại có thể khai thác điều này để thực thi lệnh tùy ý đối với người dùng cố gắng chạy lệnh `rdoc`.

Người dùng Ruby có phiên bản RDoc bị ảnh hưởng bởi vấn đề này nên cập nhật lên phiên bản mới nhất của RDoc.

## Các phiên bản bị ảnh hưởng

* Tất cả các bản phát hành RDoc từ 3.11 đến 6.3.0
* Ruby 3.0.2 (đi kèm RDoc 6.3.1), Ruby 2.7.4 (đi kèm RDoc 6.2.1.1) và Ruby 2.6.8 (đi kèm RDoc 6.1.2.1) bao gồm các bản vá và không bị ảnh hưởng

## Cách cập nhật

Chạy lệnh sau để cập nhật RDoc lên phiên bản mới nhất (6.3.1 hoặc mới hơn) để khắc phục lỗ hổng.

```
gem install rdoc
```

Nếu bạn đang sử dụng bundler, vui lòng thêm `gem "rdoc", ">= 6.3.1"` vào `Gemfile` của bạn.

## Ghi công

Cảm ơn [Alexandr Savca](https://hackerone.com/chinarulezzz) đã báo cáo vấn đề này.

## Lịch sử

* Công bố lần đầu vào 2021-05-02 09:00:00 UTC
* Đề cập về Ruby 3.0.2, Ruby 2.7.4 và Ruby 2.6.8 vào 2021-07-16 00:02:00 UTC
