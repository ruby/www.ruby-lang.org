---
layout: news_post
title: "更改 ext/openssl 默认设置"
author: "usa"
translator: "Ryan Jiang"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: zh_cn
---

我们在 Ruby 2.1.4、Ruby 2.0.0-p594 和 Ruby 1.9.3-p550 中更改了 ext/openssl 的默认设置，
根据这些设置，非安全的 SSL/TLS 选项默认情况下将被禁用。
尽管更改了这些默认设置，但 SSL 链接仍然有可能存在某些问题。

## 详情

根据过往经验，OpenSSL 至今仍在使用的协议及密文方式被认为是不安全的。
比如 POODLE 漏洞（[CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)），如果你继续使用 OpenSSL 的这些不安全的特性，那么将可能无法保证你网络交互的安全性。
据此，根据 [Bug #9424](https://bugs.ruby-lang.org/issues/9424) 的讨论， 我们决定默认禁用这些存在安全隐患的 SSL/TLS 选项。
如果你仍需保留这些特性（如下），请安装以下回退补丁。

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

注意，回退这些更改将无法保证你的网络安全。
在你回退之前你应该了解此举可能带来的影响。

### 涉及到的 Ruby 包

这些更改体现在 net/http、net/imap 和 net/pop 模块中。
由于 DRb 和 WEBrick 独立于这些设置，因此这些更改将不会影响到他们。

### 直接使用到 ext/openssl 的代码

本次更新在通过实例化 `OpenSSL::SSL::SSLContext` 并且调用其实例方法 `set_params` 后亦将生效。

具体如以下代码：

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # if you want to change some options, such as cert store, verify mode and so on, you can pass such parameters within a hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

如何在客户端使用 ext/openssl，我们认为此次变更不会带来任何影响。
但是如果你在服务端使用 ext/openssl，并且安装此次更改，那么一些陈旧的客户端（Windows XP 上的 Internet Explorer 6 浏览器或者老的手机浏览器）可能将无法连接到服务器。

你需要权衡利弊，然后决定是否安装本次更新，

## 解决方案

如果你无法升级 Ruby 但是你想禁用这些存在安全隐患的 SSL/TLS 选项，请直接应用以下猴子补丁。

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## 受影响的版本

* Ruby 1.9.3 patchlevel 550 和之后的版本
* Ruby 2.0.0 patchlevel 594 和之后的版本
* Ruby 2.1.4 以后的版本
* 主干 revision 48097 之后的版本

## 历史记录

* 首次发布于 2014-10-27 12:00:00 (UTC)
