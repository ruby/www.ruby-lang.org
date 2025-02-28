---
layout: news_post
title: "安全建议: CVE-2025-27219，CVE-2025-27220 和 CVE-2025-27221"
author: "hsbt"
translator: "GAO Jun"
date: 2025-02-26 07:00:00 +0000
tags: security
lang: zh_cn
---

针对 CVE-2025-27219，CVE-2025-27220 和 CVE-2025-27221，我们发布下列安全建议。

## CVE-2025-27219: `CGI::Cookie.parse` 中的拒绝服务（Denial of Service，DoS）。

`cgi` gem 中存在 DoS 可能。此漏洞的 CVE 编号为 [CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219)。我们建议您更新 `cgi` gem。

### 详情

在某些情况下，`CGI::Cookie.parse` 解析 cookie 字符串的时间超过线性增长。向该方法传入恶意构造的 cookie 字符串可能会导致拒绝服务（DoS）。

请更新 `cgi` gem 至 0.3.5.1，0.3.7，0.4.2 或更新版本。

### 受影响版本

* `cgi` gem 版本 <= 0.3.5，0.3.6，0.4.0 和 0.4.1。

### 致谢

感谢 [lio346](https://hackerone.com/lio346) 发现此漏洞。同样感谢 [mame](https://github.com/mame) 修补此漏洞。

## CVE-2025-27220: `CGI::Util#escapeElement` 中的正则表达式拒绝服务（Regular Expression Denail of Service, ReDoS）漏洞。

`cgi` gem 中存在 ReDoS 可能。此漏洞的 CVE 编号为 [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220)。我们建议您更新 `cgi` gem。

### 详情

`CGI::Util#escapeElement` 中使用的正则表达式可能受到 ReDoS 攻击。特定的输入可能会导致 CPU 高负载。

此漏洞仅影响 Ruby 3.1 和 3.2。如果您正在使用这些版本，请更新 `cgi` gem 至 0.3.5.1，0.3.7，0.4.2 或更新版本。

### 受影响版本

* `cgi` gem 版本 <= 0.3.5，0.3.6，0.4.0 和 0.4.1。

### 致谢

感谢 [svalkanov](https://hackerone.com/svalkanov) 发现此漏洞。同样感谢 [nobu](https://github.com/nobu) 修补此漏洞。


## CVE-2025-27221: `URI#join`， `URI#merge` 和 `URI#+` 中的用户信息泄漏。

`uri` gem 可能会泄漏用户信息。此漏洞的 CVE 编号为 [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221)。我们建议您更新 `uri` gem。

### 详情

`URI#join`，`URI#merge` 和 `URI#+` 方法会保留用户信息，如 `user:password`。即使替换了主机也会保留。
当基于用户隐私信息，使用了这些方法生成了一个指向恶意主机的 URL 后，如果有人访问了该 URL，可能会发生用户信息泄漏。

请更新 `uri` gem 至 0.11.3，0.12.4，0.13.2，1.0.3 或更新版本。

### 受影响版本

* `uri` gem 版本 < 0.11.3，0.12.0 至 0.12.3，0.13.0，0.13.1，1.0.0 至 1.0.2。

### 致谢

感谢 [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa) 发现此漏洞。同样感谢 [nobu](https://github.com/nobu) 修补此漏洞。

## 历史

* 最初发布于 2025-02-26 7:00:00 (UTC)
