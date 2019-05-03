---
layout: page
title: "Đến với Ruby từ Python"
lang: vi
---

Python là một ngôn ngữ lập trình khác khá tốt. Khi chuyển từ Python qua Ruby,
bạn sẽ học thêm một vài cú pháp.

### Điểm tương đồng

Giống như Python, trong Ruby,...

* Có một dấu nhắc tương tác (được gọi là `irb`).
* Bạn có thể đọc các doc trên cửa sổ dòng lệnh (với lệnh `ri` thay vì
  `pydoc`).
* Không có dòng kết thúc đặc biệt (ngoài trừ xuống dòng).
* Các chuỗi có thể kéo dài nhiều dòng giống như chuỗi triple-quoted của
  Python.
* Ngoặc vuông dùng cho list, và ngoặc nhọn dùng cho dict (trong Ruby
  được gọi là "hash").
* Các mảng hoạt động như nhau (khi thêm vào sẽ làm tăng phần tử mảng,
  nhưng khi kết hợp lại như `a3=[ a1, a2 ]` sẽ thành mảng trong mảng).
* Đối tượng là kiểu dữ liệu chủ đạo.
* Tất cả mọi thứ đều là đối tượng, và các biến chỉ tham chiếu đến đối tượng.
* Mặc dù từ khóa có một chút khác biệt, nhưng các ngoại lệ hoạt động như
  nhau.
* Công cụ doc được tích hợp sẵn (trong Ruby là rdoc).

### Khác biệt

Khác với Python, trong Ruby,...

* Chuỗi có thể thay đổi.
* Bạn có thể tạo hằng số (giá trị của các biến không thay đổi).
* Viết theo quy ước trong một số trường hợp (ví dụ tên lớp phải bắt đầu
  bằng ký tự in hoa, các biến bắt đầu với ký tự thường).
* Chỉ có một loại danh sách chứa (một mảng), và có thể thay đổi.
* Các chuỗi trong dấu nháy kép cho phép chuyển đổi tuần tự (như `\t`)
  và cú pháp "thay đổi biểu thức" đặc biệt (cho phép bạn có thể chèn
  trực tiếp vào kết quả của biểu thức đó mà không cần phải `"gắn " +
  "các chuỗi " + "vào nhau"`). Các chuỗi nằm trong dấu nháy đơn tương
  tự như `r"raw strings"` của Python.
* Không có các lớp "new style" và "old style". Chỉ có 1 loại (Python
  3+ không có vấn đề này, nhưng nó không hoàn toàn tương thích với
  Python 2).
* Bạn không thể truy cập trực tiếp thuộc tính. Trong Ruby tất cả đểu
  thông qua việc gọi phương thức.
* Dấu ngoặc đơn khi gọi phương thức được tùy chọn.
* Có các truy cập `public`, `private`, và `protected` thay vì
  gạch dưới `_voluntary_` `__convention__` trong Python.
* “mixins” được sử dụng thay cho đa kế thừa.
* Bạn có thể chỉnh sửa các phương thức trong lớp được xây dựng sẵn. Cả
  hai ngôn ngữ đều là mã nguồn mở và bạn có thể chỉnh sửa các lớp ở bất
  kỳ đâu, nhưng Python ngăn chặn việc thay đổi mã nguồn được xây dựng sẵn
  - Ruby thì không.
* Bạn có `true` và `false` thay vì `True` và `False` (và `nil` thay cho
  `None`).
* Khi kiểm tra đúng sai, chỉ có `false` và `nil` là dành cho giá trị
  sai. Tất cả mọi thứ còn lại đều là true (bao gồm `0`, `0.0`, `""`, và
  `[]`).
* Dùng `elsif` thay vì `elif`.
* Dùng `require` thay vì `import`. tuy nhiên cách dùng thì như nhau.
* Các dòng ghi chú được viết phía *trên* (ngoại trừ docstrings viết
  bên dưới) được dùng để tạo chú thích.
* Số lượng phím tắt giúp bạn dễ nhớ và dễ học hơn. Nó làm cho ngôn
  ngữ Ruby dễ dàng tiếp cận và thú vị hơn.
* Không có cách nào gỡ bỏ một biến đã được thiết lập (như lệnh `del`
  trong Python). Bạn có thể gán giá trị `nil` cho biến, làm cho nội
  dung cũ được xoá, tuy nhiên biến đó vẫn sẽ tồn tại trong bảng symbol.
