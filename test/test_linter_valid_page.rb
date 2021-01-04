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

  it "checks ok a valid page" do
    content = <<~PAGE
      ---
      layout: page
      title: "Page"
      lang: en
      ---

      Content
    PAGE

    create_file("en/page.md", content)
    _(linter_output).must_equal @ok
  end
end
