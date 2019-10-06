---
layout: page
title: "メーリングリスト"
lang: ja
---

以下のようなメーリングリストで情報交換や議論が行われています。

参加希望の方は、[lists.ruby-lang.org](http://lists.ruby-lang.org)
より登録を行ってください。

また、メールでも登録・解除ができます。

『(ML名)-request@ruby-lang.org』(例えばruby-list
MLに参加する場合はruby-list-request@ruby-lang.org)宛に、*本文に*

    subscribe
{: .code}

と書いて送って下さい。
Subject(件名)は、空のままでかまいません。
しばらく待つと、確認のためのメールが届きますので、そのメールに書かれた指示に従うとメーリングリストへの参加登録が完了します。

購読をやめたい場合は、先ほどと同じく(ML名)-request@ruby-lang.org宛に、本文に

    unsubscribe
{: .code}

と書いて送ってください。その他のコマンドの使い方を知りたい場合も、同様に、(ML名)-request@ruby-lang.org宛に、本文に

    help
{: .code}

と書いて送ってください。

## ruby-list(日本語)

Rubyを使ってプログラムを書く人たちが情報交換を行うためのメーリングリストです。
Rubyを使う上での疑問点についての相談や、Rubyを利用したアプリケーションやライブラリなどのリリース情報の紹介、Rubyに関連するイベントの紹介などが行われています。

[ruby-listアーカイブ][1]

## ruby-dev(日本語)

Rubyの開発者向け公式メーリングリストです。
こちらではRuby自体のバグの報告とそれに対する対応や、将来の仕様拡張や実装上の問題などについての議論が行われています。

新規の機能要望やバグ報告は、担当者等を管理するために[問題追跡システム][2]へ投稿すると良いでしょう。同じ内容はruby-devにも投稿されます。

また、セキュリティ関連のバグや脆弱性については後述する非公開メーリングリストへ報告してください。

[ruby-devアーカイブ][3]

## ruby-ext(日本語)

Ruby拡張モジュールの実装について話し合われています。

[ruby-extアーカイブ][4]

## ruby-math(日本語)

数学関連の話題について話し合われています。

[ruby-mathアーカイブ][5]

## ruby-talk(英語)

英語で一般的な話題を取り扱っています。 上記ruby-listの英語版という位置づけになります。

[ruby-talkアーカイブ][6]

## ruby-core(英語)

英語でRubyの実装について話し合っています。 上記ruby-devの英語版という位置づけになります。

[ruby-coreアーカイブ][7]

## ruby-cvs(英語)

RubyのGitリポジトリへのcommit logが流れます。 このメーリングリストに対して投稿を行うことはできません。

[ruby-cvsアーカイブ][8]

## 非公開メーリングリスト

### security@ruby-lang.org

コア開発者がセキュリティホールへの対策を話し合うための非公開メーリングリストです。非メンバーは投稿のみできます。

Rubyにセキュリティーホールを発見なさった場合はこちらまでお知らせください。詳しくは[セキュリティ][9]のページをご覧ください。

Posted by Shugo Maeda on 27 May 2006
{: .post-info}



[1]: http://blade.nagaokaut.ac.jp/ruby/ruby-list/index.shtml
[2]: https://bugs.ruby-lang.org/
[3]: http://blade.nagaokaut.ac.jp/ruby/ruby-dev/index.shtml
[4]: http://blade.nagaokaut.ac.jp/ruby/ruby-ext/index.shtml
[5]: http://blade.nagaokaut.ac.jp/ruby/ruby-math/index.shtml
[6]: http://blade.nagaokaut.ac.jp/ruby/ruby-talk/index.shtml
[7]: http://blade.nagaokaut.ac.jp/ruby/ruby-core/index.shtml
[8]: http://www.atdot.net/~ko1/w3ml/w3ml.cgi/ruby-cvs/
[9]: /ja/security/
