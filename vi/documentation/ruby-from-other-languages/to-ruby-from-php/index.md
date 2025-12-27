---
layout: page
title: "Đến với Ruby từ PHP"
lang: vi
---

PHP được sử dụng rộng rãi cho các ứng dụng web, nhưng nếu bạn muốn
sử dụng Ruby on Rails hoặc chỉ muốn một ngôn ngữ mà có thể phù hợp
cho việc sử dụng chung thì Ruby cũng đáng được xem xét.

### Điểm tương đồng

Giống như PHP, trong Ruby…

* Ruby cũng như PHP là kiểu động, do đó bạn không cần quan tâm đến
  việc khai báo biến.
* Có các lớp, và bạn có thể điều khiển truy cập như trong PHP 5
  (`public`, `protected` và `private`).
* Một số biến bắt đầu bằng $ như trong PHP (nhưng không phải tất cả).
* Cũng có `eval` như trong PHP.
* Bạn có thể sử dụng chuỗi nội suy. Thay vì viết `"$foo is a $bar"`
  bạn có thể viết `"#{foo} is a #{bar}"` như trong PHP, cách này
  không áp dụng cho các chuỗi sử dụng dấu nháy đơn.
* Có heredocs.
* Ruby cũng có các ngoại lệ như PHP 5.
* Có một thư viện đồ sộ.
* Các mảng và hashes thực hiện đúng như mong muốn, nếu bạn chuyển đổi
  `array()` for `{` and `}`\: `array('a' => 'b')` thành `{'a' => 'b'}`.
* `true` và `false` giống như trong PHP, nhưng `null` thì thành `nil`.

### Khác biệt

Không giống như PHP, trong Ruby…

* Cách gõ ngắn gọn. Bạn có thể gọi `to_s`, `to_i` v.v. để
  chuyển đổi sang kiểu chuỗi, số vân vân, thay vì dựa vào ngôn ngữ.
* Strings, numbers, arrays, hashes, v.v đều là các đối tượng. Thay vì
  gọi `abs(-1)` chỉ cần gọi `-1.abs`.
* Các dấu ngoặc được tùy chọn khi gọi phương thức, ngoại trừ một số
  tham số cần được làm rõ khi gọi phương thức.
* Thay cho các quy ước đặt tên, như gạch chân, các phần mở rộng của
  thư viện chuẩn được sắp xếp trong các mô-đun và các lớp.
* Ánh xạ là khả năng vốn có của đối tượng, bạn không cần lớp `Reflection`
  như trong PHP 5.
* Các biến đều có thể tham chiếu.
* Không có lớp `abstract` hay `interface`.
* Hash và mảng không thể chuyển đổi qua lại.
* Chỉ có `false` và `nil` là false: `0`, `array()` và `""` đều là true
  trong các câu điều kiện.
* Hầu như mọi thứ đều gọi phương thức, thậm chí cả `raise` (trong PHP là `throw`).
