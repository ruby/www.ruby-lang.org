---
layout: page
title: "Official Ruby FAQ"
lang: en

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <a href="7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <a href="8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

### What is Ruby?

Ruby is a simple and powerful object-oriented programming language, created by Yukihiro Matsumoto (who goes by the handle "matz" in this document and on the mailing lists).

Like Perl, Ruby is good at text processing. Like Smalltalk, everything in Ruby is an object, and Ruby has blocks, iterators, meta-classes and other good stuff.

You can use Ruby to write servers, experiment with prototypes, and for everyday programming tasks. As a fully-integrated object-oriented language, Ruby scales well.

Ruby features:

* Simple syntax,
* Basic OO features (classes, methods, objects, and so on),
* Special OO features (Mix-ins, singleton methods, renaming, ...),
* Operator overloading,
* Exception handling,
* Iterators and closures,
* Garbage collection,
* Dynamic loading (depending on the architecture),
* High transportability (runs on various Unices, Windows, DOS, OSX, OS/2, Amiga, and so on)

### Show me some Ruby code.

Let's define a class called Person, with a name and an age. We'll test our code by creating a few people and examining them.

    class Person
      attr_accessor :name, :age
      def initialize(name, age)
        @name = name
        @age  = age.to_i
      end
      def inspect
        "#@name (#@age)"
      end
    end
    
    p1 = Person.new('elmo', 4)
    p2 = Person.new('zoe', 7)
    
    p1               # -> elmo (4)
    p2               # -> zoe (7)

Now let's populate an array of people by reading their names and ages from a file containing lines like:

    bert:    8
    cookie: 11
    elmo:    4
    ernie:   8
    zoe:     7

The code uses regular expressions to parse successive lines from the input file, creating a new Person object for each match and pushing it on to the end of the array people.

    people = Array.new
    
    File.foreach("ages") { |l|
      people << Person.new($1, $2) if l =~ /(.*):\s+(\d+)/
    }
    
    people           # -> [bert (8), cookie (11), elmo (4), ernie (8), zoe (7)]

Now, let's sort the result based on the person's age. There are many ways to do this. We can define a sort block, which tells Ruby how to do the comparison of two people:

    sorted = people.sort do |a,b| a.age <=> b.age end
    sorted           # -> [elmo (4), zoe (7), bert (8), ernie (8), cookie (11)]

Another way would be to change the comparison method for class Person:

    class Person
      def <=>(other)
        @age <=> other.age
      end
    end
    people.sort      # -> [elmo (4), zoe (7), bert (8), ernie (8), cookie (11)]

### Why the name 'Ruby'?

Influenced by Perl, Matz wanted to use a jewel name for his new language, so he named Ruby after a colleague's birthstone.

Later, he realized that Ruby comes right after Perl in several situations. In birthstones, pearl is June, ruby is July. When measuring font sizes, pearl is 5pt, ruby is 5.5pt. He thought Ruby was a good name for a programming language newer (and hopefully better) than Perl.

(Based on an explanation from matz in [ruby-talk:00394] on June 11, 1999.)

### What is the history of Ruby?

The following a summary of a posting made by Matz in [ruby-talk:00382] on June 4, 1999. (The birthday of Ruby is corrected in [ruby-list:15977]).

> Well, Ruby was born on February 24 1993. I was talking with my colleague about the possibility of an object-oriented scripting language. I knew Perl (Perl4, not Perl5), but I didn't like it really, because it had smell of toy language (it still has). The object-oriented scripting language seemed very promising.

> I knew Python then. But I didn't like it, because I didn't think it was a true object-oriented language---OO features appeared to be add-on to the language. As a language manic and OO fan for 15 years, I really wanted a genuine object-oriented, easy-to-use scripting language. I looked for, but couldn't find one.

> So, I decided to make it. It took several months to make the interpreter run. I put it the features I love to have in my language, such as iterators, exception handling, garbage collection.

> Then, I reorganized the features of Perl into a class library, and implemented them. I posted Ruby 0.95 to the Japanese domestic newsgroups in Dec. 1995.

> Since then, highly active mailing lists have been established and web pages formed.

### Where is the Ruby Home Page?

The official Ruby Home Page is http://www.ruby-lang.org (in English) and http://www.ruby-lang.org/ja/ (in Japanese).

You can also find Ruby information at http://www.rubycentral.com. In particular, there is a complete online reference to Ruby's built-in classes and methods.

### Is there a Ruby newsgroup?

comp.lang.ruby was established in May, 2000 (thanks to the efforts of Conrad Schneiker).

### Is there a Ruby mailing list?

There are five mailing lists now talking about Ruby. The first is in English, the last four in Japanese:

    ruby-talk: English language discussion of Ruby.
    ruby-list: Japanese language discussion of Ruby.
    ruby-dev: List for Ruby developers.
    ruby-ext: List for people writing extensions for or with Ruby.
    ruby-math: Ruby in mathematics.

