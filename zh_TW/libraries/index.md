---
layout: page
title: "函式庫"
lang: zh_TW
---

Ruby 有著不計其數有用且有趣的函式庫，其中大部分都是用便捷的 [*gem* 格式][1] 來進行發佈。有些則是將原始碼透過壓縮檔(.zip
或 .tar.gz) 來發佈。來讓我們看看怎麼尋找和安裝你所需要的函式庫。

### 尋找函式庫

[**RubyGems**][2] 是 Ruby 社群全新的 RubyGems 官方網站，它也是你的 RubyGems
套件管理工具預設的搜尋站點。

[**RubyForge**][3] 是個老牌的 Ruby 函式庫網站。你可以參考看看根據分類的 [軟體列表][4]
(如果你建立了自己的函式庫，你也可以在 Rubyforge 上 [註冊][5] 發佈你的專案，它提供了
Subversion、網頁空間及郵件論壇。)

[**Ruby Application Archive**][6] (簡稱 RAA) 是個分類的 Ruby 函式庫目錄。其中 [資料庫][7]
分類擁有最多項目，緊接在後的是 [Net.][8] 。 [HTML][9] 和 [XML][10] 也十分熱門。甚至還有四個 [物理學][11]
項目。

### 使用 RubyGems

[RubyGems][1] 是 Ruby 的套件管理工具。它提供了一個標準格式來發佈 Ruby
程式和函式庫，以及提供方便的工具來安裝這些套件。某種程度上，這種套件管理工具就像 apt-get，只是專門給 Ruby 軟體使用。官方的 Gem
儲存庫是 [RubyGems.org][12]. (又叫做 Gemcutter)

雖然 Windows 安裝包有包括 RubyGems 套件管理工具，但是有些作業系統沒有。如果以下的指令沒有作用，請參考最底下的 [安裝
RubyGems](#installing-rubygems) 。

#### 搜尋 Gems

**search** 命令可以搜尋特定名字的 gems。例如，要搜尋有 “html” 字眼的 gem:

    $ gem search html --remote
    
     *** REMOTE GEMS ***
    
     html-sample (1.0, 1.1)
        A sample Ruby gem, just to illustrate how RubyGems works.
{: .code .bash-code}

(*加上 `--remote` 旗標(flag)表示我們要搜尋的是遠端 Gemcutter 上的官方 gem。*)

#### 安裝 Gem

當確定要裝某一個 gem 時，請使用 **install** 指令:

    $ gem install html-sample
{: .code .bash-code}

你可以透過 `--version` 旗標來安裝特定的版本。

    $ gem install html-sample --version 1.0
{: .code .bash-code}

#### 列出所有的 Gems

要列出 Gemcutter 上的完整 gems 清單：

    $ gem list --remote
{: .code .bash-code}

如果只需要列出你安裝的 gems，拿掉旗標即可。

    $ gem list
{: .code .bash-code}

關於 RubyGems 的更多資料，請參考 [**官方手冊**][13] ，手冊中也介紹了如何在你的 Ruby 程式中使用 gems 的例子。

### 安裝 RubyGems

欲安裝 RubyGems，請從 [下載頁面][14] 下載 RubyGems，解壓縮之後執行
`setup.rb`。在某些作業系統上，你可能需要用 root 身分來執行。

例如，在 Linux 上：

    $ tar xzvf rubygems-0.9.0.tar.gz
    $ cd rubygems-0.9.0
    $ su -
    # ruby setup.rb
{: .code .bash-code}

如果你需要更完整地知道如何安裝，請參考 RubyGems 手冊的 [**安裝 RubyGems**][15] 一章。



[1]: http://docs.rubygems.org 
[2]: http://rubygems.org/ 
[3]: http://rubyforge.org/ 
[4]: http://rubyforge.org/softwaremap/trove_list.php 
[5]: http://rubyforge.org/register/ 
[6]: http://raa.ruby-lang.org/ 
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database 
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net 
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML 
[10]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML 
[11]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics 
[12]: http://rubygems.org 
[13]: http://rubygems.org/read/chapter/1 
[14]: http://rubygems.org/pages/download 
[15]: http://rubygems.org/read/chapter/3 
