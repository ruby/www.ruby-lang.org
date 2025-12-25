---
layout: news_post
title: "Ruby 4.0.0 リリース"
author: "naruse"
translator:
date: 2025-12-25 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Ruby {{ release.version }} が公開されました。
Ruby 4.0 には "Ruby Box"、"ZJIT" ほか多数の改善が含まれています。

## Ruby Box

Ruby Boxはクラス等の定義の分離／隔離のための機能を提供する、実験的機能です。Ruby Boxは環境変数として `RUBY_BOX=1` を指定することで有効化できます。クラス名は `Ruby::Box` です。

Boxの中で読み込まれた定義はそのBox内に閉じた状態となります。Ruby Boxが隔離できる定義としては、既存クラスへのモンキーパッチ、グローバル変数やクラス変数の操作、クラスやモジュールの定義、そして.rbファイルや拡張ライブラリとして実装されたライブラリ類です。

Ruby Boxの主要なユースケースとしては、次のものが想定されています:

* テストのために何かの挙動を上書きするようなモンキーパッチを必要とするテストケースをBox内に閉じて実行すること
* WebアプリケーションをBox内で実行することで、Blue-Greenデプロイメントをプロセス内で、アプリケーションサーバ上で実行すること
* WebアプリケーションをBox内で実行することで、依存関係の更新時などに、一定期間並列で動かしてRubyコードを用いてレスポンス等を検証すること
* (未設計の)「パッケージAPI」のような新しい高レベルAPIを作るための低レベルAPIとしての機能を提供すること

"Ruby Box"の詳細については次のドキュメントを参照してください: [doc/language/box.md](doc/language/box.md).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT は、YJIT の次世代として開発された新しい just-in-time（JIT）コンパイラです。ZJIT サポート付きで Ruby をビルドするには Rust 1.85.0 以降が必要で、--zjit を指定すると ZJIT が有効になります。

