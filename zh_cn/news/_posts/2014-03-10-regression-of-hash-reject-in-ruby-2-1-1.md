---
layout: news_post
title: "关于 Ruby 2.1.1 中包含的 Hash#reject 不正确的情况"
author: "sorah"
translator: "ywjno"
date: 2014-03-10 14:00:00 +0000
lang: zh_cn
---

直到 Ruby 2.1.0 为止，继承了 `Hash` 的类的 `reject` 方法，将会返回那个继承的类的对象。
但是在 Ruby 2.1.1 中，不小心出现了错误的变动，变成了即使在继承了 Hash 的类的情况下，也必定会返回 Hash 类的对象。

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(正确的说，实例变量等其他的属性也都没有被复制过来)

因为从 Ruby 2.1.0 开始实施的[版本变动方针](https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/)，Ruby 2.1.1 是属于补丁级别的发布。而补丁级别的发布应该是保持向下兼容，因此在 Ruby 2.1.1 中不应该加入这个变动。

这个错误的变动可能对某些库造成了影响。其中一个被发现的事例是
Rails 中的 `HashWithIndifferentAccess` 与 `OrderedHash`：[Rails issue #14188](https://github.com/rails/rails/issues/14188)

这个变动打算将在 Ruby 2.1.2 中回到原来的状态。但是在这个 [Feature #9223](https://bugs.ruby-lang.org/issues/9223) 的讨论中，这个修正将预计在 Ruby 2.2.0 中导入。
我们假设您的代码将按照这个变动进行修改。

此外，这个错误是源于漏了一个兼容性的提交。包括对策等详细的情况请参照这篇文章：[http://diary.sorah.jp/2014/02/28/ruby211-hash-reject](http://diary.sorah.jp/2014/02/28/ruby211-hash-reject)

给您带来的不便我们深感抱歉。
