---
layout: page
title: "Đến với Ruby từ Java"
lang: vi
---

Java rất phổ biến. Nó đã được chứng minh là nhanh (trái với những
gì mà các nhóm anti-Java nêu ra). Nó cũng khá là rườm rà. Chuyển
từ Java qua Ruby, đoạn mã của bạn sẽ rút ngắn đáng kề. Ruby cho phép
thực hiện nguyên mẫu nhanh hơn.

### Điểm tương đồng

Giống như Java, trong Ruby,...

* Bộ nhớ được quản lý thông qua một bộ thu dọn (Garbage Collector).
* Đối tượng là kiểu dữ liệu chủ đạo.
* Có các phương thức public, private, và protected.
* Có tích hợp các công cụ doc (trong Ruby là RDoc). Các doc
  được tạo bằng rdoc cũng tương tự như được tạo bởi javadoc.

### Khác biệt

Khác với Java, trong Ruby,...

* Bạn không cần phải biên dịch, chỉ cần chạy trực tiếp.
* Có một số khác biệt với các công cụ GUI của bên thứ ba. Người
  dùng Ruby có thể dùng [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3],
  [Qt][4], hoặc ví dụ như các gói  trong Ruby Tk.
* Bạn sử dụng từ khóa `end` sau khi định nghĩa mọi thứ trong các lớp,
  thay vì sử dụng các block.
* Sử dụng `require` thay vì `import`.
* Tất cả các biến đều là private. Bạn chỉ có thể truy cập từ bên ngoài
  thông qua các phương thức.
* Các dấu ngoặc khi gọi phương thức thường bỏ qua hoặc tùy chọn.
* Tất cả đều là đối tượng, bao gồm số như là 2 và 3.14159.
* Không kiểm tra các kiểu static.
* Tên biến chỉ là các nhãn. Không có loại nào liên quan tới chúng.
* Không có kiểu khai báo. Bạn chỉ cần gán cho tên biến mới những gì
  cần thiết và nó sẽ "tự tạo" (ví dụ `a = [1,2,3]` thay vì
  `int[] a = {1,2,3};`).
* Không cần ép kiểu. Chỉ cần gọi các phương thức. Các unit test
  sẽ báo các ngoại lệ cho bạn biết trước khi bạn thực thi lệnh.
* Sử dụng `foo = Foo.new("hi")` thay vì `Foo foo = new Foo("hi")`.
* Các phương thức khởi tạo luôn được đặt tên là “initialize”
  thay vì là tên của lớp đó.
* Bạn có “mixins” thay cho các interface.
* YAML thường được sử dụng trên XML.
* Ruby báo `nil` thay vì `null`.
* `==` và `equals()` được xử lý khác nhau trong Ruby. Sử dụng `==`
  khi bạn muốn kiểm tra tương đương trong Ruby (trong Java là `equals()`).
  Sử dụng `equals?()` khi bạn muốn biết 2 đối tượng có giống nhau không
  (trong Java là `==`).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