See joining the mailing list.

You can search the mailing list archives using http://blade.nagaokaut.ac.jp/ruby/ruby-talk/index.shtml. (This is the url for the ruby-talk list: munge as required for the others).

1.8 **Changed** How can I thread the mailing list in mutt?

The Ruby mailing list software adds a prefix to the subject lines, for example [ruby-talk:1234]. This can confuse the threading in some mail user agents.

In mutt, you can get threading to work using the following variable setting.

    # reply regexp, to support MLs like ruby-talk.
    set reply_regexp="^(\[[a-z0-9:-]+\][[:space:]]*)?(re([\[0-9\]+])*|aw):[[:space:]]*"

### Which is correct, Ruby or ruby?

Officially, the language is called ``Ruby''. On most systems, it is invoked using the command ``ruby''. It's OK to use ruby instead of Ruby.

Please don't use RUBY as the language name.

Originally, or historically, it was called ``ruby''.

### Are there any Ruby books?

Programming Ruby: The Pragmatic Programmer's Guide, (the Pickaxe Book) by David Thomas and Andrew Hunt: ISBN 0-20171-089-7, Addison-Wesley, October 2000.

A Japanese language Ruby reference book by matz, et al and published by ASCII is available in Japan (ISBN 4-7561-3254-5). An English translation, `` The Ruby Programming Language,'' is in the works from Addison-Wesley (ISBN 020171096X).

A Japanese language ``Ruby Pocket Reference'' is published by O'Reilly Japan (ISBN 4-87311-023-8). Let O'Reilly in the US know if you'd like to see a translation.

In addition, `` Mastering Regular Expressions,'' by Jeffrey Friedl, (the Hip Owl Book): ISBN 1-56592-257-3 from O'Reilly & Associates, is a reference work that covers the art and implementation of regular expressions in various programming languages. Most of it is highly relevant to Ruby regular expressions.

### Which editors provide support for Ruby.

* Emacs or XEmacs: ruby-mode.el is supplied in the Ruby distribution. With some versions of XEmacs, you may need to add (load "font-lock") to your .emacs file to allow ruby-mode.el to detect the syntax highlighting package you're using.
* Vim: Vim 5.7 and later have Ruby syntax files as standard in the runtime package. For prior versions, a syntax file for Ruby is available at http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim.
* Jedit: A portable editor written in Java, comes with support for Ruby.
* Jed: An s-lang file supporting Ruby is available at http://www.kondara.org/~g/slang/ruby.sl.
* Nedit ( http://www.nedit.org): Eric Santonacci has written Ruby support for Nedit, available from ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz.
* Barry Shultz has written a Ruby definition file for TextPad, available at http://www.textpad.com/add-ons/ntsyn.html.

### How can I annotate Ruby code with its results?

People commonly annotate Ruby code by showing the results of executing each statement as a comment attached to that statement. For example, in the following code, we show that the assignment generates the string "Billy Bob", and then result of extracting some substrings.

    str = "Billy" + " Bob"           # -> "Billy Bob"
    str[0,1] + str[2,1] + str[-2,2]  # -> "Blob"

Gotoken's xmp package, available from http://www.ruby-lang.org/en/raa-list.rhtml?name=xmp is a utility that annotates Ruby source code this way.

Emacs and vim users can integrate this with their editing environments, which is useful if you want to send people e-mail with annotated Ruby code. Having installed xmp, Emacs users can add the following to their .emacs file:

    (defun ruby-xmp-region (reg-start reg-end)
      "Pipe the region through Ruby's xmp utility and replace the region with
       the result."
      (interactive "r")
      (shell-command-on-region reg-start reg-end
                               "ruby -r xmp -n -e 'xmp($_, \"%l\t\t# %r\n\")'"
                               t))
    (global-set-key [(meta f10)] 'ruby-xmp-region)

Vim users can use the mapping (thanks to hipster):

    map <M-F10> :!ruby -r xmp -n -e 'xmp($_, "\%l\t\t\# \%r\n")'<CR>

In both cases, highlight a region of code and hit Meta-F10 to annotate it.

### I can't understand Ruby even after reading the manual!

The syntax of Ruby has been fairly stable since Ruby 1.0, but new features are added every now and then. So, the books and the online documentation can get behind.

If you have a problem, feel free to ask in the mailing list (see ruby-talk mailing list). Generally you'll get timely answers from matz himself, the author of the language, from other gurus, and from those who've solved problems similar to your own.

Please include the output of ruby -v along with any problematic source code.

If you have a problem using irb, be aware that it has some limitations. Try the script using `irb --single-irb`, or directly using the ruby command.

There might be similar questions in the mailing list, and it is good netiquette to read through recent mails (RFC1855:3.1.1, 3.1.2) before asking. But do ask on the list, and a correct answer will be forthcoming. 

