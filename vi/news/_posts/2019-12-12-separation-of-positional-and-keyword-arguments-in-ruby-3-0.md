---
layout: news_post
title: "Separation of positional and keyword arguments in Ruby 3.0"
author: "mame"
translator:
date: 2019-12-12 12:00:00 +0000
lang: vi
---

This article explains the planned incompatibility of keyword arguments in Ruby 3.0

## tl;dr

In Ruby 3.0, positional arguments and keyword arguments will be separated.  Ruby 2.7 will warn for behaviors that will change in Ruby 3.0.  If you see the following warnings, you need to update your code:

* `Using the last argument as keyword parameters is deprecated`, or
* `Passing the keyword argument as the last hash parameter is deprecated`, or
* `Splitting the last argument into positional and keyword parameters is deprecated`

In most cases, you can avoid the incompatibility by adding the _double splat_ operator. It explicitly specifies passing keyword arguments instead of a `Hash` object. Likewise, you may add braces `{}` to explicitly pass a `Hash` object, instead of keyword arguments. Read the section "Typical cases" below for more details.

In Ruby 3, a method delegating all arguments must explicitly delegate keyword arguments in addition to positional arguments.  If you want to keep the delegation behavior found in Ruby 2.7 and earlier, use `ruby2_keywords`.   See the "Handling argument delegation" section below for more details.

