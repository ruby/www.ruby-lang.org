---
layout: news_post
title: "Tách biệt tham số vị trí và tham số từ khóa trong Ruby 3.0"
author: "mame"
translator:
date: 2019-12-12 12:00:00 +0000
lang: vi
---

Bài viết này giải thích sự không tương thích được lên kế hoạch của tham số từ khóa trong Ruby 3.0

## tl;dr

Trong Ruby 3.0, tham số vị trí và tham số từ khóa sẽ được tách biệt. Ruby 2.7 sẽ cảnh báo cho các hành vi sẽ thay đổi trong Ruby 3.0. Nếu bạn thấy các cảnh báo sau, bạn cần cập nhật code của mình:

* `Using the last argument as keyword parameters is deprecated`, hoặc
* `Passing the keyword argument as the last hash parameter is deprecated`, hoặc
* `Splitting the last argument into positional and keyword parameters is deprecated`

Trong hầu hết các trường hợp, bạn có thể tránh sự không tương thích bằng cách thêm toán tử _double splat_. Nó chỉ định rõ ràng việc truyền tham số từ khóa thay vì một đối tượng `Hash`. Tương tự, bạn có thể thêm dấu ngoặc nhọn `{}` để truyền rõ ràng một đối tượng `Hash`, thay vì tham số từ khóa. Đọc phần "Các trường hợp điển hình" bên dưới để biết thêm chi tiết.

Trong Ruby 3, một phương thức ủy quyền tất cả tham số phải ủy quyền rõ ràng tham số từ khóa ngoài tham số vị trí. Nếu bạn muốn giữ hành vi ủy quyền có trong Ruby 2.7 và trước đó, hãy sử dụng `ruby2_keywords`. Xem phần "Xử lý ủy quyền tham số" bên dưới để biết thêm chi tiết.

