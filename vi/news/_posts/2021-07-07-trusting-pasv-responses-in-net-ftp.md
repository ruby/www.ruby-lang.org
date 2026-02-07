---
layout: news_post
title: "CVE-2021-31810: Lỗ hổng tin cậy phản hồi FTP PASV trong Net::FTP"
author: "shugo"
translator:
date: 2021-07-07 09:00:00 +0000
tags: security
lang: vi
---

Một lỗ hổng tin cậy phản hồi FTP PASV đã được phát hiện trong Net::FTP.
Lỗ hổng này đã được gán mã định danh CVE [CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810).
Chúng tôi khuyến nghị bạn nâng cấp Ruby ngay.

net-ftp là một default gem trong Ruby 3.0.1 nhưng nó có vấn đề về đóng gói, vì vậy vui lòng nâng cấp chính Ruby.

## Chi tiết

Một máy chủ FTP độc hại có thể sử dụng phản hồi PASV để lừa Net::FTP
kết nối ngược lại đến một địa chỉ IP và cổng nhất định. Điều này
có thể khiến Net::FTP trích xuất thông tin về các dịch vụ
mà thông thường là riêng tư và không được tiết lộ (ví dụ: kẻ tấn công có thể thực hiện quét cổng
và trích xuất banner dịch vụ).

## Các phiên bản bị ảnh hưởng

* Ruby dòng 2.6: 2.6.7 và trước đó
* Ruby dòng 2.7: 2.7.3 và trước đó
* Ruby dòng 3.0: 3.0.1 và trước đó

## Ghi công

Cảm ơn [Alexandr Savca](https://hackerone.com/chinarulezzz) đã báo cáo vấn đề này.

## Lịch sử

* Originally published at 2021-07-07 09:00:00 UTC
