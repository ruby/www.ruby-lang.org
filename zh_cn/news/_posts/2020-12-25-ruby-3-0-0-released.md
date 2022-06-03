---
layout: news_post
title: "Ruby 3.0.0 现已发布"
author: "naruse"
translator: Delton Ding
date: 2020-12-25 00:00:00 +0000
lang: zh_cn
---

我们很高兴宣布 Ruby 3.0.0 已发布。自 2015 年起，我们就开始努力开发 Ruby 3，其目标在更高的性能、并发性和更安全的类型。尤其是性能上，Matz 表示「Ruby 3 会比 Ruby 2 快 3 倍」，也就是 [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3)。

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

在 [Optcarrot 基准测试中](https://github.com/mame/optcarrot) 我们测量了单线程 NES 游戏模拟器工作负载下的性能，其相比 Ruby 2.0 快了 3 倍！ <details>该结果是 Ruby 3.0 在下面的环境中测试得到的（[benchmark-driver.github.io/hardware.html](http://github.com/ruby/ruby/commit/8c510e4095) ）。取决于你所运行的环境和基准测试的类型，可能提升不足 3 倍。</details>

Ruby 3.0.0 的主要目标包括
* 性能
  * MJIT
* 并发性
  * Ractor
  * Fiber 调度器
* 类型（静态分析）
  * RBS
  * TypeProf

除了这些性能提升，Ruby 3 还引入了下面的新特性。

## 性能

> 当我第一次在会议上提到「Ruby 3x3」的时候，大多数核心团队的成员都觉得 Matz 在吹牛。事实上，我也这么觉得。但是我们做到了。我很高兴看到核心开发团队完成了 Ruby 3.0 比 2.0 快 3 倍的目标（在一些基准测试中）。—— Matz

### MJIT

MJIT 引入了大量的提升。详见 NEWS。

对于 Ruby 3.0 来说，JIT 将能在某些特定的工作负载下得到性能提升，例如游戏（[Optcarrot](https://benchmark-driver.github.io/benchmarks/optcarrot/commits.html#chart-1)）、AI（[Rubykon](https://benchmark-driver.github.io/benchmarks/rubykon/commits.html)），以及其它大多数时间都在反复调用某些特定方法的应用中。

虽然 Ruby 3.0 [大幅降低了 JIT 后代码的大小](https://twitter.com/k0kubun/status/1256142302608650244)，但对例如 Rails 这样的负载还没有做好准备。其调用大量不同的方法，在使用 JIT 后会遇到 CPU 指令缓存命中率降低的问题。Ruby 3.1 会在这一问题上进行进一步优化提升，敬请关注。

## 并发/并行

> 现在是多核的时代，并发性很重要。有了 Ractor 和异步 Fiber，Ruby 将会成为一门真正的并发语言。—— Matz

### Ractor（实验性）

Ractor 是一个基于 Actor 模型的并发抽象层，提供了无需担心线程安全的并行环境。

你可以创建多个 Ractor，它们能并行运行。Ractor 能保障多线程的线程安全，因为其无法跨线程共享一般对象，需要通过多个 Ractor 之间的通信来交换信息。

为了限制共享对象，Ractor 在 Ruby 语法中引入了多重的限制（如果不使用多个 Ractor 的话，没有这些限制）。

目前的规格和实现尚不完善，并可能在未来发生变更，因此当你第一次调用 `Ractor.new` 的时候会提示该特性是「实验性」的。

下面的小程序使用了 4 个 Ractor 线程同时执行著名的 Tak 函数（[Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))）测量了其性能。

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
基准测试结果：
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

该测试在 Ubuntu 20.04，Intel(R) Core(TM) i7-6700（4 核心 8 线程）下完成。测量显示其比起顺序执行，有约 3.87 倍的性能提升。

详见 [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html)。

### Fiber 调度器

`Fiber#scheduler` 被引入来解决阻塞操作的问题。其允许在不修改已有代码的情况下，自动实现轻量化的并发。详见 ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) 来了解其工作原理。

目前支持的类和方法有：

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` 以及相关方法（例如 `#wait_readable`, `#gets`, `#puts` 等）
- `IO#select` **不被支持**

下面是一个同时运行多个 HTTP 请求的样例程序：

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

这里使用了 [async](https://github.com/socketry/async) 来提供事件循环。事件循环会使用 `Fiber#scheduler` 的钩子来实现将 `Net::HTTP` 变为非阻塞请求。其它使用该接口 的 gem 也会自动提供非阻塞执行。这样实现的 gem 对于 Ruby 的其它实现了非阻塞的解释器（例如 JRuby, TruffleRuby）也能达到一样的非阻塞运行的效果。


## 静态分析

> 21 世纪 10 年代是静态编程语言的时代。Ruby 使用了抽象解释层来探索在没有类型定义的情况下实现类型检查。RBS 和 TypeProf 是迈向这样未来的第一步。未来还有更多发展。—— Matz


### RBS

RBS 是一门描述 Ruby 类型的语言。

包括 TypeProf 在内的支持 RBS 的类型检查器能更好通过 RBS 定义来理解 Ruby 程序。

你可以写下类和模块的定义：例如类中的方法、实例变量和它们的类型，以及它们如何组合和继承。

RBS 的目的是支持常见的 Ruby 程序的各种模式，并使其可以描述高级类型，包括：组合类型、函数重载、泛型。其也支持对鸭子类型提供**接口**类型。

Ruby 3.0 包括 `rbs` 的 gem，允许直接解析和处理 RBS 定义的类型。下面是一个 RBS 定义类、模块和常量的类型定义。

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

详见 [rbs gem 的 README](https://github.com/ruby/rbs)。

### TypeProf

TypeProf 是 Ruby 自带的类型分析工具。

目前，TypeProf 是一个类型推断器。

其读取没有类型标注的 Ruby 代码，分析其方法如何被使用，然后生成一个 RBS 的类型签名。

下面是使用 TypeProf 的一个例子。

样例输入：

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

样例输出：

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

你只需把输入保存为 `test.rb`文件然后调用命令 `typeprof test.rb` 即可生成。

你也可以 [在线尝试 TypeProf](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=)。（其运行在服务器上，如果出现服务中断，我们深表遗憾。）

详见 [文档](https://github.com/ruby/typeprof/blob/master/doc/doc.md) 和 [示例](https://github.com/ruby/typeprof/blob/master/doc/demo.md)。

TypeProf 目前是实验特性，还不够成熟。只有 Ruby 语言的一个子集可以被分析，能检测出的类型错误也比较有限。但其正在快速开发来覆盖更多 Ruby 语言特性、更好的分析性能以及可用性。我们欢迎任何反馈。

## 其它值得注意的新特性

* 单行模式匹配被重新设计了（实验性）

    * 加入 `=>`。其可以被用作向右赋值。

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```
    * `in` 改成了会返回 `true` 或 `false`.

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* 加入了模式查找功能（实验性）

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* 加入了无需 `end` 关键字的函数定义

  ``` ruby
  def square(x) = x * x
  ```

* 内建了 `Hash#except`

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* 内存查看以实验性的形式加入

    * 这是一个用来交换内存原始空间的新 C-API。例如将数组和位图在两个扩展库中交换。该扩展库可以互相共享其内存空间的元信息，例如尺寸、格式等。利用这些元信息，扩展库之间可以共享例如多维度的数组。该功能参考了 Python 的 buffer protocol 设计。

## 性能提升

* 粘贴长代码到 IRB 中，比起 Ruby 2.7.0 快了 53 倍。例如粘贴 [样例代码](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) 从 11.7 秒变成了只需 0.22 秒。


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* IRB 加入了 `measure` 命令，来简单测量命令的执行时间。

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## 其它自 2.7 起的新特性

* 关键字参数和其它参数分离。
  * 原则上，在 2.7 会跑出警告的操作在 3.0 不能执行。详见 [文档](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)。
  * 顺带一提，参数现在支持了前缀参数匹配。

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* 模式匹配 (`case`/`in`) 不再是实验性特性。
  * 详见[模式匹配文档](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html)。
* `$SAFE` 特性被彻底移除，现在它就是一个普通的全部常量。
* backtrace 的顺序在 Ruby 2.5 中被颠倒，现在倒了回来。现在其行为和 2.4 一致，先打印错误信息，再以此打印其调用者。
* 一些标准库被升级
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * etc.
* 标准库以及内置的 gem 不再含有下面的 gems
  如果要使用相应的特性，请安装对应的 gem
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* 以下 gems 将从默认变为内置
  * rexml
  * rss
* 以下标准库现变为默认 gem，并在 rubygems.org 发布
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

参考 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) 或 [提交记录](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}) 以获取更多信息。

伴随这些变更，[{{ release.stats.files_changed }} 文件已更改，自 Ruby 2.7.0 以来新增 {{ release.stats.insertions }} 行，删除 {{ release.stats.deletions }} 行](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)

> Ruby 3.0 是一个里程碑，这门语言在保持兼容性的前提下进化了。但这不是终点，Ruby 会继续前进，未来变得更好。尽情期待！—— Matz

圣诞快乐，节日快乐，享受使用 Ruby 3.0 编程！

## 下载

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}


## Ruby 是什么

Ruby 是最初由 Matz（Yukihiro Matsumoto）于 1993 年开发，现在作为开源软件开发的语言。它可以在多个平台上运行，并在世界各地使用。尤其适合于网站的开发。
