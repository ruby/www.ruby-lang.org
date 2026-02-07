---
layout: page
title: "Ruby in Twenty Minutes"
lang: vi

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Part 4">4</a>
  </div>
  <h1>Ruby in Twenty Minutes</h1>

---

## Introduction

This is a small Ruby tutorial that should take no more than 20 minutes
to complete. It makes the assumption that you already have Ruby installed.
(If you do not have Ruby on your computer [install][installation] it
before you get started.)

## Interactive Ruby

Ruby comes with a program that will show the results of any Ruby
statements you feed it. Playing with Ruby code in interactive sessions
like this is a terrific way to learn the language.

Open up IRB (which stands for Interactive Ruby).

* If you’re using **macOS** open up `Terminal` and type `irb`, then
  hit enter.
* If you’re using **Linux**, open up a shell and type `irb` and hit
  enter.
* If you’re using **Windows**, open `Interactive Ruby` from the
  Ruby section of your Start Menu.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Ok, so it’s open. Now what?

Type this: `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby Obeyed You!

What just happened? Did we just write the world’s shortest “Hello World”
program? Not exactly. The second line is just IRB’s way of telling us
the result of the last expression it evaluated. If we want to print out
“Hello World” we need a bit more:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` is the basic command to print something out in Ruby. But then
what’s the `=> nil` bit? That’s the result of the expression. `puts`
always returns nil, which is Ruby’s absolutely-positively-nothing value.

## Your Free Calculator is Here

Already, we have enough to use IRB as a basic calculator:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Three plus two. Easy enough. What about three *times* two? You could
type it in, it’s short enough, but you may also be able to go up and
change what you just entered. Try hitting the **up-arrow** on your
keyboard and see if it brings up the line with `3+2` on it. If it does,
you can use the left arrow key to move just after the `+` sign and then
use backspace to change it to a `*` sign.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Next, let’s try three squared:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

In Ruby `**` is the way you say “to the power of”. But what if you want
to go the other way and find the square root of something?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Ok, wait, what was that last one? If you guessed, “it was figuring out
the square root of nine,” you’re right. But let’s take a closer look at
things. First of all, what’s `Math`?

## Modules Group Code by Topic

`Math` is a built-in module for mathematics. Modules serve two roles in
Ruby. This shows one role: grouping similar methods together under a
familiar name. `Math` also contains methods like `sin()` and `tan()`.

Next is a dot. What does the dot do? The dot is how you identify the
receiver of a message. What’s the message? In this case it’s `sqrt(9)`,
which means call the method `sqrt`, shorthand for “square root” with the
parameter of `9`.

The result of this method call is the value `3.0`. You might notice it’s
not just `3`. That’s because most of the time the square root of a
number won’t be an integer, so the method always returns a
floating-point number.

What if we want to remember the result of some of this math? Assign the
result to a variable.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

As great as this is for a calculator, we’re getting away from the
traditional `Hello World` message that beginning tutorials are supposed
to focus on… [so let’s go back to that.](2/)

[installation]: /en/documentation/installation/
