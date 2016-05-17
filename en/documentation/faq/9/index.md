---
layout: page
title: "Official Ruby FAQ"
lang: en

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
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
    <strong>9</strong>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

## Built-in libraries

### What does instance_methods(nil) return?

The method instance_methods returns an array containing the names of methods
that the receiver responds to. This will include the methods in superclasses
and in mixed-in modules.

instance_methods(nil) returns the name of just those methods which are
defined in the object's class.

### How do random number seeds work?

It depends. In Ruby versions prior to 1.5.2, the random number generator had
(by default) a constant seed, and so would produce the same series of numbers
each time a program was run. If you needed less deterministic behaviors, you
called srand to set up a less predictable seed.

Newer Rubys (Rubies?) have a different behavior. If rand is called without a
prior call to srand, Ruby will generate its own random(ish) seed. Successive
runs of a program that does not use srand will generate different sequences of
random numbers. To get the old, predictable, behavior (perhaps for testing),
call srand with a constant seed.

### What is the difference between an immediate value and a reference?

Fixnum, true, nil, and false are implemented as immediate values. With
immediate values, variables hold the objects themselves, rather than
references to them.

Singleton methods cannot be defined for such objects. Two Fixnums of the same
value always represent the same object instance, so (for example) instance
variables for the Fixnum with the value "one" are shared between all the
"ones" is the system. This makes it impossible to define a singleton method
for just one of these.

### What is the difference between nil and false?

First the similarity. nil and false are the only two values that evaluate to
false in a boolean context.

However, they are instances of different classes (NilClass and FalseClass),
and have different behaviors elsewhere.

We recommend that predicate methods (those whose name ends with a question
mark) return true or false. Other methods that need to indicate failure
should return nil.

### I read a file and changed it, but the file on disk has not changed.

~~~
open("example", "r+").readlines.each_with_index{|l, i|
  l[0,0] = (i+1).to_s + ": " }
~~~

This program does not add line numbers to the file "example". It does read the
contents of the file, and for each line read prepend the line number, but the
data is never written back. The code below does update the file (although
somewhat dangerously, as it takes no backup before starting the update):

~~~
io = open("example", "r+")
ary = io.readlines
ary.each_with_index{|l, i| l[0,0] = (i+1).to_s + ": "}
io.rewind
io.print ary
io.close
~~~

### How can I process a file and update its contents?

Using the command-line option -i, or built-in variable $-i, you can read a
file and replace it.

The code in the preceding question, which added line numbers to file,
is probably best written using this technique:

~~~
$ ruby -i -ne 'print "#$.: #$_"' example
~~~

If you want to preserve the original file, use -i.bak to create a backup.

### I wrote a file, copied it, but the end of the copy seems to be lost.

This code will not work correctly:

~~~
open('file', 'w').print "This is a file.\n"
system 'cp file newfile'
~~~

Because I/O is buffered, file is being copied before its contents have been
written to disk. newfile will probably be empty. However, when the program
terminates, the buffers are flushed, and file has the expected content.

The problem doesn't arise if you close file before copying:

~~~
f = open('file', 'w')
f.print "This is a file.\n"
f.close
system "cp file newfile"
~~~

### How can I get the line number in current input file?

As you read from a file, Ruby increments a line number counter in the global
variable $.. This is also available using the lineno attribute of the File
object.

The special constant ARGF is a file-like object that can be used to read all
the input files specified on the command line (or standard input if there are
no files). ARGF is used implicitly by code such as:

~~~
while gets
  print $_
end
~~~

In this case, $. will be the cumulative number of lines read across all input
files. To get the line number in the current file, use

~~~
ARGF.file.lineno
~~~

You can also get the name of the current file using ARGF.file.path.

### How can I use less to display my program's output?

I tried the following, but nothing came out:

~~~
f = open '|less', 'w'
f.print "abc\n"
~~~

That's because the program ends immediately, and less never gets a chance to
see the stuff you've written to it, never mind to display it. Use close to
wait until less ends.

~~~
f = open '|less', 'w'
f.print "abc\n"
f.close
~~~

### What happens to a File object which is no longer referenced?

A File object which is no longer referenced becomes eligible for garbage
collection. The file will be closed automatically when the File object is
garbage collected.

### I feel uneasy if I don't close a file.

There are at least four good ways of ensuring that you do close a file:

~~~
(1)  f = open "file"
     begin
       f.each {|l| print l}
     ensure
       f.close
     end

(2)  File.open("file") { |f|
       f.readlines.each { |l| print l }
     }

(3)  IO.foreach("file") {|l| print l}

(4)  IO.readlines("file").each {|l| print l}
~~~

### How can I sort files by their modified time?

~~~
Dir.glob("*").sort{|a,b| File.mtime(b) <=> File.mtime(a)}
~~~

Although this works (returning a list in reverse chronological order) it
isn't very efficient, as it fetches the files' modification times from the
operating system on every comparison.

More efficiency can be bought with some extra complexity:

~~~
Dir.glob("*").collect! {|f| [File.mtime(f), f]}.
  sort{|a,b| b[0] <=> a[0]}.collect! {|e| e[1]}
~~~

### How can I count the frequency of words in a file?

~~~
freq = Hash.new(0)
open("example").read.scan(/\w+/){|w| freq[w] += 1}
freq.keys.sort.each {|k| print k, "-", freq[k], "\n"}
~~~

Produces:

~~~
and-1
is-3
line-3
one-1
this-3
three-1
two-1
~~~

### Why is an empty string not false?

Q: An empty string ("") returns true in a conditional expression! In Perl,
it's false.

