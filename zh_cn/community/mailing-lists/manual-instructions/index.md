---
layout: page
title: "手工订阅邮件列表方法"
lang: zh_cn
---

注意: 如果无法订阅，请参考
[https://ml.ruby-lang.org/mailman3/postorius/lists/](https://ml.ruby-lang.org/mailman3/postorius/lists/).

订阅邮件列表，请发送一个带有以下邮件主体（不是标题）的纯文本邮件到自动的 “控制器” 地址。

    subscribe
{: .code}

Ruby-Talk
: For the Ruby-Talk list, the controller address is
  [ruby-talk-request@ruby-lang.org](mailto:ruby-talk-request@ruby-lang.org), the
  posting address is
  [ruby-talk@ruby-lang.org](mailto:ruby-talk@ruby-lang.org), and the
  human administrator address is
  [ruby-talk-owner@ruby-lang.org](mailto:ruby-talk-owner@ruby-lang.org).

Ruby-Core
: For the Ruby-Core list, the controller address is
  [ruby-core-request@ruby-lang.org](mailto:ruby-core-request@ruby-lang.org), the
  posting address is
  [ruby-core@ruby-lang.org](mailto:ruby-core@ruby-lang.org), and the
  “human” administrator address is
  [ruby-core-owner@ruby-lang.org](mailto:ruby-core-owner@ruby-lang.org).

Ruby-Doc
: For the Ruby-Doc list, the controller address is
  [ruby-doc-request@ruby-lang.org](mailto:ruby-doc-request@ruby-lang.org), the
  posting address is
  [ruby-doc@ruby-lang.org](mailto:ruby-doc@ruby-lang.org), and the
  “human” administrator address is
  [ruby-doc-owner@ruby-lang.org](mailto:ruby-doc-owner@ruby-lang.org).

Ruby-CVS
: For the Ruby-CVS list, the controller address is
  [ruby-cvs-request@ruby-lang.org](mailto:ruby-cvs-request@ruby-lang.org), the
  posting address is
  [ruby-cvs@ruby-lang.org](mailto:ruby-cvs@ruby-lang.org), and the
  “human” administrator address is
  [ruby-cvs-owner@ruby-lang.org](mailto:ruby-cvs-owner@ruby-lang.org).

### 取消订阅

从列表中退订，请发送一个主体是 “unsubscribe” 的邮件到 **控制器地址**:

    unsubscribe
{: .code}

确保发送的是纯文本邮件，HTML 邮件可能不起作用。

### 获取帮助

查看命令列表，发送主体是 “help” 的邮件到控制器地址。
