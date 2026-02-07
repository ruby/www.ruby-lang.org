---
layout: page
title: "Ruby in Twenty Minutes"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>Ruby in Twenty Minutes</h1>

---

Now let’s create a greeter object and use it:

{% highlight irb %}
irb(main):035:0> greeter = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> greeter.say_hi
Hi Pat!
=> nil
irb(main):037:0> greeter.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Once the `greeter` object is created, it remembers that the name is Pat. Hmm,
what if we want to get at the name directly?

{% highlight irb %}
irb(main):038:0> greeter.@name
SyntaxError: (irb):38: syntax error, unexpected tIVAR, expecting '('
{% endhighlight %}

Nope, can’t do it.

## Under the Object’s Skin

Instance variables are hidden away inside the object. They’re not
terribly hidden, you see them whenever you inspect the object, and there
are other ways of accessing them, but Ruby uses the good object-oriented
approach of keeping data sort-of hidden away.

So what methods do exist for Greeter objects?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> [:say_hi, :say_bye, :instance_of?, :public_send,
    :instance_variable_get, :instance_variable_set,
    :instance_variable_defined?, :remove_instance_variable,
    :private_methods, :kind_of?, :instance_variables, :tap,
    :is_a?, :extend, :define_singleton_method, :to_enum,
    :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?,
    :freeze, :inspect, :display, :send, :object_id, :to_s,
    :method, :public_method, :singleton_method, :nil?, :hash,
    :class, :singleton_class, :clone, :dup, :itself, :taint,
    :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods,
    :protected_methods, :frozen?, :public_methods, :singleton_methods,
    :!, :==, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

Whoa. That’s a lot of methods. We only defined two methods. What’s going
on here? Well this is **all** of the methods for Greeter objects, a
complete list, including ones defined by ancestor classes. If we want to
just list methods defined for Greeter we can tell it to not include
ancestors by passing it the parameter `false`, meaning we don’t want
methods defined by ancestors.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> [:say_hi, :say_bye]
{% endhighlight %}

Ah, that’s more like it. So let’s see which methods our greeter object
responds to:

{% highlight irb %}
irb(main):041:0> greeter.respond_to?("name")
=> false
irb(main):042:0> greeter.respond_to?("say_hi")
=> true
irb(main):043:0> greeter.respond_to?("to_s")
=> true
{% endhighlight %}

So, it knows `say_hi`, and `to_s` (meaning convert something to a
string, a method that’s defined by default for every object), but it
doesn’t know `name`.

## Altering Classes—It’s Never Too Late

But what if you want to be able to view or change the name? Ruby
provides an easy way of providing access to an object’s variables.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

In Ruby, you can reopen a class and modify it. The changes will
be present in any new objects you create and even available in existing
objects of that class. So, let’s create a new object and play with its
`@name` property.

{% highlight irb %}
irb(main):047:0> greeter = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> greeter.respond_to?("name")
=> true
irb(main):049:0> greeter.respond_to?("name=")
=> true
irb(main):050:0> greeter.say_hi
Hi Andy!
=> nil
irb(main):051:0> greeter.name="Betty"
=> "Betty"
irb(main):052:0> greeter
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> greeter.name
=> "Betty"
irb(main):054:0> greeter.say_hi
Hi Betty!
=> nil
{% endhighlight %}

Using `attr_accessor` defined two new methods for us, `name` to get the
value, and `name=` to set it.

## Greeting Anything and Everything, MegaGreeter Neglects None!

This greeter isn’t all that interesting though, it can only deal with
one person at a time. What if we had some kind of MegaGreeter that could
either greet the world, one person, or a whole list of people?

Let’s write this one in a file instead of directly in the interactive
Ruby interpreter IRB.

To quit IRB, type “quit”, “exit” or just hit Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end
end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Save this file as “ri20min.rb”, and run it as “ruby ri20min.rb”. The
output should be:

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

There are a lot of new things thrown into this final example that we
[can take a deeper look at.](../4/)
