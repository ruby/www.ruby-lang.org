---
layout: page
title: "Đến với Ruby từ C và C++"
lang: vi
---

Thật khó để viết một danh sách liệt kê mô tả mã của bạn sẽ khác nhau
như thế nào trong Ruby so với C hoặc C++ vì sự khác biệt là khá lớn.
Một lý do là Ruby runtime làm rất nhiều thứ cho bạn. Ruby dường như
khác xa nhất có thể so với nguyên tắc "không có cơ chế ẩn" của C—toàn bộ
mục đích của Ruby là làm cho công việc của con người dễ dàng hơn với cái giá
là runtime phải gánh vác nhiều hơn. Trừ khi bạn cần tối ưu mã, bạn không
cần phải bận tâm về việc "làm hài lòng trình biên dịch" khi sử dụng Ruby.

Nói vậy, một điều bạn có thể mong đợi là mã Ruby sẽ chạy chậm hơn
nhiều so với mã C hoặc C++ "tương đương". Đồng thời, bạn sẽ ngạc nhiên
về tốc độ bạn có thể đưa một chương trình Ruby vào hoạt động, cũng như
số lượng dòng mã ít ỏi cần thiết để viết nó. Ruby đơn giản hơn C++
rất nhiều—nó sẽ làm bạn mê mẩn.

Ruby sử dụng kiểu dữ liệu động thay vì kiểu tĩnh—runtime thực hiện
nhiều nhất có thể tại thời điểm chạy. Ví dụ, bạn không cần biết trước
chương trình Ruby của bạn sẽ "liên kết đến" (tức là nạp và sử dụng)
những module nào hay những phương thức nào nó sẽ gọi.

May mắn thay, Ruby và C có một mối quan hệ cộng sinh lành mạnh. Ruby
hỗ trợ cái gọi là "module mở rộng". Đây là các module mà bạn có thể
sử dụng từ chương trình Ruby (và từ bên ngoài, chúng trông và hoạt động
giống như bất kỳ module Ruby nào khác), nhưng được viết bằng C. Bằng cách
này, bạn có thể tách biệt các phần quan trọng về hiệu suất của phần mềm
Ruby và chuyển chúng thành C thuần.

Và tất nhiên, bản thân Ruby được viết bằng C.

### Điểm tương đồng với C

Giống như C, trong Ruby,...

* Bạn có thể lập trình theo kiểu thủ tục nếu muốn (nhưng bên dưới nó
  vẫn là hướng đối tượng).
* Hầu hết các toán tử là giống nhau (bao gồm toán tử gán kết hợp
  và toán tử thao tác bit). Tuy nhiên, Ruby không có `++` hoặc `--`.
* Bạn có `__FILE__` và `__LINE__`.
* Bạn cũng có thể có hằng số, mặc dù không có từ khóa `const` đặc biệt.
  Tính hằng được thực thi bằng quy ước đặt tên—tên bắt đầu bằng chữ hoa
  là hằng số.
* Chuỗi được đặt trong ngoặc kép.
* Chuỗi có thể thay đổi được (mutable).
* Giống như man page, bạn có thể đọc hầu hết tài liệu trong cửa sổ
  terminal—sử dụng lệnh `ri`.
* Bạn có cùng loại trình gỡ lỗi dòng lệnh khả dụng.

### Điểm tương đồng với C++

Giống như C++, trong Ruby,...

* Bạn có hầu hết các toán tử tương tự (kể cả `::`). `<<` thường được
  sử dụng để thêm phần tử vào danh sách. Tuy nhiên lưu ý: với Ruby bạn
  không bao giờ sử dụng `->`—luôn chỉ dùng `.`.
* `public`, `private`, và `protected` làm các công việc tương tự.
* Cú pháp kế thừa vẫn chỉ một ký tự, nhưng là `<` thay vì `:`.
* Bạn có thể đặt mã vào các "module", tương tự cách `namespace` trong
  C++ được sử dụng.
* Ngoại lệ hoạt động tương tự, mặc dù tên các từ khóa đã được thay đổi
  để bảo vệ người vô tội.

### Khác biệt so với C

Không giống C, trong Ruby,...

* Bạn không cần biên dịch mã. Bạn chỉ cần chạy trực tiếp.
* Các đối tượng được định kiểu mạnh (và bản thân tên biến không có
  kiểu dữ liệu nào cả).
* Không có macro hay bộ tiền xử lý. Không có ép kiểu. Không có con trỏ
  (cũng không có phép toán con trỏ). Không có typedef, sizeof, hay enum.
* Không có tệp header. Bạn chỉ cần định nghĩa các hàm (thường
  được gọi là "phương thức") và lớp trong các tệp mã nguồn chính.
* Không có `#define`. Chỉ cần sử dụng hằng số thay thế.
* Tất cả các biến nằm trên heap. Hơn nữa, bạn không cần tự giải phóng
  chúng—bộ thu gom rác sẽ lo việc đó.