私たちが Ruby 向けに新しいコンパイラを開発しているのは、パフォーマンスの上限を引き上げ（より大きなコンパイル単位サイズと SSA IR を導入）つつ、より一般的なデザインであるメソッドコンパイラにすることで、外部からの貢献を促進したいからです。詳しくは [ブログ記事](https://railsatscale.com/2025-12-24-launch-zjit/) をご覧ください。
<!-- このブログ記事は 2025-12-24 9:00am UTC に自動公開されます。 -->

ZJITは通常の Ruby インタプリタより高速ですが、まだ YJIT ほど速くはありません。ZJIT をぜひ試してみて欲しいですが、現時点では本番環境へのデプロイは控えたほうがよいかもしれません。Ruby 4.1 の ZJIT にご期待ください。

## Ractor の改善

Ruby で簡単に並列処理を行うための Ractor に多くの改善がありました。まず、`Ractor::Port` というクラスを加え、メッセージの送受信についのて問題を解決しました（[ブログ記事](https://product.st.inc/entry/2025/06/24/110606)）。また、`Ractor.shareable_proc`によって、ProcをRactor間で共有しやすくしました。

性能面では、多くのデータ構造を改善し、グローバルロックに対する競合が大幅に減少し、並列処理性能を向上しました。また、Ractor 間で共有するデータを減らすことで、並列実行時の CPU キャッシュの衝突を減らしました。

Ruby 3.0 で experimental feature として導入されましたが、来年くらいには experimental を取りたいと思っています。

## 言語仕様の変更

* `*nil` は `nil.to_a` を呼ばなくなりました。`**nil` が `nil.to_hash` を呼ばないのと同様です。[[Feature #21047]]

* 行頭の論理二項演算子（`||`、`&&`、`and`、`or`）は、ドット記法のように前の行を継続するようになりました。次のコードは同等です。

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    従来の書き方:

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## コアクラスの更新

注: 特筆すべきクラス更新のみを記載しています。

* Array

    * `array.reverse_each.find` より効率的な代替として `Array#rfind` を追加しました。[[Feature #21678]]
    * `Enumerable#find` をより効率的に実行する `Array#find` を追加しました。[[Feature #21678]]
* Binding

    * `Binding#local_variables` は番号付きパラメータを含めなくなりました。また、`Binding#local_variable_get`、`Binding#local_variable_set`、`Binding#local_variable_defined?` は番号付きパラメータを扱わないようになりました。[[Bug #21049]]

    * 番号付きパラメータおよび "it" パラメータにアクセスするために、`Binding#implicit_parameters`、`Binding#implicit_parameter_get`、`Binding#implicit_parameter_defined?` を追加しました。[[Bug #21049]]

* Enumerator

    * `Enumerator.produce` がオプションのキーワード引数 `size` を受け付けるようになりました。サイズには整数、`Float::INFINITY`、ラムダなどの呼び出し可能オブジェクト、または不明を示す `nil` を指定できます。省略時は `Float::INFINITY` です。

        ```ruby
        # 無限列挙子
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # サイズが既知/計算可能な有限列挙子
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * `ArgumentError` が発生した際に、メソッド呼び出し側（caller）とメソッド定義側（callee）の両方のコードスニペットを表示するようになりました。[[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * `Kernel#raise` と同様に `Fiber#raise(cause:)` 引数をサポートしました。[[Feature #21360]]

* Fiber::Scheduler

    * 指定した例外でファイバを中断する `Fiber::Scheduler#fiber_interrupt` を追加しました。初期用途は、IO 操作が閉じられたときにブロッキング IO を待っているファイバを中断することです。[[Feature #21166]]

    * シグナル例外が無効なときでもスケジューラが処理を続行できるよう、`Fiber::Scheduler#yield` を追加しました。[[Bug #21633]]

    * 非同期 `IO#close` 用の `Fiber::Scheduler#io_close` フックを再導入しました。

    * IO 書き込みバッファを flush する際に `Fiber::Scheduler#io_write` を呼び出すようになりました。[[Bug #21789]]

* File

    * カーネルとファイルシステムが対応していれば、statx システムコール経由で Linux でも `File::Stat#birthtime` が利用可能になりました。[[Feature #21205]]

* IO

    * `IO.select` がタイムアウト引数として `Float::INFINITY` を受け付けるようになりました。[[Feature #20610]]

    * `|` で始まる `IO` クラスメソッドによるプロセス生成という非推奨挙動を削除しました。[[Feature #19630]]

* Kernel

    * `Kernel#inspect` は `#instance_variables_to_inspect` メソッドの有無を確認し、`#inspect` 文字列に表示するインスタンス変数を制御できるようになりました。

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * `|` で始まる `Kernel#open` によるプロセス生成という非推奨挙動を削除しました。[[Feature #19630]]

* Math

    * `Math.log1p` と `Math.expm1` を追加しました。[[Feature #21527]]

* Pathname

    * Pathname は default gem から Ruby のコアクラスに昇格しました。[[Feature #17473]]

* Proc

    * `Proc#parameters` は匿名のオプション引数を `[:opt, nil]` ではなく `[:opt]` と表示するようになり、必須匿名引数の場合と整合しました。[[Bug #20974]]

* Ractor

    * Ractor 間の通信のための新しい同期機構として `Ractor::Port` クラスを追加しました。[[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` は次のメソッドを提供します。

        * `Ractor::Port#receive`
        * `Ractor::Port#send`（または `Ractor::Port#<<`）
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        この結果、`Ractor.yield` と `Ractor#take` は削除されました。

    * Ractor の終了待ちを行うために `Ractor#join` と `Ractor#value` を追加しました。`Thread#join`、`Thread#value` に相当します。

    * `Ractor#join` を実装するために内部で使われる低レベルインターフェイスとして `Ractor#monitor` と `Ractor#unmonitor` を追加しました。

    * `Ractor.select` は Ractor と Port のみを受け付けるようになりました。Ractor が与えられた場合は、その Ractor が終了すると戻ります。

    * 各 `Ractor` はデフォルトポートを持ち、`Ractor.send`、`Ractor.receive` で使用されるようになりました (`Ractor#default_port` を追加)。

    * `Ractor#close_incoming` と `Ractor#close_outgoing` は削除されました。

    * 共有可能な Proc / lambda を作るために `Ractor.shareable_proc` と `Ractor.shareable_lambda` を追加しました。[[Feature #21550]] [[Feature #21557]]

* Range

    * `Range#to_set` はサイズチェックを行うようになり、終端のない範囲での問題を防ぎます。[[Bug #21654]]

    * `Range#overlap?` は無限（非境界）範囲を正しく扱うようになりました。[[Bug #21185]]

    * 始点のない整数範囲での `Range#max` の挙動を修正しました。[[Bug #21174]] [[Bug #21175]]

* Ruby

    * Ruby に関する定数を含む新しいトップレベルモジュール `Ruby` を定義しました。このモジュールは Ruby 3.4 で予約されており、今回正式に定義されました。[[Feature #20884]]

* Ruby::Box

    * 定義の分離を提供する新しい（実験的）機能です。詳細は [doc/language/box.md](doc/language/box.md) を参照してください。[[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` は自動ロードされる stdlib クラスからコアクラスになりました。[[Feature #21216]]

    * `Set#inspect` は配列リテラル風の簡潔な表示になりました（例: `#<Set: {1, 2, 3}>` ではなく `Set[1, 2, 3]`）。[[Feature #21389]]

    * `Set#to_set` と `Enumerable#to_set` への引数指定は非推奨になりました。[[Feature #21390]]

* Socket

    * `Socket.tcp` と `TCPSocket.new` が初回接続のタイムアウトを指定するキーワード引数 `open_timeout` を受け付けるようになりました。[[Feature #21347]]
    * `TCPSocket.new` でユーザー指定タイムアウトが発生した場合、状況により `Errno::ETIMEDOUT` または `IO::TimeoutError` が発生し得ましたが、今後は一貫して `IO::TimeoutError` を発生させます（ただし `Socket.tcp` では同様の状況で `Errno::ETIMEDOUT` となる場合があり、OS レベルのタイムアウトではいずれの場合も `Errno::ETIMEDOUT` が発生する可能性があります）。

* String

    * Unicode を Version 17.0.0、Emoji を Version 17.0 に更新しました（Regexp にも適用）。[[Feature #19908]][[Feature #20724]][[Feature #21275]]

    * `String#strip`、`strip!`、`lstrip`、`lstrip!`、`rstrip`、`rstrip!` が `*selectors` 引数を受け付けるようになりました。[[Feature #21552]]

* Thread

    * `Kernel#raise` と同様に `Thread#raise(cause:)` 引数をサポートしました。[[Feature #21360]]

## Stdlib の更新

ここでは注目すべき機能変更のみを記載します。

その他の変更は以下のセクションに記載しています。また、前回バンドル版（Ruby 3.4.0）からの GitHub リリース履歴がある場合はそれも記載しています。

次の bundled gem が default gem から昇格しました。

* ostruct 0.6.3
  * 0.6.1 to [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 to [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 to [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 to [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 to [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 to [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 to [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 to [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 to [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

次のデフォルト gem を追加しました。

* win32-registry 0.1.2

次の default gem を更新しました。

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 to [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 to [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 to [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 to [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 to [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 to [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 to [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 to [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 to [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 to [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 to [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 to [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 to [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 to [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 to [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 to [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 to [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 to [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 to [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 to [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 to [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 to [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 to [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 to [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 to [v3.2.2][zlib-v3.2.2]

次の bundled gem を更新しました。

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 to [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 to [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.3
  * 3.6.7 to [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 to [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 to [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 to [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 to [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 to [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 to [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 to [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 to [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 to [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 to [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 to [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 to [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 to [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12


### RubyGems と Bundler

RubyGems と Bundler は Version 4 が同梱されています。詳細は次のリンクを参照してください。

* [Upgrading to RubyGems/Bundler 4 - RubyGems Blog](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## サポートプラットフォーム

* Windows

    * _MSC_VER 1900 より古い MSVC をサポート対象外としました。つまり Visual Studio 2015 以降が必須になります。

## 互換性に関する注意

* `Ractor::Port` 追加に伴い、Ractor から次のメソッドを削除しました。

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` は非推奨になりました。[[Feature #15408]]

* `Process::Status#&` と `Process::Status#>>` を削除しました（Ruby 3.3 で非推奨）。[[Bug #19868]]

* `$SAFE` のパスチェック（Ruby 2.7 で削除）に使われ、既に非推奨だった `rb_path_check` を削除しました。[[Feature #20971]]

* "wrong number of arguments" の `ArgumentError` のバックトレースに、受け手のクラス/モジュール名が含まれるようになりました（例: `bar` ではなく `Foo#bar`）。[[Bug #21698]]

* バックトレースに `internal` フレームが表示されなくなりました。C 実装メソッドも、他の C 実装と同様に Ruby ソースファイル上にあるかのように表示されます。[[Bug #20968]]

  変更前:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  変更後:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

## Stdlib 互換性の注意

* CGI ライブラリは default gem から除外されました。現在は次のメソッド向けに `cgi/escape` のみ提供します。

    * `CGI.escape` / `CGI.unescape`
    * `CGI.escapeHTML` / `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` / `CGI.unescapeURIComponent`
    * `CGI.escapeElement` / `CGI.unescapeElement`

    [[Feature #21258]]

* `Set` が stdlib からコアクラスへ移動したため、`set/sorted_set.rb` を削除し、`SortedSet` は自動ロードされる定数ではなくなりました。利用する場合は `sorted_set` gem をインストールし、`require 'sorted_set'` してください。[[Feature #21287]]



* Net::HTTP

    * ボディ（本文）を持つリクエスト（例：POST、PUT）において、Content-Type ヘッダーが明示的に設定されていない場合に、デフォルトで application/x-www-form-urlencoded を自動設定する挙動が削除されました。もしアプリケーションがこの自動設定に依存していた場合、今後は Content-Type ヘッダーなしでリクエストが送信されることになり、特定のサーバーとの互換性が失われる可能性があります。
[[GH-net-http #205]]

## C API の更新

* IO

    * `rb_thread_fd_close` は非推奨になり、何もしなくなりました。C 拡張でファイルディスクリプタを Ruby コードに公開する必要がある場合は、`RUBY_IO_MODE_EXTERNAL` を使って `IO` インスタンスを作成し、`rb_io_close(io)` で閉じてください（これにより、その IO 上のすべての保留操作が割り込まれ、完了を待ちます）。ディスクリプタを直接閉じても保留操作は割り込まれず、未定義動作を招く可能性があります。言い換えると、同じファイルディスクリプタを共有する 2 つの `IO` オブジェクトの片方を閉じても、もう一方には影響しません。[[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` は GVL の有無にかかわらず動作するようになりました。これにより gem は `ruby_thread_has_gvl_p` を確認せずに済みますが、GVL の扱いには引き続き注意してください。[[Feature #20750]]

* Set

    * `Set` の C API を追加しました。次のメソッドをサポートします。[[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## 実装の改善

* `Class#new`（例: `Object.new`）が全般的に高速化され、特にキーワード引数を渡す場合に効果があります。YJIT と ZJIT にも取り込まれました。[[Feature #21254]]
* サイズプールの異なる GC ヒープを独立して成長させるようにし、一部のプールだけに長寿命オブジェクトがある場合のメモリ使用量を削減しました。
* 大きなオブジェクトページでの GC スイープが高速化されました。
* "Generic ivar" オブジェクト（String、Array、`TypedData` など）は、新しい内部 "fields" オブジェクトを使ってインスタンス変数アクセスを高速化します。
* GC は内部の `id2ref` テーブルを初回使用まで保持しないようにし、`object_id` の割り当てと GC スイープを高速化しました。
* Class / Module オブジェクトでの `object_id` と `hash` が高速化されました。
* より大きな多倍長整数でも可変幅アロケーションにより埋め込みのまま保持できるようになりました。
* `Random`、`Enumerator::Product`、`Enumerator::Chain`、`Addrinfo`、`StringScanner`、および一部内部オブジェクトが書き込みバリア保護され、GC のオーバーヘッドを削減します。

### Ractor

Ractor をより安定・高性能・実用的にするため多くの改善を行いました。これらにより Ractor 実装は実験的ステータスを脱する段階に近づいています。

* パフォーマンス改善
    * 凍結文字列とシンボルテーブルが内部でロックフリーのハッシュセットを使用します。[[Feature #21268]]
    * メソッドキャッシュの参照で多くの場合ロックを回避します。
    * クラス（および generic ivar）のインスタンス変数アクセスが高速化され、ロックを避けます。
    * Ractor ごとのカウンタを用いてオブジェクト割り当てでの CPU キャッシュ競合を回避します。
    * スレッドローカルカウンタを用いて xmalloc/xfree での CPU キャッシュ競合を回避します。
    * 多くの場合 `object_id` 取得でロックを回避します。
* バグ修正と安定性
    * Ractor と Thread の併用で起こり得るデッドロックを修正しました。
    * Ractor 内での require / autoload の問題を修正しました。
    * Ractor 間のエンコーディング/トランスコード問題を修正しました。
    * GC 操作やメソッド無効化に関する競合を修正しました。
    * Ractor 起動後にプロセスを fork する際の問題を修正しました。
    * Ractor 環境下で GC の割り当てカウントが正確になりました。
    * GC 後に TracePoint が動作しない問題を修正しました。[[Bug #19112]]

## JIT

* ZJIT
    * [メソッドベースの実験的 JIT コンパイラ](https://docs.ruby-lang.org/en/master/jit/zjit_md.html) を導入しました。利用可能な場合、ZJIT は `--zjit` オプションまたは `RubyVM::ZJIT.enable` を呼び出すことで実行時に有効化できます。
Ruby をビルドする場合、ZJIT サポートを含めるには Rust 1.85.0 以降が必要です。
    * Ruby 4.0.0 時点で ZJIT はインタプリタより高速ですが、まだ YJIT には及びません。ZJIT の試用を推奨しますが、現時点では本番利用を推奨しません。
    * 目標は Ruby 4.1 で ZJIT を YJIT より高速かつ本番対応にすることです。
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * デフォルトビルドでは `ratio_in_yjit` は利用できなくなりました。`configure` で `--enable-yjit=stats` を付け、`--yjit-stats` で有効化してください。
        * すべてのコードが TracePoint により無効化された回数を表す `invalidate_everything` をデフォルト統計に追加しました。
    * `RubyVM::YJIT.enable` に `mem_size:` と `call_threshold:` オプションを追加しました。
* RJIT
    * `--rjit` を削除しました。サードパーティ JIT API の実装は [ruby/rjit](https://github.com/ruby/rjit) リポジトリに移します。

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
