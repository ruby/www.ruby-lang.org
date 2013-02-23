---
layout: page
title: "ライブラリ"
lang: ja
---

Rubyではたくさんの素敵で便利なアプリケーションやライブラリが利用できます。最近では多くのものが\"gem\"という形式で提供されるようになってきました。また、従来通り.zipや.tar.gzといったアーカイブ形式で配布されているものもあります。

## ライブラリの入手元

今日では世界中で数多くのRubyアプリケーションやライブラリが配布されています。以下に代表的な入手もとを紹介します。

### Rubyforge

[RubyForge][1]はオープンソースなRuby関連プロジェクトを支援しているサービスです。ここで多くのライブラリが提供されており、[分野別のライブラリのリスト][2]などから探索できます。また[ユーザー登録][3]すると自分自身のプロジェクトを登録して、Subversionリポジトリやメーリングリストといったサービスを利用できます。

### RAA - Ruby Application Archive

[Ruby Application
Archive][4]はRubyforgeよりも古いライブラリ登録サイトです。最近では他のサービスに取って代わられつつありますが、ここにしか登録されていない貴重なライブラリも数多く存在します。

\"Application Archive\"という名前ですが、アプリケーションだけでなく、ライブラリも登録されています。

RAAでは、ライブラリは機能によって分類されており、簡単に必要なライ ブラリを見つけることができます。 たとえば、 [Database][5]
カテゴリにはもっとも多くの項目が登録されており、 [Net][6]・[HTML][7]・ [XML][8]
といったカテゴリにも多くの項目があります。 登録されている項目は4つだけですが、 [Physics][9] というカテゴリまであります。

## RubyGems

RubyGemsはRuby 1.9に組み込まれたパッケージ管理システムです。Ruby
1.8でもデファクトスタンダードな地位を築いています。RubyGemsを使うとパッケージ化されたRubyアプリケーションやライブラリを簡単にインストール/更新したり、削除したりできます。
なお、RubyGemsではパッケージ単位のことを\"gem\"と呼びます。RubyGemsを操作するためのコマンドも\"gem\"です。

Ruby 1.9系統ではRubyGemsが組み込まれていますから、すぐにgemを利用できます。Ruby
1.8でもインストーラーがRubyGemsを一緒にインストールすることも多いです。またaptやportsのようなシステムのパッケージ管理システムでrubygemsが提供されていることも多いです。システムでRubyGemsが提供されていない場合は次のようにソースコードからインストールすることもできます。

### RubyGemsのインストール

RubyGemsはシステムにインストール済みであったり、aptやportsなどで提供されていることも多いので、まずその可能性を調べてください。
そうでない場合は[ダウンロードサイト][10]からアーカイブをダウンロードして、その中のREADMEに書かれている手順でインストールできます。例えば次のようにします。

    $ wget http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
    $ tar xzvf rubygems-1.3.5.tar.gz
    $ cd rubygems-1.3.5
    $ su -
    # ruby setup.rb

### gemの検索

次のようにして\"gem search\"コマンドでパターン\"mspec\"に合致するgemを検索できます。

    $ gem search mspec --remote
    
     *** REMOTE GEMS ***
    
     mspec (1.5.12)

### gemのインストール

例えば次のようにしてmspecというgemをインストールできます。これは[RubySpec][11]プロジェクトで利用されている振る舞い駆動開発支援ライブラリです。

    $ gem install mspec

また、多くのgemは最新版だけではなく過去の複数のバージョンも提供されています。特定のバージョンのgemをインストールするには次のように--versionオプションを使用します。

    $ gem install mspec --version 1.5.11

### gemの一覧

システムにインストールされているgemを一覧するには\"gem list\"コマンドを使用します

    $ gem list
    
     *** LOCAL GEMS ***
    
     activesupport (2.3.3)
     archive-tar-minitar (0.5.2)
     builder (2.1.2)
     columnize (0.3.1)
     cucumber (0.3.94, 0.3.91)
     diff-lcs (1.1.2)
     ffi (0.3.5)
     genki-ruby-terminfo (0.1.1)
     .....(略)

### 詳細

RubyGemsの詳細は[公式マニュアル][12](英語)や\"gem help\"コマンドを参照してください。

Posted by Shugo Maeda on 26 May 2006
{: .post-info}



[1]: http://rubyforge.org 
[2]: http://rubyforge.org/softwaremap/trove_list.php 
[3]: http://rubyforge.org/register/ 
[4]: http://raa.ruby-lang.org 
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database 
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net 
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML 
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML 
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics 
[10]: http://rubyforge.org/frs/?group_id=126 
[11]: http://www.rubyspec.org 
[12]: http://rubygems.org/read/chapter/1 
