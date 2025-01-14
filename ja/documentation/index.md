---
layout: page
title: "ドキュメント"
lang: ja
---

ここでは、マニュアルやチュートリアル、リファレンスといった、
Rubyでプログラミングする際に役立つドキュメントを紹介します。
{: .summary}

### マニュアル

各環境にRubyをインストールする方法は、 [ダウンロード][downloads] 及び [インストールガイド][installation] で解説しています。

また、現在有志の手により[リファレンスマニュアルの整備][rurema-wiki]が進行中です。
成果物を[&lt;URL:https://docs.ruby-lang.org/ja/&gt;][doc-r-l-o]から閲覧できます。

* [Rubyリファレンスマニュアル Ruby 3.4版][man-34]
* [Rubyリファレンスマニュアル Ruby 3.3版][man-33]
* [Rubyリファレンスマニュアル Ruby 3.2版][man-32]
* [Rubyリファレンスマニュアル Ruby 3.1版][man-31]
* [Rubyリファレンスマニュアル Ruby 3.0版][man-30]
* [Rubyリファレンスマニュアル Ruby 2.7.0版][man-270]
* [るりまサーチ][man-search]（全文検索）

### 入門

[20分ではじめるRuby](/ja/documentation/quickstart/)
: Rubyの基本をカバーしている便利なチュートリアルです。始めから終わりまで読んでも20分かからないでしょう。

[他言語からのRuby入門](/ja/documentation/ruby-from-other-languages/)
: 他の言語からRubyにやってきましたか？C、C++、Java、Perl、PHP、Pythonといった言語から来たのであれば、この記事が役に立つはずです！

### リファレンス

[Ruby コアリファレンス (英語)](http://www.ruby-doc.org/core/)
: [RDoc](https://ruby.github.io/rdoc/)を用いてRubyのソースコードから直接生成したものです。
  String, ArrayやSymbol等のコアクラスやモジュールのリファレンスがあります。

[Ruby 標準ライブラリリファレンス (英語)](http://www.ruby-doc.org/stdlib/)
: こちらもRDocを使用してRubyのソースコードから生成しています。
  こちらはRubyの標準ライブラリのリファレンスになります。

[RubyDoc.info (英語)](http://www.rubydoc.info/)
: Ruby gemsやGitHubでホスティングされてるRubyプロジェクトのリファレンスが見れる
  完結型のリファレンスサイト。

[RubyAPI.org (英語)][rubyapi-org]
: こちらは Ruby のソースコードから生成したのリファレンス、コアクラスやモジュールのリファレンスがあります。

### 旧版

* [Rubyリファレンスマニュアル Ruby 2.6.0版][man-260]
* [Rubyリファレンスマニュアル Ruby 2.5.0版][man-250]
* [Rubyリファレンスマニュアル Ruby 2.4.0版][man-240]
* [Rubyリファレンスマニュアル Ruby 2.3.0版][man-230]
* [Rubyリファレンスマニュアル Ruby 2.2.0版][man-220]
* [Rubyリファレンスマニュアル Ruby 2.1.0版][man-210]
* [Rubyリファレンスマニュアル Ruby 2.0.0版][man-200]
* [Rubyリファレンスマニュアル Ruby 1.9.3版][man-193]
* [Rubyリファレンスマニュアル Ruby 1.8.7版][man-187]

刷新計画以前の古いRubyリファレンスマニュアルの公開は終了しましたが、
古いバージョンを含め、ダウンロードは可能です。

* [旧リファレンスマニュアル
  20051029版(HTML/tar.gz形式)][old-man-html-gz]\|[(HTML/tar.bz2形式)][old-man-html-bz2]\|[(HTML/zip形式)][old-man-html-zip]\|[(RD/tar.gz形式)][old-man-rd-gz]\|[(RD/tar.bz2形式)][old-man-rd-bz2]\|[(RD/zip形式)][old-man-rd-zip]
* [Ruby 1.6.6 リファレンスマニュアル(日本語版)][man-166-ja]
* [Ruby 1.4.6 リファレンスマニュアル(日本語版)][man-146-ja]
* [Ruby 1.4.6 リファレンスマニュアル(英語版)][man-146-en]

### エディタと統合開発環境

Rubyプログラミングには、OS標準のテキストエディタを使うことができます。
しかし、適切なツールを使用すると、より効率よくプログラミングできるようになります。
シンタクスハイライトやファイルブラウジングのような基本的なRubyプログラミング支援機能を提供するソースコードエディタや、
コード補完やリファクタリング機能、テスト支援といった、より高度な機能を提供する統合開発環境があります。

Rubyistに人気のあるソフトウェアには次のようなものがあります。

* Linux/クロスプラットフォーム
  * [Aptana Studio][19]
  * [Emacs][20]
    * [Ruby mode][21]
    * [Rsense][22]
  * [Geany][23]
  * [gedit][24]
  * [Vim][25]
    * [vim-ruby][26]
    * [Rsense][22]
  * [RubyMine][27]
  * [SciTe][28]
  * [NetBeans][36]
  * [Sublime Text][37]
  * [Atom][atom]
  * [Visual Studio Code][vscode]

* Windows
  * [Notepad++][29]

* macOS
  * [TextMate][32]
  * [BBEdit][33]
  * [Dash][39] (ドキュメント表示ツール)

Posted by Shugo Maeda on 26 May 2006
{: .post-info}



[rurema-wiki]: https://github.com/rurema/doctree/wiki
[doc-r-l-o]: https://docs.ruby-lang.org/ja/
[man-187]: https://docs.ruby-lang.org/ja/1.8.7/doc/index.html
[man-193]: https://docs.ruby-lang.org/ja/1.9.3/doc/index.html
[man-200]: https://docs.ruby-lang.org/ja/2.0.0/doc/index.html
[man-210]: https://docs.ruby-lang.org/ja/2.1.0/doc/index.html
[man-220]: https://docs.ruby-lang.org/ja/2.2.0/doc/index.html
[man-230]: https://docs.ruby-lang.org/ja/2.3.0/doc/index.html
[man-240]: https://docs.ruby-lang.org/ja/2.4.0/doc/index.html
[man-250]: https://docs.ruby-lang.org/ja/2.5.0/doc/index.html
[man-260]: https://docs.ruby-lang.org/ja/2.6.0/doc/index.html
[man-270]: https://docs.ruby-lang.org/ja/2.7.0/doc/index.html
[man-30]: https://docs.ruby-lang.org/ja/3.0/doc/index.html
[man-31]: https://docs.ruby-lang.org/ja/3.1/doc/index.html
[man-32]: https://docs.ruby-lang.org/ja/3.2/doc/index.html
[man-33]: https://docs.ruby-lang.org/ja/3.3/doc/index.html
[man-34]: https://docs.ruby-lang.org/ja/3.4/doc/index.html
[man-search]: https://docs.ruby-lang.org/ja/search/
[man-xz]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-dynamic-20120829.tar.xz
[man-gz]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-dynamic-20120829.tar.gz
[man-zip]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-dynamic-20120829.zip
[man-187-chm]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.8.7-20120829.chm
[man-193-chm]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-20120829.chm
[old-man-html-gz]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-html-20051029.tar.gz
[old-man-html-bz2]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-html-20051029.tar.bz2
[old-man-html-zip]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-html-20051029.zip
[old-man-rd-gz]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-rd-20051029.tar.gz
[old-man-rd-bz2]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-rd-20051029.tar.bz2
[old-man-rd-zip]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-rd-20051029.zip
[man-166-ja]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-ja-1.6.6-20011225-rd.tar.gz
[man-146-ja]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-1.4.6-jp.tar.gz
[man-146-en]: https://cache.ruby-lang.org/pub/ruby/doc/ruby-man-1.4.6.tar.gz

[rubyapi-org]: https://rubyapi.org/
[19]: http://www.aptana.com/
[20]: http://www.gnu.org/software/emacs/
[21]: http://www.emacswiki.org/emacs/RubyMode
[22]: http://rsense.github.io/
[23]: http://www.geany.org/
[24]: http://projects.gnome.org/gedit/screenshots.html
[25]: http://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: http://www.jetbrains.com/ruby/
[28]: http://www.scintilla.org/SciTE.html
[29]: http://notepad-plus-plus.org/
[32]: http://macromates.com/
[33]: https://www.barebones.com/products/bbedit/
[36]: https://netbeans.org/
[37]: http://www.sublimetext.com/
[39]: http://kapeli.com/dash
[atom]: https://atom.io/
[vscode]: https://code.visualstudio.com/
[downloads]: /ja/downloads/
[installation]: /ja/documentation/installation/
