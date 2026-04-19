---
layout: news_post
title: "Ruby 4.0.0 preview3 リリース"
author: "naruse"
translator:
date: 2025-12-18 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
Ruby {{ release.version }} が公開されました。

## 言語仕様の変更

* `*nil` は `nil.to_a` を呼び出さなくなりました。これは `**nil` が `nil.to_hash` を呼び出さないのと同様です。 [[Feature #21047]]

* 行頭の論理二項演算子 (`||`, `&&`, `and`, `or`) は、fluent dot（行頭のドット）のように前の行からの継続として扱われるようになりました。
  以下の2つのコードは等価です:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    [[Feature #20925]]

## 組み込みクラスの更新

注: 重要なクラスの更新のみを記載しています。

* Kernel

    * `Kernel#inspect` は `#instance_variables_to_inspect` メソッドの存在を確認するようになり、`#inspect` の文字列に表示するインスタンス変数を制御できるようになりました:

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

    * 先頭に `|` を付けた `Kernel#open` によるプロセス生成という非推奨の挙動が削除されました。 [[Feature #19630]]

* Binding

    * `Binding#local_variables` にナンバードパラメーターが含まれなくなりました。また、`Binding#local_variable_get` と `Binding#local_variable_set` はナンバードパラメーターの操作を拒否するようになりました。 [[Bug #21049]]

* File

    * カーネルとファイルシステムがサポートしている場合、Linux 上で statx システムコールを通じて `File::Stat#birthtime` が利用可能になりました。
      [[Feature #21205]]

* IO

    * `IO.select` がタイムアウト引数として `Float::INFINITY` を受け付けるようになりました。[[Feature #20610]]
    * 先頭に `|` を付けた `IO` クラスメソッドによるプロセス生成という非推奨の挙動が削除されました。 [[Feature #19630]]

* Math

    * `Math.log1p` と `Math.expm1` が追加されました。 [[Feature #21527]]

* Method

    * `Method#source_location`、`Proc#source_location`、`UnboundMethod#source_location` は、`[path, start_line, start_column, end_line, end_column]` の5つの要素を持つ拡張された位置情報を返すようになりました。従来の `[path, line]` という2要素の形式は、結果に対して `.take(2)` を呼び出すことで取得できます。
      [[Feature #6012]]

* Proc

    * `Proc#parameters` は、匿名のオプション引数が必須の場合との整合性をとるため、`[:opt, nil]` ではなく `[:opt]` として表示するようになりました。 [[Bug #20974]]

* Ractor

    * Ractor 間で通信するための新しい同期メカニズムとして `Ractor::Port` クラスが追加されました。 [[Feature #21262]]

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

        `Ractor::Port` は以下のメソッドを提供します:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (または `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        結果として、`Ractor.yield` と `Ractor#take` は削除されました。

    * Ractor の終了を待機するために `Ractor#join` と `Ractor#value` が追加されました。これらは `Thread#join` や `Thread#value` と同様です。
    * `Ractor#join` を実装するために内部で使用される低レベルインターフェースとして `Ractor#monitor` と `Ractor#unmonitor` が追加されました。
    * `Ractor.select` は Ractor と Port のみを受け付けるようになりました。Ractor が渡された場合、その Ractor が終了した時点で戻ります。
    * `Ractor#default_port` が追加されました。各 `Ractor` はデフォルトのポートを持っており、`Ractor.send` や `Ractor.receive` で使用されます。
    * `Ractor#close_incoming` と `Ractor#close_outgoing` は削除されました。
    * 共有可能な Proc や lambda を作成するために `Ractor.shareable_proc` と `Ractor.shareable_lambda` が導入されました。
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` と `Enumerator#to_set` は、無限範囲 (endless ranges) による問題を防ぐためにサイズチェックを行うようになりました。 [[Bug #21654]]
    * `Range#overlap?` が無限範囲 (unbounded ranges) を正しく扱えるようになりました。[[Bug #21185]]
    * 始端のない (beginless) 整数範囲に対する `Range#max` の挙動が修正されました。
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Ruby 関連の定数を含むトップレベルモジュール `Ruby` が定義されました。このモジュールは Ruby 3.4 で予約されていましたが、今回正式に定義されました。 [[Feature #20884]]

* Ruby::Box

    * 定義の分離を提供するための新しい (実験的な) 機能です。"Ruby Box" の詳細については、[doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html) を参照してください。
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` は autoload される標準ライブラリのクラスではなく、組み込みクラス (core class) になりました。
      [[Feature #21216]]
    * `Set#inspect` は、`Set[]` 構文 (例: `#<Set: {1, 2, 3}>` ではなく `Set[1, 2, 3]`) を使用した、`eval` に適した文字列を返すようになりました。これにより、Array や Hash のような他の組み込みコレクションクラスと一貫性が保たれます。 [[Feature #21389]]
    * `Set#to_set` および `Enumerable#to_set` に引数を渡すことは非推奨となりました。
      [[Feature #21390]]

* Socket

    * `Socket.tcp` と `TCPSocket.new` は、初期接続のタイムアウトを指定するための `open_timeout` キーワード引数を受け付けるようになりました。 [[Feature #21347]]

* String

    * Unicode バージョン 17.0.0 および Emoji バージョン 17.0 に更新されました。
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (Regexp にも適用されます)
    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, `rstrip!` が拡張され、`*selectors` 引数を受け付けるようになりました。 [[Feature #21552]]

* Thread

    * `Kernel#raise` と同様の `Thread#raise(cause:)` 引数のサポートが導入されました。 [[Feature #21360]]

* Fiber

    * `Kernel#raise` と同様の `Fiber#raise(cause:)` 引数のサポートが導入されました。 [[Feature #21360]]

* Fiber::Scheduler

    * 指定された例外で Fiber に割り込みをかけるための `Fiber::Scheduler#fiber_interrupt` が導入されました。当初のユースケースは、ブロックしている IO 操作が閉じられた際に、その IO 操作待ちをしている Fiber に割り込むことです。
      [[Feature #21166]]

* Pathname

    * Pathname は default gem から Ruby の組み込みクラスに昇格しました。
      [[Feature #17473]]

## 標準ライブラリの更新

以下の bundled gems は default gems から昇格しました。

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 6.17.0
* win32ole 1.9.2
* irb 1.16.0
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

注目すべき機能変更があった標準ライブラリの変更のみを記載しています。

その他の変更は以下のセクションに記載されています。また、GitHub Releases があるものについては、以前のバンドルバージョン（Ruby 3.3.0）からのリリース履歴もリストアップしています。

以下の default gem が追加されました。

* win32-registry 0.1.2

以下の default gems が更新されました。

* RubyGems 4.0.2
* bundler 4.0.2
* date 3.5.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.1
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.2
* io-nonblock 0.3.2
* io-wait 0.4.0
* ipaddr 1.2.8
* json 2.18.0
* net-http 0.9.1
* openssl 4.0.0
* optparse 0.8.1
* pp 0.6.3
* prism 1.6.0
* psych 5.3.1
* resolv 0.7.0
* stringio 3.2.0
* strscan 3.1.6
* time 0.4.2
* timeout 0.6.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

以下の bundled gems が更新されました。

* minitest 5.27.0
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.3
* rexml 3.4.4
* net-ftp 0.3.9
* net-imap 0.6.1
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.10.0.pre.2
* typeprof 0.31.0
* debug 1.11.0
* base64 0.3.0
* bigdecimal 4.0.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

## サポートされているプラットフォーム

* Windows

    * MSVC のバージョン 14.0 (_MSC_VER 1900) より前のサポートを終了しました。
      これは、Visual Studio 2015 以降が必要になったことを意味します。

## 互換性の問題

* `Ractor::Port` の追加に伴い、以下のメソッドが Ractor から削除されました:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* `ObjectSpace._id2ref` は非推奨になりました。 [[Feature #15408]]

* `Process::Status#&` および `Process::Status#>>` は削除されました。
  これらは Ruby 3.3 で非推奨になっていました。 [[Bug #19868]]

* `rb_path_check` は削除されました。この関数は Ruby 2.7 で削除された `$SAFE` パスのチェックに使用されており、既に非推奨となっていました。
  [[Feature #20971]]

## 標準ライブラリの互換性の問題

* CGI ライブラリは default gems から削除されました。現在は以下のメソッドのために `cgi/escape` のみを提供しています:

    * `CGI.escape` と `CGI.unescape`
    * `CGI.escapeHTML` と `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` と `CGI.unescapeURIComponent`
    * `CGI.escapeElement` と `CGI.unescapeElement`

    [[Feature #21258]]

* `Set` が標準ライブラリから組み込みクラスへ移行したことに伴い、`set/sorted_set.rb` は削除され、`SortedSet` は autoload される定数ではなくなりました。`SortedSet` を使用するには `sorted_set` gem をインストールし、`require 'sorted_set'` を行ってください。
  [[Feature #21287]]

## C API の更新

* IO

    * `rb_thread_fd_close` は非推奨となり、何もしなくなりました (no-op)。C 拡張から Ruby コードにファイルディスクリプタを公開する必要がある場合は、`RUBY_IO_MODE_EXTERNAL` を使用して `IO` インスタンスを作成し、それを閉じるために `rb_io_close(io)` を使用してください（これは `IO` インスタンス上のすべての保留中の操作を中断し、待機します）。ファイルディスクリプタを直接閉じると、保留中の操作は中断されず、未定義の動作につながる可能性があります。言い換えれば、2つの `IO` オブジェクトが同じファイルディスクリプタを共有している場合、一方を閉じても他方には影響しません。 [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` は GVL の有無にかかわらず動作するようになりました。
      これにより、Gem は `ruby_thread_has_gvl_p` のチェックを回避できます。
      ただし、GVL には引き続き注意を払ってください。 [[Feature #20750]]

* Set

    * `Set` のための C API が追加されました。以下の関数がサポートされています:
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## 実装の改善

### Ractor

Ractor をより安定的かつ高性能で使いやすくするために、多くの作業が行われました。これらの改善により、Ractor の実装は実験的ステータスの脱却に近づいています。

* パフォーマンスの改善
    * Frozen string とシンボルテーブルは内部的にロックフリーなハッシュセットを使用するようになりました
    * メソッドキャッシュのルックアップは、ほとんどの場合ロックを回避します
    * クラス（および geniv）インスタンス変数へのアクセスが高速化され、ロックを回避します
    * オブジェクト割り当て時のキャッシュ競合が回避されるようになりました
    * `object_id` はほとんどの場合ロックを回避します
* バグ修正と安定性
    * Ractor と Thread を組み合わせた際のデッドロックの可能性を修正しました
    * Ractor 内での require と autoload に関する問題を修正しました
    * Ractor 間でのエンコーディング/トランスコーディングの問題を修正しました
    * GC 操作とメソッド無効化における競合状態を修正しました
    * Ractor 開始後のプロセス fork に関する問題を修正しました

## JIT

* ZJIT
    * [実験的なメソッドベースの JIT コンパイラ](https://docs.ruby-lang.org/en/master/jit/zjit_md.html) を導入しました。
      `--zjit` サポートを有効にするには、Rust 1.85.0 以降で Ruby をビルドしてください。
    * Ruby 4.0.0 時点では、ZJIT はインタプリタより高速ですが、YJIT ほど高速ではありません。
      ZJIT を試すことを推奨しますが、現時点では本番環境への導入は避けることをお勧めします。
    * 私たちの目標は、Ruby 4.1 で ZJIT を YJIT よりも高速にし、本番環境で利用可能にすることです。
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` はデフォルトビルドでは機能しなくなりました。
          `configure` で `--enable-yjit=stats` を指定して `--yjit-stats` を有効にしてください。
        * デフォルトの統計に `invalidate_everything` を追加しました。これは TracePoint によってすべてのコードが無効化されたときにインクリメントされます。
    * `RubyVM::YJIT.enable` に `mem_size:` と `call_threshold:` オプションを追加しました。
* RJIT
    * `--rjit` は削除されました。サードパーティ JIT API の実装は [ruby/rjit](https://github.com/ruby/rjit) リポジトリに移動します。

## その他の変更点

より詳細な情報は [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
か [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}) を参照してください。


これらの変更により、Ruby 3.4.0から [{{ release.stats.files_changed }} ファイルが変更され、 {{ release.stats.insertions }} 行が追加され、 {{ release.stats.deletions }} 行が削除されました!deletions(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)


## Download

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

## What is Ruby

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。


[Feature #6012]: https://bugs.ruby-lang.org/issues/6012
[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
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
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
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
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
