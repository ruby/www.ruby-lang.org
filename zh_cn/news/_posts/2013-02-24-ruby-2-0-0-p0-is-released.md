---
layout: news_post
title: "Ruby 2.0.0-p0 发布"
author: "Yusuke Endoh"
translator: "Andor Chen / Daniel Bovensiepen"
date: 2013-02-24 09:06:22 +0000
lang: zh_cn
---

我们非常荣幸地发布 Ruby 2.0.0-p0 版。

Ruby 2.0.0 是 Ruby 2.0 系列首个稳定版本。对于 Ruby 不断增加的需求及多样性方面的要求，此版本增加了许多新的特性并做出了相应改善。

希望您使用 Ruby 2.0.0 编程愉快！

## 下载

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      大小:   10814890 字节
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      大小:   13608925 字节
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      大小:   15037340 字节
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## Ruby 2.0.0 简介

### 新特性

重要部分：

* 语言的核心特性
  * 关键字参数：满足 API 设计的灵活性
  * Module#prepend：扩展类的新方式
  * %i 字面量：轻松地使用符号创建数组
  * \_\_dir\_\_：返回当前执行文件所在的目录名
  * 默认使用 UTF-8 编码：没必要再使用编码声明注释了

* 内置库
  * Enumerable#lazy 和 Enumerator::Lazy，懒惰流（可能是无限的）
  * Enumerator#size 和 Range#size：对大小惰性求值
  * \#to\_h：转换成散列类型的新方式
  * Onigmo：新的正则表达式引擎（Oniguruma 的分支）
  * 异步异常处理 API

* 调试支持
  * 支持 DTrace：可在生产环境中进行诊断
  * TracePoint：改进的跟踪 API

* 性能改进
  * 以位图标记优化 GC
  * 优化了 Kernel#require，启动 Rails 程序更快了
  * 优化了虚拟机，比如方法调度
  * 优化了浮点数操作

此外，我们实验性地在 Ruby 2.0.0 中加入了 Refinements 功能，这是新一代模块化编程理念。

更多的性能，改良及细节请参见 NEWS。

### 兼容性

在规划 2.0.0 时，我们兼顾了与 1.9 的兼容性。从 1.9 移植到 2.0 要比从 1.8 移植到 1.9 更容易。（稍后将介绍已知的不兼容部分。）

在此，非常感谢第三方开发者的大力支持，一些著名的应用，例如 Rails 和 tDiary，在发布 2.0.0 候选版本时都给予了很多反馈。

### 文档

据很多 Ruby 爱好者的要求，我们也对文档做了改进，为大量模块和方法添加了 rdoc 文档。如果说 1.9 的文档覆盖率是 60%，那么 2.0.0 就达到了 75%。此外，我们还添加了一些针对 Ruby 语法的说明，可以使用下面的命令查看：

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### 稳定性

请注意，和 1.9.0 版不同，尽管 2.0.0 版本号的最后一位是 0，却已经是个稳定版了。我们强烈建议所有代码库的开发者都要支持 2.0.0 版。正如前面所说，从 1.9 迁移到 2.0 更加容易。

Ruby 2.0.0 版是可以实际运用的，而且绝对能提高您使用 Ruby 编程的效率。

## 备注

### 特性介绍文章

下面是一些其他人撰写的文章，介绍了 2.0.0 版的特性：

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  （很全面，推荐）
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  （很全面，推荐）
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  （简介，日语）
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  （只介绍了 Enumerator::Lazy，日语）

以下文章也很有帮助，但是关于 refinement 的论述稍显陈旧：

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

此外，近期发行的《Rubyist Magazine》中有一些文章，由各功能的设计者编写，介绍了 2.0.0 版中的新功能。

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

虽然，这个杂志中的文章是日语的，但后续会有英文翻译。

### 不兼容性

据我们所知，Ruby 2.0.0 有以下五个明显的不兼容问题：

* 现在 Ruby 脚本的默认编码是UTF-8 \[#6679\]。一些用户反馈，影响现有的程序，比如一些评测程序变得很慢\[ruby-dev:46547\]。
* 在 Ruby 1.9 引入 M17N 时，就废弃了 Iconv，现在彻底删除了，请使用 String#encode 等代替。
* 存在 ABI 损坏：\[ruby-core:48984\]。我们认为普通用户可以/应该只要重装扩展库即可。但请勿直接从 1.9 中复制 .so 或 .bundle 文件。
* 现在\#lines，\#chars，\#codepoints，\#bytes 返回数组，而不是 Enumerator\[#6670\]。这些改变可以让您避免使用 lines.to\_a。使用 #each\_line 等，就能得到 Enumerator。
* Object#inspect 的返回结果会是 #&lt;ClassName:0x...&gt; 的形式，不再分发给 #to\_s 方法。\[#2152\]

还有一些相对较小的不兼容性。
\[ruby-core:49119\]

### Refinements 的状况

我们新增的 Refinements 功能，提供了一种实现模块化的新方式。但是，请注意，Refinements 功能还处在实验阶段，今后可能会改动。尽管如此，我们仍希望您能尝试使用，并向我们反馈意见。您的反馈将对我们优化此项功能提供重大帮助。

## 致谢

很多朋友对 2.0.0 版做出了贡献。受篇幅限制，即便仅仅对其中部分人员的贡献做出感谢，也很难在此一一呈现。对此，我感到非常抱歉，请允许我在此附上一个链接，指向感谢页面。

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

感谢大家！



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
