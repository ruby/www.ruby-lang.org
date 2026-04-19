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

  it "reports release data with missing post URL" do
    content = <<~YAML
      - version: 2.7.1
        date: 2020-01-01
        post:
    YAML

    create_file("_data/releases.yml", content)
    _(linter_output).must_match "post URL with unexpected format"
  end

  it "reports release data with malformed post URL" do
    content = <<~YAML
      - version: 2.7.2
        date: 2020-01-01
        post: /en/news/2020-01-01/malformed-post-url/
    YAML

    create_file("_data/releases.yml", content)
    _(linter_output).must_match "post URL with unexpected format"
  end

  it "reports release data with missing release post" do
    content = <<~YAML
      - version: 2.7.3
        date: 2020-01-01
        post: /en/news/2020/01/01/missing/
    YAML

    create_file("_data/releases.yml", content)
    _(linter_output).must_match "no release post file that matches given post URL"
  end

  it "reports release data with dates that do not match" do
    content = <<~YAML
      - version: 2.7.4
        date: 2020-01-01
        post: /en/news/2020/01/02/wrong-date/
    YAML

    create_file("_data/releases.yml", content)
    _(linter_output).must_match "release date and post date do not match"
  end

  it "reports release data with wrong date format" do
    content = <<~YAML
      - version: 2.7.1
        date: '2020-01-01'
        post: /en/news/2020/01/01/post/
    YAML

    create_file("_data/releases.yml", content)
    _(linter_output).must_match "release date is a string, not a Date object"
  end
end
