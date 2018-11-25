---
layout: page
title: "代码库"
lang: zh_cn
---

与大多数的编程语言一样，Ruby 也受益于海量的第三方代码库。
{: .summary}

这些代码库大部分都以 **Gem** 形式发布。 [**RubyGems**][1] 是设计用来帮助创建，分享和安装
这些代码库的（从某种意义上来讲，RubyGems 是一个类似于 apt-get 的分布式包管理系统，只不过专注于 Ruby 软件）。从 Ruby 1.9 起，Ruby 默认自带 RubyGems，而之前的版本 Ruby 版本需要先[手动安装][2]。

还有些其他的代码库以将 **源代码** 压缩成归档文件如 .zip 或 .tar.gz 的形式发布。安装方式多有不同，通常附带有
 `README` 或 `INSTALL` 文档来指导安装。

 让我们看下如何查找安装你所需的代码库。

### 查找代码库

[**RubyGems.org**][1] 站点是代码库的主要集散地，它提供 Gem 形式的代码库。你可以直接访问其网站或者使用 `gem` 命令。

使用 `gem search -r`，能查看 RubyGems 的 Repository 。比如要找 Rails，输入 `gem search -r rails` 会返回与 Rails 相关的 Gem。使用 `--local` (`-l`) 选项就会在本地你已安装的 Gem 中搜索与 Rails 相关的 Gem。使用 `gem install [gem]` 来安装 Gem。可通过 `gem list` 来浏览已安装的 Gem。更多关于 `gem` 命令的说明，请继续阅读，或前往 [RubyGems 的文件][3]。

除了 RubyGems.org 之外，也有其它的站点可供查找代码库。[RubyForge][4] 曾是 Ruby 代码库之家，但近年来 [**GitHub**][5] 作为主要的 Ruby 相关资源的 Repository 而崛起。现在，通常 Gem 的源代码会被放在 GitHub，而 Gem 会被发布到 RubyGems.org。

[**The Ruby Toolbox**][6] 是一个旨在使搜索开源 Ruby 项目更容易的项目。它按照各种常见的开发任务做了分类，并收集了许多与项目相关的信息，诸如版本发布历史、提交活跃度、代码库相依关系、根据它们在 GitHub 和 RubyGems.org 上的流行程度做评估，让你更易找到所需的代码库。

### 更多关于 RubyGems 的说明

这里是对 `gem` 命令的快速回顾。关于 `gem` 命令更详细的说明，请查阅[更详细的文件][7]。

#### 搜索可用的 Gem

`search` 命令可根据输入的关键字来查找 Gem。比如输入 `html` 会返回与 `html` 相关的 Gem：

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

`--remote` 或 `-r` 标识表示我们想要查看 RubyGems.org 的官方仓库（默认设置）。使用 `--local` 或 `-l` 标识表示你想要搜索本地你已安装的 Gem 包。

#### 安装 Gem

一旦你知道你所需要安装的 Gem 包，比如说颇受欢迎的 Rails:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

你甚至可以通过 `--version` 或 `-v` 标识来安装特定版本的代码库:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### 列出所有的 Gem

列出本地安装的所有 Gem：

{% highlight sh %}
$ gem list
{% endhighlight %}

列出 RubyGems.org 上所有可用的 Gem：

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### 帮助！

可在终端中直接查看文档:

{% highlight sh %}
$ gem help
{% endhighlight %}

`gem help commands` 可查看特定子命令的说明，如 `gem help install`。

#### 打造自己的 Gem

RubyGems.org 上有[系列教程][3]，你可能也想研究 [Bundler][9]，一个用于管理应用依赖关系的通用工具，它可以跟 RubyGems 搭配使用。



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
