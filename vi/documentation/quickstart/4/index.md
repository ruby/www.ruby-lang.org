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
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby in Twenty Minutes</h1>

---

So, looking deeper at our new program, notice the initial lines, which
begin with a hash mark (#). In Ruby, anything on a line after a hash
mark is a comment and is ignored by the interpreter. The first line of
the file is a special case, and under a Unix-like operating system tells
the shell how to run the file. The rest of the comments are there just
for clarity.

Our `say_hi` method has become a bit trickier:

{% highlight ruby %}
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
{% endhighlight %}

It now looks at the `@names` instance variable to make decisions. If
it’s nil, it just prints out three dots. No point greeting nobody,
right?

## Cycling and Looping—a.k.a. Iteration

If the `@names` object responds to `each`, it is something that you can
iterate over, so iterate over it and greet each person in turn. Finally,
if `@names` is anything else, just let it get turned into a string
automatically and do the default greeting.

Let’s look at that iterator in more depth:

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` is a method that accepts a block of code then runs that block of
code for every element in a list, and the bit between `do` and `end` is
just such a block. A block is like an anonymous function or `lambda`.
The variable between pipe characters is the parameter for this block.

What happens here is that for every entry in a list, `name` is bound to
that list element, and then the expression `puts "Hello #{name}!"` is
run with that name.

Most other programming languages handle going over a list using the
`for` loop, which in C looks something like:

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

This works, but isn’t very elegant. You need a throw-away variable like
`i`, have to figure out how long the list is, and have to explain how to
walk over the list. The Ruby way is much more elegant, all the
housekeeping details are hidden within the `each` method, all you need
to do is to tell it what to do with each element. Internally, the `each`
method will essentially call `yield "Albert"`, then `yield "Brenda"` and
then `yield "Charles"`, and so on.

## Blocks, the Highly Sparkling Glint on the Edge of Ruby

The real power of blocks is when dealing with things that are more
complicated than lists. Beyond handling simple housekeeping details
within the method, you can also handle setup, teardown, and errors—all
hidden away from the cares of the user.

{% highlight ruby %}
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
{% endhighlight %}

The `say_bye` method doesn’t use `each`, instead it checks to see if
`@names` responds to the `join` method, and if so, uses it. Otherwise,
it just prints out the variable as a string. This method of not caring
about the actual *type* of a variable, just relying on what methods it
supports is known as “Duck Typing”, as in “if it walks like a duck and
quacks like a duck…”. The benefit of this is that it doesn’t
unnecessarily restrict the types of variables that are supported. If
someone comes up with a new kind of list class, as long as it implements
the `join` method with the same semantics as other lists, everything
will work as planned.

## Kicking Off the Script

So, that’s the MegaGreeter class, the rest of the file just calls
methods on that class. There’s one final trick to notice, and that’s the
line:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` is the magic variable that contains the name of the current
file. `$0` is the name of the file used to start the program. This check
says “If this is the main file being used…” This allows a file to be
used as a library, and not to execute code in that context, but if the
file is being used as an executable, then execute that code.

## Consider Yourself Introduced

So that’s it for the quick tour of Ruby. There’s a lot more to explore,
the different control structures that Ruby offers; the use of blocks and
`yield`; modules as mixins; and more. I hope this taste of Ruby has left
you wanting to learn more.

If so, please head on over to our [Documentation](/en/documentation/)
area, which rounds up links to manuals and tutorials, all freely
available online.
