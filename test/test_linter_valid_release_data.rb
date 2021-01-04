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

  it "checks ok for nonexistent release data file" do
    release_file = Pathname.new("_data/releases.yml")

    message = "test setup should not create `_data/releases.yml'"
    _(release_file.exist?).must_equal false, message
    _(linter_output).must_equal @ok
  end

  it "checks ok for empty release data file" do
    create_file("_data/releases.yml", "")
    _(linter_output).must_equal @ok
  end

  it "checks ok valid release data with corresponding post" do
    releases_content = <<~YAML
      - version: 2.7.0
        date: 2018-01-01
        post: /en/news/2018/01/01/post/
    YAML

    post_content = <<~POST
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

    create_file("_data/releases.yml", releases_content)
    create_file("en/news/_posts/2018-01-01-post.md", post_content)
    _(linter_output).must_equal @ok
  end
end
