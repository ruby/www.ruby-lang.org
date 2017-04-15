---
layout: page
title: "Offical Ruby FAQ"
lang: en

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <strong>11</strong>
  </div>
  <h1>Official Ruby FAQ</h1>

---

11. Other Features

11.1 What does a ? b : c mean?

It's the same as saying if a then b else c end.

11.2 How can I count the number of lines in a file?

Assuming that the file ends in a linefeed, the following code may give the fastest result.

                

open("example").read.count("\n")  # -> 3

11.3 What do begin and end of MatchingData return?

They act with $ , and return the start index and the end index of the matched data ($0) in the original string. See an example in tab expansion.

11.4 How can I sum the elements in an array?

Rather than solve the specific problem, let's solve the general case. The first thing we'll do is produce a method that will iterate over an Enumerable object and collect a single result. Smalltalk calls that method inject, so we will too:

                

module Enumerable

  # inject(n) { |n, i| ...}
  def inject(n)
    each { |i|
      n = yield(n, i)
    }
    n
  end
end

Notice how we've added the method to Enumerable. This means that anything that includes Enumerable can now use inject. But how do we use it? It takes a single argument `n' and a block. For each element in the thing being enumerated, it calls the block, passing in `n' and the element itself. The result of the block is assigned back to `n'. So, to define sum, we could write:

                

module Enumerable
  def sum
    inject(0) {|n, i|  n + i }
  end
end

[1,3,5,7,9].sum  # -> 25
(1..100).sum     # -> 5050

11.5 How can I use continuations?

Ruby's continuations allow you to create an object representing a place in a Ruby program, and then return to that place at any time (even if it has apparently gone out of scope). Continuations can be used to implement complex control structures, but are typically more useful as ways of confusing people.

In [ruby-talk:4482], Jim Weirich posted the following examples of continuations:

                

# --------------------------------------------------------------------
# Simple Producer/Consumer
# --------------------------------------------------------------------
# Connect a simple counting task and a printing task together using
# continuations.
#
# Usage:  count(limit)

def count_task(count, consumer)
  (1..count).each do
    |i|
    callcc {|cc| consumer.call cc, i }
  end
  nil
end

def print_task()
  producer, i = callcc { |cc| return cc }
  print "#{i} "
  callcc { |cc| producer.call }
end

def count(limit)
  count_task(limit, print_task())
  print "\n"
end

                

# --------------------------------------------------------------------
# Filtering Out Multiples of a Given Number
# --------------------------------------------------------------------
# Create a filter that is both a consumer and producer.  Insert it
# between the counting task and the printing task.
# 
# Usage:  omit (2, limit)

def filter_task(factor, consumer)
  producer, i = callcc { |cc| return cc }
  if (i%factor) != 0 then
    callcc { |cc| consumer.call cc, i }
  end
  producer.call
end

def omit(factor, limit)
  printer = print_task()
  filter = filter_task(factor, printer)
  count_task(limit, filter)
  print "\n"
end

                

# --------------------------------------------------------------------
# Prime Number Generator
# --------------------------------------------------------------------
# Create a prime number generator.  When a new prime number is
# discovered, dynamically add a new multiple filter to the chain of
# producers and consumers.
#
# Usage:  primes (limit)

def prime_task(consumer)
  producer, i = callcc { |cc| return cc }
  if i >= 2 then
    callcc { |cc| consumer.call cc, i }
    consumer = filter_task(i, consumer)
  end
  producer.call
end

def primes(limit)
  printer = print_task()
  primes = prime_task(printer)
  count_task(limit, primes)
  print "\n"
end


