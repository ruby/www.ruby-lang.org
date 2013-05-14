layout: news_post
title: "Ruby 2.0.0-p0发布"
author: "Andor Chen & Daniel Bovensiepen"
date: 2013-04-19 10:00:0 UTC
lang: en

在此，我们非常荣幸地发布Ruby 2.0.0-p0版。

Ruby 2.0.0是Ruby 2.0系列中首个稳定的版本。针对对于Ruby不断增加的需求及多样性方面的要求，此版本增加了许多新的特性及做出了相应改善。

希望您Ruby 2.0.0编程愉快！

## 下载

* [&lt;URL:ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      大小:   10814890 字节
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      大小:   13608925 字节
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      大小:   15037340 字节
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## Ruby 2.0.0是什么

### 新特性

重要部分提示（重要

* 语言的核心特性
  * 键盘参数：满足API设计的灵活性
  * Module#prepend：提供延伸类的新方式
  * 文字 %i： 轻松地为符号创建数组
  * \_\_dir\_\_: 返回执行中的文件目录
  * UTF-8默认编码： 使很多magic comments成为可删除的

* 内置库
  * Enumerable#lazy和Enumerator::Lazy，懒惰流（可能是无限的）
  * Enumerator#size和Range#size：对大小惰性求值
  * \#to\_h：转换为散列的新约定
  * Onigmo：新的正则表达式的引擎（Oniguruma的一个叉路）
  * 异步异常处理API

* 调试支持
  *动态追踪支持：在生成中启动运行时间诊断
  *跟踪点：改进的跟踪API

* 性能改进
  * 以位图标记GC优化
  * Kernel#require优化，非常快地启动Rails
  * 虚拟机优化，如调度方式
  * 浮动操作优化

此外，尽管作为一个实验性的性能，2.0.0包括的精化为Ruby的模块化增加了新的概念。

更多的性能，改良及细节请参见NEWS。

### 兼容性

我们同时在2.0.0的设计中也兼顾了其与1.9的兼容性。1.9移植至2.0比1.8移植至1.9更加容易。（可察觉的不兼容性将在后面介绍）

在此，非常感谢第三方的大力支持，一些著名的应用，如已有报告中Rails和tDiary发表2.0.0的候选版本。

### 文档

我们据很多Ruby爱好者的要求，也对文档做出了改进。我们针对各种模块和方式也增加了大量的rdoc。2.0.0版的75%将有文档记录，而1.9.3版的记录率仅是60%左右。此外，我们也已经对Ruby语法做出了 描述，请参见：

    ri ruby:syntax

### 稳定性

请注意，尽管2.0.0版的TENNY是0，但是与1.9.0版不同的是,2.0.0版是一个稳定的版本。强烈建议所有库制作者都支持2.0.0版。正如之前所提到的，从1.9版迁移到2.0版更加容易。

Ruby 2.0.0版是可以实际运用的，而且决定能够提高您的Ruby生活。

## 备注

### 相关文献

这是由第三方提供的对于2.0.0版性能的介绍文章：

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (综合性, 推荐)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (综合性, 推荐)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (简介, 日语)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (仅限枚举::懒惰, 日语)

以下文章也很有帮助，但是关于精化的论述稍显陈旧：

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

此外，近期发行的\"Rubyist Magazine\"中有一些由各个功能设计者针对2.0.0版本的功能做出的一些介绍。

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

虽然，这些将会以日语介绍，但后续会有英文的翻译。

### 不兼容性

据我们所知，有以下五个显著的不兼容：

* 现在Ruby脚本的默认编码是UTF-8 \[#6679\]。一些用户反馈它会影响已有的程序，比如一些基准程序变得很慢\[ruby-dev:46547\]。
* Iconv删除了，在M17N引入Ruby1.9时，其已被删除。使用String#encode等代替。
* 存在应用系统二进制接口破坏:\[ruby-core:48984\]。我们认为普通用户可以/应该只要重装扩展库。请勿直接从1.9复制文件包。
* 现在\#lines，\#chars，\#codepoints，\#bytes返回一个数组，而不是Enumerator\[#6670\]。这些改变可以让您避免常用的\”lines.to\_a\”。使用#each\_line等，能得到枚举。
* 对象#检查，并不是一直返回#&lt;ClassName:0x...&gt;而不是转至#to\_s。\[#2152\]

存在一些相对小的不兼容性。
\[ruby-core:49119\]


### 精化状态

我们新增的精化功能，为Ruby的模块化提供了新的感念。但是，请注意，精化功能如今正在实验阶段，今后有可能会对其做出更改。尽管如此，我们仍是希望您能尝试应用它，并向我们反馈您的意见。您的反馈将对我们优化此项功能提供重大的帮助。

## 致谢

很多朋友对2.0.0版做出了许多贡献。受篇幅限制，即便仅仅对其中部分人员的部分贡献做出感谢，也很难在此做出呈现。对此，我感到非常抱歉，请允许我在此附上链接。

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

再次感谢大家！



[1]: ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
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

