---
layout: news_post
title: "net/httpsライブラリにおける「中間者によるなりすまし攻撃」に対する脆弱性について"
author: "Shugo Maeda"
lang: ja
---

Rubyに標準で添付されているnet/httpsライブラリ(net/https.rb)において、このライブラリを使用してhttpsプロトコルを発行した場合、中間者によるなりすまし攻撃(man-in-the-middle
attack)を検出できないという問題が発見されました。

この脆弱性については、[&lt;URL:http://www.isecpartners.com/advisories/2007-006-rubyssl.txt&gt;][1]として公開されています。

#### 影響

net/http.rbでは、SSL接続の際に、証明書のCNがリクエスト先のDNS名に対して検証されません。これにより、攻撃者がリクエスト先のサーバになりすますことが可能になります。

#### 脆弱性の存在するバージョン

1.8系
: 1\.8.4以前の全てのバージョン、1.8.5-p113以前のバージョン、1.8.6-p110以前のバージョン

開発版(1.9系)
: 2007-09-23より前の全てのバージョン

#### 各バージョンでの対応方法

1.8系

: 1\.8.6-p111または1.8.5-p114にアップグレードしてください。

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p111.tar.gz&gt;][2]
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p114.tar.gz&gt;][3]

  チェックを有効にするためには、以下のようにNet::HTTP#enable\_post\_connection\_check=を使用する必要があります。

      http = Net::HTTP.new(host, 443)
      http.use_ssl = true
      http.enable_post_connection_check = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      store = OpenSSL::X509::Store.new
      store.set_default_paths
      http.cert_store = store
      http.start {
        response = http.get("/")
      }

  また、Rubyのパッケージを配布している各ベンダから、それぞれ、この脆弱性を修正した版のパッケージが提供されている場合もあります。詳細については各ベンダにお問い合わせください。

開発版(1.9系)
: 2007-09-23以降のバージョンに更新してください。 Ruby
  1.9では、Net::HTTP#enable\_post\_connection\_checkはデフォルトでtrueになっています。

#### 変更履歴

* 2007-10-04 16:30 +09:00 「影響」の「DNS応答を詐称」という表現が不適切でしたので修正しました。
* 2007-10-04 16:30 +09:00
  「各バージョンでの対応方法」にenable\_post\_connection\_checkに関する説明を追記しました。



[1]: http://www.isecpartners.com/advisories/2007-006-rubyssl.txt
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p111.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p114.tar.gz
