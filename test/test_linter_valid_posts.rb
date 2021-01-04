# frozen_string_literal: true

require "helper"
require "linter"


describe Linter do

  before do
    chdir_tempdir

    @ok = "Checking markdown files... ok\n"
  end

  after do
    teardown_tempdir
  end

  it "checks ok a valid post" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      translator:
      date: 2018-01-01 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-01-post.md", content)
    _(linter_output).must_equal @ok
  end

  it "checks ok a valid old post without date" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      translator:
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2000-01-01-old-without-date.md", content)
    _(linter_output).must_equal @ok
  end

  it "checks ok a valid old post without translator" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      date: 2000-01-01 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2000-01-01-old-without-translator.md", content)
    _(linter_output).must_equal @ok
  end

  it "checks ok a valid release post with SHA sums" do
    content = <<~POST
      ---
      layout: news_post
      title: "Release Post"
      author: "stomar"
      translator:
      date: 2019-01-01 12:00:00 +0000
      lang: en
      ---

      Content

      Sums:

          SHA1:    abcdef7890123456789012345678901234567890
          SHA256:  abcdef7890123456789012345678901234567890123456789012345678901234
          SHA512:  abcdef78901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
    POST

    create_file("en/news/_posts/2019-01-01-ruby-with-sha-sums-released.md", content)
    _(linter_output).must_equal @ok
  end

  it "checks ok a valid release post with SHA sums as liquid tags" do
    content = <<~POST
      ---
      layout: news_post
      title: "Release Post"
      author: "stomar"
      translator:
      date: 2019-01-01 12:00:00 +0000
      lang: en
      ---

      Content

      Sums:

          SHA1:    {{ sha1 }}
          SHA256:  {{ sha256 }}
          SHA512:  {{ sha512 }}
    POST

    create_file("en/news/_posts/2019-01-01-ruby-with-sha-sums-liquid-released.md", content)
    _(linter_output).must_equal @ok
  end

  it "checks ok a valid old release post with missing SHA512 sum" do
    content = <<~POST
      ---
      layout: news_post
      title: "Release Post"
      author: "stomar"
      translator:
      date: 2019-01-01 12:00:00 +0000
      lang: en
      ---

      Content

      Sums:

          SHA1:    abcdef7890123456789012345678901234567890
          SHA256:  abcdef7890123456789012345678901234567890123456789012345678901234
    POST

    create_file("en/news/_posts/2019-01-01-ruby-without-sha512-sum-released.md", content)
    _(linter_output).must_equal @ok
  end
end
