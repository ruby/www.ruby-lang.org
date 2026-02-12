---
layout: news_post
title: "Changed default settings of ext/openssl"
author: "usa"
translator:
date: 2014-10-27 12:00:00 +0000
tags: security
lang: en
---

We changed the default setting of ext/openssl in Ruby 2.1.4, Ruby 2.0.0-p594 and Ruby 1.9.3-p550.
With this change, insecure SSL/TLS options are now disabled by default.
However, by this change, there is a possibility of some problems in the SSL connection.

## Details

OpenSSL still implements protocols and ciphers that are considered insecure today by historical circumstances.
Like POODLE vulnerability ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)), if you continue to use OpenSSL with such insecure features, you may not be able to keep the safety of network communication.
So, based on the discussion in [Bug #9424](https://bugs.ruby-lang.org/issues/9424), we have decided to disable such insecure SSL/TLS options by default.
If you need to cancel this change (shown below), apply the reverse patch to revoke it.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

However, if you cancel this change, there is a risk that you can not guarantee the safety of network communication.
You should understand the implications of this change before removing it.

### Bundled libraries of Ruby

This change is reflected in net/http, net/imap and net/pop.
Since DRb and WEBrick receive the setting separately, this change does not effect them.

### Scripts that use ext/openssl directly

This change is reflected when an `OpenSSL::SSL::SSLContext` object is instantiated and the instance method `set_params` is called.

In particular, code such as:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # if you want to change some options, such as cert store, verify mode and so on, you can pass such parameters within a hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

When using ext/openssl as a client side, we assume that there may be no problem with this change.
However, if you are using ext/openssl as a server side and reflect this change, some old clients (Internet Explorer 6 on Windows XP, browsers in old cellular phones, etc.) may not be able to connect to the server.

It is your decision whether to enable this change or not, consider the trade-offs.

## Workaround

If you cannot update Ruby but you have to cope to insecure SSL/TLS options, apply the following monkey-patch:

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

## Affected versions of this change

* Ruby 1.9.3 patchlevel 550 and later
* Ruby 2.0.0 patchlevel 594 and later
* Ruby 2.1.4 and later
* revision 48097 and later of trunk

## History

* Originally published at 2014-10-27 12:00:00 (UTC)
