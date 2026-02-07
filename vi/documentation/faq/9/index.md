---
layout: page
title: "Official Ruby FAQ"
lang: vi

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

{% include faq-notice.md %}

## Built-in libraries

### What does `instance_methods(false)` return?

The method `instance_methods` returns an array containing the names of
instance methods in the receiving class or module. This will include
the methods in superclasses and in mixed in modules.

`instance_methods(false)` or `instance_methods(nil)` returns the names
of just those methods which are defined in the receiver.

### How do random number seeds work?

If `rand` is called without a prior call to `srand`,
Ruby's pseudo-random number generator uses a random(ish) seed that
amongst other things uses an entropy source provided by the OS,
if available.
Successive runs of a program that does not use `srand` will generate
different sequences of random numbers.

For testing purposes, you can get a predictable behavior with the same
series of numbers each time the program is run by calling `srand`
with a constant seed.

### I read a file and changed it, but the file on disk has not changed.

~~~
File.open("example", "r+").readlines.each_with_index do |line, i|
  line[0,0] = "#{i+1}: "
end
~~~

This program does _not_ add line numbers to the file `example`. It does read
the contents of the file, and for each line read does prepend the line number,
but the data is never written back. The code below _does_ update the file
(although somewhat dangerously, as it takes no backup before starting the
update):

~~~
File.open("example", "r+") do |f|
  lines = f.readlines
  lines.each_with_index {|line, i| line[0,0] = "#{i+1}: " }
  f.rewind
  f.puts lines
end
~~~

### How can I process a file and update its contents?

Using the command-line option `-i`, or built-in variable `$-i`, you can read
a file and replace it.

The code in the preceding question, which added line numbers to a file,
is probably best written using this technique:

~~~
$ ruby -i -ne 'print "#$.: #$_"' example
~~~

If you want to preserve the original file, use `-i.bak` to create a backup.

### I wrote a file, copied it, but the end of the copy seems to be lost.

This code will not work correctly:

~~~
require "fileutils"

File.open("file", "w").puts "This is a file."
FileUtils.cp("file", "newfile")
~~~

Because I/O is buffered, `file` is being copied before its contents have been
written to disk. `newfile` will probably be empty. However, when the program
terminates, the buffers are flushed, and file has the expected content.

The problem doesn't arise if you make sure that `file` is closed before
copying:

~~~
require "fileutils"

File.open("file", "w") {|f| f.puts "This is a file." }
FileUtils.cp("file", "newfile")
~~~

### How can I get the line number in the current input file?

As you read from a file, Ruby increments a line number counter in the global
variable `$.`. This is also available using the `lineno` attribute of the
`File` object.

The special constant `ARGF` is a file-like object that can be used to read
all the input files specified on the command line (or standard input if there
are no files). `ARGF` is used implicitly by code such as:

~~~
while gets
  print $_
end
~~~

In this case, `$.` will be the cumulative number of lines read across all
input files. To get the line number in the current file, use

~~~
ARGF.file.lineno
~~~

You can also get the name of the current file using `ARGF.file.path`.

### How can I use `less` to display my program's output?

I tried the following, but nothing came out:

~~~
open("|less", "w").puts "abc"
~~~

That's because the program ends immediately, and `less` never gets a chance
to see the stuff you've written to it, never mind to display it.
Make sure that the IO is properly closed and it will wait until `less` ends.

~~~
open("|less", "w") {|f| f.puts "abc" }
~~~

### What happens to a `File` object which is no longer referenced?

A `File` object which is no longer referenced becomes eligible for garbage
collection. The file will be closed automatically when the `File` object is
garbage collected.

### I feel uneasy if I don't close a file.

There are at least four good ways of ensuring that you do close a file:

~~~
# (1)
f = File.open("file")
begin
  f.each {|line| print line }
ensure
  f.close
end

# (2)
File.open("file") do |f|
  f.each {|line| print line }
end

# (3)
File.foreach("file") {|line| print line }

# (4)
File.readlines("file").each {|line| print line }
~~~

### How can I sort files by their modification time?

~~~
Dir.glob("*").sort {|a, b| File.mtime(b) <=> File.mtime(a) }
~~~

Although this works (returning a list in reverse chronological order) it
isn't very efficient, as it fetches the files' modification times from the
operating system on every comparison.

More efficiency can be bought with some extra complexity:

~~~
Dir.glob("*").map {|f| [File.mtime(f), f] }.
  sort {|a, b| b[0] <=> a[0] }.map(&:last)
~~~

### How can I count the frequency of words in a file?

~~~
freq = Hash.new(0)
File.read("example").scan(/\w+/) {|word| freq[word] += 1 }
freq.keys.sort.each {|word| puts "#{word}: #{freq[word]}" }
~~~