## Các trường hợp điển hình
{: #typical-cases }

Đây là trường hợp điển hình nhất. Bạn có thể sử dụng toán tử double splat (`**`) để truyền tham số từ khóa thay vì một Hash.

{% highlight ruby %}
# This method accepts only a keyword argument
def foo(k: 1)
  p k
end

h = { k: 42 }

# This method call passes a positional Hash argument
# In Ruby 2.7: The Hash is automatically converted to a keyword argument
# In Ruby 3.0: This call raises an ArgumentError
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# If you want to keep the behavior in Ruby 3.0, use double splat
foo(**h) #=> 42
{% endhighlight %}

Đây là một trường hợp khác. Bạn có thể sử dụng dấu ngoặc nhọn (`{}`) để truyền rõ ràng một Hash thay vì tham số từ khóa.

{% highlight ruby %}
# This method accepts one positional argument and a keyword rest argument
def bar(h, **kwargs)
  p h
end

# This call passes only a keyword argument and no positional arguments
# In Ruby 2.7: The keyword is converted to a positional Hash argument
# In Ruby 3.0: This call raises an ArgumentError
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# If you want to keep the behavior in Ruby 3.0, write braces to make it an
# explicit Hash
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## Những gì không còn được khuyến khích?
{: #what-is-deprecated }

Trong Ruby 2, tham số từ khóa có thể được xử lý như tham số Hash vị trí cuối cùng và tham số Hash vị trí cuối cùng có thể được xử lý như tham số từ khóa.

Bởi vì việc chuyển đổi tự động đôi khi quá phức tạp và gây phiền phức như được mô tả trong phần cuối. Vì vậy nó hiện không còn được khuyến khích trong Ruby 2.7 và sẽ bị loại bỏ trong Ruby 3. Nói cách khác, tham số từ khóa sẽ được tách biệt hoàn toàn khỏi tham số vị trí trong Ruby 3. Vì vậy khi bạn muốn truyền tham số từ khóa, bạn nên luôn sử dụng `foo(k: expr)` hoặc `foo(**expr)`. Nếu bạn muốn nhận tham số từ khóa, về nguyên tắc bạn nên luôn sử dụng `def foo(k: default)` hoặc `def foo(k:)` hoặc `def foo(**kwargs)`.

Lưu ý rằng Ruby 3.0 không hoạt động khác khi gọi một phương thức không nhận tham số từ khóa với tham số từ khóa. Ví dụ, trường hợp sau sẽ không bị đánh dấu không khuyến khích và sẽ tiếp tục hoạt động trong Ruby 3.0. Tham số từ khóa vẫn được xử lý như tham số Hash vị trí.

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

Điều này là do phong cách này được sử dụng rất thường xuyên, và không có sự mơ hồ trong cách tham số nên được xử lý. Việc cấm chuyển đổi này sẽ gây ra thêm sự không tương thích mà ít mang lại lợi ích.

Tuy nhiên, phong cách này không được khuyến khích trong code mới, trừ khi bạn thường xuyên truyền Hash như tham số vị trí, và cũng sử dụng tham số từ khóa. Nếu không, hãy sử dụng double splat:

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## Code của tôi có bị lỗi trên Ruby 2.7 không?
{: #break-on-ruby-2-7 }

Câu trả lời ngắn gọn là "có thể không".

Các thay đổi trong Ruby 2.7 được thiết kế như một lộ trình chuyển đổi hướng tới 3.0. Về nguyên tắc, Ruby 2.7 chỉ cảnh báo về các hành vi sẽ thay đổi trong Ruby 3, nhưng nó bao gồm một số thay đổi không tương thích mà chúng tôi cho là nhỏ. Xem phần "Các thay đổi nhỏ khác" để biết chi tiết.

Ngoại trừ các cảnh báo và thay đổi nhỏ, Ruby 2.7 cố gắng giữ tương thích với Ruby 2.6. Vì vậy, code của bạn có thể sẽ hoạt động trên Ruby 2.7, mặc dù nó có thể phát ra cảnh báo. Và bằng cách chạy nó trên Ruby 2.7, bạn có thể kiểm tra xem code của bạn đã sẵn sàng cho Ruby 3.0 chưa.

Nếu bạn muốn tắt các cảnh báo không khuyến khích, vui lòng sử dụng tham số dòng lệnh `-W:no-deprecated` hoặc thêm `Warning[:deprecated] = false` vào code của bạn.

## Xử lý ủy quyền tham số
{: #delegation }

### Ruby 2.6 hoặc trước đó
{: #delegation-ruby-2-6-or-prior }

Trong Ruby 2, bạn có thể viết một phương thức ủy quyền bằng cách nhận tham số `*rest` và tham số `&block`, rồi truyền cả hai cho phương thức đích. Trong hành vi này, tham số từ khóa cũng được xử lý ngầm bởi việc chuyển đổi tự động giữa tham số vị trí và tham số từ khóa.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3
{: #delegation-ruby-3 }

Bạn cần ủy quyền rõ ràng tham số từ khóa.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

Ngoài ra, nếu bạn không cần tương thích với Ruby 2.6 hoặc trước đó và bạn không thay đổi bất kỳ tham số nào, bạn có thể sử dụng cú pháp ủy quyền mới (`...`) được giới thiệu trong Ruby 2.7.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7
{: #delegation-ruby-2-7 }

Nói ngắn gọn: sử dụng `Module#ruby2_keywords` và ủy quyền `*args, &block`.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords` nhận tham số từ khóa như tham số Hash cuối cùng, và truyền nó như tham số từ khóa khi gọi phương thức khác.

Thực tế, Ruby 2.7 cho phép phong cách ủy quyền mới trong nhiều trường hợp. Tuy nhiên, có một trường hợp đặc biệt đã biết. Xem phần tiếp theo.

### Ủy quyền tương thích hoạt động trên Ruby 2.6, 2.7 và Ruby 3
{: #a-compatible-delegation }

Nói ngắn gọn: sử dụng `Module#ruby2_keywords` một lần nữa.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

Rất tiếc, chúng ta cần sử dụng kiểu ủy quyền cũ (tức là không có `**kwargs`) vì Ruby 2.6 hoặc trước đó không xử lý đúng kiểu ủy quyền mới. Đây là một trong những lý do của việc tách biệt tham số từ khóa; chi tiết được mô tả trong phần cuối. Và `ruby2_keywords` cho phép bạn chạy kiểu cũ ngay cả trong Ruby 2.7 và 3.0. Vì không có `ruby2_keywords` được định nghĩa trong 2.6 hoặc trước đó, vui lòng sử dụng [ruby2_keywords gem](https://rubygems.org/gems/ruby2_keywords) hoặc tự định nghĩa:

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

Nếu code của bạn không cần chạy trên Ruby 2.6 hoặc cũ hơn, bạn có thể thử kiểu mới trong Ruby 2.7. Trong hầu hết các trường hợp, nó hoạt động. Tuy nhiên, lưu ý rằng có các trường hợp đặc biệt không may như sau:

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []   ({} is dropped)
foo({}, **{}) #=> Ruby 2.7: [{}] (You can pass {} by explicitly passing "no" keywords)
{% endhighlight %}

Một tham số Hash rỗng được tự động chuyển đổi và hấp thụ vào `**kwargs`, và lệnh gọi ủy quyền loại bỏ hash từ khóa rỗng, vì vậy không có tham số nào được truyền cho `target`. Theo những gì chúng tôi biết, đây là trường hợp đặc biệt duy nhất.

Như đã ghi chú ở dòng cuối, bạn có thể giải quyết vấn đề này bằng cách sử dụng `**{}`.

Nếu bạn thực sự lo lắng về tính di động, hãy sử dụng `ruby2_keywords`. (Lưu ý rằng bản thân Ruby 2.6 hoặc trước đó cũng có rất nhiều trường hợp đặc biệt trong tham số từ khóa. :-)
`ruby2_keywords` có thể bị loại bỏ trong tương lai sau khi Ruby 2.6 kết thúc vòng đời. Tại thời điểm đó, chúng tôi khuyến khích ủy quyền rõ ràng tham số từ khóa (xem code Ruby 3 ở trên).

## Các thay đổi nhỏ khác
{: #other-minor-changes }

Có ba thay đổi nhỏ về tham số từ khóa trong Ruby 2.7.

### 1. Khóa không phải Symbol được cho phép trong tham số từ khóa
{: #other-minor-changes-non-symbol-keys }

Trong Ruby 2.6 hoặc trước đó, chỉ có khóa Symbol được cho phép trong tham số từ khóa. Trong Ruby 2.7, tham số từ khóa có thể sử dụng khóa không phải Symbol.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6 or before: ArgumentError: wrong number of arguments
  #=> Ruby 2.7 or later: {"key"=>42}
{% endhighlight %}

Nếu một phương thức nhận cả tham số tùy chọn và tham số từ khóa, đối tượng Hash có cả khóa Symbol và khóa không phải Symbol đã bị tách thành hai trong Ruby 2.6. Trong Ruby 2.7, cả hai đều được chấp nhận như tham số từ khóa vì khóa không phải Symbol được cho phép.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# Use braces to keep the behavior
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 and 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7 vẫn tách hash với cảnh báo nếu truyền Hash hoặc tham số từ khóa có cả khóa Symbol và không phải Symbol cho phương thức nhận tham số từ khóa rõ ràng nhưng không có tham số từ khóa còn lại (`**kwargs`). Hành vi này sẽ bị loại bỏ trong Ruby 3, và `ArgumentError` sẽ được phát sinh.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6 and 2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2. Double splat với hash rỗng (`**{}`) không truyền tham số nào
{: #other-minor-changes-empty-hash }

Trong Ruby 2.6 hoặc trước đó, truyền `**empty_hash` sẽ truyền một Hash rỗng như tham số vị trí. Trong Ruby 2.7 hoặc sau đó, nó không truyền tham số nào.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 or before: [{}]
  #=> Ruby 2.7 or later: []
{% endhighlight %}

Lưu ý rằng `foo(**{})` không truyền gì trong cả Ruby 2.6 và 2.7. Trong Ruby 2.6 và trước đó, `**{}` bị loại bỏ bởi trình phân tích cú pháp, và trong Ruby 2.7 trở lên, nó được xử lý giống như `**empty_hash`, cho phép một cách dễ dàng để không truyền tham số từ khóa cho phương thức.

Trong Ruby 2.7, khi gọi một phương thức với số lượng tham số vị trí bắt buộc không đủ, `foo(**empty_hash)` truyền một hash rỗng với cảnh báo được phát ra, để tương thích với Ruby 2.6. Hành vi này sẽ bị loại bỏ trong 3.0.

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 or before: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. Cú pháp không nhận tham số từ khóa (`**nil`) được giới thiệu
{: #other-minor-changes-double-splat-nil }

Bạn có thể sử dụng `**nil` trong định nghĩa phương thức để đánh dấu rõ ràng rằng phương thức không nhận tham số từ khóa. Gọi các phương thức như vậy với tham số từ khóa sẽ dẫn đến `ArgumentError`. (Đây thực ra là một tính năng mới, không phải sự không tương thích)

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7 or later: no keywords accepted (ArgumentError)
{% endhighlight %}

Điều này hữu ích để làm rõ ràng rằng phương thức không nhận tham số từ khóa. Nếu không, tham số từ khóa sẽ bị hấp thụ vào tham số còn lại trong ví dụ trên. Nếu bạn mở rộng phương thức để nhận tham số từ khóa, phương thức có thể có sự không tương thích như sau:

{% highlight ruby %}
# If a method accepts rest argument and no `**nil`
def foo(*args)
  p args
end

# Passing keywords are converted to a Hash object (even in Ruby 3.0)
foo(k: 1) #=> [{:k=>1}]

# If the method is extended to accept a keyword
def foo(*args, mode: false)
  p args
end

# The existing call may break
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## Tại sao chúng tôi không còn khuyến khích chuyển đổi tự động
{: #why-deprecated }

Việc chuyển đổi tự động ban đầu dường như là một ý tưởng tốt, và hoạt động tốt trong nhiều trường hợp. Tuy nhiên, nó có quá nhiều trường hợp đặc biệt, và chúng tôi đã nhận được nhiều báo cáo lỗi về hành vi này.

Chuyển đổi tự động không hoạt động tốt khi một phương thức nhận tham số vị trí tùy chọn và tham số từ khóa. Một số người mong đợi đối tượng Hash cuối cùng được xử lý như tham số vị trí, và những người khác mong đợi nó được chuyển đổi thành tham số từ khóa.

Đây là một trong những trường hợp gây nhầm lẫn nhất:

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> expected: [{}, {}], actual: [1, {}]
{% endhighlight %}

Trong Ruby 2, `foo({})` truyền hash rỗng như tham số bình thường (tức là `{}` được gán cho `x`), trong khi `bar({})` truyền tham số từ khóa (tức là `{}` được gán cho `kwargs`). Vì vậy `any_method({})` rất mơ hồ.

Bạn có thể nghĩ đến `bar({}, **{})` để truyền rõ ràng hash rỗng cho `x`. Đáng ngạc nhiên, nó không hoạt động như bạn mong đợi; nó vẫn in `[1, {}]` trong Ruby 2.6. Điều này là do `**{}` bị bỏ qua bởi trình phân tích cú pháp trong Ruby 2.6, và tham số đầu tiên `{}` được tự động chuyển đổi thành tham số từ khóa (`**kwargs`). Trong trường hợp này, bạn cần gọi `bar({}, {})`, điều này rất kỳ lạ.

Các vấn đề tương tự cũng áp dụng cho các phương thức nhận tham số còn lại và tham số từ khóa. Điều này làm cho việc ủy quyền rõ ràng tham số từ khóa không hoạt động.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6 or before: [{}]
      #=> Ruby 2.7 or later:  []
{% endhighlight %}

`foo()` không truyền tham số nào, nhưng `target` nhận được một tham số hash rỗng trong Ruby 2.6. Điều này là do phương thức `foo` ủy quyền tham số từ khóa (`**kwargs`) một cách rõ ràng. Khi `foo()` được gọi, `args` là một Array rỗng, `kwargs` là một Hash rỗng, và `block` là `nil`. Và sau đó `target(*args, **kwargs, &block)` truyền một Hash rỗng như tham số vì `**kwargs` được tự động chuyển đổi thành tham số Hash vị trí.

Việc chuyển đổi tự động không chỉ gây nhầm lẫn cho mọi người mà còn làm cho phương thức kém khả năng mở rộng. Xem [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183) để biết thêm chi tiết về lý do thay đổi hành vi, và tại sao các lựa chọn triển khai nhất định được đưa ra.

## Ghi nhận

Bài viết này đã được Jeremy Evans và Benoit Daloze xem xét (hoặc thậm chí đồng tác giả) một cách tận tình.

## Lịch sử

* Cập nhật 2019-12-25: Trong 2.7.0-rc2, thông báo cảnh báo đã được thay đổi một chút, và một API để chặn các cảnh báo đã được thêm vào.
