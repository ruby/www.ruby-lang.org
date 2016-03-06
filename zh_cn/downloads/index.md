---
layout: page
title: "下载 Ruby"
lang: zh_cn
---

您可以在这里下载最新的 Ruby 发行版。目前最新的稳定版本是
{{ site.downloads.stable[0].version }}。另外，请先阅读 [Ruby 版权说明][license]。
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

* **稳定版:**{% for release in site.downloads.stable %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.downloads.security_maintenance %}
* **在做安全性维护的版本（很快 EOL！）:**{% for release in site.downloads.security_maintenance %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.downloads.eol %}
* **不再维护的版本（EOL）:**{% for release in site.downloads.eol %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **快照：**
  * [稳定版快照]({{ site.downloads.stable_snapshot.url.gz }})：当前稳定版 tarball 的最新快照
  * [每日构建版快照]({{ site.downloads.nightly_snapshot.url.gz }})：这是 SVN 上的 tarball，每晚构建。可能有问题或 bug，谨慎使用！

关于 Ruby Subversion 和 Git 仓库的信息，参见 [Ruby Core](/zh_cn/community/ruby-core/) 页面。

Ruby 源代码可从世界各地的[镜像站][mirrors]获得。请尝试离您最近的镜像站。



[license]: {{ site.license.url }}
[installation]: /zh_cn/documentation/installation/
[mirrors]: /en/downloads/mirrors/
