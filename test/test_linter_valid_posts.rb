# frozen_string_literal: true

require "helper"
require "linter"


describe Linter do

  before do
    chdir_tempdir
    create_releases_file

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
end
