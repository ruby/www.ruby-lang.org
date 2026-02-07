---
layout: news_post
title: "helium.ruby-lang.org đã bị tấn công"
author: "Shugo Maeda"
lang: vi
---

Vào thứ Sáu ngày 28 tháng 5, chúng tôi phát hiện có người đã tấn công helium.ruby-lang.org
thông qua CVS.

May mắn là tiến trình cvs đang chạy trong môi trường chroot,
nên ảnh hưởng đến các dịch vụ/nội dung khác không nhiều, nhưng
chúng tôi đang xác nhận điều này.
Hiện tại không tìm thấy sự can thiệp nào ngoài môi trường
chroot.

Nội dung đáng lo ngại nhất là các kho CVS, nhưng các bản
phân phối này không bị ảnh hưởng.

    5d52c7d0e6a6eb6e3bc68d77e794898e  ruby-1.8.1.tar.gz
    bf48d49dbd94b5c0eda5f75b3bfbac16  ruby-1.6.8.tar.gz

Dịch vụ danh sách thư đã được khởi động lại, nhưng CVS/WWW/FTP/RSYNC
vẫn đang tạm dừng, xin lỗi.

Thông tin thêm sẽ được cung cấp trên https://www.ruby-lang.org/.
Để biết thêm thông tin, vui lòng gửi email đến admin@ruby-lang.org.