## Typical cases
{: #typical-cases }

Here is the most typical case. You can use double splat operator (`**`) to pass keywords instead of a Hash.

{% highlight ruby %}
# This method accepts only a keyword argument
def foo(k: 1)
  p k
end

h = { k: 42 }

# This method call passes a positional Hash argument
# In Ruby 2.7: The Hash is automatically converted to a keyword argument
# In Ruby 3.0: This call raises an ArgumentError
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# If you want to keep the behavior in Ruby 3.0, use double splat
foo(**h) #=> 42
{% endhighlight %}

Here is another case.  You can use braces (`{}`) to pass a Hash instead of keywords explicitly.

{% highlight ruby %}
# This method accepts one positional argument and a keyword rest argument
def bar(h, **kwargs)
  p h
end

# This call passes only a keyword argument and no positional arguments
# In Ruby 2.7: The keyword is converted to a positional Hash argument
# In Ruby 3.0: This call raises an ArgumentError
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# If you want to keep the behavior in Ruby 3.0, write braces to make it an
# explicit Hash
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## What is deprecated?
{: #what-is-deprecated }

In Ruby 2, keyword arguments can be treated as the last positional Hash argument and a last positional Hash argument can be treated as keyword arguments.

Because the automatic conversion is sometimes too complex and troublesome as described in the final section.  So it's now deprecated in Ruby 2.7 and will be removed in Ruby 3.  In other words, keyword arguments will be completely separated from positional one in Ruby 3.  So when you want to pass keyword arguments, you should always use `foo(k: expr)` or `foo(**expr)`.  If you want to accept keyword arguments, in principle you should always use `def foo(k: default)` or `def foo(k:)` or `def foo(**kwargs)`.

Note that Ruby 3.0 doesn't behave differently when calling a method which doesn't accept keyword arguments with keyword arguments. For instance, the following case is not going to be deprecated and will keep working in Ruby 3.0. The keyword arguments are still treated as a positional Hash argument.

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

This is because this style is used very frequently, and there is no ambiguity in how the argument should be treated. Prohibiting this conversion would result in additional incompatibility for little benefit.

However, this style is not recommended in new code, unless you are often passing a Hash as a positional argument, and are also using keyword arguments.  Otherwise, use double splat:

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## Will my code break on Ruby 2.7?
{: #break-on-ruby-2-7 }

A short answer is "maybe not".

The changes in Ruby 2.7 are designed as a migration path towards 3.0.  While in principle, Ruby 2.7 only warns against behaviors that will change in Ruby 3, it includes some incompatible changes we consider to be minor.  See the "Other minor changes" section for details.

Except for the warnings and minor changes, Ruby 2.7 attempts to keep the compatibility with Ruby 2.6.  So, your code will probably work on Ruby 2.7, though it may emit warnings.  And by running it on Ruby 2.7, you can check if your code is ready for Ruby 3.0.

If you want to disable the deprecation warnings, please use a command-line argument `-W:no-deprecated` or add `Warning[:deprecated] = false` to your code.

## Handling argument delegation
{: #delegation }

### Ruby 2.6 or prior
{: #delegation-ruby-2-6-or-prior }

In Ruby 2, you can write a delegation method by accepting a `*rest` argument and a `&block` argument, and passing the two to the target method.  In this behavior, the keyword arguments are also implicitly handled by the automatic conversion between positional and keyword arguments.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3
{: #delegation-ruby-3 }

You need to explicitly delegate keyword arguments.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

Alternatively, if you do not need compatibility with Ruby 2.6 or prior and you don't alter any arguments, you can use the new delegation syntax (`...`) that is introduced in Ruby 2.7.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7
{: #delegation-ruby-2-7 }

In short: use `Module#ruby2_keywords` and delegate `*args, &block`.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords` accepts keyword arguments as the last Hash argument, and passes it as keyword arguments when calling the other method.

In fact, Ruby 2.7 allows the new style of delegation in many cases.  However, there is a known corner case.  See the next section.

### A compatible delegation that works on Ruby 2.6, 2.7 and Ruby 3
{: #a-compatible-delegation }

In short: use `Module#ruby2_keywords` again.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

Unfortunately, we need to use the old-style delegation (i.e., no `**kwargs`) because Ruby 2.6 or prior does not handle the new delegation style correctly.  This is one of the reasons of the keyword argument separation; the details are described in the final section. And `ruby2_keywords` allows you to run the old style even in Ruby 2.7 and 3.0.  As there is no `ruby2_keywords` defined in 2.6 or prior, please use the [ruby2_keywords gem](https://rubygems.org/gems/ruby2_keywords) or define it yourself:

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

If your code doesn't have to run on Ruby 2.6 or older, you may try the new style in Ruby 2.7.  In almost all cases, it works.  Note that, however, there are unfortunate corner cases as follows:

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []   ({} is dropped)
foo({}, **{}) #=> Ruby 2.7: [{}] (You can pass {} by explicitly passing "no" keywords)
{% endhighlight %}

An empty Hash argument is automatically converted and absorbed into `**kwargs`, and the delegation call removes the empty keyword hash, so no argument is passed to `target`.  As far as we know, this is the only corner case.

As noted in the last line, you can work around this issue by using `**{}`.

If you really worry about the portability, use `ruby2_keywords`.  (Acknowledge that Ruby 2.6 or before themselves have tons of corner cases in keyword arguments. :-)
`ruby2_keywords` might be removed in the future after Ruby 2.6 reaches end-of-life. At that point, we recommend to explicitly delegate keyword arguments (see Ruby 3 code above).

## Other minor changes
{: #other-minor-changes }

There are three minor changes about keyword arguments in Ruby 2.7.

### 1. Non-Symbol keys are allowed in keyword arguments
{: #other-minor-changes-non-symbol-keys }

In Ruby 2.6 or before, only Symbol keys were allowed in keyword arguments.  In Ruby 2.7, keyword arguments can use non-Symbol keys.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6 or before: ArgumentError: wrong number of arguments
  #=> Ruby 2.7 or later: {"key"=>42}
{% endhighlight %}

If a method accepts both optional and keyword arguments, the Hash object that has both Symbol keys and non-Symbol keys was split in two in Ruby 2.6.  In Ruby 2.7, both are accepted as keywords because non-Symbol keys are allowed.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# Use braces to keep the behavior
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 and 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7 still splits hashes with a warning if passing a Hash or keyword arguments with both Symbol and non-Symbol keys to a method that accepts explicit keywords but no keyword rest argument (`**kwargs`).  This behavior will be removed in Ruby 3, and an `ArgumentError` will be raised.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6 and 2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2. Double splat with an empty hash (`**{}`)  passes no arguments
{: #other-minor-changes-empty-hash }

In Ruby 2.6 or before, passing `**empty_hash` passes an empty Hash as a positional argument.  In Ruby 2.7 or later, it passes no arguments.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 or before: [{}]
  #=> Ruby 2.7 or later: []
{% endhighlight %}

Note that `foo(**{})` passes nothing in both Ruby 2.6 and 2.7.  In Ruby 2.6 and before, `**{}` is removed by the parser, and in Ruby 2.7 and above, it is treated the same as `**empty_hash`, allowing for an easy way to pass no keyword arguments to a method.

In Ruby 2.7, when calling a method with an insufficient number of required positional arguments, `foo(**empty_hash)` passes an empty hash with a warning emitted, for compatibility with Ruby 2.6.  This behavior will be removed in 3.0.

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 or before: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. The no-keyword-arguments syntax (`**nil`) is introduced
{: #other-minor-changes-double-splat-nil }

You can use `**nil` in a method definition to explicitly mark the method accepts no keyword arguments. Calling such methods with keyword arguments will result in an `ArgumentError`. (This is actually a new feature, not an incompatibility)

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7 or later: no keywords accepted (ArgumentError)
{% endhighlight %}

This is useful to make it explicit that the method does not accept keyword arguments.  Otherwise, the keywords are absorbed in the rest argument in the above example.  If you extend a method to accept keyword arguments, the method may have incompatibility as follows:

{% highlight ruby %}
# If a method accepts rest argument and no `**nil`
def foo(*args)
  p args
end

# Passing keywords are converted to a Hash object (even in Ruby 3.0)
foo(k: 1) #=> [{:k=>1}]

# If the method is extended to accept a keyword
def foo(*args, mode: false)
  p args
end

# The existing call may break
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## Why we're deprecating the automatic conversion
{: #why-deprecated }

The automatic conversion initially appeared to be a good idea, and worked well in many cases.  However, it had too many corner cases, and we have received many bug reports about the behavior.

Automatic conversion does not work well when a method accepts optional positional arguments and keyword arguments.  Some people expect the last Hash object to be treated as a positional argument, and others expect it to be converted to keyword arguments.

Here is one of the most confusing cases:

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> expected: [{}, {}], actual: [1, {}]
{% endhighlight %}

In Ruby 2, `foo({})` passes an empty hash as a normal argument (i.e., `{}` is assigned to `x`), while `bar({})` passes a keyword argument (i.e, `{}` is assigned to `kwargs`).  So `any_method({})` is very ambiguous.

You may think of `bar({}, **{})` to pass the empty hash to `x` explicitly.  Surprisingly, it does not work as you expected; it still prints `[1, {}]` in Ruby 2.6.  This is because `**{}` is ignored by the parser in Ruby 2.6, and the first argument `{}` is automatically converted to keywords (`**kwargs`).  In this case, you need to call `bar({}, {})`, which is very weird.

The same issues also apply to methods that accept rest and keyword arguments.  This makes explicit delegation of keyword arguments not work.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6 or before: [{}]
      #=> Ruby 2.7 or later:  []
{% endhighlight %}

`foo()` passes no arguments, but `target` receives an empty hash argument in Ruby 2.6.  This is because the method `foo` delegates keywords (`**kwargs`) explicitly.  When `foo()` is called, `args` is an empty Array, `kwargs` is an empty Hash, and `block` is `nil`.  And then `target(*args, **kwargs, &block)` passes an empty Hash as an argument because `**kwargs` is automatically converted to a positional Hash argument.

The automatic conversion not only confuses people but also makes the method less extensible.  See [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183) for more details about the reasons for the change in behavior, and why certain implementation choices were made.

## Acknowledgment

This article was kindly reviewed (or even co-authored) by Jeremy Evans and Benoit Daloze.

## History

* Updated 2019-12-25: In 2.7.0-rc2, the warning message was slightly changed, and an API to suppress the warnings was added.
