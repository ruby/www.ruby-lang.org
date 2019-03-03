---
layout: page
title: "Đến với Ruby từ Perl"
lang: vi
---

Perl rất tuyệt vời, các tài liệu của Perl cũng vậy. Cộng đồng Perl cũng …
tuyệt vời. Tuy nhiên, ngôn ngữ này khá rộng lớn và phức tạp. Ruby có lẽ
được dành cho các Perler những người đã có một khoảng thời gian dễ dàng,
một ngôn ngữ trực quan hơn, và các tính năng OO được xây dựng ngay từ đầu.

### Điểm tương đồng

Giống như Perl, trong Ruby,...

* Bạn có một gói quản lý hệ thống, như là CPAN (trong Ruby thì được
  gọi là [RubyGems][1]).
* Các regex đã được xây dựng sẵn.
* Có một số lượng built-ins khá lớn được xây dựng sẵn.
* Các ngoặc đơn thường tùy chọn.
* Cách hoạt động của các String cũng tương tự nhau.
* Có một ký tự phân cách giữa chuỗi và regex khi trích dẫn cú pháp
  như của Perls (như `%q{(dẫu nháy đơn) này}`, hoặc `%Q{(nháy kép) này}`,
  và `%w{trích dẫn danh sách các từ}`.
  Bạn `%Q|có thể|` `%Q(dùng)` ký tự `%Q^khác^` nếu thích.
* You’ve got double-quotish variable interpolation, though
  nó `"trông #{như thế} này"` (và bạn có thể đặt bất cứ đoạn mã mình thích vào
  `#{}`).
* Mở rộng lệnh shell bằng `` `backticks` ``.
* Có tích hợp các công cụ doc (trong Ruby là rdoc).

### Khác biệt

Khác với Perl, trong Ruby,...

* Bạn không cần các quy tắc về ngữ cảnh như Perl.
* Một biến không giống như đối tượng mà nó có thể tham chiếu.
  Thay vào đó nó luôn được tham chiếu đến đối tượng.
* Mặc dù `$` và `@` đôi khi được sử dụng khi khai báo
  tên biến, chứ không chỉ loại của nó, nó chỉ ra phạm vi (`$`
  cho toàn cục, `@` cho thể hiện của đối tượng, và
  `@@` cho thuộc tính của lớp).
* Các phần tử của mảng đặt trong ngoặc vuông thay vì ngoặc đơn.
* Kết hợp list từ các list khác không làm cho chúng trở nên lớn hơn.
  Thay vào đó bạn sẽ nhận được một mảng của mảng.
* Sử dụng `def` thay vì `sub`.
* Không cần dấu chấm phẩy ở mỗi cuối dòng. Thay vào đó, bạn kết thúc
  các chức năng, lớp và các điều kiện với từ khóa `end`.
* Đối tượng là kiểu dữ liệu chủ đạo. Bạn có thể gọi `foo.to_i`,
  `foo.to_s`, v.v., nếu bạn muốn chuyển đổi kiểu dữ liệu.
* Không có `eq`, `ne`, `lt`, `gt`, `ge`, nor `le`.
* Không có toán tử diamond (`<>`). Bạn có thể sử dụng `IO.some_method`
  để thay thế.
* Dấu suy ra `=>` chỉ được dùng cho các chuỗi ký tự hash.
* Không có `undef`. Trong Ruby bạn có `nil`. `nil` là một đối tượng (như
  những thứ khác trong Ruby). Không phải là một biến không xác định.
  Nó sẽ là `false` nếu bạn xem nó như kiểu boolean.
* Khi kiểm tra đúng sai, chỉ có `false` và `nil` là dành cho các giá trị
  sai. Tất cả mọi thứ đều là true (bao gồm `0`,`0.0` và `"0"`).
* Không có [PerlMonks][2]. Mặc dù hộp thư chung của ruby-talk là một nơi
  rất hữu ích.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
