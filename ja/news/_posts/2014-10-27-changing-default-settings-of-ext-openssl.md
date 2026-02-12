---
layout: news_post
title: "ext/openssl のデフォルト設定の変更について"
author: "usa"
translator: "usa"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: ja
---

Ruby 2.1.4、Ruby 2.0.0-p594、Ruby 1.9.3-p550 において、ext/openssl のデフォルト設定が従来のものから変更されています。
今回の変更により、安全でない SSL/TLS オプションがデフォルトで無効化されるようになりましたが、これに伴い、利用状況によっては SSL 接続に際して問題が生じる可能性があります。

## 詳細

OpenSSL には、現在では安全ではないとみなされるプロトコルや暗号方式などが、歴史的事情により依然として実装されています。
最近話題となった POODLE 脆弱性 ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)) に見られるように、これらの安全ではない機能を有効にしたままで OpenSSL を利用し続けた場合、攻撃者によって通信を傍受されるおそれがあります。
そこで、[Bug #9424](https://bugs.ruby-lang.org/issues/9424) での議論を踏まえ、Ruby では既に安全ではないとわかっている SSL/TLS オプションについては、デフォルトで無効となるよう変更を行いました。
この変更を無効化する必要がある場合は、以下に示す対応する変更を取り消すパッチを各自で適応してください。

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

ただし、今回の変更を取り消した場合、通信の安全が確保できなくなる可能性があります。
影響を十分理解した上で行ってください。

### Ruby の標準添付ライブラリ

今回の変更は、標準添付ライブラリに関しては、net/http、net/imap、net/pop においてデフォルトで反映されます。
DRb および WEBrick については、別途設定を受け付けるようになっているため、今回の変更は直接には反映されません。

### 直接 ext/openssl を使用している場合

直接 ext/openssl を使用しているスクリプトに関しては、`OpenSSL::SSL::SSLContext` オブジェクトを自前で作成し、その `set_params` メソッドを呼び出した上で `OpenSSL::SSL::SSLSocket.new` の第2引数に渡した場合にのみ、今回の変更が反映されます。
具体的には以下のようなコードになります。

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # if you want to change some options, such as cert store, verify mode and so on, you can pass such parameters within a hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

なお、Ruby をクライアント側として使用する場合は、今回の変更を反映しても問題が生じるケースはほとんどないと考えられますが、不特定のクライアントからの接続を受け付けるサーバとして使用する場合、上記のコード例のような形で今回の変更を反映してしまうと、古いクライアント (Windows XP 上の Internet Explorer 6 や、古い携帯電話のブラウザなど) から接続できなくなります。
サーバ側で利用する場合は、その旨を考慮した上で反映すべきかどうかを判断してください。

## 回避策

何らかの事情で Ruby の更新はできないけれども安全でない SSL/TLS オプションへの対処は必要であるという場合は、以下に示すモンキーパッチを適応してください。

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## 今回の変更の影響を受けるバージョン

* Ruby 1.9.3 patchlevel 550 以降の Ruby 1.9.3
* Ruby 2.0.0 patchlevel 594 以降の Ruby 2.0.0
* Ruby 2.1.4 以降の Ruby 2.1
* revision 48097 以降の開発版 (trunk)

## 更新履歴

* 2014-10-27 21:00:00 (JST) 初版
