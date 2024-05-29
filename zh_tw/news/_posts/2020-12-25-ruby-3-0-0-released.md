---
layout: news_post
title: "Ruby 3.0.0 發布"
author: "naruse"
translator: "Juanito Fatas"
date: 2020-12-25 00:00:00 +0000
lang: zh_tw
---

我們很高興宣布 Ruby 3.0.0 發布了。從 2015 年開始開發，目標是提高效能、支援並行性並提供型態檢查。Matz 表示「Ruby 3 將會比 Ruby 2 快 3 倍」，即 [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3)。

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

從 [Optcarrot 指標](https://github.com/mame/optcarrot)（量測了單線程在 NES 遊戲模擬器的效能）來看，我們得到了比 Ruby 2.0 高三倍的效能！<details>在這裡 [https://github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark) 所記載的硬體環境下實測。Ruby 3.0 測的是這個 [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095)。但在你的機器上跑起來可能沒有三倍快。</details>

Ruby 3.0.0 達成各項目標的功能
* 效能
  * MJIT
* 並行
  * Ractor
  * Fiber Scheduler
* 靜態型態（靜態分析）
  * RBS
  * TypeProf

通過上述的效能提升，Ruby 3.0 也加入了許多新功能。

## 效能

> 當我第一次在大會上放話 "Ruby3x3" 時，許多核心成員認為 "Matz 在說大話"。實際上我自己也是這麼認為的。但我們做到了。能看到核心成員在某些測試實現了 Ruby 3.0 比 Ruby 2.0 快三倍的目標，真是我的榮幸。— Matz

### MJIT

許多的效能改進來自 MJIT。參考 [NEWS](https://github.com/ruby/ruby/blob/v3_0_0/NEWS.md) 了解更多。

Ruby 3.0 開啟 JIT 之後，某些場合應該能感覺到效能提升了，比如遊戲領域（[Optcarrot](https://benchmark-driver.github.io/benchmarks/optcarrot/commits.html#chart-1))、AI ([Rubykon](https://benchmark-driver.github.io/benchmarks/rubykon/commits.html)），或是任何需要大量呼叫某些特定方法的應用程式。

雖然 Ruby 3.0 [大幅減少了 JIT 產生的程式碼大小](https://twitter.com/k0kubun/status/1256142302608650244)，但還不能應用在像是 Rails 這種呼叫大量不同方法的上（因為 CPU 指令 cache 命中率很低），Ruby 3.1 將會改善這一塊，敬請期待。

## Concurrency / Parallel

> 現在是多核心的時代了。並行性至關重要。有了 Ractor 和 Async Fiber 後，Ruby 將會成為一門真正的並行語言。— Matz

### Ractor（實驗性）

Ractor 是基於 Actor 模型的並行抽象層，可以並行執行程式而無須擔心線程安全性問題。

可以一次創好幾個 Ractor，也可以同時執行它們。Ractor 之間不共享物件，所以能確保線程的安全性。Ractor 透過交換訊息來互相溝通。

為了要限制共享物件，Ractor 引入了許多 Ruby 語法的限制（若沒有使用多個 Ractor 則沒有限制）。

規範與實作尚未成熟，在未來還有可能會改變，所以 Ractor 還是個實驗性功能，在第一次執行 `Ractor.new` 時會輸出警告訊息。

以下的小程式量測有名的 [tak 函數](https://en.wikipedia.org/wiki/Tak_(function))，分別紀錄了序行執行四次跟用 Ractor 並行執行四次的執行時間。

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
測試結果：
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

測試在 Ubuntu 20.04、Intel(R) Core(TM) i7-6700 (4 核心、8 硬體線程）下量測。並行的版本比序行的版本快 3.87 倍。

參見 [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html) 來了解更多。

### Fiber Scheduler

引進了 `Fiber#scheduler` 來攔截阻塞式操作。可以不改原來的程式碼來獲得少量的並行性。詳見 ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) 演講來了解大概的工作原理。

目前支援的類別和方法：

- `Mutex#lock`、`Mutex#unlock`、`Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`、`SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`、`IO#read`、`IO#write`和相關方法（比如 `#wait_readable`、`#gets`、`#puts`等）。
- **不支援** `IO#select`

下面的例子會同時執行多個 HTTP 請求：

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

這裡用了 [async](https://github.com/socketry/async) 提供的事件循環。事件循環用了 `Fiber#scheduler` 的鉤子（hooks）把 `Net::HTTP` 變成了非阻塞操作。別的 Gem 也可以用這個介面來實作非阻塞操作，如此一來只要其他的 Ruby（JRuby、TruffleRuby）也實作了非阻塞的鉤子，也就可以達到同樣的效果。

## 靜態分析

> 2010 是靜態型態語言的時代。Ruby 透過無需定義型態的抽象解釋層，跟上時代的腳步也實作了靜態型態。RBS 和 TypeProf 只是未來的一小步，之後還有更多發展。— Matz

### RBS

RBS 是描述 Ruby 程式型態的語言。

型態檢查工具，TypeProf 和其他工具可以透過 RBS 定義來更好地理解 Ruby 程式。

你可以寫下類別和模組的定義：定義了什麼方法、實體變數和型態，繼承和 mix-in 關係。

RBS 的目標是支援各種常見的 Ruby 程式模式，進而描述更高階的型態如 union、方法重載和泛型。

Ruby 3.0 搭載了 `rbs` Gem，可以直接解析和處理用 RBS 定義的型態宣告。以下是一個用 RBS 描述類別、模組和常數定義的例子。

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

參見 [RBS Gem 的 README](https://github.com/ruby/rbs) 來了解更多。

### TypeProf

TypeProf 是一個 Ruby 內建的型態分析工具。

目前 TypeProf 是一種型態推測器。

讀入 Ruby 程式碼，分析方法的定義，在那被使用，怎麼被使用，最後產生用 RBS 定義的型態簽名。

以下是 TypeProf 的示範。

範例程式：

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

範例輸出：

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

可以直接把檔名 `test.rb` 丟給 `TypeProf`： `typeprof test.rb` 。

也可以在[線上試用 TypeProf](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=)（在我們自己的伺服器上跑 TypeProf，要是壞了在這裡先說聲抱歉）。

參見 [TypeProf 文件](https://github.com/ruby/typeprof/blob/master/doc/doc.md)和[演示](https://github.com/ruby/typeprof/blob/master/doc/demo.md)來了解更多。

TypeProf 仍是實驗性質功能尚未成熟，只支援 Ruby 的部分語法，能找出的型態錯誤有限。但目前正在快速開發中來支援更多的 Ruby 特性，更快的分析速度，更高的使用性。有任何回饋歡迎告訴我們。

## 其它值得一提的新功能

* 重新設計了單行模式匹配（實驗性質）

    * 新增 `=>`。用來向右賦值。

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` 現在會回傳 `true` 或 `false`。

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* 新增「模式查詢」（實驗性質）

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* 新增了無 `end` 的方法定義

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` 現已內建

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* 新增了實驗性質的記憶體監視圖

    * 這是一組新的 C-API，用來交換記憶體空間的，比如擴展函式庫（extension）之間可以交換 array 跟 bitmap。擴展函式庫之間也可以共享記憶體空間的 metadata，比如那裡的記憶體已經被用了、佔用空間所存放的格式等。利用這些 metadata，擴展函式庫甚至可以恰當的共享多維度的 array。這個功能參考了 Python 的 buffer protocol。

## 效能改善

* 貼一段很長的程式碼到 IRB 跟 Ruby 2.7.0 相比快了 53 倍。舉例來說，貼上[這段程式碼](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)從 11.7 秒降到了 0.22 秒。

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>

* IRB 新增了 `measure` 指令。可以量一些簡單的執行時間。

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## 其他自 2.7 以來的變更

* Keyword arguments 從其它的參數分離出去了。
  * 原則上來說，在 Ruby 2.7 有警告的程式碼，在 3.0 不會動。參見[這份文件](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)來了解更多。
  * 除此之外，參數現在可以轉發到下一層。

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* 模式匹配（`case`/`in`）不再是實驗性質。
  * 參見[模式匹配文件](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html)來了解更多。
* 完全移除了 `$SAFE` 功能，現在只是個單純的全域變數。
* 錯誤訊息的順序在 Ruby 2.5 被顛倒了，現在又改回來了。現在錯誤訊息和 Ruby 2.4 一樣：先顯示錯誤訊息行號，再來才是所有的呼叫者。
* 更新了某些標準函式庫
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * 等等；
* 以下函式庫從標準函式庫移除。如果用到了以下函式庫的功能，請安裝對應的 Gem 再使用。
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* 以下函式庫納入標準函式庫
  * rexml
  * rss
* 以下的函式庫納入標準函式庫並發佈在 rubygems.org
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}) 來了解更多。

自 2.7.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }} 行刪減（-）](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)！

> Ruby 3.0 是一個里程碑。語言進化了仍向下相容。這不是終點而是起點。Ruby 會繼續演進變得更好。敬請期待！

聖誕快樂、佳節愉快，享受用 Ruby 3.0 寫程式的時光。

## 下載

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby 是什麼

Ruby 最初由 Matz（Yukihiro Matsumoto）於 1993 年開發的開源軟體。可以在許多平台上執行。使用者來自世界各地，特別活躍於網路開發領域。
