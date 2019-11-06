---
layout: news_post
title: "Ruby 2.7.0-preview2 已发布"
author: "naruse"
translator: Delton Ding
date: 2019-10-22 12:00:00 +0000
lang: zh_cn
---

我们很高兴宣布 Ruby 2.7.0-preview2 已发布。

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

{% highlight ruby %}
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
{% endhighlight %}

关于更多信息，请查阅 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)。

## REPL 改进

`irb`，集成的交互环境 (REPL; Read-Eval-Print-Loop)，现已支持多行编辑，由 `reline`、`readline` 实现了纯 Ruby 的支持。它还提供 rdoc 集成。在 irb 中您可以为指定的类、模块或方法的显示引用。[功能 #14683](https://bugs.ruby-lang.org/issues/14683)、[功能 #14787](https://bugs.ruby-lang.org/issues/14787)、[功能 #14918](https://bugs.ruby-lang.org/issues/14918) 此外，`binding.irb` 中显示的代码和核心类的检查结果现在已经可以彩色呈现。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 位置参数和关键词参数的分离

关键词参数和位置参数的自动转换被标记为已废弃（deprecated），自动转换将会在 Ruby 3 中被移除。[[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

* 当方法传入一个 Hash 作为最后一个参数，或者传入的参数没有关键词的时候，会抛出警告。如果需要继续将其视为关键词参数，则需要加入两个星号来避免警告并确保在 Ruby 3 中行为正常。

  {% highlight ruby %}
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  {% endhighlight %}

* 当方法传入一个 Hash 到一个接受关键词参数的方法中，但是没有传递足够的位置参数，关键词参数会被视为最后一个位置参数，并抛出一个警告。请将参数包装为 Hash 对象来避免警告并确保在 Ruby 3 中行为正常。

  {% highlight ruby %}
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  {% endhighlight %}

* 当方法接受关键词参数传入，但不会进行关键词分割（splat），且传入同时含有 Symbol 和非 Symbol 的 key，那么 Hash 会被分割，但是会抛出警告。你需要在调用时传入两个分开的 Hash 来确保在 Ruby 3 中行为正常。

  {% highlight ruby %}
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  {% endhighlight %}

* 当一个方法不接受关键词，但是调用时传入了关键词，关键词会被视为位置参数，不会有警告抛出。这一行为将会在 Ruby 3 中继续工作。

  {% highlight ruby %}
  def foo(opt={});  end; foo( key: 42 )   # OK
  {% endhighlight %}

* 如果方法支持任意参数传入，那么非 Symbol 也会被允许作为关键词参数传入。[[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

  {% highlight ruby %}
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  {% endhighlight %}

* <code>**nil</code> 被允许使用在方法定义中，用来标记方法不接受关键词参数。以关键词参数调用这些方法会抛出 ArgumentError [[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

  {% highlight ruby %}
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  {% endhighlight %}

* 将空的关键词分割（splat）传入一个不接受关键词的方法不会继续被当作空 Hash 处理，除非空哈希被作为一个必要参数，并且这种情况会抛出警告。请移除双星号来将 Hash 作为位置参数传入。[[功能 #14183]](https://bugs.ruby-lang.org/issues/14183)

  {% highlight ruby %}
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  {% endhighlight %}

## 其它值得关注的新特性

* 方法引用运算符，<code>.:</code>，作为实验性功能加入了。[功能 #12125]( https://bugs.ruby-lang.org/issues/12125)、[功能 #13581]( https://bugs.ruby-lang.org/issues/13581)


* 实验性地加入了把编号参数作为默认的块参数的特性。[功能 #4475](https://bugs.ruby-lang.org/issues/4475)

* 无头范围实验性地加入了。它可能尽管没有无限范围那么有用，但它对开发 DSL 是非常有用的。[功能 #14799](https://bugs.ruby-lang.org/issues/14799)

  {% highlight ruby %}
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  {% endhighlight %}

* 新增了 `Enumerable#tally`，它会计算每个元素出现的次数。

  {% highlight ruby %}
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  {% endhighlight %}

* 允许在 `self` 上调用私有方法 [[功能 #11297]](https://bugs.ruby-lang.org/issues/11297) [[功能 #16123]](https://bugs.ruby-lang.org/issues/16123)

  {% highlight ruby %}
  def foo
  end
  private :foo
  self.foo
  {% endhighlight %}

* 新增 `Enumerator::Lazy#eager`。它会产生一个非懒惰的迭代器。[[功能 #15901]](https://bugs.ruby-lang.org/issues/15901)

  {% highlight ruby %}
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  {% endhighlight %}

## 性能改进

* JIT [实验性质]

  * 当优化假设不成功时，JIT 后的代码可能会被重新编译到优化程度较低的代码。

  * 当方法（Method）被认为是纯函数（pure）时，会进行方法内联优化。这种优化方法仍是实验性的，许多方法不被认为是纯函数。

  * `--jit-min-calls` 的默认值从 5 调整到 10,000。

  * `--jit-max-cache` 的默认值从 1,000 调整到 100。

* Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` 和 `nil.to_s` 现在始终返回一个冻结（frozen）字符串。返回的字符串始终和给定的对象相等。 [实验性]  [[功能 #16150]](https://bugs.ruby-lang.org/issues/16150)

* `CGI.escapeHTML` 的性能被提升了。[GH-2226](https://github.com/ruby/ruby/pull/2226)

## 其他自 2.6 版本以來显著的变化

* 一些标准库已被更新
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * 一些其它没有原始版本的库也被更新了。

* 现在进行块方法调用时，如果 `Proc.new` 和 `proc` 在没有 block 会产生警告。

* `lambda` 在方法调用时如果没有 block 会产生区块错误。

* Unicode 和 Emoji 版本从 11.0.0 更新至 12.0.0。[[功能 #15321]](https://bugs.ruby-lang.org/issues/15321)

* 更新 Unicode 至 12.1.0 版本，新增对于新年号「令和」 U+32FF 的支持。[[功能 #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`、`Date#jisx0301` 和 `Date.parse` 展示支持新的日本年号作为非正式的扩展功能，直到新的 JIS X 0301 发布。[[功能 #15742]](https://bugs.ruby-lang.org/issues/15742)

* 编译器需要支持 C99 [[杂项 #15347]](https://bugs.ruby-lang.org/issues/15347)
  *关于我们使用方言的具体信息请查阅：<https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

见 [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) 以查看详情。

这些合并后，自 Ruby 2.6.0 已发生了 [3670 个文件变更，201242 行新增(+)，88066 行删除(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)！

享受使用 Ruby 2.7 编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Ruby 是什么

Ruby 是最初由 Matz（Yukihiro Matsumoto）于 1993 年开发，现在作为开源软件开发的语言。它可以在多个平台上运行，并在世界各地使用。尤其适合于网站的开发。
