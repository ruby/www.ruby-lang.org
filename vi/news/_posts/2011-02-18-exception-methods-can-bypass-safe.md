---
layout: news_post
title: "Exception methods can bypass $SAFE"
author: "Urabe Shyouhei"
lang: vi
---

Exception#to\_s method can be used to trick $SAFE check, which makes a untrusted codes to modify arbitrary strings.

### Detailed description

In Ruby\'s $SAFE semantics, safe level of 4 is used to run a untrusted
code (such as plugin). So in upper safe levels, some sort of operations
are prohibited to prevent untrusted codes from attacking outer (trusted)
data.

Exception#to\_s was found to be problematic around it. The method can
trick safe level mechanism and destructively modifies an untaitned
string to be tainted. With this an attacker can modify arbitrary
untainted strings like this:

    $secret_path = "foo"

    proc do
        $SAFE = 4
        Exception.new($secret_path).to_s
        $secret_path.replace "/etc/passwd"
    end.call

    open($secret_path) do
      ...
    end

### Affected versions

Luckily this attack is ineffective for 1.9.x series of ruby. Affected
versions are restricted to:

* Ruby 1.8.6 patchlevel 420 and all prior versions
* Ruby 1.8.7 patchlevel 330 and all prior versions
* Development versions of Ruby 1.8 (1.8.8dev)

### Solutions

Please upgrade to a newer version.

### Updates

* 1\.8.7-334 was released to fix this issue. 1.8.7 users are encouraged
  to upgrade.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
