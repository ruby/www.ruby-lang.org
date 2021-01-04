# frozen_string_literal: true

require "helper"
require "linter"


describe Linter do

  before do
    chdir_tempdir
  end

  after do
    teardown_tempdir
  end

  it "reports old posts with lang variable that is nil" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      lang:
      ---

      Content
    POST

    create_file("en/news/_posts/2000-01-01-old-lang-variable-nil.md", content)
    _(linter_output).must_match "missing or invalid lang variable"
  end

  it "reports old posts with translator variable that has wrong type" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      translator: 1
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2000-01-01-old-translator-variable-wrong-type.md", content)
    _(linter_output).must_match "invalid translator variable"
  end

  it "reports old posts with date variable that is empty" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      date: ""
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2000-01-01-old-date-empty.md", content)
    _(linter_output).must_match "invalid date variable"
  end

  it "reports old posts with filename not matching date variable" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      date: 2000-12-12 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2000-01-01-old-date-mismatch.md", content)
    _(linter_output).must_match "filename not matching date variable"
  end

  it "reports posts with trailing whitespace" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      translator:
      date: 2018-01-01 12:00:00 +0000
      lang: en
      ---

      Content\s
    POST

    create_file("en/news/_posts/2018-01-01-trailing-whitespace.md", content)
    _(linter_output).must_match "trailing whitespace"
  end

  it "reports posts with lang variable that is nil" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: "stomar"
      translator:
      date: 2018-01-02 12:00:00 +0000
      lang:
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-02-lang-variable-nil.md", content)
    _(linter_output).must_match "missing or invalid lang variable"
  end

  it "reports posts with missing author variable" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      translator:
      date: 2018-01-03 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-03-author-variable.md", content)
    _(linter_output).must_match "missing or invalid author variable"
  end

  it "reports posts with author variable that is nil" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author:
      translator:
      date: 2018-01-04 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-04-author-variable-nil.md", content)
    _(linter_output).must_match "missing or invalid author variable"
  end

  it "reports posts with author variable that is empty" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: ""
      translator:
      date: 2018-01-05 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-05-author-variable-empty.md", content)
    _(linter_output).must_match "missing or invalid author variable"
  end

  it "reports posts with author variable that has wrong type" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: 1
      translator:
      date: 2018-01-06 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-06-author-variable-wrong-type.md", content)
    _(linter_output).must_match "missing or invalid author variable"
  end

  it "reports posts with missing translator" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      date: 2018-01-07 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-07-translator-variable-missing.md", content)
    _(linter_output).must_match "missing translator variable"
  end

  it "reports posts with translator variable that is empty" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator: ""
      date: 2018-01-08 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-08-translator-variable-empty.md", content)
    _(linter_output).must_match "invalid translator variable"
  end

  it "reports posts with missing date variable" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-09-date-variable-missing.md", content)
    _(linter_output).must_match "missing date variable"
  end

  it "reports posts with date variable that is nil" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      date:
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-10-date-variable-nil.md", content)
    _(linter_output).must_match "missing date variable"
  end

  it "reports posts with date variable that is empty" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      date: ""
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-11-date-variable-empty.md", content)
    _(linter_output).must_match "invalid date variable"
  end

  it "reports posts with date variable that is of wrong type" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      date: 2018
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-12-date-variable-wrong-type.md", content)
    _(linter_output).must_match "invalid date variable"
  end

  it "reports posts with date variable that has no time" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      date: 2018-01-13
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-13-date-variable-without-time.md", content)
    _(linter_output).must_match "invalid date variable"
  end

  it "reports posts with date variable that has wrong offset" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      date: 2018-01-14 12:00:00 +0500
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-14-date-variable-wrong-offset.md", content)
    _(linter_output).must_match "date variable with wrong time zone offset"
  end

  it "reports posts with filename not matching date variable" do
    content = <<~POST
      ---
      layout: news_post
      title: "Post"
      author: stomar
      translator:
      date: 2018-12-12 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("en/news/_posts/2018-01-15-date-mismatch.md", content)
    _(linter_output).must_match "filename not matching date variable"
  end

  it "reports posts with invalid SHA1 length" do
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

          SHA1:    abcdef78901234567890
    POST

    create_file("en/news/_posts/2019-01-01-invalid-sha1-length-released.md", content)
    _(linter_output).must_match "invalid SHA1 length"
  end

  it "reports posts with invalid SHA256 length" do
    content = <<~POST
      ---
      layout: news_post
      title: "Release Post"
      author: "stomar"
      translator:
      date: 2019-01-02 12:00:00 +0000
      lang: en
      ---

      Content

          SHA256:  abcdef7890123456789012345678901234567890123456789012345678901234567890
    POST

    create_file("en/news/_posts/2019-01-02-invalid-sha256-length-released.md", content)
    _(linter_output).must_match "invalid SHA256 length"
  end

  it "reports posts with invalid SHA512 length" do
    content = <<~POST
      ---
      layout: news_post
      title: "Release Post"
      author: "stomar"
      translator:
      date: 2019-01-03 12:00:00 +0000
      lang: en
      ---

      Content

          SHA512:  abcdef789012345678901234567890123456789012345678901234567890
      12345678901234567890123456789012345678901234567890123456789012345678
    POST

    create_file("en/news/_posts/2019-01-03-invalid-sha512-length-released.md", content)
    _(linter_output).must_match "invalid SHA512 length"
  end
end
