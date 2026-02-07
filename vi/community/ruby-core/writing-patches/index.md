---
layout: page
title: "Hướng dẫn viết Patch"
lang: vi
---

Sau đây là một số mẹo, trực tiếp từ Matz, về cách làm cho bản vá
của bạn được xem xét.
{: .summary}

Các hướng dẫn này được lấy từ [bài viết của Matz][ruby-core-post]
trên hộp thư chung Ruby-Core:

* Thực hiện một sửa đổi cho mỗi bản vá

  Đây là vấn đề lớn nhất đối với hầu hết các bản vá bị trì hoãn. Khi
  bạn gửi một bản vá sửa nhiều lỗi (và thêm tính năng) cùng một lúc,
  chúng tôi phải tách chúng ra trước khi áp dụng. Đây là một nhiệm vụ
  khá khó khăn đối với các nhà phát triển bận rộn như chúng tôi, vì vậy
  loại bản vá này thường bị trì hoãn. Xin đừng gửi bản vá lớn.

* Cung cấp mô tả

  Đôi khi chỉ một bản vá thôi chưa đủ mô tả vấn đề mà nó sửa.
  Một mô tả tốt hơn (vấn đề mà nó sửa, điều kiện tiên quyết, nền tảng,
  v.v.) sẽ giúp bản vá được hợp nhất sớm hơn.

* Diff với phiên bản mới nhất

  Vấn đề của bạn có thể đã được sửa trong phiên bản mới nhất. Hoặc mã
  nguồn có thể đã hoàn toàn khác biệt. Trước khi gửi bản vá, hãy thử
  lấy phiên bản mới nhất (nhánh `trunk` cho phiên bản phát triển mới
  nhất, `{{ site.svn.stable.branch }}` cho {{ site.svn.stable.version }})
  từ kho lưu trữ Subversion.

* Sử dụng `diff -u`

  Chúng tôi thích bản vá kiểu unified diff `diff -u` hơn `diff -c`
  hoặc bất kỳ kiểu bản vá nào khác. Chúng dễ xem xét hơn nhiều.
  Đừng gửi các tệp đã sửa đổi, chúng tôi không muốn phải tự tạo diff.

* Cung cấp các trường hợp kiểm thử (tùy chọn)

  Một bản vá kèm theo các trường hợp kiểm thử (tốt nhất là bản vá cho
  `test/*/test_*.rb`) sẽ giúp chúng tôi hiểu bản vá và ý định của bạn.

Trong tương lai, chúng tôi có thể chuyển sang quy trình push/pull kiểu
Git. Nhưng cho đến lúc đó, tuân theo các hướng dẫn trên sẽ giúp bạn
tránh thất vọng.


[ruby-core-post]: https://blade.ruby-lang.org/ruby-core/25139
