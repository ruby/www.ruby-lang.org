---
layout: news_post
title: "Rush: Ruby Shell-Sistem Operasi Abstrak dalam Ruby"
author: "Hendy Irawan"
lang: id
---

[Rush][1] yang dibuat oleh Adam Wiggins ini merupakan UNIX shell (bash)
dan remote login (ssh), yang ditulis dengan Ruby dan menerima syntax
Ruby untuk menjalankan sistem operasi. Seperti operasi berikut:

{% highlight ruby %}
processes.each { |p| p.kill if p.command == "mongrel_rails" }
{% endhighlight %}

Atau

{% highlight ruby %}
local = Rush::Box.new('localhost')
remote = Rush::Box.new('my.remote.server.com')
local_dir = local['/Users/adam/myproj/']
remote_dir = remote['/home/myproj/app/']
local_dir.copy_to remote_dir
remote_dir['**/.svn/'].each { |d| d.destroy }
{% endhighlight %}

Anda dapat membuat sesuatu dengan menggunakan usual UNIX commands, Rush
abstracts sebuah kumpulan dari sitem tasks dan memudahkan anda untuk
menjalankan operasi dengan menggunakan Ruby yang Anda sukai dan Anda
ketahui. Rush ini bisa menjadi security aspect dan hal yang menarik
untuk dikembangkan dan dipelajari.

Sumber: [Ruby Inside – A Ruby Shell That Abstracts System Operations
Into Ruby Ones][1]



[1]: http://adam.blog.heroku.com/past/2008/2/19/rush_the_ruby_shell/
