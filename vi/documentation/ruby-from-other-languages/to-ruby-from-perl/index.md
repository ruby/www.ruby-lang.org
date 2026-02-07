---
layout: page
title: "Đến với Ruby từ Perl"
lang: vi
---

Perl thật tuyệt vời. Tài liệu của Perl thật tuyệt vời. Cộng đồng Perl
cũng… tuyệt vời.
Đối với những lập trình viên Perl khao khát các tính năng OO thanh lịch
được tích hợp sẵn ngay từ đầu, Ruby có thể dành cho bạn.

### Điểm tương đồng

Giống như Perl, trong Ruby,...

* Bạn có một hệ thống quản lý gói, hơi giống CPAN (được gọi là
  [RubyGems][1]).
* Regex được tích hợp sẵn. Bon appétit!
* Có một số lượng khá lớn các hàm tích hợp thường dùng.
* Dấu ngoặc đơn thường là tùy chọn.
* Chuỗi hoạt động cơ bản giống nhau.
* Có cú pháp phân cách chuỗi và regex tổng quát tương tự như Perl.
  Nó trông như `%q{this}` (ngoặc đơn), hoặc `%Q{this}` (ngoặc kép),
  và `%w{this for a single-quoted list of words}`. Bạn `%Q|can|`
  `%Q(use)` `%Q^other^` dấu phân cách nếu muốn.
* Bạn có nội suy biến trong ngoặc kép, mặc dù nó `"looks
  #{like} this"` (và bạn có thể đặt bất kỳ mã Ruby nào bên trong
  `#{}`).
* Mở rộng lệnh shell sử dụng `` `backticks` ``.
* Bạn có các công cụ tài liệu tích hợp (của Ruby gọi là rdoc).

### Khác biệt

Không giống Perl, trong Ruby,...

* Bạn không có các quy tắc phụ thuộc ngữ cảnh như với Perl.
* Một biến không giống với đối tượng mà nó tham chiếu đến. Thay vào đó,
  nó luôn chỉ là một tham chiếu đến một đối tượng.
* Mặc dù `$` và `@` đôi khi được sử dụng làm ký tự đầu tiên trong
  tên biến, thay vì chỉ định kiểu, chúng chỉ định phạm vi
  (`$` cho biến toàn cục, `@` cho instance của đối tượng, và
  `@@` cho thuộc tính lớp).
* Mảng được đặt trong ngoặc vuông thay vì ngoặc đơn.
* Kết hợp danh sách từ các danh sách khác không làm phẳng chúng thành
  một danh sách lớn. Thay vào đó, bạn nhận được một mảng chứa các mảng.
* Sử dụng `def` thay vì `sub`.
* Không cần dấu chấm phẩy ở cuối mỗi dòng. Nhân tiện,
  bạn kết thúc các thứ như định nghĩa hàm, định nghĩa lớp, và câu lệnh
  case bằng từ khóa `end`.
* Các đối tượng được định kiểu mạnh. Bạn sẽ phải gọi `foo.to_i`,
  `foo.to_s`, v.v. một cách thủ công nếu cần chuyển đổi giữa các kiểu.
* Không có `eq`, `ne`, `lt`, `gt`, `ge`, hay `le`.
* Không có toán tử kim cương (`<>`).
  Bạn thường sử dụng `IO.some_method` thay thế.
* Dấu phẩy béo `=>` chỉ được sử dụng cho hash literal.
* Không có `undef`. Trong Ruby bạn có `nil`. `nil` là một đối tượng (giống
  như mọi thứ khác trong Ruby). Nó không giống với một biến chưa được định
  nghĩa. Nó được đánh giá là `false` nếu bạn coi nó như boolean.
* Khi kiểm tra giá trị thật, chỉ `false` và `nil` được đánh giá là giá
  trị false. Mọi thứ khác là true (bao gồm `0`, `0.0`, và `"0"`).
* Không có [PerlMonks][2]. Tuy nhiên mailing list ruby-talk là một nơi
  rất hữu ích.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
