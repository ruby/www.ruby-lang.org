---
layout: news_post
title: "WEBrick có lỗ hổng chèn chuỗi thoát"
author: "Urabe Shyouhei"
lang: vi
---

Một lỗ hổng đã được phát hiện trong WEBrick, một phần của thư viện
chuẩn của Ruby. WEBrick cho phép kẻ tấn công chèn các chuỗi thoát độc
hại vào nhật ký của nó, khiến cho các ký tự điều khiển nguy hiểm có thể
được thực thi trên trình giả lập terminal của nạn nhân.

Chúng tôi đã có bản sửa cho vấn đề này. Các bản phát hành cho tất cả
các nhánh đang hoạt động sẽ theo sau thông báo này. Nhưng trong thời
gian chờ đợi, chúng tôi khuyến nghị bạn tránh xem nhật ký WEBrick cho
đến khi bạn cập nhật tiến trình WEBrick của mình.

## Mô tả chi tiết

Các chuỗi thoát terminal được sử dụng để cho phép nhiều hình thức tương
tác giữa terminal và tiến trình bên trong. Vấn đề là các chuỗi đó
không được thiết kế để được phát ra bởi các nguồn không đáng tin cậy;
chẳng hạn như đầu vào mạng. Vì vậy nếu kẻ tấn công từ xa có thể chèn
các chuỗi thoát vào nhật ký WEBrick, và nạn nhân tình cờ xem chúng
thông qua terminal, kẻ tấn công có thể lợi dụng các [điểm yếu trong
trình giả lập terminal][1].

Và WEBrick không lọc các chuỗi thoát terminal đó.

Ví dụ:

    % xterm -e ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port=>8080).start' &
    % wget http://localhost:8080/%1b%5d%32%3b%6f%77%6e%65%64%07%0a

Hãy chú ý tiêu đề cửa sổ của xterm.

## Các phiên bản bị ảnh hưởng

* Ruby 1.8.6 patchlevel 383 và tất cả các phiên bản trước đó
* Ruby 1.8.7 patchlevel 248 và tất cả các phiên bản trước đó
* Các phiên bản phát triển của Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 376 và tất cả các phiên bản trước đó
* Các phiên bản phát triển của Ruby 1.9 (1.9.2dev)

## Giải pháp

* Các bản sửa cho 1.8.6, 1.8.7, và 1.9.1 sẽ theo sau thông báo này.
  * **Cập nhật** 1.8.7 pl. 249 đã được phát hành để sửa vấn đề này.
    Người dùng 1.8.7 được khuyến khích nâng cấp.
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz][2]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2][3]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip][4]

  * **Cập nhật** 1.9.1 pl. 378 đã được phát hành để sửa vấn đề này.
    Người dùng 1.9.1 được khuyến khích nâng cấp.
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz][5]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2][6]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip][7]

  * **Cập nhật** 1.8.6 pl. 388 đã được phát hành để sửa vấn đề này.
    Người dùng 1.8.6 được khuyến khích nâng cấp.
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz][8]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2][9]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip][10]

* Đối với các phiên bản phát triển, vui lòng cập nhật lên revision mới
  nhất cho mỗi nhánh phát triển.

## Ghi nhận

Ghi nhận Giovanni "evilaliv3" Pellerano, Alessandro "jekil" Tanasi,
và Francesco "ascii" Ongaro vì đã phát hiện lỗ hổng này.



[1]: http://marc.info/?l=bugtraq&amp;m=104612710031920&amp;w=2 "Terminal Emulator Security Issues"
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2
[10]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip
