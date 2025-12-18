---
layout: page
title: "Ruby ブランチごとのメンテナンス状況"
lang: ja
---

このページでは Ruby の各ブランチについてメンテナンス状況を記載します。
{: .summary}

より詳細な情報については[リリースページ][releases]を見てください。

以下は Ruby のブランチとそのメンテナンス状況の暫定リストです。
EOL の日付等は予定として掲載しています。

Ruby の各ブランチは以下のフェーズに別れてメンテナンスされています:

* **ノーマルメンテナンス** (不具合修正):
  これらのブランチのバージョンは機能修正と脆弱性の修正が行われます。
* **セキュリティメンテナンス** (脆弱性の修正):
  これらのブランチは脆弱性の修正のみ行われます。
* **EOL** (end-of-life):
  これらのブランチは Ruby 開発チームによる修正は種類を問わず行われません。

{% include branches_timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

ステータス: {{ branch.status }}<br>
リリース: {{ branch.date }}<br>
ノーマルメンテナンス終了: {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}TBD{% endif %}<br>
EOL: {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }}（見込み）{% else %}TBD{% endif %}{% endif %}

{% endfor %}

[releases]: /ja/downloads/releases/
