---
layout: news_post
title: "Thay đổi chính sách đánh số phiên bản Ruby bắt đầu từ Ruby 2.1.0"
author: "zzak"
translator:
date: 2013-12-21 2:00:00 +0000
lang: vi
---

Chúng tôi đã quyết định thay đổi chính sách đánh số phiên bản Ruby sang kiểu
[Semantic Versioning](http://semver.org/) bắt đầu từ bản phát hành Ruby 2.1.0.

Để cung cấp một sơ đồ đánh số phiên bản được xác định rõ ràng và sử dụng đúng
đắn hơn cho Ruby, chúng tôi đã quyết định dần chuyển sang chính sách sau.

## Thay đổi chính sách

Chính sách này dựa trên đề xuất của quản trị viên hệ thống ruby-lang.org
Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Sơ đồ phiên bản

* `MAJOR`: tăng khi có thay đổi không tương thích mà không thể phát hành trong MINOR
  * Dành cho các sự kiện đặc biệt
* `MINOR`: tăng mỗi dịp Giáng sinh, có thể không tương thích API
* `TEENY`: bản vá bảo mật hoặc sửa lỗi đảm bảo tương thích API
  * Có thể tăng trên 10 (ví dụ `2.1.11`), và sẽ được phát hành mỗi 2-3 tháng.
* `PATCH`: số lượng commit kể từ bản phát hành `MINOR` cuối cùng (sẽ được đặt lại về 0 khi phát hành `MINOR`)

### Sơ đồ nhánh

Chúng tôi sẽ tiếp tục duy trì các nhánh sau:

* trunk
* `ruby_{MAJOR}_{MINOR}_{TEENY}`

### Tương thích API

Các đặc điểm sau có thể được đánh dấu là thay đổi không tương thích, yêu cầu
tăng phiên bản `MINOR`:

* Loại bỏ tính năng API cấp C
* Các thay đổi hoặc bổ sung không tương thích ngược

### Tương thích ABI

ABI sẽ tuân theo sơ đồ sau: `{MAJOR}.{MINOR}.0`

Chúng tôi sẽ cố gắng hết sức để duy trì tương thích ABI trong cùng các bản
phát hành cấp `MINOR`, vì vậy `TEENY` sẽ được cố định ở 0.

## Tham khảo

Để đọc thêm về đề xuất này, vui lòng xem các liên kết sau:

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [Accepted proposal in English](https://gist.github.com/sorah/7803201)
* [Accepted proposal in Japanese](https://gist.github.com/hsbt/7719305)

## Cảm ơn!

Tôi muốn cá nhân cảm ơn tất cả những ai đã đóng góp vào cuộc thảo luận này.
Mỗi bước chúng ta tiến tới là gần hơn đến một Ruby ổn định và hiệu quả hơn.
