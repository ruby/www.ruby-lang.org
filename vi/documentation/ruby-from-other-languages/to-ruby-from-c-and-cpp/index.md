---
layout: page
title: "Đến với Ruby từ C và C++"
lang: vi
---

Khá là khó để viết những điểm chính hình dung sự khác biệt khi chuyển
từ C và C++ qua Ruby vì thật sự là có sự khác biệt rất lớn.
Ruby runtime đảm nhận nhiều nhiệm vụ là một lý do. Ruby có vẻ
xa vời với nguyên tắc "không có cơ chế ẩn" của C- điểm này của Ruby giúp
cho công việc của chúng ta trở nên dễ dàng hơn bằng việc đánh đổi thêm một
ít thời gian khi thực thi. Trừ khi bạn muốn tối ưu mã của mình, bạn không cần quan
tâm về việc "giữ cho trình biên dịch thực thi dễ dàng" khi sử dụng Ruby.

Việc đó nói lên một điều là thời gian thực thi của Ruby sẽ chậm hơn
C và C++. Trong cùng một thời điểm, thì bạn sẽ thấy thời gian viết code
và chạy thử với Ruby sẽ nhanh như thế nào khi bạn chỉ cần viết một vài
dòng code. Ruby đơn giản hơn C++ rất nhiều.

Ruby là ngôn ngữ động, chứ không phải kiểu tĩnh - phải thực hiện rất nhiều
việc khi thực thi. Ví dụ, bạn không cần biết Ruby sẽ liên kết đến mô-đun nào
(chỉ cần load và dùng) hoặc gọi phương thức nào.

May mắn là Ruby và C có mối quan hệ cộng sinh. Ruby hỗ trợ cái gọi là
"mô-đun mở rộng". Có những mô-đun mà bạn có thể sử dụng trong Ruby (và
những thành phần nào mà từ bên ngoài có thể xem xét và thực thi như
các mô-đun khác của Ruby), nhưng nó được viết bằng C. Bằng cách này, bạn có
thể chỉa những phần xử lý quan trọng của Ruby xuống để xử lý bằng C.

Và tất nhiên là chính bản thân Ruby cũng được viết từ C.

### Điểm tương đồng với C

Giống như C, trong Ruby,...

* Bạn có thể viết thủ tục nếu thích (nhưng nó vẩn phải đảm bảo tính
  hướng đối tượng).
* Đa số các toán tử đều như nhau (bao gồm toán tử kết hợp và cả toán tử bit).
  Do đó trong Ruby không có `++` hay `--`.
* Bạn cũng có `__FILE__` và `__LINE__`.
* Bạn cũng có thể tạo hằng số, mà không cần từ khóa `const`. Các hằng số
  cũng phải theo qui ước đặt tên - tên bắt đầu với ký tự in hoa dùng cho
  hằng số.
* Chuỗi được đặt trong dấu nháy kép.
* Chuỗi có thể thay đổi.
* Như đã đề cập ở trang chính, bạn cũng có thể đọc các doc ở cửa sổ dòng
  lệnh- khi sử dụng lệnh `ri`.
* Bạn cũng có phần dòng lệnh debug tương tự nhau.

### Điểm tương đồng với C++

Giống như C++, trong Ruby,...

* Bạn cũng có các toán tử như nhau (thậm chí cả `::`). `<<` thường xuyên
  được sử dụng để thêm phần tử vào danh sách. Lưu ý là với Ruby bạn đừng
  nên dùng `->`- vì nó luôn luôn là `.`.
* `public`, `private`, và `protected` cũng hoạt động như nhau.
* Cú pháp kế thừa cũng chỉ là 1 ký tự, nhưng sử dụng `<` thay vì `:`.
* Bạn nên đặt code vào các "mô-đun", giống như `namespace` trong C++.
* Các ngoại lệ cũng hoạt động như nhau, mặc dù các tên từ khóa đã được
  thay đổi.

### Khác biệt với C

Không giống như C, trong Ruby,...

* Đối tượng là kiểu dữ liệu chủ đạo (và các tên biến không cần khai báo
  kiểu dữ liệu).
* Không có các macro hay preprocessor. Không ép kiểu, không con trỏ
  (hay con trỏ số học). Không có typedefs, sizeof hay enums.
* Không cần các tập tin header. Bạn chỉ cần định nghĩa chức năng mình
  muốn (thường là các phương thức) và các lớp trong mã nguồn chính của
  mình.
* Không cần `#define`. Thay vào đó chỉ cần dùng hằng số.
* Giống như Ruby 1.8, mã được biên dịch khi thực thi mà không cần biên
  dịch qua mã máy (machine-code) hay byte-code.
