---
layout: page
title: "Ruby Core"
lang: en
---

Now is a fantastic time to follow Ruby’s development. With the increased
attention Ruby has received in the past few years, there’s a growing need
for good talent to help enhance Ruby and document its parts.
So, where do you start?
{: .summary}

The topics related to Ruby development covered here are:

* [Using Git to Track Ruby Development](#following-ruby)
* [Improving Ruby, Patch by Patch](#patching-ruby)
* [Note about branches](#branches-ruby)

### Using Git to Track Ruby Development
{: #following-ruby}

The current primary repository of the latest Ruby source code is
[git.ruby-lang.org/ruby.git][gitrlo].
There is also a [mirror on GitHub][7].  Usually, please use this mirror.

You can get the latest Ruby source code by using Git.
From your command line:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

The `ruby` directory will now contain the latest source code
for the development version of Ruby (ruby-trunk).

See also [Non-committer’s HOWTO to join our development][noncommitterhowto].

If you have commit access, and if you want to push something,
you should use the primary repository.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### Improving Ruby, Patch by Patch
{: #patching-ruby}

The core team maintains an [issue tracker][10] for submitting patches and
bug reports to Matz and the gang. These reports also get submitted to
the [Ruby-Core mailing list][mailing-lists] for discussion,
so you can be sure your request won’t go unnoticed. You can
also send your patches straight to the mailing list. Either way, you are
encouraged to take part in the discussion that ensues.

Please look over the [Patch Writer’s Guide][writing-patches] for some tips,
straight from Matz, on how to get your patches considered.

To summarize, the steps for building a patch are:

1.  Check out a copy of the Ruby source code from GitHub.
    Usually patches for bugfixes or new features should be submitted
    for the trunk of Ruby’s source.

        $ git clone https://github.com/ruby/ruby.git

    If you are fixing a bug that is specific to only one maintenance branch,
    check out a copy of the respective branch.

        $ git checkout ruby_X_X

    X_X should be replaced with a version that you want to check out.

2.  Add your improvements to the code.

3.  Create a patch.

        $ git diff > ruby-changes.patch

4.  Create a ticket in the [issue tracker][10] or email your patch to
    the [Ruby-Core mailing list][mailing-lists] with a ChangeLog entry
    describing the patch.

5.  If there are no issues raised about the patch, committers will be
    given the approval to apply it.

**Please note:** patches should be submitted as a [unified diff][12].
For more on how patches are merged, see [the diffutils reference][13].

Discussion of Ruby’s development converges on the
[Ruby-Core mailing list][mailing-lists]. So, if you are curious
about whether your patch is worthwhile or you want to spark a discussion
about Ruby’s future, don’t hesitate to come aboard. Be warned that
off-topic discussions are not tolerated on this list, the noise level
should be very low, topics should be pointed, well-conceived and
well-written. Since we’re addressing Ruby’s creator, let’s have some
reverence.

Keep in mind that many of Ruby’s core developers live in Japan and, while many
speak very good English, there is a significant timezone difference.
They also have an entire body of Japanese development lists happening
alongside the English counterparts. Be patient, if your claim isn’t
resolved, be persistent—give it another shot a few days later.


### Note about branches
{: #branches-ruby}

The source code of Ruby had been managed under Subversion repository until 22nd April 2019.
Thus, some branches may still be managed under Subversion.
You can view the SVN repository.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

However, you don't have to care about it (unless you are a branch maintainer).
You can check out the branches in your Git working copy.
For example, run the following command.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X should be replaced with a version that you want to check out.

If you want to modify the branches, please open an issue in our [issue tracker][10].
See also the following section.

[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /en/community/mailing-lists/
[writing-patches]: /en/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
