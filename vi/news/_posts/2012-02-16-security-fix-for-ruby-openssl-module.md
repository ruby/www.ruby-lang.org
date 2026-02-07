---
layout: news_post
title: "Security Fix for Ruby OpenSSL module: Allow \"0/n splitting\" as a prevention for the TLS BEAST attack."
author: "Urabe Shyouhei"
lang: vi
---

In OpenSSL, `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS` option for SSL
connection is used to prevent TLS-CBC-IV vulnerability described at
[\[1\]][1]. It\'s known issue of TLSv1/SSLv3 but it attracts lots of
attention these days as BEAST attack [\[2\]][2] (CVE-2011-3389). Ruby
related topics are at our issue tracker [\[3\]][3].

Until now Ruby OpenSSL extension uses `SSL_OP_ALL` option, the combined
option of OpenSSL for various bug workarounds that should be rather
harmless, for all SSL connection by default. And it only allows users to
add other options so you could not remove the feature that is included
in `SSL_OP_ALL` option, like `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`. It
was intentional as it didn\'t expose constants like
`SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`, but we should allow to unset the
option so that Ruby OpenSSL extension inserts empty fragments at the
beginning of SSL connections (named \"0/n splitting\") to prevent the
TLS BEAST attack.

[This release][4] defines additional constants and allows users to unset
options in `SSL_OP_ALL`. Default option is still `SSL_OP_ALL` but you
can setup the SSLSocket with doing \"0/n splitting\" for BEAST
prevention like this.

    ctx = SSLContext.new
    ctx.options = OP_ALL & ~OP_DONT_INSERT_EMPTY_FRAGMENTS
    ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER
    SSLSocket.new(socket, ctx)

Credit to Apple for reporting this issue.

NOTE: Some SSL endpoints are known to have a bug that cannot handle
\"0/n splitting\" correctly so we (and OpenSSL) do not set this as a
default option. Please test SSL connectivity before enabling this in
production environment. If the other endpoint you\'re connecting cannot
handle \"0/n splitting\", you must use another workaround for preventing
the TLS BEAST attack, like enforcing ciphersuite to use RC4. For
details, please find discussions and resources around CVE-2011-3389.



[1]: http://www.openssl.org/~bodo/tls-cbc.txt
[2]: https://www.cve.org/CVERecord?id=CVE-2011-3389
[3]: https://bugs.ruby-lang.org/5353
[4]: http://mla.n-z.jp/?ruby-talk=393484
