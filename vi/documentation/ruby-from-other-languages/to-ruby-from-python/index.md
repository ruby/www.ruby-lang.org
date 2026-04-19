---
layout: page
title: "Đến với Ruby từ Python"
lang: vi
---

Python là một ngôn ngữ lập trình đa mục đích rất tốt. Khi chuyển từ
Python sang Ruby, bạn sẽ thấy rằng có thêm một chút cú pháp để học
so với Python.

### Điểm tương đồng

Giống như Python, trong Ruby,...

* Có một dấu nhắc tương tác (gọi là `irb`).
* Bạn có thể đọc tài liệu trên dòng lệnh (với lệnh `ri` thay vì
  `pydoc`).
* Không có ký tự kết thúc dòng đặc biệt (ngoại trừ ký tự xuống dòng
  thông thường).
* Chuỗi ký tự có thể trải dài nhiều dòng giống như chuỗi ba dấu ngoặc
  kép của Python.
* Ngoặc vuông dùng cho danh sách, và ngoặc nhọn dùng cho dict (trong Ruby
  được gọi là "hash").
* Mảng hoạt động giống nhau (cộng chúng tạo ra một mảng dài, nhưng kết
  hợp như thế này `a3 = [ a1, a2 ]` cho bạn một mảng chứa các mảng).
* Các đối tượng được định kiểu mạnh và động.
* Mọi thứ đều là đối tượng, và biến chỉ là tham chiếu đến đối tượng.
* Mặc dù các từ khóa hơi khác, ngoại lệ hoạt động gần như tương tự.
* Bạn có các công cụ tài liệu tích hợp (của Ruby gọi là rdoc).
* Có hỗ trợ tốt cho lập trình hàm với hàm hạng nhất, hàm ẩn danh,
  và closure.

### Khác biệt

Không giống Python, trong Ruby,...

* Chuỗi có thể thay đổi được (mutable).
* Bạn có thể tạo hằng số (biến mà bạn không có ý định thay đổi giá trị).
* Có một số quy ước viết hoa bắt buộc (ví dụ: tên lớp bắt đầu bằng chữ
  hoa, biến bắt đầu bằng chữ thường).
* Chỉ có một loại container danh sách (Array), và nó có thể thay đổi được.
* Chuỗi ngoặc kép cho phép chuỗi thoát (như `\t`) và cú pháp
  "thay thế biểu thức" đặc biệt (cho phép bạn chèn kết quả của các biểu
  thức Ruby trực tiếp vào chuỗi khác mà không cần
  `"add " + "strings " + "together"`). Chuỗi ngoặc đơn giống như
  `r"raw strings"` của Python.
* Không có lớp "kiểu mới" và "kiểu cũ". Chỉ có một loại.
  (Python 3+ không còn vấn đề này, nhưng nó không hoàn toàn tương thích
  ngược với Python 2.)
* Bạn không bao giờ truy cập trực tiếp thuộc tính. Với Ruby, tất cả đều
  là lệnh gọi phương thức.
* Dấu ngoặc đơn cho lệnh gọi phương thức thường là tùy chọn.
* Có `public`, `private`, và `protected` để kiểm soát truy cập, thay vì
  quy ước `_tự_nguyện_` dấu gạch dưới `__convention__` của Python.
* "Mixin" được sử dụng thay cho đa kế thừa.
* Bạn có thể thêm hoặc sửa đổi phương thức của các lớp tích hợp. Cả hai
  ngôn ngữ đều cho phép bạn mở và sửa đổi lớp bất cứ lúc nào, nhưng
  Python ngăn việc sửa đổi các lớp tích hợp — Ruby thì không.
* Bạn có `true` và `false` thay vì `True` và `False` (và `nil`
  thay vì `None`).
* Khi kiểm tra giá trị thật, chỉ `false` và `nil` được đánh giá là giá
  trị false. Mọi thứ khác là true (bao gồm `0`, `0.0`, `""`, và `[]`).
* Sử dụng `elsif` thay vì `elif`.
* Sử dụng `require` thay vì `import`. Ngoài ra, cách sử dụng là
  giống nhau.
* Các comment theo kiểu thông thường trên (các) dòng *phía trên* (thay vì
  docstring phía dưới) được sử dụng để tạo tài liệu.
* Có một số phím tắt mặc dù cho bạn nhiều thứ phải nhớ hơn, nhưng bạn
  sẽ nhanh chóng học được. Chúng có xu hướng làm cho Ruby thú vị và rất
  năng suất.
* Không có cách nào để hủy thiết lập một biến đã được đặt (giống câu lệnh
  `del` của Python). Bạn có thể đặt lại biến thành `nil`, cho phép nội
  dung cũ được thu gom rác, nhưng biến sẽ vẫn tồn tại trong bảng ký hiệu
  miễn là nó còn trong phạm vi.
* Từ khóa `yield` hoạt động khác nhau. Trong Python nó sẽ trả quyền
  thực thi cho phạm vi bên ngoài lệnh gọi hàm. Mã bên ngoài chịu trách
  nhiệm tiếp tục hàm. Trong Ruby `yield` sẽ thực thi một hàm khác đã
  được truyền làm tham số cuối cùng, sau đó tiếp tục ngay lập tức.
* Python chỉ hỗ trợ một loại hàm ẩn danh, lambda, trong khi Ruby có
  block, Proc, và lambda.
