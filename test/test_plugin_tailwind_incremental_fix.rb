# frozen_string_literal: true

require "helper"
require "jekyll"
require "fileutils"
require "time"
require_relative "../_plugins/tailwind_incremental_fix"

describe Jekyll::PostcssTrigger do
  before do
    # Reset module state before each test
    Jekyll::PostcssTrigger.last_check_time = nil
    Jekyll::PostcssTrigger.css_touched = false
  end

  after do
    # Clean up module state
    Jekyll::PostcssTrigger.last_check_time = nil
    Jekyll::PostcssTrigger.css_touched = false
  end

  describe "module initialization" do
    it "has last_check_time accessor" do
      _(Jekyll::PostcssTrigger).must_respond_to :last_check_time
      _(Jekyll::PostcssTrigger).must_respond_to :last_check_time=
    end

    it "has css_touched accessor" do
      _(Jekyll::PostcssTrigger).must_respond_to :css_touched
      _(Jekyll::PostcssTrigger).must_respond_to :css_touched=
    end

    it "initializes with nil last_check_time" do
      _(Jekyll::PostcssTrigger.last_check_time).must_be_nil
    end

    it "initializes with false css_touched" do
      _(Jekyll::PostcssTrigger.css_touched).must_equal false
    end
  end

  describe "state management" do
    it "can set and get last_check_time" do
      time = Time.now
      Jekyll::PostcssTrigger.last_check_time = time
      _(Jekyll::PostcssTrigger.last_check_time).must_equal time
    end

    it "can set and get css_touched" do
      Jekyll::PostcssTrigger.css_touched = true
      _(Jekyll::PostcssTrigger.css_touched).must_equal true
    end

    it "can reset state" do
      Jekyll::PostcssTrigger.last_check_time = Time.now
      Jekyll::PostcssTrigger.css_touched = true

      Jekyll::PostcssTrigger.last_check_time = nil
      Jekyll::PostcssTrigger.css_touched = false

      _(Jekyll::PostcssTrigger.last_check_time).must_be_nil
      _(Jekyll::PostcssTrigger.css_touched).must_equal false
    end
  end

  describe "file modification detection logic" do
    before do
      chdir_tempdir
    end

    after do
      teardown_tempdir
    end

    it "detects files modified after a timestamp" do
      # Create a file
      create_file("test.html", "<html>content</html>")

      # Record current time
      check_time = Time.now

      # Wait to ensure time difference
      sleep 0.1

      # Modify the file
      create_file("test.html", "<html>modified</html>")

      # Check mtime
      _(File.mtime("test.html") > check_time).must_equal true
    end

    it "does not detect unmodified files" do
      # Create a file
      create_file("test.html", "<html>content</html>")

      # Record time after creation
      sleep 0.1
      check_time = Time.now

      # Wait
      sleep 0.1

      # Don't modify the file

      # Check mtime
      _(File.mtime("test.html") > check_time).must_equal false
    end

    it "can touch a file to update mtime" do
      create_file("test.css", "/* css */")
      original_mtime = File.mtime("test.css")

      sleep 0.1

      FileUtils.touch("test.css")
      new_mtime = File.mtime("test.css")

      _(new_mtime > original_mtime).must_equal true
    end

    it "matches HTML files with glob pattern" do
      create_file("index.html", "<html></html>")
      create_file("about.html", "<html></html>")
      create_file("style.css", "/* css */")

      html_files = Dir.glob("*.html")

      _(html_files.length).must_equal 2
      _(html_files).must_include "index.html"
      _(html_files).must_include "about.html"
      _(html_files).wont_include "style.css"
    end

    it "matches nested HTML files with glob pattern" do
      create_file("_includes/header.html", "<header></header>")
      create_file("_layouts/default.html", "<html></html>")

      includes_files = Dir.glob("_includes/**/*.html")
      layouts_files = Dir.glob("_layouts/**/*.html")

      _(includes_files.length).must_equal 1
      _(layouts_files.length).must_equal 1
    end

    it "matches markdown files with glob pattern" do
      create_file("about.md", "# About")
      create_file("contact.md", "# Contact")

      md_files = Dir.glob("*.md")

      _(md_files.length).must_equal 2
    end
  end

  describe "integration with incremental config" do
    before do
      chdir_tempdir
    end

    after do
      teardown_tempdir
    end

    it "recognizes incremental mode in config" do
      config = Jekyll.configuration(
        source: ".",
        incremental: true,
        quiet: true
      )

      _(config['incremental']).must_equal true
    end

    it "recognizes non-incremental mode in config" do
      config = Jekyll.configuration(
        source: ".",
        incremental: false,
        quiet: true
      )

      _(config['incremental']).must_equal false
    end
  end

  describe "CSS file operations" do
    before do
      chdir_tempdir
    end

    after do
      teardown_tempdir
    end

    it "can check if CSS file exists" do
      create_file("stylesheets/main.css", "/* css */")

      _(File.exist?("stylesheets/main.css")).must_equal true
    end

    it "can touch CSS file" do
      create_file("stylesheets/main.css", "/* css */")
      original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      FileUtils.touch("stylesheets/main.css")
      new_mtime = File.mtime("stylesheets/main.css")

      _(new_mtime > original_mtime).must_equal true
    end

    it "preserves CSS file content when touched" do
      content = "/* original css */"
      create_file("stylesheets/main.css", content)

      FileUtils.touch("stylesheets/main.css")

      _(File.read("stylesheets/main.css")).must_equal content
    end
  end
end