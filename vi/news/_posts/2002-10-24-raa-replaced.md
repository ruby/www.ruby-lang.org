---
layout: news_post
title: "RAA đã được thay thế"
author: "Unknown Author"
lang: vi
---

Chúng tôi www-admin@ruby-lang.org đã viết lại [RAA][1] hiện tại vốn đã
cũ và xuống cấp.

Các thay đổi:

* Trang chủ nhẹ hơn
* iso8859-1 =&gt; UTF-8
* Thêm tìm kiếm từ khóa đơn giản
* Hiển thị dự án theo chủ sở hữu được chỉ định

Các giao diện SOAP và XML-RPC cũng sẽ được cập nhật. Người dùng giao diện SOAP và
XML-RPC của RAA, vui lòng thông báo cho tôi nếu có vấn đề xảy ra. Tôi đã thay đổi
định dạng truyền tải một chút. Xem bên dưới;

* Phần tử id và owner\_id được thêm vào mỗi mục nhập. Hai phần tử này
  chứa số nguyên dương.
* Chỉ dành cho người dùng giao diện SOAP: phần tử url, download và email được
  đánh dấu là kiểu xsd:anyURI. Các phần tử này sẽ được giải mã thành đối tượng
  URI ở phía client, không phải đối tượng String.

Ngoài SOAP và XML-RPC, chúng tôi cung cấp tệp XML hoặc RDF thuần của thông tin
RAA. Chúng nằm tại http://raa.ruby-lang.org/xml.xml và
http://raa.ruby-lang.org/rdf.xml. Bạn cũng có thể lấy thông tin mới nhất ở
định dạng RDF từ http://raa.ruby-lang.org/since.mrb

Người dùng giao diện XML/RDF feed của pragdave nên sử dụng các địa chỉ trên
tạm thời. Các giao diện cũ của pragdave hiện chưa được cập nhật do việc
thay thế RAA DB. Hãy lưu ý rằng một số thay đổi cũng đã được thực hiện trên các
giao diện này. Xem bên dưới;

* Các tệp \*.xml được cập nhật mỗi 15 phút, không phải theo thời gian thực.
* Bảng mã ký tự đã được thay đổi từ iso-8859-1 sang UTF-8.
* Định dạng XML instance đã được thay đổi để tiện lợi hơn cho người dùng.



[1]: http://raa.ruby-lang.org/
