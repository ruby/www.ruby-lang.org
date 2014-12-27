---
layout: page
title: "代码库 - Ruby 官方网站"
lang: zh_cn
---

{% include out-of-date.html %}

在别的地方还有不计其数的有趣并且有用的 Ruby 代码库，在它们中很多是以便捷的 *gem*
文件格式发布的，其它的则是通过将源代码目录打包成归档文件（例如 .zip 或
.tar.gz）进行发布。现在让我们一起瞧一瞧怎么寻找并安装代码库，来让它们为你所用。

### 寻找代码库

主要的三方库都是以 Gem 的形式存放在 [RubyGems.org](http://rubygems.org)，你可以直接打开网页或者用 `gem` 命令。


#### 搜索 Gem

**搜索**命令可以通过确定的名字来搜索 gem。要搜索一个名字里包含了 html 关键词的 gem：

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

(*参数标志`--remote` / `-r` 表明我们将要搜索的是 RubyGems.org 的官方 Gem。*)

#### 安装一个 Gem

当你知道你想**安装**哪个 Gem 的时候:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

你还可以使用 `--version` 参数标志来指定版本的安装代码库。

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### 列出所有的 Gem

为了得到一个 RubGems 的所有 Gem 的完整**列表**\:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

要想只列出你已经安装的 gem，去掉后边那个标志参数。

{% highlight sh %}
$ gem list
{% endhighlight %}

想要得到更多的关于使用 RubyGems 的信息，请参阅[**官方手册**][10] ，那里包含了一些在 Ruby 脚本中使用 Gem 的例子。

[10]: http://rubygems.org/read/chapter/1
