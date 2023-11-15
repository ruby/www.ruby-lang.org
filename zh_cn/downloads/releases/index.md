---
layout: page
title: "Ruby 版本"
lang: zh_cn
---

本页面列出了各个 Ruby 发布版本。
{: .summary}

如需了解 Ruby 各版本的当前维护状态，可以参见
[分支页面](../branches/).

### Ruby 版本列表

下表列出了各 Ruby 发布版本。
其中显示的日期基于对应新闻的发布日期，可能与源代码包的实际创建时间有所差别。

<table class="release-list">
<tr>
<th>发布版本</th>
<th>发布日期</th>
<th>下载地址</th>
<th>发布文档</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">下载</a></td>
<td><a href="{{ release.post }}">查看…</a></td>
</tr>{% endfor %}
</table>
