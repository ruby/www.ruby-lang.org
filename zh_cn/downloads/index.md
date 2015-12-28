---
layout: page
title: "下载 Ruby"
lang: zh_cn
---

您可以在这里下载最新的 Ruby 发行版。目前最新的稳定版本是
{{ site.downloads.stable.version }}。另外，请先阅读 [Ruby 版权说明][license]。
{: .summary}

### 安装 Ruby 的方法

每个流行的平台都有多种工具可用于安装 Ruby：

* Linux/UNIX 平台，可以使用第三方工具（如 rbenv 或 RVM）或使用系统中的包管理系统。
* OS X 平台，可以使用第三方工具（如 rbenv 或 RVM）。
* Windows 平台，可以使用 RubyInstaller。

使用包管理系统或第三方工具的详细说明，参见[安装页面][installation]。

当然，每个平台都可以从源代码编译安装 Ruby。

### 从源代码编译 Ruby

如果您非常熟悉您的操作系统，或是您的环境需要特別设定，那么直接使用源码安装是个极佳的方式。如果您的平台没有编译好的包，则需要通过源代码来安装。

从源代码编译 Ruby 的详细说明，参见[安装页面][installation]。若编译 Ruby 时遇到问题，请参考安装页面罗列的第三方工具，可能会有帮助。

* **当前稳定版：**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **前一个稳定版：**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **旧的稳定版：**
  [Ruby {{ site.downloads.old.version }}][old-gz]<br>
  sha256: {{ site.downloads.old.sha256.gz }}

* **快照：**
  * [稳定版快照][stable-snapshot-gz]：当前稳定版 tarball 的最新快照
  * [每日构建版快照][nightly-gz]：这是 SVN 上的 tarball，每晚构建。可能有问题或 bug，谨慎使用！

关于 Ruby Subversion 和 Git 仓库的信息，参见 [Ruby Core](/zh_cn/community/ruby-core/) 页面。

Ruby 源代码可从世界各地的[镜像站][mirrors]获得。请尝试离您最近的镜像站。



[license]: {{ site.license.url }}
[installation]: /zh_cn/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[old-gz]: {{ site.downloads.old.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