* Tất cả các biến đều tồn tại trên heap. Do đó, bạn không cần giải phóng
  nó - bộ thu gom sẽ làm việc đó.
* Tham số của phương thức (ví dụ như các chức năng) đều được truyền bằng
  tham chiếu (reference), không phải tham trị (value).
* Sử dụng `require 'foo'` thay vì `#include <foo>` hay `#include "foo"`.
* Bạn không thể drop down để assembly.
* Không cần chấm phẩy khi hết dòng.
* Không cần đóng mở ngoặc khi dùng biểu thức điều kiện `if` và `while`.
* Ngoặc đơn khi gọi phương thức (chức năng) thường được tùy chọn.
* Bạn không cần sử dụng dấu ngoặc nhọn- chỉ cần dùng từ khóa `end` để
  kết thúc (giống như vòng lặp `while`).
* Từ khóa `do` được gọi là "block". Không có "biểu thức do" như trong C.
* Thuật ngữ "block" có nghĩa là có sự khác biệt. Đó là một đoạn mã mà
  bạn liên kết với phương thức đó và phương thức đó sẽ thực hiện đoạn
  mã đó khi được gọi.
* Không cần phải khai báo biến. Chỉ cần đặt tên khi bạn cần sử dụng.
* Khi kiểm tra đúng sai, chỉ có `false` và `nil` là dành cho các
  giá trị sai. Tất cả những thứ còn lại đều là true (bao gồm `0`,
  `0.0`, và `"0"`).
* Không có `char` - chỉ có một chuỗi ký tự.
* Chuỗi không kết thúc với một byte rỗng.
* Các phần tử của mảng nằm trong ngoặc vuông thay vì ngoặc nhọn.
* Kích thước của mảng sẽ tăng lên khi bạn thêm các phần tử vào đó.
* Nếu bạn thêm vào 2 mảng, bạn sẽ nhận được một mảng mới có kích thước
  lớn hơn (mảng chồng mảng) thay vì thực hiện con trỏ.
* Tất cả mọi thứ đều là một biểu thức (nghĩa là, những biểu thức như
  `while` biểu thị cho 1 rvalue).

### Khác biệt với C++

Khác với C++, trong Ruby,...

* Không có tham chiếu rõ ràng. Nghĩa là trong Ruby, tất cả các biến đều
  tự động tham chiếu đến đối tượng nào đó.
* Đối tượng là kiểu dữ liệu *động* chủ đạo. Bộ thực thi sẽ phát hiện
  *khi thực thi* nếu phương thức đó thực sự hoạt động.
* Phương thức khởi tạo được gọi `initialize` thay vì tên của lớp đó.
* Tất cả các phương thức luôn là virtual.
* Tên biến của "Lớp" (static) luôn được bắt đầu với `@@` (giống
  như `@@total_widgets`).
* Bạn không thể truy cập trực tiếp vào các biến - tất cả các truy cập
  đến các biến public (trong Ruby nghĩa là thuộc tính) đều thông qua
  phương thức.
* Dùng `self` thay cho `this`.
* Một số phương thức kết thúc bằng ’?’ hay ’!’. Đều là một phần của
  tên phương thức đó.
* Không có đa kế thừa. Trong Ruby có "mixins" (bạn có thể "kế thừa" toàn
  bộ các phương thức của mô-đun đó).
* Có một số quy ước bắt buộc (ví dụ tên lớp bắt đầu bằng kí tự Hoa,
  các biến bắt đầu với ký tự thường).
* Ngoặc đơn khi gọi phương thức thường được tùy chọn.
* Bạn có thể mở lại một lớp bất kỳ lúc nào và thêm vào các phương thức.
* Không cần các template của C++ (khi bạn có thể gán bất kỳ kiểu dữ liệu
  nào cho biến, và sẽ được chỉ rõ khi thực thi). Không cần ép kiểu.
* Các bước lặp có một ít khác biệt khi thực thi. Trong Ruby, bạn không
  cần chuyển thành đối tượng lặp (như `vector<T>::const_iterator iter`)
  nhưng thay vào đó đối tượng của bạn sẽ kế thừa (mixin) mô-đun `Enumerator`
  và chỉ cần gọi `my_obj.each`.
* Chỉ có hai kiểu chứa dữ liệu là : `Mảng` và `Hash`.
* Không cần quy ước kiểu. Đối với Ruby bạn sẽ thây điều đó không cần thiết.
* Đa luồng đã được xây dựng sẵn, nhưng trong Ruby 1.8 đều là "green thread"
  (được thực thi khi biên dịch) trái ngược với các luồng gốc.
* Thư viện unit test theo chuẩn của Ruby.
