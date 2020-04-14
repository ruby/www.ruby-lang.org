---
layout: news_post
title: "Ruby 2.7.0-preview3 已发布"
author: "naruse"
translator: Delton Ding
date: 2019-11-23 12:00:00 +0000
lang: zh_cn
---

我们很高兴宣布 Ruby 2.7.0-preview3 已发布。

此版本的发布是为了十二月发布的正式版收集反馈意见。此版本引入了大量新特性和性能提升，其中最值得注意的是：

* 紧凑 GC（Compaction GC）
* 模式匹配
* REPL 改进
* 位置参数和关键词参数的分离

## 紧凑 GC（Compaction GC）

此版本引入了 Compaction GC，可以对内存空间碎片进行整理。

某些多线程 Ruby 程序会导致内存碎片化，进而导致内存占用率提高和速度降低。

我们引入了 `GC.compact` 方法来压缩堆。此函数能压缩堆中的存活对象，以更少地占用内存分页。并且堆可能会变得对写入时复制（CoW）更友好。
[功能 #15626](https://bugs.ruby-lang.org/issues/15626)

## 模式匹配 [实验性]

在函数式编程中非常常用的模式匹配功能，作为实验性功能被加入了。[功能 #14912](https://bugs.ruby-lang.org/issues/14912) 它可以遍历一个对象，并在其满足某一模式时进行赋值。

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

关于更多信息，请查阅 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)。

## REPL 改进

`irb`，集成的交互环境 (REPL; Read-Eval-Print-Loop)，现已支持多行编辑，由 `reline`、`readline` 实现了纯 Ruby 的支持。它还提供 rdoc 集成。在 irb 中您可以为指定的类、模块或方法的显示引用。[功能 #14683](https://bugs.ruby-lang.org/issues/14683)、[功能 #14787](https://bugs.ruby-lang.org/issues/14787)、[功能 #14918](https://bugs.ruby-lang.org/issues/14918)

此外，`binding.irb` 中显示的代码和核心类的检查结果现在已经可以彩色呈现。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 位置参数和关键词参数的分离

关键词参数和位置参数的自动转换被标记为已废弃（deprecated），自动转换将会在 Ruby 3 中被移除。[[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

* 当方法传入一个 Hash 作为最后一个参数，或者传入的参数没有关键词的时候，会抛出警告。如果需要继续将其视为关键词参数，则需要加入两个星号来避免警告并确保在 Ruby 3 中行为正常。

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* 当方法传入一个 Hash 到一个接受关键词参数的方法中，但是没有传递足够的位置参数，关键词参数会被视为最后一个位置参数，并抛出一个警告。请将参数包装为 Hash 对象来避免警告并确保在 Ruby 3 中行为正常。

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* 当方法接受关键词参数传入，但不会进行关键词分割（splat），且传入同时含有 Symbol 和非 Symbol 的 key，那么 Hash 会被分割，但是会抛出警告。你需要在调用时传入两个分开的 Hash 来确保在 Ruby 3 中行为正常。

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* 当一个方法不接受关键词，但是调用时传入了关键词，关键词会被视为位置参数，不会有警告抛出。这一行为将会在 Ruby 3 中继续工作。

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* 如果方法支持任意参数传入，那么非 Symbol 也会被允许作为关键词参数传入。[[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> 被允许使用在方法定义中，用来标记方法不接受关键词参数。以关键词参数调用这些方法会抛出 ArgumentError [[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* 将空的关键词分割（splat）传入一个不接受关键词的方法不会继续被当作空 Hash 处理，除非空哈希被作为一个必要参数，并且这种情况会抛出警告。请移除双星号来将 Hash 作为位置参数传入。[[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

注意：关键词参数不兼容时的警告目前被指出过于冗长，现在有两种可能的解决方案正在被讨论：
讲警告默认为关闭
（[#16345](https://bugs.ruby-lang.org/issues/16345)），
或是禁止重复警告
（[#16289](https://bugs.ruby-lang.org/issues/16289)），
尚未做出最后的决定，但会在正式发布的版本中修复。

## 其它值得关注的新特性

* 方法引用运算符，<code>.:</code>，作为实验性功能加入了。[功能 #12125]( https://bugs.ruby-lang.org/issues/12125)、[功能 #13581]( https://bugs.ruby-lang.org/issues/13581)


* 实验性地加入了把编号参数作为默认的块参数的特性。[功能 #4475](https://bugs.ruby-lang.org/issues/4475)

* 无头范围实验性地加入了。它可能尽管没有无限范围那么有用，但它对开发 DSL 是非常有用的。[功能 #14799](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* 新增了 `Enumerable#tally`，它会计算每个元素出现的次数。

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* 允许在 `self` 上调用私有方法 [[功能 #11297]](https://bugs.ruby-lang.org/issues/11297) [[功能 #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* 新增 `Enumerator::Lazy#eager`。它会产生一个非懒惰的迭代器。[[功能 #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## 性能改进

* JIT [实验性质]

  * 当优化假设不成功时，JIT 后的代码可能会被重新编译到优化程度较低的代码。

  * 当方法（Method）被认为是纯函数（pure）时，会进行方法内联优化。这种优化方法仍是实验性的，许多方法不被认为是纯函数。

  * `--jit-min-calls` 的默认值从 5 调整到 10,000。

  * `--jit-max-cache` 的默认值从 1,000 调整到 100。

* ~~`Symbol#to_s`~~ (已撤回), `Module#name`, `true.to_s`, `false.to_s` 和 `nil.to_s` 现在始终返回一个冻结（frozen）字符串。返回的字符串始终和给定的对象相等。 [实验性]  [[功能 #16150]](https://bugs.ruby-lang.org/issues/16150)

* `CGI.escapeHTML` 的性能被提升了。[GH-2226](https://github.com/ruby/ruby/pull/2226)

## 其他自 2.6 版本以來显著的变化

* 一些标准库已被更新
  * Bundler 2.1.0.pre.3
    ([History](https://github.com/bundler/bundler/blob/2-1-stable/CHANGELOG.md#210pre3-november-8-2019))
  * RubyGems 3.1.0.pre.3
    ([History](https://github.com/rubygems/rubygems/blob/3.1/History.txt))
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * 一些其它没有原始版本的库也被更新了。

* 将一下函数库升级为默认 gems
  * 以下默认 gem 已在 rubygems.org 上发布
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * 以下默认 gem 仅在 ruby 核心中升级，尚未发布于 rubygems.org
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* 现在进行块方法调用时，如果 `Proc.new` 和 `proc` 在没有 block 会产生警告。

* `lambda` 在方法调用时如果没有 block 会产生区块错误。

* Unicode 和 Emoji 版本从 11.0.0 更新至 12.0.0。[[功能 #15321]](https://bugs.ruby-lang.org/issues/15321)

* 更新 Unicode 至 12.1.0 版本，新增对于新年号「令和」 U+32FF 的支持。[[功能 #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`、`Date#jisx0301` 和 `Date.parse` 暂时支持新的日本年号作为非正式的扩展功能，直到新的 JIS X 0301 发布。[[功能 #15742]](https://bugs.ruby-lang.org/issues/15742)

* 编译器需要支持 C99 [[杂项 #15347]](https://bugs.ruby-lang.org/issues/15347)
  *关于我们使用方言的具体信息请查阅：<https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

* ~~`Regexp#match{?}` 传入 `nil` 会产生 TypeError。
  [[Feature #13083]](https://bugs.ruby-lang.org/issues/13083)~~ 已撤回

3895 个文件变更，213426 行新增(+)，96934 行删除(-)

见 [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview3/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview3) 以查看详情。

随着这些变动，从 Ruby 2.6.0 至今的[状态](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview3)！

享受使用 Ruby 2.7 编程吧！

## 下载

{% assign release = site.data.releases | where: "version", "2.7.0-preview3" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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