A: In Ruby, only nil and false are false in conditional contexts. This is a
way of gaining speed--both nil and false have immediate values, so they can
be tested without having to chase a reference to an object.

You can use empty?, compare the string to "", or compare length to 0 to find
out if a string is empty.

### How can I sort strings in alphabetical order?

If you want your strings to sort 'AAA', 'BBB', ..., 'ZZZ', 'aaa', 'bbb',
then the built-in comparison will work just fine.

If you want to sort ignoring case distinctions, compare downcased versions of
the strings in the sort block:

~~~
array = %w( z bB Bb BB bb Aa aA AA aa a )
puts array.sort { |a,b|  a.downcase <=> b.downcase }
~~~

Produces:

~~~
a
aa
AA
aA
Aa
bb
BB
bB
Bb
z
~~~

If you want to sort so that the 'A's and 'a's come together, but 'a' is
considered greater than 'A' (so 'Aa' comes after 'AA' but before 'AB'), use:

~~~
puts array.sort { |a,b|
  (a.downcase <=> b.downcase).nonzero? || a <=> b
}
~~~

Produces:

~~~
a
AA
Aa
aA
aa
BB
Bb
bB
bb
z
~~~

### What does "abcd"[0] return?

It returns the character code for “a”, 97 (Fixnum). You can express a
character code as an integer constant by prefixing the character with a
question mark, so `?a` is also 97 (Fixnum).

### How can I expand tabs to spaces?

If a holds the string to be expanded, you could use one of:

~~~
  1 while a.sub!(/(^[^\t]*)\t(\t*)/){$1+' '*(8-$1.size%8+8*$2.size)}
# or
  1 while a.sub!(/\t(\t*)/){' '*(8-$~.begin(0)%8+8*$1.size)}
# or
  a.gsub!(/([^\t]{8})|([^\t]*)\t/n){[$+].pack("A8")}
~~~

### How can I escape a backslash in a regexp?

Regexp.quote('\\') escapes a backslash.

It gets trickier if you're using sub and gsub, Say you write
gsub(/\\/, '\\\\'), hoping to replace each backslash with two.
The second argument is converted to '\\' in syntax analysis. When the
substitution occurs, the regular expression engine converts this to '\',
so the net effect is to replace each single backslash with another single
backslash. You need to write gsub(/\\/, '\\\\\\')!

However, using the fact that \& contains the matched string, you could also
write gsub(/\\/, '\&\&').

If you use the block form of gsub, i.e. gsub(/\\/){'\\\\'}, the string for
substitution is analyzed only once (during the syntax pass) and the result
is what you intended.

### What is the difference between sub and sub!?

In sub, a copy of the receiver is generated, substituted and returned.

In sub!, the receiver is altered and returned if any match was found.
Otherwise, nil is returned.

Methods like sub! are called destructive methods which alter the attribute of
the receiver. If there are two similar methods and one is destructive, the
destructive one has a suffix !.

~~~
def foo(str)
    str = str.sub(/foo/, "baz")
end

obj = "foo"
foo(obj)         # -> "baz"
obj              # -> "foo"

def foo(str)
    str = str.sub!(/foo/, "baz")
end

foo(obj)         # -> "baz"
obj              # -> "baz"
~~~

### Where does \Z match?

\Z matches just before the last \n if the string ends with a \n,
otherwise it matches at the end of a string.

### What is the difference between ".." and "..."?

.. includes the right hand side in the range, ... does not.

### Does Ruby have function pointers?

A Proc object generated by Proc.new, proc, or lambda can be referenced from a
variable, so that variable could be said to be a function pointer. You can
also get references to methods within a particular object instance using
Object.method.

### What is the difference between thread and fork?

Ruby threads are implemented within the interpreter, while fork invokes the
operating system to create a separately executing subprocess.

Thread and fork have following characteristics:

* fork is slow, thread is not.
* fork does not share the memory space.
* thread does not cause thrashing.
* thread works on DOS.
* when thread gets in a deadlock, the whole process stops.
* fork can take advantage of pauses waiting for I/O to complete,
  thread does not (at least not without some help).

You probably shouldn't mix fork and thread.

### How can I use Marshal?

Marshal is used to store an object in a file or a string, and later
reconstitute it. Objects may be stored using:

~~~
Marshal.dump obj [, io ] [, lev]
~~~

io is a writable IO object, lev designates the level to which objects are
dereferred and stored. If lev levels of dereferring are done and object
references still exist, then dump stores just the reference, not the object
referenced. This is not good, as these referenced objects cannot be
subsequently reconstructed.

If io is omitted, the marshaled objects are returned in a string.

You can load objects back using:

~~~
   obj = Marshal.load io
# or
   obj = Marshal.load str
~~~

where io is a readable IO object, str is the dumped string.

### Does Ruby have exception handling?

Ruby supports a flexible exception handling scheme:

~~~
begin
  statements which may raise exceptions.
rescue [exception class names]
  statements when an exception occurred.
rescue [exception class names]
  statements when an exception occurred.
ensure
  statements that will always run
end
~~~

If an exception occurs in the begin clause, the rescue clause with the
matching exception name is executed. The ensure clause is executed whether
an exception occurred or not. rescue and ensure clauses may be omitted.

If no exception class is designated for rescue clause, StandardError
exception is implied, and exceptions which are in a is_a? relation to
StandardError are captured.

This expression returns the value of the begin clause.

The latest exception is accessed by the global variable $! (and so its type
can be determined using $!.type).

### How can I use trap?

trap associates code blocks with external events (signals).

~~~
trap("PIPE") {raise "SIGPIPE"}
~~~
