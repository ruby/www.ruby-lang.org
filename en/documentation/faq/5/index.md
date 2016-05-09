---
layout: page
title: "Official Ruby FAQ"
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
    <strong>5</strong>
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
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

## Iterators

### What is an iterator?

An iterator is a method which accepts a block or a Proc object. In the source file, the block is placed immediately after the invocation of the method. Iterators are used to produce user-defined control structures--especially loops.

Let's look at an example to see how this works. Iterators are often used to repeat the same action on each element of a collection, like this:

    data = [1, 2, 3]
    data.each do |i|
      print i, "\n"
    end

Produces:

    1
    2
    3

The each method of the array data is passed the do...end block, and executes it repeatedly. On each call, the block is passed successive elements of the array.

You can define blocks with `{...}` in place of `do...end`.

    data = [1, 2, 3]
    data.each { |i|
      print i, "\n"
    }

Produces:

    1
    2
    3

This code has the same meaning as the last example. However, in some cases, precedence issues cause `do...end` and `{...}` to act differently.

    foobar a, b do .. end # foobar is the iterator.
    foobar a, b { .. }    # b is the iterator.

This is because `{...}` binds more tightly to the preceding expression than does a `do` block. The first example is equivalent to `foobar(a, b) do...`, while the second is `foobar(a, b {...})`.

### How can I pass a block to an iterator?

You simply place the block after the iterator call. You can also pass a Proc object by prepending & to the variable or constant name that refers to the Proc.

### How is a block used in an iterator?

There are three ways to execute a block from an iterator method: (1) the yield control structure; (2) calling a Proc argument (made from a block) with call; and (3) using Proc.new followed by a call.

The yield statement calls the block, optionally passing it one or more arguments.

    def myIterator
      yield 1,2
    end
    myIterator { |a,b| puts a, b }

Produces:

    1
    2

If a method definition has a block argument (the last formal parameter has an ampersand (&) prepended), it will receive the attached block, converted to a Proc object. This may be called using `method.call(args...)`.

    def myIterator(&b)
      b.call(2,3)
    end
    myIterator { |a,b| puts a, b }

Produces:

    2
    3

Proc.new (or the equivalent proc or lambda calls), when used in an iterator definition, takes the block which is given to the method as its argument, generates a procedure object from it. (proc and lambda are effectively synonyms.)

    def myIterator
      Proc.new.call(3,4)
      proc.call(4,5)
      lambda.call(5,6)
    end
    myIterator { |a,b| puts a, b }

Produces:

    3
    4
    4
    5
    5
    6

Perhaps surprisingly, `Proc.new` and friends do not in any sense consume the block attached to the method--each call to `Proc.new` generates a new procedure object out of the same block.

You can tell if there is a block associated with a method by calling `block_given?`.

### What does Proc.new without a block do?

`Proc.new` without a block cannot generate a procedure object and an error occurs. In a method definition, however, `Proc.new` without a block implies the existence of a block at the time the method is called, and so no error will occur.

### How can I run iterators in parallel?

Matz's solution, in [ruby-talk:5252], uses threads:

    require 'thread'

    def combine(*args)
      queues = []
      threads = []
      for it in args
        queue = SizedQueue.new(1)
        th = Thread.start(it, queue) do |i,q|
          self.send(it) do |x|
            q.push x
          end
        end
        queues.push queue
        threads.push th
      end
      loop do
        ary = []
        for q in queues
          ary.push q.pop
        end
        yield ary
        for th in threads
          return unless th.status
        end
      end
    end
    public :combine

    def it1 ()
      yield 1; yield 2; yield 3
    end

    def it2 ()
      yield 4; yield 5; yield 6
    end

    combine('it1','it2') do |x|
      # x is (1, 4), then (2, 5), then (3, 6)
    end