Produces:

~~~
and: 1
is: 3
line: 3
one: 1
this: 3
three: 1
two: 1
~~~

### How can I sort strings in alphabetical order?

If you want your strings to sort 'AAA', 'BBB', ..., 'ZZZ', 'aaa', 'bbb',
then the built-in comparison will work just fine.

If you want to sort ignoring case distinctions, compare downcased versions of
the strings in the sort block:

~~~
array = %w( z bB Bb bb Aa BB aA AA aa a A )
array.sort {|a, b| a.downcase <=> b.downcase }
  # => ["a", "A", "Aa", "aA", "AA", "aa", "bB", "Bb", "bb", "BB", "z"]
~~~

If you want to sort so that the 'A's and 'a's come together, but 'a' is
considered greater than 'A' (so 'Aa' comes after 'AA' but before 'AB'), use:

~~~
array.sort {|a, b| (a.downcase <=> b.downcase).nonzero? || a <=> b }
  # => ["A", "a", "AA", "Aa", "aA", "aa", "BB", "Bb", "bB", "bb", "z"]
~~~

### How can I expand tabs to spaces?
{: #tab-expansion}

If `a` holds the string to be expanded, you could use one of:

~~~
1 while a.sub!(/(^[^\t]*)\t(\t*)/){$1+" "*(8-$1.size%8+8*$2.size)}
# or
1 while a.sub!(/\t(\t*)/){" "*(8-$~.begin(0)%8+8*$1.size)}
# or
a.gsub!(/([^\t]{8})|([^\t]*)\t/n){[$+].pack("A8")}
~~~

### How can I escape a backslash in a regular expression?

`Regexp.quote('\\')` escapes a backslash.

It gets trickier if you are using `sub` and `gsub`. Say you write
`gsub(/\\/, '\\\\')`, hoping to replace each backslash with two.
The second argument is converted to `'\\'` in syntax analysis. When the
substitution occurs, the regular expression engine converts this to `'\'`,
so the net effect is to replace each single backslash with another single
backslash. You need to write `gsub(/\\/, '\\\\\\')`!

However, using the fact that `\&` contains the matched string, you could also
write `gsub(/\\/, '\&\&')`.

If you use the block form of `gsub`, i.e. `gsub(/\\/) { '\\\\' }`, the string
for substitution is analyzed only once (during the syntax pass) and the
result is what you intended.

### What is the difference between `sub` and `sub!`?

In `sub`, a copy of the receiver is generated, substituted, and returned.

In `sub!`, the receiver is altered and returned if any match was found.
Otherwise, `nil` is returned.

Methods like `sub!`, which alter the attribute of the receiver,
are called [destructive methods](../7/#destructive-method).
Usually, if there are two similar methods and one is destructive,
the destructive one has a suffix `!`.

~~~
def foo(str)
  str.sub(/foo/, "baz")
end

obj = "foo"
foo(obj)  # => "baz"
obj       # => "foo"

def foo(str)
  str.sub!(/foo/, "baz")
end

foo(obj)  # => "baz"
obj       # => "baz"
~~~

### Where does `\Z` match?

`\Z` matches just before the last `\n` (newline) if the string ends
with a `\n`, otherwise it matches at the end of a string.

### What is the difference between `thread` and `fork`?

{% include warnings/faq-out-of-date.html %}

Ruby threads are implemented within the interpreter, while `fork` invokes the
operating system to create a separately executing subprocess.

Thread and fork have the following characteristics:

* `fork` is slow, `thread` is not.
* `fork` does not share the memory space.
* `thread` does not cause thrashing.
* `thread` works on DOS.
* When `thread` gets in a deadlock, the whole process stops.
* `fork` can take advantage of pauses waiting for I/O to complete,
  `thread` does not (at least not without some help).

You probably shouldn't mix `fork` and `thread`.

### How can I use `Marshal`?

`Marshal` is used to store an object in a file or a string, and later
reconstitute it. Objects may be stored using:

~~~
Marshal.dump( obj [, io ] [, lev] )
~~~

`io` is a writable `IO` object, `lev` designates the level to which objects
are dereferred and stored. If `lev` levels of dereferring are done and object
references still exist, then `dump` stores just the reference, not the object
referenced. This is not good, as these referenced objects cannot be
subsequently reconstructed.

If `io` is omitted, the marshaled objects are returned in a string.

You can load objects back using:

~~~
obj = Marshal.load(io)
# or
obj = Marshal.load(str)
~~~

where `io` is a readable `IO` object, `str` is the dumped string.

### How can I use `trap`?

`trap` associates code blocks with external events (signals).

~~~
trap("PIPE") { raise "SIGPIPE" }
~~~
