---
layout: page
title: "Câu hỏi thường gặp về Ruby"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <strong>11</strong>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Các tính năng khác

### `a ? b : c` có nghĩa là gì?

Đây là cái gọi là "toán tử ba ngôi" và tương đương với
`if a then b else c end`.

### Làm thế nào để đếm số dòng trong một tệp?

Đoạn mã sau có thể cho kết quả nhanh nhất.

~~~
File.readlines("example").size  # => 3
~~~

### `MatchData#begin` và `MatchData#end` trả về gì?

Chúng hoạt động với `$~`, và trả về chỉ mục bắt đầu và chỉ mục kết thúc
của dữ liệu khớp trong chuỗi gốc. Xem ví dụ trong
[mở rộng tab](../9/#tab-expansion).

### Làm thế nào để tính tổng các phần tử trong một mảng?

{% include warnings/faq-out-of-date.html %}

Thay vì giải quyết bài toán cụ thể, hãy giải quyết trường hợp tổng quát.
Điều đầu tiên chúng ta sẽ làm là tạo một phương thức duyệt qua
một đối tượng `Enumerable` và thu thập một kết quả duy nhất. Smalltalk gọi
phương thức đó là inject, nên chúng ta cũng sẽ gọi như vậy:

~~~
module Enumerable

  # inject(n) {|n, i| ...}
  def inject(n)
    each {|i| n = yield(n, i) }

    n
  end
end
~~~

Lưu ý cách chúng ta thêm phương thức vào `Enumerable`. Điều này có nghĩa
là bất cứ thứ gì include Enumerable giờ đều có thể sử dụng `inject`. Nhưng
làm thế nào để sử dụng nó? Nó nhận một đối số duy nhất `n` và một block.
Với mỗi phần tử trong đối tượng đang được duyệt, nó gọi block, truyền vào
`n` và chính phần tử đó. Kết quả của block được gán lại cho `n`. Vì vậy,
để định nghĩa `sum`, chúng ta có thể viết:

~~~
module Enumerable
  def sum
    inject(0) {|n, i| n + i }
  end
end

[1,3,5,7,9].sum  # => 25
(1..100).sum     # => 5050
~~~

### Làm thế nào để sử dụng continuation?

{% include warnings/faq-out-of-date.html %}

Continuation trong Ruby cho phép bạn tạo một đối tượng đại diện cho một vị
trí trong chương trình Ruby, và sau đó quay lại vị trí đó bất cứ lúc nào
(ngay cả khi nó dường như đã ra khỏi phạm vi). Continuation có thể được sử
dụng để triển khai các cấu trúc điều khiển phức tạp, nhưng thường hữu ích
hơn như một cách để làm rối người khác.

Trong [\[ruby-talk:4482\]][ruby-talk:4482], Jim Weirich đã đăng các ví dụ
sau về continuation:

~~~
# --------------------------------------------------------------------
# Simple Producer/Consumer
# --------------------------------------------------------------------
# Connect a simple counting task and a printing task together using
# continuations.
#
# Usage:  count(limit)

def count_task(count, consumer)
  (1..count).each do |i|
    callcc {|cc| consumer.call cc, i }
  end
  nil
end

def print_task()
  producer, i = callcc { |cc| return cc }
  print "#{i} "
  callcc { |cc| producer.call }
end

def count(limit)
  count_task(limit, print_task())
  print "\n"
end
~~~


~~~
# --------------------------------------------------------------------
# Filtering Out Multiples of a Given Number
# --------------------------------------------------------------------
# Create a filter that is both a consumer and producer. Insert it
# between the counting task and the printing task.
#
# Usage:  omit(2, limit)

def filter_task(factor, consumer)
  producer, i = callcc { |cc| return cc }
  if (i%factor) != 0 then
    callcc { |cc| consumer.call cc, i }
  end
  producer.call
end

def omit(factor, limit)
  printer = print_task()
  filter = filter_task(factor, printer)
  count_task(limit, filter)
  print "\n"
end
~~~


~~~
# --------------------------------------------------------------------
# Prime Number Generator
# --------------------------------------------------------------------
# Create a prime number generator. When a new prime number is
# discovered, dynamically add a new multiple filter to the chain of
# producers and consumers.
#
# Usage:  primes(limit)

def prime_task(consumer)
  producer, i = callcc { |cc| return cc }
  if i >= 2 then
    callcc { |cc| consumer.call cc, i }
    consumer = filter_task(i, consumer)
  end
  producer.call
end

def primes(limit)
  printer = print_task()
  primes = prime_task(printer)
  count_task(limit, primes)
  print "\n"
end
~~~

[ruby-talk:4482]: https://blade.ruby-lang.org/ruby-talk/4482
