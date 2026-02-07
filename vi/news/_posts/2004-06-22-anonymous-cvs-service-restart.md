---
layout: news_post
title: "Khởi động lại dịch vụ CVS ẩn danh"
author: "Shugo Maeda"
lang: vi
---

Dịch vụ CVS ẩn danh đã được khởi động lại.

Để lấy mã nguồn mới nhất của ruby, gõ các lệnh sau:

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password: [Enter]
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src co ruby

Không cần mật khẩu.

CVSup cũng có sẵn. Bạn có thể lấy các supfile tại
http://cvs.ruby-lang.org/cvsup/.

Kho CVS đã được nhóm quản trị viên ruby-lang.org kiểm tra.
Chi tiết sẽ được báo cáo. Vui lòng chờ thêm.

Shugo Maeda &lt;shugo@ruby-lang.org&gt;<br />
nhóm quản trị viên ruby-lang.org
