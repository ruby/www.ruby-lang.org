---
layout: news_post
title: "Hướng dẫn kho CVS của Ruby"
author: "Unknown Author"
lang: vi
---

Mã nguồn của Ruby được lưu trữ trong các kho CVS. Bạn có thể duyệt chúng
thông qua CVSweb:

* https://www.ruby-lang.org/cgi-bin/cvsweb.cgi/

CVS ẩn danh cũng có sẵn:

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password:
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src co ruby

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/doc login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password:
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/doc co doc

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/www login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password:
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/www co www

Không cần mật khẩu. Chỉ cần nhấn Enter.

Ngoài ra, CVSup cũng có sẵn:

* http://cvs.ruby-lang.org/cvsup/

Bạn sẽ tìm thấy các "supfile" ở đây. Với chúng, bạn có thể lấy một phần hoặc
toàn bộ kho lưu trữ bằng CVSup.

Vậy thôi nhé! Chúc bạn lập trình vui vẻ!
