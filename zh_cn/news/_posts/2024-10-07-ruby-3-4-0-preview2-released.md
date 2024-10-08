---
layout: news_post
title: "Ruby 3.4.0 preview2 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2024-10-07 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview2" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 发布。

## Prism

默认解析器由 parse.y 切换到 Prism。 [[Feature #20564]]

## 语言变化

* 在没有 `frozen_string_literal` 注释的文件中，当字符串字面量被修改时会发出警告。
  这些警告可以使用 `-W:deprecated` 或者通过设置 `Warning[:deprecated] = true` 来启用。
  如要禁用此变化，您可以在运行 Ruby 时，使用 `--disable-frozen-string-literal` 命令行参数。 [[Feature #20205]]

* 增加了 `it` 来引用块参数。 [[Feature #18980]]

* 支持在调用方法时使用 `nil` 作为关键字展开参数。
  `**nil` 类似于 `**{}`，不传递关键字参数，也不调用任何转换方法。 [[Bug #20064]]

* 索引不再接受块传递。 [[Bug #19918]]

* 索引不再接受关键字参数。 [[Bug #20218]]

## 核心类更新

注意：我们只列出了重要的类更新。

* Exception

  * Exception#set_backtrace 现在接受 `Thread::Backtrace::Location` 数组。
    `Kernel#raise`，`Thread#raise` 和 `Fiber#raise` 也接受这个新格式。 [[Feature #13557]]

* Range

  * 当 range 不可枚举时，Range#size 将抛出 TypeError。 [[Misc #18984]]



## 兼容性问题

注意：不包括问题补丁。

* 修改了错误信息和错误栈的显示。
  * 使用单引号(`'`)代替反勾号(`` ` ``)作为错误消息的起始引号。 [[Feature #16495]]
  * 在方法名前显示类名（仅当类具有永久名称时）。 [[Feature #19117]]
  * `Kernel#caller`，`Thread::Backtrace::Location` 等的方法也进行了相应更改。

  ```
  此前:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  现在:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in `<main>'
  ```

* `Hash#inspect` 显示格式发生变化 [[Bug #20433]]
  * 使用现代的表达语法来显示符号类型键值的情况： `"{user: 1}"`
  * 其他类型的键值在显示时，在 `=>` 前后增加空格： `'{"user" => 1}'`，此前的显示为： `'{"user"=>1}'`

## C API 更新

* 移除 `rb_newobj` 和 `rb_newobj_of` （以及相关的宏 `RB_NEWOBJ`，`RB_NEWOBJ_OF`，`NEWOBJ`，`NEWOBJ_OF`）。 [[Feature #20265]]
* 移除废除的函数 `rb_gc_force_recycle`。 [[Feature #18290]]

## 实现改进

* `Array#each` 用 Ruby 重写，以提供更好的性能 [[Feature #20182]]。

## 其他变化

* 如果传递了一个块给不使用块的方法时，在详细模式（`-w`）中将显示警告。 [[Feature #15554]]

* Ruby 对一些核心方法通过解释器和 JIT 进行了优化，诸如 `String.freeze`，`Integer#+`。
  当这些方法被重定义时，解释器将发出性能警告（`-W:performance` 或 `Warning[:performance] = true`）。 [[Feature #20429]]

有关默认 gems 和 绑定 gems 的细节，可以参考 GitHub 上的发布，例如 [logger gem](https://github.com/ruby/logger/releases) 或相应的变更日志。
或 [提交日志](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})。

自 Ruby 3.3.0 以来，这些变化共导致 [{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)！


## 下载

* <{{ release.url.gz }}>

      文件大小: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      文件大小: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      文件大小: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby 是什么

Ruby 最初由 Matz （松本行弘，Yukihiro Matsumoto） 于 1993 年开发，现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是 Web 开发领域。

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20433]:     https://bugs.ruby-lang.org/issues/20433
