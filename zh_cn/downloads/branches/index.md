---
layout: page
title: "Ruby 维护分支"
lang: zh_cn
---

本页面列出了当前各个 Ruby 分支的维护情况。
{: .summary}

对于特定版本的详细信息，可以参考
[版本页面](../releases/).

这是 Ruby 分支及其维护状态的初步列表。
显示的日期基于 版本发布 或 EOL声明 新闻的发布时间。

Ruby 分支或版本 分为以下集中状态：

* **正常维护** (错误修复)：
  能得到一般错误修复和安全修复。
* **安全维护** (security fix):
  只有安全修复会向后移植。
* **eol** (生命周期终止):
  Ruby 核心团队不再进行支持，不会得到任何修复。也不会发布新的补丁版本。

{% include branches-timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

状态: {{ branch.status }}<br>
发布日期: {{ branch.date }}<br>
正常维护期至: {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}未定{% endif %}<br>
生命周期终止: {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }} (预计){% else %}未定{% endif %}{% endif %}

{% endfor %}