* Tham số của phương thức (tức là hàm) được truyền theo giá trị, trong đó
  giá trị luôn là tham chiếu đến đối tượng.
* Sử dụng `require 'foo'` thay vì `#include <foo>` hoặc `#include "foo"`.
* Bạn không thể viết mã assembly trực tiếp.
* Không có dấu chấm phẩy kết thúc dòng.
* Bạn không cần dấu ngoặc đơn cho biểu thức điều kiện `if` và `while`.
* Dấu ngoặc đơn cho lệnh gọi phương thức (tức là hàm) thường là tùy chọn.
* Bạn thường không sử dụng dấu ngoặc nhọn—chỉ cần kết thúc các cấu trúc
  nhiều dòng (như vòng lặp `while`) bằng từ khóa `end`.
* Từ khóa `do` dùng cho cái gọi là "block". Không có "câu lệnh do"
  như trong C.
* Thuật ngữ "block" có nghĩa khác. Nó dùng cho một khối mã mà bạn
  liên kết với một lệnh gọi phương thức để thân phương thức có thể gọi
  đến block đó trong quá trình thực thi.
* Không có khai báo biến. Bạn chỉ cần gán cho tên mới
  khi cần thiết.
* Khi kiểm tra giá trị thật, chỉ `false` và `nil` được đánh giá là
  giá trị false. Mọi thứ khác là true (bao gồm `0`, `0.0`, và `"0"`).
* Không có `char`—chúng chỉ là chuỗi 1 ký tự.
* Chuỗi không kết thúc bằng null byte.
* Mảng được đặt trong ngoặc vuông thay vì ngoặc nhọn.
* Mảng tự động lớn hơn khi bạn thêm phần tử vào chúng.
* Nếu bạn cộng hai mảng, bạn nhận lại một mảng mới và lớn hơn
  (tất nhiên, được cấp phát trên heap) thay vì thực hiện phép toán con trỏ.
* Thường xuyên hơn là không, mọi thứ đều là biểu thức (nghĩa là những thứ
  như câu lệnh `while` thực sự có giá trị trả về).

### Khác biệt so với C++

Không giống C++, trong Ruby,...

* Không có tham chiếu tường minh. Nghĩa là, trong Ruby, mọi biến chỉ
  là một tên tự động giải tham chiếu cho một đối tượng nào đó.
* Các đối tượng được định kiểu mạnh nhưng *động*. Runtime phát hiện
  *tại thời điểm chạy* liệu lệnh gọi phương thức đó có thực sự hoạt động
  hay không.
* "Constructor" được gọi là `initialize` thay vì tên lớp.
* Tất cả các phương thức luôn là virtual.
* Tên biến "lớp" (static) luôn bắt đầu bằng `@@` (như trong
  `@@total_widgets`).
* Bạn không truy cập trực tiếp biến thành viên—mọi truy cập đến biến
  thành viên public (được gọi là thuộc tính trong Ruby) đều thông qua
  phương thức.
* Sử dụng `self` thay vì `this`.
* Một số phương thức kết thúc bằng '?' hoặc '!'. Nó thực sự là một phần
  của tên phương thức.
* Không có đa kế thừa theo nghĩa truyền thống. Tuy nhiên Ruby có "mixin"
  (tức là bạn có thể "kế thừa" tất cả các phương thức instance của
  một module).
* Có một số quy ước viết hoa bắt buộc (ví dụ: tên lớp bắt đầu bằng chữ
  hoa, biến bắt đầu bằng chữ thường).
* Dấu ngoặc đơn cho lệnh gọi phương thức thường là tùy chọn.
* Bạn có thể mở lại một lớp bất cứ lúc nào và thêm phương thức.
* Không cần template C++ (vì bạn có thể gán bất kỳ loại đối tượng nào
  cho một biến, và kiểu được xác định tại thời điểm chạy). Cũng không
  cần ép kiểu.
* Vòng lặp được thực hiện hơi khác. Trong Ruby, bạn không sử dụng đối
  tượng iterator riêng biệt (như `vector<T>::const_iterator iter`).
  Thay vào đó, bạn sử dụng phương thức iterator của đối tượng chứa
  (như `each`) nhận một khối mã và truyền các phần tử liên tiếp vào đó.
* Chỉ có hai loại container: `Array` và `Hash`.
* Không có chuyển đổi kiểu. Tuy nhiên với Ruby, bạn có thể sẽ thấy rằng
  chúng không cần thiết.
* Đa luồng được tích hợp sẵn, nhưng kể từ Ruby 1.8 chúng là "green
  thread" (chỉ được cài đặt bên trong trình thông dịch) thay vì
  luồng gốc.
* Thư viện kiểm thử đơn vị đi kèm tiêu chuẩn với Ruby.
