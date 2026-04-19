---
layout: page
title: "Đến với Ruby từ Java"
lang: vi
---

Java là một ngôn ngữ trưởng thành. Nó đã được kiểm chứng. Và nó nhanh
(trái với những gì nhóm phản đối Java vẫn có thể tuyên bố). Nó cũng
khá dài dòng. Khi chuyển từ Java sang Ruby, bạn có thể mong đợi kích thước
mã của mình giảm đi đáng kể. Bạn cũng có thể mong đợi sẽ mất ít thời gian
hơn để xây dựng các bản mẫu nhanh.

### Điểm tương đồng

Giống như Java, trong Ruby,...

* Bộ nhớ được quản lý cho bạn thông qua bộ thu gom rác.
* Các đối tượng được định kiểu mạnh.
* Có các phương thức public, private, và protected.
* Có các công cụ tài liệu tích hợp (của Ruby được gọi là RDoc). Tài liệu
  được tạo bởi rdoc trông rất giống với tài liệu được tạo bởi javadoc.

### Khác biệt

Không giống Java, trong Ruby,...

* Bạn không cần biên dịch mã. Bạn chỉ cần chạy trực tiếp.
* Có một số bộ công cụ GUI bên thứ ba phổ biến khác nhau. Người dùng Ruby
  có thể thử [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3],
  [Qt][4], hoặc [Ruby Tk](https://github.com/ruby/tk) chẳng hạn.
* Bạn sử dụng từ khóa `end` sau khi định nghĩa các thứ như lớp, thay vì
  phải đặt dấu ngoặc nhọn bao quanh các khối mã.
* Bạn dùng `require` thay vì `import`.
* Tất cả biến thành viên đều là private. Từ bên ngoài, bạn truy cập
  mọi thứ thông qua phương thức.
* Dấu ngoặc đơn trong lệnh gọi phương thức thường là tùy chọn và thường
  được bỏ qua.
* Mọi thứ đều là đối tượng, bao gồm cả các số như 2 và 3.14159.
* Không có kiểm tra kiểu tĩnh.
* Tên biến chỉ là nhãn. Chúng không có kiểu dữ liệu đi kèm.
* Không có khai báo kiểu. Bạn chỉ cần gán cho tên biến mới
  khi cần và chúng sẽ tự "xuất hiện" (ví dụ: `a = [1,2,3]` thay vì
  `int[] a = {1,2,3};`).
* Không có ép kiểu. Chỉ cần gọi phương thức. Các bài kiểm thử đơn vị
  của bạn sẽ cho bạn biết trước khi chạy mã nếu bạn sẽ gặp ngoại lệ.
* Sử dụng `foo = Foo.new("hi")` thay vì `Foo foo = new Foo("hi")`.
* Constructor luôn được đặt tên là "initialize" thay vì tên của lớp.
* Bạn có "mixin" thay vì interface.
* YAML có xu hướng được ưa chuộng hơn XML.
* Sử dụng `nil` thay vì `null`.
* `==` và `equals()` được xử lý khác nhau trong Ruby. Sử dụng `==` khi
  bạn muốn kiểm tra tương đương trong Ruby (`equals()` trong Java).
  Sử dụng `equal?()` khi bạn muốn biết hai đối tượng có phải là cùng
  một đối tượng hay không (`==` trong Java).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
