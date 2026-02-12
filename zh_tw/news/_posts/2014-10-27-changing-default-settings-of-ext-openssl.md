---
layout: news_post
title: "修改 ext/openssl 的預設選項"
author: "usa"
translator: "Juanito Fatas"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: zh_tw
---

我們在 Ruby 2.1.4、Ruby 2.0.0-p594 以及 Ruby 1.9.3-p550 修改了 ext/openssl 的原廠設定。
這次的修改預設把不安全的 SSL/TLS 選項禁用了。
但這個修改也可能給 SSL 連線帶來某些問題。

## 詳情

OpenSSL 仍在透過先前發生的事件在持續改善不安全的協議與密碼。像是 POODLE 風險（[CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)）。若繼續使用 OpenSSL 這樣的不安全功能，可能無法保證網路溝通的安全性。基於在 [Bug #9424](https://bugs.ruby-lang.org/issues/9424) 的討論後考量，我們決定預設禁用這些不安全的選項。若需要取消這次的修改（如下所示），把這個補丁打上去即可取消。

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

但如果你取消本次修改，便無法保證網路溝通的安全性。移除之前，請先了解此次修改背後的意義。

### Ruby 內建的函式庫

這次修改影響到 net/http、net/imap 以及 net/pop。而由於 DRb 和 WEBrick 是分開來設定的，所以它們不受影響。

### 關於直接使用 ext/openssl 的腳本

這次修改影響到 `OpenSSL::SSL::SSLContext` 實例化出來的物件呼叫 `set_params` 實例方法的時候。

特別像是下面的程式碼：

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # if you want to change some options, such as cert store, verify mode and so on, you can pass such parameters within a hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

在客戶端使用 ext/openssl，我們假設這次修改應該沒有任何問題。但若是在伺服器端使用 ext/openssl，則某些老舊的客戶端（比如 Windows XP 上的 Internet Explorer 6、舊手機的瀏覽器等）可能會沒辦法連上伺服器。

你應該經過權衡考量之後決定要不要啟用這次的修改。

## 因應措施

若無法更新 Ruby 但想解決不安全的 SSL/TLS 選項，請用下面這個 monkey-patch：

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

## 此次修改所影響的版本

* Ruby 1.9.3 patchlevel 550 以及之後的版本
* Ruby 2.0.0 patchlevel 594 以及之後的版本
* Ruby 2.1.4 以及之後的版本
* 主幹 revision 48097 以及之後的版本

## 編輯記錄

* 2014-10-27 12:00:00 (UTC) 初版
