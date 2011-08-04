---
layout: page
title: About Ruby
---

Wondering why Ruby is so popular? Its fans call it a beautiful,
artful language. And yet, they say it's handy and practical. 
What gives?

### The Ideals of Ruby's Creator

<p style="float:right"><img src="http://redhanded.hobix.com/images/ruby-lang-matz.png" style="padding-left:8px;" alt=""></p>

Ruby is a language of careful balance. Its creator,
[Yukihiro "matz" Matsumoto](http://www.rubyist.net/~matz/), blended parts
of his favorite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to form
a new language that balanced functional programming with imperative
programming.

He has often said that he is "trying to make Ruby natural, not simple,"
in a way that mirrors life.

Building on this, he adds:

> Ruby is simple in appearance, but is very complex inside, just like
> our human body <sup markdown="true">[1](#fn1)</sup>.

### About Ruby's Growth

Since its public release in 1995, Ruby has drawn devoted coders worldwide.
In 2006, Ruby achieved mass acceptance. With active user groups formed in
the world's major cities and Ruby-related conferences filled to capacity.

<p style="float:right"><img src="http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=280&amp;height=140&amp;title=Ruby-Talk+Activity" style="padding-left:8px;" title="Graph courtesy of Gmane." alt="Graph courtesy of Gmane."></p>

Ruby-Talk, the primary [mailing list](/community/mailing-lists/) for
discussion of the Ruby language, climbed to an average of 200 messages per
day in 2006. It has dropped in recent years as the size of the community
pushed discussion from one central list into many smaller groups.

The TIOBE index, which measures the growth of programming languages,
ranks Ruby as #9 among programming languages worldwide. Much of the growth
is attributed to the popularity of software written in Ruby, particularly
the Ruby on Rails web framework <sup markdown="true">[2](#fn2)</sup>.


Ruby is also [totally free](/license.txt). Not only free of charge, but
also free to use, copy, modify, and distribute.

### Seeing Everything as an Object


Initially, Matz looked at other languages to find an ideal syntax.
Recalling his search, he said, "I wanted a scripting language that was more
powerful than Perl, and more object-oriented than Python
<sup markdown="true">[1](#fn3)</sup>."


In Ruby, everything is an object. Every bit of information and code can be
given their own properties and actions. Object-oriented programming calls
properties by the name _instance variables_ and actions are known as
_methods_.  Ruby's pure object-oriented approach is most commonly
demonstrated by a bit of code which applies an action to a number.

    {% highlight ruby %}
    5.times { print "We *love* Ruby -- it's outrageous!" }
    {% endhighlight %}

### Ruby's Flexibility

Ruby is seen as a flexible language, since it allows its users to freely
alter its parts. Essential parts of Ruby can be removed or redefined,
at will. Existing parts can be added upon. Ruby tries not to restrict the
coder.

For example, addition is performed with the plus (`+`) operator. But,
if you'd rather use the readable word `plus`, you could add such a method to
Ruby's builtin `Numeric` class.

    {% highlight ruby %}
    class Numeric
      def plus(x)
        self.+(x)
      end
    end
    
    y = 5.plus 6
    # y is now equal to 11
    {% endhighlight %}

Ruby's operators are syntactic sugar for methods. You can redefine them as
well.

### Blocks, a Truly Expressive Feature

Ruby's block are also seen as a source of great flexibility. A programmer
can attach a closure to any method, describing how that method should act. 
The closure is called a _block_ and has become one of the most
popular features for newcomers to Ruby from other imperative languages
like PHP or Visual Basic.

Blocks are inspired by functional languages. Matz said, "in Ruby closures,
I wanted to respect the Lisp culture <sup markdown="true">[4](#fn4)</sup>"

    {% highlight ruby %}
    search_engines = %w[Google Yahoo MSN].map do |engine|
      "http://www." + engine.downcase + ".com"
    end
    {% endhighlight %}

In the above code, the block is described inside the `do ... end`
construct. The `map` method applies the block to the provided list of words.
Many other methods in Ruby leave a hole open for a coder to write their own 
block to fill in the details of what that method should do.

### Ruby and the Mixin

Unlike many object-oriented languages, Ruby features single inheritance
only, **on purpose**. But Ruby knows the concept of modules
(called Categories in Objective-C). Modules are collections of methods.

Classes can mixin a module and receive all its methods for free.
For example, any class which implements the `each` method can mixin the
`Enumerable` module, which adds a pile of methods that use `each` for
looping.

    {% highlight ruby %}
    class MyArray
      include Enumerable
    end
    {% endhighlight %}

Generally, Rubyists see this as a much clearer way than multiple
inheritance, which is complex and can be too restrictive.

### Ruby's Visual Appearance

While Ruby often uses very limited punctuation and usually prefers English
keywords, some punctuation is used to decorate Ruby. Ruby needs no variable
declarations. It uses simple naming conventions to denote the scope of
variables.

* `var` could be a local variable.
* `@var` is an instance variable.
* `$var` is a global variable.

These sigils enhance readability by allowing the programmer to easily
identify the roles of each variable. It also becomes unnecessary to use a
tiresome `self.` prepended to every instance member.

### Beyond the Basics

Ruby has a wealth of other features, among which are the following:

* Ruby has exception handling features, like Java or Python,
  to make it easy to handle errors.
* Ruby features a true mark-and-sweep garbage collector for all Ruby
  objects. No need to maintain reference counts in extension
  libraries. As Matz says, "This is better for your health."
* Writing C extensions in Ruby is easier than in Perl or Python, with a
  very elegant API for calling Ruby from C. This includes calls for
  embedding Ruby in software, for use as a scripting language.
  A SWIG interface is also available.
* Ruby can load extension libraries dynamically if an OS allows.
* Ruby features OS independent threading. Thus, for all platforms on which
  Ruby runs, you also have multithreading, regardless of if the OS supports
  it or not, even on MS-DOS!
* Ruby is highly portable: it is developed mostly on GNU/Linux,
  but works on many types of UNIX, Mac OS X, Windows 95/98/Me/NT/2000/XP,
  DOS, BeOS, OS/2, etc.

#### References

<p id="fn1">
  <sup>1</sup> Matz, speaking on the Ruby-Talk mailing list,
  <a href="http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773">May 12th, 2000</a>.
</p>

<p id="fn2">
  <sup>2</sup> See the <a href="http://rubyonrails.org/">Ruby on Rails</a> home page for more.
</p>

<p id="fn3">
  <sup>3</sup> Matz, in <a href="http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html">An Interview with the Creator of Ruby</a>, Nov. 29th, 2001.
</p>

<p id="fn4">
  <sup>4</sup> Matz, in <a href="http://www.artima.com/intv/closures2.html">Blocks and Closures in Ruby</a>,
  December 22nd, 2003.
</p>
