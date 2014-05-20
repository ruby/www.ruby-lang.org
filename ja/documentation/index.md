---
layout: page
title: "ドキュメント"
lang: ja
---

ここでは、マニュアルなどのドキュメントを紹介します。

### マニュアル

各環境にRubyをインストールする方法は、 [ダウンロード](/ja/downloads) 及び [インストールガイド](/ja/installation) で解説しています。

また、現在有志の手により[リファレンスマニュアルの整備][rurema-wiki]が進行中です。
作業途中の成果物を[&lt;URL:http://doc.ruby-lang.org/ja/&gt;][doc-r-l-o]から閲覧できます。

* [Rubyリファレンスマニュアル Ruby 1.8.7版][man-187]
* [Rubyリファレンスマニュアル Ruby 1.9.3版][man-193]
* [Rubyリファレンスマニュアル Ruby 2.0.0版][man-200]
* [Rubyリファレンスマニュアル Ruby 2.1.0版][man-210]
* [るりまサーチ][man-search]

またこのリファレンスマニュアルをまとめてダウンロードすることもできます。

* [Rubyリファレンスマニュアル刷新計画 パッケージ版 1.8.7/1.9.3用 (tar.xz形式)][man-xz]
  \|[(tar.gz形式)][man-gz] \|[(zip形式)][man-zip]
* [Rubyリファレンスマニュアル刷新計画 chm版 1.8.7用][man-187-chm] \|[1.9.3用][man-193-chm]

ドキュメントは全て [&lt;URL:http://doc.okkez.net/&gt;][man-mirror] でもミラーされています

### リファレンス

[Ruby コアリファレンス (英語)](http://www.ruby-doc.org/core-2.0/)
: [RDoc](http://rdoc.sourceforge.net/)を用いてRubyのソースコードから直接生成したものです。
  String, ArrayやSymbol等のコアクラスやモジュールのリファレンスがあります。

[Ruby 標準ライブラリリファレンス (英語)](http://www.ruby-doc.org/stdlib-2.0/)
: こちらもRDocを使用してRubyのソースコードから生成しています。
  こちらはRubyの標準ライブラリのリファレンスになります。

[RubyDoc.info (英語)](http://www.rubydoc.info/)
: Ruby gemsやGitHubでホスティングされてるRubyプロジェクトのリファレンスが見れる
  完結型のリファレンスサイト。

### 旧版

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

* Windows
  * [Notepad++][29]
  * [E-TextEditor][30]
  * [Ruby In Steel][31]

* OS X
  * [TextMate][32]
  * [TextWrangler][33]
  * [Dash][39] (ドキュメント表示ツール)

Posted by Shugo Maeda on 26 May 2006
{: .post-info}



[rurema-wiki]: https://github.com/rurema/doctree/wiki
[doc-r-l-o]: http://docs.ruby-lang.org/ja/
[man-187]: http://docs.ruby-lang.org/ja/1.8.7/doc/index.html
[man-193]: http://docs.ruby-lang.org/ja/1.9.3/doc/index.html
[man-200]: http://docs.ruby-lang.org/ja/2.0.0/doc/index.html
[man-210]: http://docs.ruby-lang.org/ja/2.1.0/doc/index.html
[man-search]: http://docs.ruby-lang.org/ja/search/
[man-xz]: http://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-dynamic-20120829.tar.xz
[man-gz]: http://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-dynamic-20120829.tar.gz
[man-zip]: http://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-dynamic-20120829.zip
[man-187-chm]: http://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.8.7-20120829.chm
[man-193-chm]: http://cache.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.3-20120829.chm
[man-mirror]: http://doc.okkez.net/
[old-man-html-gz]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-html-20051029.tar.gz
[old-man-html-bz2]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-html-20051029.tar.bz2
[old-man-html-zip]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-html-20051029.zip
[old-man-rd-gz]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-rd-20051029.tar.gz
[old-man-rd-bz2]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-rd-20051029.tar.bz2
[old-man-rd-zip]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-rd-20051029.zip
[man-166-ja]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-ja-1.6.6-20011225-rd.tar.gz
[man-146-ja]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-1.4.6-jp.tar.gz
[man-146-en]: ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-man-1.4.6.tar.gz

[19]: http://www.aptana.com/
[20]: http://www.gnu.org/software/emacs/
[21]: http://www.emacswiki.org/emacs/RubyMode
[22]: http://cx4a.org/software/rsense/
[23]: http://www.geany.org/
[24]: http://projects.gnome.org/gedit/screenshots.html
[25]: http://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: http://www.jetbrains.com/ruby/
[28]: http://www.scintilla.org/SciTE.html
[29]: http://notepad-plus-plus.org/
[30]: http://www.e-texteditor.com/
[31]: http://www.sapphiresteel.com/
[32]: http://macromates.com/
[33]: http://www.barebones.com/products/textwrangler/
[36]: https://netbeans.org/
[37]: http://www.sublimetext.com/
[39]: http://kapeli.com/dash
