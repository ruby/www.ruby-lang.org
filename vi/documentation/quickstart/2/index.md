---
layout: page
title: "Ruby in Twenty Minutes"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>Ruby in Twenty Minutes</h1>

---

What if we want to say “Hello” a lot without getting our fingers all
tired? We need to define a method!

{% highlight irb %}
irb(main):010:0> def hi
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> :hi
{% endhighlight %}

The code `def hi` starts the definition of the method. It tells Ruby that
we’re defining a method, that its name is `hi`. The next line is the body
of the method, the same line we saw earlier: `puts "Hello World"`.
Finally, the last line `end` tells Ruby we’re done defining the method.
Ruby’s response `=> :hi` tells us that it knows we’re done defining the
method. This response could be `=> nil` for Ruby 2.0 and earlier versions.
But, it's not important here, so let's go on.

## The Brief, Repetitive Lives of a Method

Now let’s try running that method a few times:

{% highlight irb %}
irb(main):013:0> hi
Hello World!
=> nil
irb(main):014:0> hi()
Hello World!
=> nil
{% endhighlight %}

Well, that was easy. Calling a method in Ruby is as easy as just
mentioning its name to Ruby. If the method doesn’t take parameters
that’s all you need. You can add empty parentheses if you’d like, but
they’re not needed.

What if we want to say hello to one person, and not the whole world?
Just redefine `hi` to take a name as a parameter.

{% highlight irb %}
irb(main):015:0> def hi(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> :hi
irb(main):018:0> hi("Matz")
Hello Matz!
=> nil
{% endhighlight %}

So it works… but let’s take a second to see what’s going on here.

## Holding Spots in a String

What’s the `#{name}` bit? That’s Ruby’s way of inserting something into
a string. The bit between the braces is turned into a string (if it
isn’t one already) and then substituted into the outer string at that
point. You can also use this to make sure that someone’s name is
properly capitalized:

{% highlight irb %}
irb(main):019:0> def hi(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> :hi
irb(main):022:0> hi "chris"
Hello Chris!
=> nil
irb(main):023:0> hi
Hello World!
=> nil
{% endhighlight %}

A couple of other tricks to spot here. One is that we’re calling the
method without parentheses again. If it’s obvious what you’re doing, the
parentheses are optional. The other trick is the default parameter
`World`. What this is saying is “If the name isn’t supplied, use the
default name of `"World"`”.

## Evolving Into a Greeter

What if we want a real greeter around, one that remembers your name and
welcomes you and treats you always with respect. You might want to use
an object for that. Let’s create a “Greeter” class.

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> :say_bye
{% endhighlight %}

The new keyword here is `class`. This defines a new class called Greeter
and a bunch of methods for that class. Also notice `@name`. This is an
instance variable, and is available to all the methods of the class. As
you can see it’s used by `say_hi` and `say_bye`.

So how do we get this Greeter class set in motion?
[Create an object.](../3/)
