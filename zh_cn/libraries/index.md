---
layout: page
title: "资源库 - Ruby 官方网站"
lang: zh_cn
---

在别的地方还有不计其数的有趣并且有用的 Ruby 资源库，在它们中很多是以便捷的 *gem*
文件格式发布的，其它的则是通过将源代码目录打包成归档文件（例如 .zip 或
.tar.gz）进行发布。现在让我们一起瞧一瞧怎么寻找并安装资源库，来让它们为你所用。

### 寻找资源库
{: #finding-libraries}

[**RubyForge**][1] 是一个收集广泛的 Ruby 资源库站点，这个站点最值得看看的是它的[软件地图][2]
，这是一个按主题分类的资源库列表。（如果你创建完了你自己的资源库，你可以在 RubyForge [注册][3]
一个项目,这样你就得到了一个免费的子版本的访问权限、web 空间以及邮件列表。）

[**Ruby 应用程序档案(Ruby Application Archive)**][4] (通常简称为 RAA)是一个包含各种各样的
Ruby 软件的索引簿,并且它是按功能来进行分类的。现在，[数据库][5] 类别包含最多的条目，紧随其后的是 [Net][6] 。
[HTML][7] 以及 [XML][8] 也是非常流行的类别。在那里甚至还有四个[物理学][9] 分类的条目.

### 使用 RubyGems
{: #using-rubygems}

虽然 Windows 版的安装程序包含了
RubyGems，但还是有很多操作系统的没有这样做。如果这些命令在你那里没有什么效果，那么请参考一下本页最下边的[安装RubyGems](#installing-rubygems)
。

#### 搜索 gem

**搜索**命令可以通过确定的名字来搜索 gem。要搜索一个名字里包含了 html 关键词的 gem：

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
   A sample Ruby gem, just to illustrate how RubyGems works.
{% endhighlight %}

(*参数标志`--remote` 表明我们将要搜索的是 Rubyforge 的官方 gem。*)

#### 安装一个 gem

当你知道你想**安装**哪个 gem 的时候:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

你还可以使用 `--version` 参数标志来指定版本的安装资源库。

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### 列出所有的 gem

为了得到一个 Rubyforge 的所有 gem 的完整**列表**\:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

要想只列出你已经安装的 gem，去掉后边那个标志参数。

{% highlight sh %}
$ gem list
{% endhighlight %}

想要得到更多的关于使用 RubyGems 的信息，请参阅[**官方手册**][10] ，那里包含了一些在 Ruby 脚本中使用 gem 的例子。

### 安装 RubyGems
{: #installing-rubygems}

要安装 RubyGems，首先从[下载页][11] 里下载 RubyGems 0.9.0。解开归档文件，然后运行
`setup.rb`。在某些操作系统上你需要作为root用户去这些事。

例如，在 linux 上:

{% highlight sh %}
$ tar xzvf rubygems-0.9.0.tar.gz
$ cd rubygems-0.9.0
$ su -
# ruby setup.rb
{% endhighlight %}

如果你需要更进一步的关于如何安装 Ruby 的指导，请翻阅 RubyGems 手册里的[**安装章节(installation
chapter)**][12] 。



[1]: http://rubyforge.org/
[2]: http://rubyforge.org/softwaremap/trove_list.php "software map"
[3]: http://rubyforge.org/register/
[4]: http://raa.ruby-lang.org/
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics
[10]: http://rubygems.org/read/chapter/1
[11]: http://rubyforge.org/frs/?group_id=126
[12]: http://rubygems.org/read/chapter/3
