---
layout: news_post
title: "Regression of Hash#reject in Ruby 2.1.1"
author: "sorah"
translator:
date: 2014-03-10 14:00:00 +0000
lang: vi
---

In Ruby 2.1.0 or earlier, the `reject` method in any class that inherits
`Hash` returns an object of its own class.
But in Ruby 2.1.1, this behavior has changed accidentally to return always
a plain Hash object, not of the inherited class.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(To be exact, extra states such as instance variables, etc. aren't
copied either.)

Ruby 2.1.1 shouldn't include such behavior changes, because with the release
of Ruby 2.1.0 we've [changed our versioning policy](https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
so Ruby 2.1.1 is a patch level release and it shouldn't break backwards
compatibility.

This regression could potentially affect many libraries, one such case is
Rails' `HashWithIndifferentAccess` and `OrderedHash`. They are broken:
[Rails' issue #14188](https://github.com/rails/rails/issues/14188).

This behavior will be reverted to the 2.1.0 behavior in Ruby 2.1.2,
but is expected to be the default behavior for Ruby 2.2.0:
[Feature #9223](https://bugs.ruby-lang.org/issues/9223).
So we recommend to fix your code in order to expect this behavior change.

This accident is caused by one missing backport commit. For more details, see
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Sorry for any inconvenience, and thank you for your support.
