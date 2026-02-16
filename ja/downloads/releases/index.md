---
layout: page
title: "Ruby のリリース一覧"
lang: ja
---

このページではこれまでにリリースされた Ruby を列挙しています。
{: .summary}

現在メンテナンスされている Ruby のバージョンについての情報は[Ruby ブランチごとのメンテナンス状況](../branches/)を参照してください。

### バージョンごとの Ruby のリリース一覧

これはRubyのリリース一覧です。
表示されている日付は英語バージョンのリリースアナウンスの日付に対応しています。
英語のリリースアナウンスは tar ファイルの作成日とは異なる場合があります。

<table class="release-list">
<tr>
<th>リリースバージョン</th>
<th>リリース日</th>
<th>ダウンロード URL</th>
<th>リリースノート</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">download</a></td>
<td><a href="{{ release.post | localize_post_url: page.lang }}">more...</a></td>
</tr>{% endfor %}
</table>
