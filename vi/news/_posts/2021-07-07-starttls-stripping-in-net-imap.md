---
layout: news_post
title: "CVE-2021-32066: Lỗ hổng StartTLS stripping trong Net::IMAP"
author: "shugo"
translator:
date: 2021-07-07 09:00:00 +0000
tags: security
lang: vi
---

Một lỗ hổng StartTLS stripping đã được phát hiện trong Net::IMAP.
Lỗ hổng này đã được gán mã định danh CVE [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
Chúng tôi khuyến nghị bạn nâng cấp Ruby ngay.

net-imap là một default gem trong Ruby 3.0.1 nhưng nó có vấn đề về đóng gói, vì vậy vui lòng nâng cấp chính Ruby.

## Chi tiết

Net::IMAP không phát sinh ngoại lệ khi StartTLS
thất bại với phản hồi không xác định, điều này có thể cho phép kẻ tấn công
man-in-the-middle vượt qua bảo vệ TLS bằng cách tận dụng vị trí mạng
giữa máy khách và registry để chặn lệnh StartTLS,
hay còn gọi là "tấn công StartTLS stripping."

## Các phiên bản bị ảnh hưởng

* Ruby dòng 2.6: 2.6.7 và trước đó
* Ruby dòng 2.7: 2.7.3 và trước đó
* Ruby dòng 3.0: 3.0.1 và trước đó

## Ghi công

Cảm ơn [Alexandr Savca](https://hackerone.com/chinarulezzz) đã báo cáo vấn đề này.

## Lịch sử

* Originally published at 2021-07-07 09:00:00 UTC
