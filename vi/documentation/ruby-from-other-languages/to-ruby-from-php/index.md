---
layout: page
title: "Đến với Ruby từ PHP"
lang: vi
---

PHP được sử dụng rộng rãi cho các ứng dụng web, nhưng nếu bạn muốn sử
dụng Ruby on Rails hoặc chỉ muốn một ngôn ngữ phù hợp hơn cho mục đích
tổng quát, Ruby đáng để xem xét.

### Điểm tương đồng

Giống như PHP, trong Ruby…

* Ruby có kiểu dữ liệu động, giống như PHP, vì vậy bạn không cần lo lắng
  về việc phải khai báo biến.
* Có các lớp, và bạn có thể kiểm soát quyền truy cập giống như PHP 5
  (`public`, `protected` và `private`).
* Một số biến bắt đầu bằng $, giống PHP (nhưng không phải tất cả).
* Cũng có `eval`.
* Bạn có thể sử dụng nội suy chuỗi. Thay vì viết `"$foo is a $bar"`,
  bạn có thể viết `"#{foo} is a #{bar}"`—giống như PHP, điều này không áp
  dụng cho chuỗi ngoặc đơn.
* Có heredoc.
* Ruby có ngoại lệ, giống PHP 5.
* Có một thư viện chuẩn khá lớn.
* Mảng và hash hoạt động như mong đợi, nếu bạn thay `array()` bằng
  `{` và `}`\: `array('a' => 'b')` trở thành `{'a' => 'b'}`.
* `true` và `false` hoạt động giống PHP, nhưng `null` được gọi là `nil`.

### Khác biệt

Không giống PHP, trong Ruby…

* Có định kiểu mạnh. Bạn cần gọi `to_s`, `to_i` v.v. để chuyển đổi
  giữa chuỗi, số nguyên và các kiểu khác, thay vì dựa vào ngôn ngữ
  tự làm điều đó.
* Chuỗi, số, mảng, hash, v.v. đều là đối tượng. Thay vì gọi
  `abs(-1)` thì viết `-1.abs`.
* Dấu ngoặc đơn là tùy chọn trong lệnh gọi phương thức, trừ khi cần
  làm rõ tham số nào thuộc lệnh gọi phương thức nào.
* Thư viện chuẩn và các phần mở rộng được tổ chức trong module và lớp.
* Phản chiếu (reflection) là khả năng vốn có của đối tượng, bạn không
  cần sử dụng các lớp `Reflection` như trong PHP 5.
* Biến là tham chiếu.
* Không có lớp `abstract` hay `interface`.
* Hash và mảng không thể hoán đổi cho nhau.
* Chỉ `false` và `nil` là false: `0`, `array()` và `""` đều là true
  trong điều kiện.
* Hầu hết mọi thứ đều là lệnh gọi phương thức, kể cả `raise`
  (`throw` trong PHP).
