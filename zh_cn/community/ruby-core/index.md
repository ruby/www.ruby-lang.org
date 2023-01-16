---
layout: page
title: "Ruby 核心"
lang: zh_cn
---

当下是进行 Ruby 开发的绝佳时机。随着过去几年 Ruby 的倍受关注，对帮助扩展 Ruby 功能和相关文档的优秀开发者需求巨大。那么，应该从何入手呢？
{: .summary}

这里所讨论的都是 Ruby 开发相关的话题:

* [使用 Subversion 跟踪 Ruby 开发](#following-ruby)
* [如何对主 Ruby 仓库使用 Git](#git-ruby)
* [改进 Ruby, Patch by Patch](#patching-ruby)
* [核心开发者规则](#coding-standards)

### 使用 Subversion 跟踪 Ruby 开发
{: #following-ruby}

从 [Subversion][1] 仓库匿名检出是获取最新 Ruby 源码的关键。在命令行:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

`ruby` 目录包含了最近的 Ruby 开发版本（ruby-trunk）的源码。目前，应用于 trunk 的补丁被向后移植到稳定版 {{ site.svn.stable.version }}，{{ site.svn.previous.version }} 和 {{ site.svn.old.version }} 分支（如下所示）。

如果你想要 Ruby {{ site.svn.stable.version }} 的补丁，检出的时候应当使用 `{{ site.svn.stable.branch }}`

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.stable.branch }}
{% endhighlight %}

类似地，对于 Ruby {{ site.svn.previous.version }}:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}
{% endhighlight %}

它会检出各自的开发树到 `{{ site.svn.stable.branch }}` 或 `{{ site.svn.previous.branch }}` 目录。
工作在维护分支的开发者期望将他们的更改迁移到 Ruby 的主分支上，所以这些分支常常都很相似，除了由 Matz 和 Nobu 对语言本身的改进。

如果你愿意，可以浏览 [通过网页访问 Ruby 的 Subversion 仓库][2]。

关于 Subversion 的信息，请查看 [Subversion FAQ][3] 和 [Subversion book][4]。另外，你会发现
[Subversion版本控制之道][5] 是非常有用的入门书籍。

### 如何对主 Ruby 仓库使用 Git
{: #git-ruby}

对于更愿意使用 [Git][6] 而不是 Subversion 的人来说，可以从 [mirror on GitHub][7]、
[those with commit access][8] 和 [everybody else][9] 找到使用说明。

### 改进 Ruby，Patch by Patch
{: #patching-ruby}

核心团队维护着 [问题跟踪器][10]，它用于提交补丁和报告缺陷到 Matz 和他的团队，这些报告还会提交给 [Ruby 核心邮件列表][mailing-lists] 用于讨论，所以你要确定你的请求不会被忽视，你也可以直接发送补丁到邮件列表。总之，我们鼓励你参与接下来的讨论。

请查看 Matz 撰写的 [补丁作家指南][11] 中的一些技巧，他会教你如何让你的补丁被考虑。

简要来说，创建补丁的步骤如下：

1.  从 Subversion 检出 Ruby 源码。通常情况下，针对缺陷修复的补丁或新特性应当被提交到 Ruby 源码的主干上。即使你希望添加一个特性到 Ruby {{ site.svn.previous.version }}，它也必须先被主干所接受。

        $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

    如果修复的缺陷是针对特定的某一个维护分支，请检出相应分支的代码，例如`{{ site.svn.previous.branch }}`。

        $ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}

2.  添加你的改进代码。

3.  创建补丁。

        $ svn diff > ruby-changes.patch

4.  在 [问题跟踪器][10] 创建一个 ticket，或者用描述该补丁的更新日志条目将补丁发送到 [Ruby 核心邮件列表][mailing-lists]。

5.  如果补丁没有问题，提交者们将会被批准使用。

**请注意：** 补丁应该被作为一个 [unified diff][12] 被提交。对于补丁如何被合并的更多信息，请查看 [the diffutils reference][13]。

Ruby 开发的讨论集中在 [Ruby 核心邮件列表][mailing-lists]。如果你好奇你的补丁是否有价值，或者你想讨论 Ruby 的未来，请毫无犹豫的加入吧。脱离主题的讨论是不会被容忍的，良好的主题应该是主旨明确，构思严谨且精心编写的。既然我们追随 Ruby 的创始者，请怀有敬畏之心。

请记住，Ruby 的核心开发者都生活在日本，虽然其中许多人的英语很好，但时差明显。他们也有对应英文版的日语开发目录。耐心一点，如果你的请求没有被解决，请坚持在几天之后再提一次。

### 核心开发者规则
{: #coding-standards}

通常，Ruby 开发者应该熟悉 Ruby 源码和 Ruby 团队的开发风格。为了更加清楚起见，向 Subversion 检入代码的时候，应该尊重以下几点准则：

* 遵循 [GNU 约定][14]，所有的检入应该描述在 `ChangeLog` 中。（许多 Ruby 核心
开发者使用 Emacs 的 `add-log` 模式，该模式可以通过命令 `C-x 4 a` 实现。）
* 检入的日期应该是日本标准时间（UTC+9）。
* 变更日志中的项目符号点也应该被放到 Subversion 的提交信息当中。在你提交之后，提交信息会通过邮件自动的发送到 Ruby-CVS 列表。
* 函数原型在整个 Ruby 源码和扩展库中都会被用到。
* 请不要使用 C++ 风格的注释（`//`），Ruby 的维护者更倾向于使用标准 C 的多重注释（`/* .. */`）。

也可以在 [Ruby问题跟踪器][10] 中查看相关信息。



[mailing-lists]: /en/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: https://github.com/ruby/ruby
[8]: https://github.com/shyouhei/ruby/wiki/committerhowto
[9]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: https://blade.ruby-lang.org/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
