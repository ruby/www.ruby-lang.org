---
layout: news_post
title: "Ruby 3.2.0 Preview 3 已发布"
author: "naruse"
translator: GAO Jun
date: 2022-11-11 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}

我们很高兴地宣布 Ruby {{ release.version }}。Ruby 3.2 增加了很多新功能和性能改进。


## 基于 WASI 的 WebAssembly 支持

这是首次基于 WASI 的 WebAssembly 支持。使得 CRuby 二进制内容可用于浏览器、Serverless Edge、以及其他 WebAssembly/WASI 嵌入环境。目前，此功能已通过除 Thread API 之外的 basic 和 bootstrap 测试套件。


![](https://i.imgur.com/opCgKy2.png)

### 背景

[WebAssembly (Wasm)](https://webassembly.org/) 希望能够在浏览器中提供安全快速的运行程序的方式。但其目标，也就是在不同环境中安全高效的运行程序，不仅是 web 应用长期以来的目标，也是其他一般程序所需要的。

[WASI (The WebAssembly System Interface)](https://wasi.dev/) 被设计用于此类应用场景。尽管此类应用需要与操作系统进行通信，WebAssembly 却运行在一个没有系统接口的虚拟机之上。WASI 使之标准化。

基于这些项目，Ruby 的 WebAssembly/WASI 支持能使 Ruby 开发者可以编写能运行于兼容此类功能的平台上。

### 应用场景

此功能使得开发人员可以在 WebAssembly 环境中使用 CRuby。一个此类应用场景的案例是 [TryRuby playground](https://try.ruby-lang.org/playground/) 的 CRuby 支持。现在您可以在您的浏览器中尝试原生的 CRuby。

### 技术要点

目前，WASI 和 WebAssembly 仍在不断演进，同时基于安全原因，还缺少一些功能来实现纤程、异常和垃圾回收。
所以，CRuby 使用了一种可以控制用户空间中执行的二进制转换技术 Asyncify 来填补这一鸿沟。

此外，我们创建了 [WASI 之上的虚拟文件系统](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)，于是就可以很容易地将 Ruby 应用打包成单个 .wasm 文件，进而简化分发 Ruby 应用的过程。


### 相关链接

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Regexp 用于防御 ReDoS 攻击的改进

众所周知，正则表达式匹配的耗时可能出乎意料的长。如果您的代码尝试从一个不可信输入中匹配一个低效的正则表达式，攻击者可以借此发起有效的拒绝服务攻击(所谓的正则表达式 DoS，或 ReDoS)。

我们引入了2个更新，能够显著减轻 ReDoS 的影响

### 改进 Regexp 匹配算法

自 Ruby 3.2 开始，Regexp 的匹配算法通过缓存技术得到了显著改进。
新增正则表达式匹配的超时设置。

```
# 下面的正则匹配在 Ruby 3.1 中耗时10秒，在 Ruby 3.2 中耗时0.003秒

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

通过改进的匹配算法，使得 Regexp 的匹配（根据我们的实验，约90%）能够在线性时间内完成。

（致 Preview 用户：此改进可能会消耗与每个匹配的输入长度成比例的内存。我们预计不会出现实际问题，因为这种内存分配通常会延迟，并且正常的 Regexp 匹配最多只会消耗表达式长度10倍的内存。如果您在实际应用中遇到 Regexp 匹配导致的内存不足情况，请报告给我们。）

最初提议 <https://bugs.ruby-lang.org/issues/19104>

### Regexp 超时设置

上面的改进不能使用于某些正则表达式，比如使用了某些高级特性（例如：反向引用 back-references，环视 look-around），或者大量使用固定重复次数。作为一种后备措施，Regexp 还引入了超时设置功能。

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> 1秒后 Regexp::TimeoutError
```

请注意，`Regexp.timeout` 是全局性的配置。如果您希望对于某些特殊的正则表达式使用不同的超时设置，您可以使用 `Regexp.new` 中的 `timeout` 关键词。

```ruby
Regexp.timeout = 1.0

# 这个 Regexp 没有超时设置
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # 不会被中断
```

最初提议：<https://bugs.ruby-lang.org/issues/17837>


## 其他值得注意的新功能

### 不再捆绑第三方源代码

* 我们不再捆绑第三方源代码，例如 `libyaml`， `libffi`。

    * psych 中已经移除了 libyaml 的代码。您可能需要在 Ubuntu/Debian 平台中安装 `libyaml-dev`。软件包的名称可能因平台不同而各异。

    * 从 `fiddle` 中移除捆绑的 libffi 源码

### 语言

* 除了在方法参数中使用，匿名的可变长参数现在可以作为参数进行传递
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* 接受一个单独位置参数的 proc 不再会自动解封装。 [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 及之前版本
  # => 1
  # Ruby 3.2 及之后版本
  # => [1, 2]
  ```

* 对于显示对象的常量赋值求值顺序，将始终使用单属性赋值求值顺序。参考下面的代码:

    ```ruby
    foo::BAR = baz
    ```

  `foo` 现在在 `baz` 之前求值。类似的，对于多重常量的赋值，使用从左到右的求值顺序。参考下面的代码:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  现在使用下面的求值顺序:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* 查找模式不再是实验性功能。
  [[Feature #18585]]

* 使用可变长参数 (例如 `*args`) 的方法，如果同时希望通过 `foo(*args)` 使用关键词参数的，那么必须使用 `ruby2_keywords` 进行标记。也就是说，所有希望通过 `*args` 来使用关键字参数的方法现在毫无例外地都必须使用
  `ruby2_keywords` 进行标记。一旦某个库需要 Ruby 3+，这将是一个更容易的过渡升级方式。此前，当接收方法使用 `*args` 时，`ruby2_keywords` 标记被保留，但这可能是错误并且是行为不一致的。对于查找潜在缺失的
  `ruby2_keywords` 的好方法应当是运行测试套件，检查测试失败时调用的最后一个方法，这个方法必须接收关键词参数。通过在错误处使用 `puts nil, caller, nil`，然后检查在调用链上的每一个使用自动委派关键词的方法/块被标记为
  `ruby2_keywords`。 [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Ruby 2.7-3.1 可以意外地在没有 ruby2_keywords 的情况下执行，在 3.2 中必需。
    # 如需去除 ruby2_keywords，需要修改 #foo 和 #bar 的参数为 (*args, **kwargs) 或 (...)。
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## 性能改进

### YJIT

* 在 UNIX 平台中支持 arm64 / aarch64。
* 编译 YJIT 需要 Rust 1.58.1+. [[Feature #18481]]

## 自 3.1 以来其他值得注意的变更

* Hash
    * 当 hash 为空时，Hash#shift 现在总是返回 nil，此前行为是返回默认值或调用默认 proc。 [[Bug #16908]]

* MatchData
    * 新增 MatchData#byteoffset 。 [[Feature #13110]]

* Module
    * 新增 Module.used_refinements 。 [[Feature #14332]]
    * 新增 Module#refinements 。 [[Feature #12737]]
    * 新增 Module#const_added 。 [[Feature #17881]]

* Proc
    * Proc#dup 返回子类的一个实例。 [[Bug #17545]]
    * Proc#parameters 现在接受 lambda 关键字。 [[Feature #15357]]

* Refinement
    * 新增 Refinement#refined_class。 [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * 为`parse`, `parse_file` 和 `of` 增加选项 `error_tolerant`。 [[Feature #19013]]

* Set
    * Set 现在可以直接使用，不需要调用 `require "set"`。 [[Feature #16989]]
      目前其通过 `Set` 常量或对 `Enumerable#to_set` 调用自动载入。

* String
    * 新增 String#byteindex 和 String#byterindex 。 [[Feature #13110]]
    * 更新 Unicode 至 Version 14.0.0，Emoji Version 14.0. [[Feature #18037]] (同样适用于 Regexp)
    * 新增 String#bytesplice 。  [[Feature #18598]]

* Struct
    * 即使在 `Struct.new` 中不设置 `keyword_init: true`，Struct 类也可以通过关键词参数进行初始化。 [[Feature #16806]]

## 兼容性问题

注意：不包含特性的问题修正

### 被移除的常量

下列废弃常量被移除。

* `Fixnum` 与 `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### 被移除的方法

下列废弃方法被移除。

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## 标准库兼容性问题

* `Psych` 不再捆绑 libyaml 源代码
  用户需要自行通过包管理系统安装 libyaml 库。[[Feature #18571]]

## C API 更新

### 更新的 C API

下列 API 被更新

* PRNG 更新
  `rb_random_interface_t` 被更新并设定版本。
  如果扩展库使用旧版本的接口需要更新。
  同样，`init_int32` 函数需要被定义。

### 被移除的 C API

下列废弃的 API 被移除。

* 变量 `rb_cData`。
* "taintedness" 与 "trustedness" 函数。 [[Feature #16131]]

### 标准库更新

* SyntaxSuggest

  * `syntax_suggest`（原名 `dead_end`）被集成进 Ruby。[[Feature #18159]]

* ErrorHighlight
  * 对于 TypeError 和 ArgumentErrorNow，现在错误提示指向对应参数

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

*   下列默认 gems 被更新。
    * RubyGems 3.4.0.dev
    * bigdecimal 3.1.2
    * bundler 2.4.0.dev
    * cgi 0.3.2
    * date 3.2.3
    * error_highlight 0.4.0
    * etc 1.4.0
    * io-console 0.5.11
    * io-nonblock 0.1.1
    * io-wait 0.3.0.pre
    * ipaddr 1.2.4
    * json 2.6.2
    * logger 1.5.1
    * net-http 0.2.2
    * net-protocol 0.1.3
    * ostruct 0.5.5
    * psych 5.0.0.dev
    * reline 0.3.1
    * securerandom 0.2.0
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 0.0.1
    * timeout 0.3.0
*   下列绑定 gems 被更新。
    * minitest 5.16.3
    * net-imap 0.2.3
    * rbs 2.6.0
    * typeprof 0.21.3
    * debug 1.6.2
*   系列默认 gems 现在是绑定 gems。

您可以通过 [新闻](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
获取更多信息。

自 Ruby 3.1.0 以来，伴随这些变更， [{{ release.stats.files_changed }} 个文件被更改， 新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)!

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

## Ruby是什么

Ruby 最初由 Matz （松本行弘，Yukihiro Matsumoto） 于 1993 年开发，现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是Web开发领域。



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Bug #19013]:     https://bugs.ruby-lang.org/issues/19013
