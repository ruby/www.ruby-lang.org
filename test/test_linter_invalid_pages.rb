# frozen_string_literal: true

require "helper"
require "linter"


describe Linter do

  before do
    chdir_tempdir
    create_releases_file
  end

  after do
    teardown_tempdir
  end

  it "reports pages with CR/LF line breaks" do
    content = <<~PAGE
      ---\r
      layout: page\r
      title: "Page"\r
      lang: en\r
      ---\r
      \r
      Content\r
    PAGE

    create_file("en/crlf_line_breaks.md", content)
    _(linter_output).must_match "wrong line breaks (CR/LF)"
  end

  it "reports pages without newline at EOF" do
    content = <<~PAGE.chomp
      ---
      layout: page
      title: "Page"
      lang: en
      ---

      Content
    PAGE

    create_file("en/no_newline_at_eof.md", content)
    _(linter_output).must_match "no newline at end of file"
  end

  it "reports pages with trailing whitespace" do
    content = <<~PAGE
      ---
      layout: page
      title: "Page"
      lang: en
      ---

      Content\s
    PAGE

    create_file("en/trailing_whitespace.md", content)
    _(linter_output).must_match "trailing whitespace"
  end

  it "reports pages with trailing whitespace in yaml" do
    content = <<~PAGE
      ---
      layout: page
      title: "Page"
      lang: en\s
      ---

      Content
    PAGE

    create_file("en/trailing_whitespace_in_yaml.md", content)
    _(linter_output).must_match "trailing whitespace"
  end

  it "reports pages with blank line at EOF" do
    content = <<~PAGE
      ---
      layout: page
      title: "Page"
      lang: en
      ---

      Content

    PAGE

    create_file("en/blank_line_at_eof.md", content)
    _(linter_output).must_match "blank line(s) at end of file"
  end

  it "reports pages with blank lines at EOF" do
    content = <<~PAGE
      ---
      layout: page
      title: "Page"
      lang: en
      ---

      Content



    PAGE

    create_file("en/blank_lines_at_eof.md", content)
    _(linter_output).must_match "blank line(s) at end of file"
  end

  it "reports pages with multiple errors" do
    content = <<~PAGE
      ---
      layout: page\s
      title: "Page"
      lang: en
      ---

      Content

    PAGE

    create_file("en/multiple_errors.md", content)
    _(linter_output).must_match "trailing whitespace"
    _(linter_output).must_match "blank line(s) at end of file"
  end
end
