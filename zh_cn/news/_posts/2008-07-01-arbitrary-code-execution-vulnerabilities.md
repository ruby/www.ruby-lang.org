---
layout: news_post
title: "可导致执行任意代码的安全漏洞 - Ruby 官方网站"
author: "Unknown Author"
lang: zh_cn
---

Ruby的多个漏洞可能导致拒绝服务(DoS)的情况，或者允许执行任意代码。

## 影响

通过以下漏洞，攻击者可以可能导致拒绝服务(DoS)的情况，或者允许执行任意代码。

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## 受影响的版本

1.8 系列
: * 1\.8.4 和所有之前的版本
  * 1\.8.5-p230 和所有之前的版本
  * 1\.8.6-p229 和所有之前的版本
  * 1\.8.7-p21 和所有之前的版本

1.9 系列
: * 1\.9.0-1 和所有之前的版本

## 解决办法

1.8 系列
: 请更新到 1.8.5-p231, 或者 1.8.6-p230, 或者 1.8.7-p22.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

1.9 系列
: 请更新到 1.9.0-2.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

这些版本同时也修正了WEBrick的安全漏洞 ([CVE-2008-1891][10]).

请注意一个修正这个漏洞的软件包可能已经可以通过你的软件包管理软件更新了。

## 贡献者

感谢 Apple Product Security 的 Drew Yao 为 Ruby Security Team 指出这个问题。

## 修订记录

* 2008-06-21 00:29 +09:00 removed wrong CVE IDs (CVE-2008-2727,
  CVE-2008-2728).



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2662
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2663
[3]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2725
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2726
[5]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2664
[6]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz
[10]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1891
