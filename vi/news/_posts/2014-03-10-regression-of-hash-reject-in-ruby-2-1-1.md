---
layout: news_post
title: "Lỗi hồi quy của Hash#reject trong Ruby 2.1.1"
author: "sorah"
translator:
date: 2014-03-10 14:00:00 +0000
lang: vi
---

Trong Ruby 2.1.0 trở về trước, phương thức `reject` trong bất kỳ lớp nào
kế thừa `Hash` trả về một đối tượng thuộc lớp của chính nó.
Nhưng trong Ruby 2.1.1, hành vi này đã vô tình thay đổi, luôn trả về
một đối tượng Hash thuần, không phải lớp kế thừa.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Chính xác hơn, các trạng thái bổ sung như biến instance, v.v. cũng
không được sao chép.)

Ruby 2.1.1 không nên bao gồm các thay đổi hành vi như vậy, bởi vì với việc
phát hành Ruby 2.1.0 chúng tôi đã [thay đổi chính sách đánh số phiên bản](https://www.ruby-lang.org/vi/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
vì vậy Ruby 2.1.1 là bản phát hành cấp patch và không nên phá vỡ tương thích ngược.

Lỗi hồi quy này có thể ảnh hưởng đến nhiều thư viện, một trường hợp như vậy là
`HashWithIndifferentAccess` và `OrderedHash` của Rails. Chúng bị hỏng:
[Rails' issue #14188](https://github.com/rails/rails/issues/14188).

Hành vi này sẽ được hoàn nguyên về hành vi của 2.1.0 trong Ruby 2.1.2,
nhưng dự kiến sẽ là hành vi mặc định cho Ruby 2.2.0:
[Feature #9223](https://bugs.ruby-lang.org/issues/9223).
Vì vậy chúng tôi khuyến nghị bạn sửa mã nguồn để chuẩn bị cho thay đổi hành vi này.

Sự cố này được gây ra bởi một commit backport bị thiếu. Để biết thêm chi tiết, xem
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Xin lỗi vì sự bất tiện, và cảm ơn sự hỗ trợ của bạn.
