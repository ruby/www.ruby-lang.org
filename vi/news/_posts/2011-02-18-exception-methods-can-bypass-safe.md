---
layout: news_post
title: "Các phương thức Exception có thể vượt qua $SAFE"
author: "Urabe Shyouhei"
lang: vi
---

Phương thức Exception#to\_s có thể được sử dụng để đánh lừa kiểm tra $SAFE, cho phép mã không đáng tin cậy sửa đổi các chuỗi tùy ý.

### Mô tả chi tiết

Trong ngữ nghĩa $SAFE của Ruby, safe level 4 được sử dụng để chạy mã
không đáng tin cậy (chẳng hạn như plugin). Vì vậy ở các safe level cao
hơn, một số thao tác bị cấm để ngăn mã không đáng tin cậy tấn công dữ
liệu bên ngoài (đáng tin cậy).

Exception#to\_s được phát hiện có vấn đề liên quan đến điều này. Phương
thức này có thể đánh lừa cơ chế safe level và đánh dấu phá hủy một
chuỗi không bị tainted thành tainted. Với điều này, kẻ tấn công có thể
sửa đổi các chuỗi untainted tùy ý như sau:

    $secret_path = "foo"

    proc do
        $SAFE = 4
        Exception.new($secret_path).to_s
        $secret_path.replace "/etc/passwd"
    end.call

    open($secret_path) do
      ...
    end

### Các phiên bản bị ảnh hưởng

May mắn thay, cuộc tấn công này không hiệu quả đối với dòng ruby
1.9.x. Các phiên bản bị ảnh hưởng chỉ giới hạn ở:

* Ruby 1.8.6 patchlevel 420 và tất cả các phiên bản trước đó
* Ruby 1.8.7 patchlevel 330 và tất cả các phiên bản trước đó
* Các phiên bản phát triển của Ruby 1.8 (1.8.8dev)

### Giải pháp

Vui lòng nâng cấp lên phiên bản mới hơn.

### Cập nhật

* 1\.8.7-334 đã được phát hành để sửa vấn đề này. Người dùng 1.8.7
  được khuyến khích nâng cấp.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
