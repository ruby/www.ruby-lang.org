---
layout: news_post
title: "Kho mã nguồn Ruby đã chuyển sang Git từ Subversion"
author: "hsbt"
translator:
date: 2019-04-23 00:00:00 +0000
lang: vi
---

Hôm nay, kho mã nguồn chính thức của ngôn ngữ lập trình Ruby đã được chuyển sang Git từ Subversion.

Giao diện web cho kho mã nguồn mới là [https://git.ruby-lang.org](https://git.ruby-lang.org), được cung cấp bởi cgit. Chúng tôi có thể giữ nguyên commit hash từ người đóng góp trên kho mã nguồn Ruby.

## Chính sách phát triển

* Chúng tôi không sử dụng topic branch trên cgit.
* Kho mã nguồn trên GitHub vẫn chỉ là một bản sao (mirror). Chúng tôi không sử dụng tính năng "Merge pull request".
* Các nhánh ruby_2_4, ruby_2_5 và ruby_2_6 sẽ tiếp tục sử dụng SVN. Chúng tôi không đẩy bất cứ thứ gì lên các nhánh này trên cgit.
* Bắt đầu từ ruby_2_7, chúng tôi sẽ sử dụng cgit để phát triển các nhánh ổn định.
* Chúng tôi không sử dụng merge commit.

## Lời cảm ơn đặc biệt

* k0kubun

  k0kubun đã tích cực phát triển các chuỗi công cụ liên quan đến quy trình phát hành và backport, đồng thời cập nhật hook script cho git.

* naruse

  naruse đã cập nhật các thay đổi tính năng cho Ruby CI và Redmine (bugs.ruby-lang.org).

* mame

  mame đã tạo script thông báo commit cho slack.

## Công việc trong tương lai

Chúng tôi vẫn cần hoàn thành một số công việc. Nếu bạn phát hiện vấn đề liên quan đến việc chuyển đổi sang Git, vui lòng báo cáo tại [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632).

Chúc vui!
