---
layout: news_post
title: "Ruby 2.1.1 誤變更了 Hash#reject 的行為"
author: "sorah"
translator: "Juanito Fatas"
date: 2014-03-10 14:00:00 +0000
lang: zh_tw
---

在 Ruby 2.1.0 以及之前的版本，任何從 `Hash` 類別繼承來的 `reject` 方法，會回傳繼承類別的物件。但 Ruby 2.1.1 不小心改到這個行為，`reject` 現在會回傳純 Hash 物件，而不是從 Hash 繼承而來的類別。

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

（精準的說，沒有複製到像是實體變數等額外的狀態。）

根據先前修正的 Ruby 2.1.0 的[版本發佈方針](https://www.ruby-lang.org/zh_tw/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/)，Ruby 2.1.1 不應該改變 `Hash#reject` 的行為。Ruby 2.1.1 是補丁等級的發佈，應該要保持向下相容性。

這次錯誤的行為變更可能會有許多函式庫受影響，一個例子是 Rails 的 `HashWithIndifferentAccess` 與 `OrderedHash` 壞掉了，見：[Rails' issue #14188](https://github.com/rails/rails/issues/14188)。

Ruby 2.1.2 會把這個錯誤改正過來。但回傳純 Hash 將會是 Ruby 2.2.0 的預設行為，見：[Feature #9223](https://bugs.ruby-lang.org/issues/9223)。所以我們推薦您提前針對此變動，相應修正程式碼。

這次意外起源於漏了一個相容性提交。更多細節請參見：
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211)。

造成您的不便深感抱歉，感謝您的支持。
