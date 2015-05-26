---
layout: page
title: "下载 Ruby - Ruby 官方网站"
lang: zh_cn
---

您可以在这里下载适合最新的 Ruby 发行版。目前最新的稳定版本是
{{ site.downloads.stable.version }}。另外，请先阅读 [Ruby 版权说明][license]。
{: .summary}

### 安装 Ruby 的方法

每个流行的平台都有多种工具可安装 Ruby：

* Linux/UNIX 平台，可以使用第三方工具（如 rbenv 或 RVM）或使用系统包管理工具。
* OS X 平台，可以使用第三方工具（如 rbenv 或 RVM）。
* Windows 平台，可以使用 RubyInstaller。

进一步了解请了解[安装][installation]页面上关于使用包管理工具与第三方工具的内容。

当然各个平台也可以从源代码来安装 Ruby。

### 从源代码编译 Ruby

如果您非常熟悉您的操作系统，或是您的环境需要特別设定，那么直接使用源代码来安装是个极佳的方式。如果您的平台没有编译好的包的话，则需要通过源代码来安装。

进一步关于从源代码编译 Ruby 的内容，请参考[安装][installation]页面。若编译 Ruby 时遇到任何问题，请参考安装页面罗列的第三方工具，可能会有帮助。

* **当前稳定版：**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **上一个稳定版：**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **旧稳定版（2.0.0 系列）：**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **快照：**
  * [Stable Snapshot][stable-snapshot-gz]:
    当前稳定版 tarball 的最新快照
  * [Nightly Snapshot][nightly-gz]:
    这是 SVN 上的 tarball，每晚更新。
    可能有问题或 bug，谨慎使用！

关于 Ruby Subversion 与 Git Repositories 的信息，参见 [Ruby Core](/en/community/ruby-core/) 页面。

Ruby 源代码可从世界各地的[镜像站][mirrors]获得。请尝试离您最近的镜像站。



[license]: {{ site.license.url }}
[installation]: /zh_tw/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
