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
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <strong>10</strong>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

## Extension library

10.1 How can I use Ruby interactively?

You can try using irb. The following is paraphrased from Goto Kentaro
(Gotoken), and originally appeared in ruby-talk:444.

    Get the latest tarball of irb from the contrib directory in the Ruby archive.
    Extract the irb directory tree.
    Add the location of the irb/ directory to the $RUBYLIB environment variable
    Make a symbolic link from $RUBYLIB/irb/irb.rb to a file called irb somewhere in your path.
    chmod +x $RUBYLIB/irb/irb.rb
    Possibly use rehash to tell your login shell about the new command.
    Type irb

If the readline extension module works with your interpreter, it makes irb
a lot more fun to use.

There is also a simple program, eval, in the samples/ directory of the Ruby
distribution. It lets you enter expressions and view their values. You can
copy eval into the site_ruby directory in the Ruby tree, and then invoke it
using:



ruby -r eval -e0

10.2 Is there a debugger for Ruby?

There is a gdb-like debugger for Ruby.



  ruby -r debug your_program

10.3 How can I use a library written in C from Ruby?

Of all the scripting languages, Ruby is probably the easiest to extend.
There are no problems with reference counting and variable types, and very
few interfaces to learn. In fact, C code used to extend Ruby often ends up
looking surprisingly like Ruby code itself.

First, get the Ruby source distribution and read README.EXT. This is a good
document, not only if you're writing an extension library, but also if you
want to understand Ruby more deeply.

Next, have a look at the source of the interpreter itself, and at the various
supplied extensions in the ext/ directory. You'll also find good examples
under contrib/ on the Ruby ftp sites.

10.4 Can I use Tcl/Tk interface in Ruby?

There are two interfaces to Tcl/Tk included in the standard distribution.
One is under ext/tcltk/ and loaded with require "tcltk". The syntax is very
close to that Tcl, which is passed to Tcl interpreter. Unfortunately, the
description for this library is written in Japanese.

The other is under ext/tk/ and loaded with require "tk". Its syntax closer to
the style of the Tk interface provided by the Perl and Python interfaces.

10.5 Tk won't work.

Your Tk version may be old, try a newer version.

10.6 Can I use gtk+ or xforms interfaces in Ruby?

You'll find ruby-gtk-x.xx.tar.gz and ruby-forms-x.x.tar.gz under contrib/
in ftp sites.

10.7 How can I do date arithmetic?

A Time object can express only the dates between Jan 1, 1970 and Jan 19, 2038.

Two standard extension library modules are provided:
require "date", which is simple and uses the English calendar,
and require "date2", which is more general purpose.

Also see sample/cal.rb.
