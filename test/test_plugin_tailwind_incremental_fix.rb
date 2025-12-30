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

  describe "state management" do
    it "initializes with nil last_check_time and false css_touched" do
      _(Jekyll::PostcssTrigger.last_check_time).must_be_nil
      _(Jekyll::PostcssTrigger.css_touched).must_equal false
    end

    it "can set and get last_check_time" do
      time = Time. now
      Jekyll::PostcssTrigger.last_check_time = time
      _(Jekyll::PostcssTrigger.last_check_time).must_equal time
    end

    it "can set and get css_touched" do
      Jekyll::PostcssTrigger.css_touched = true
      _(Jekyll::PostcssTrigger.css_touched).must_equal true
    end
  end

  describe "integration:  HTML change triggers CSS rebuild" do
    before do
      chdir_tempdir
      create_file("stylesheets/main.css", "/* css */")

      # Create a minimal Jekyll site
      @site = Jekyll::Site.new(
        Jekyll.configuration(
          source: ".",
          incremental: true,
          quiet: true
        )
      )
    end

    after do
      teardown_tempdir
    end

    it "records initial check time on first post_read" do
      _(Jekyll::PostcssTrigger.last_check_time).must_be_nil

      Jekyll::Hooks.trigger :site, :post_read, @site

      _(Jekyll::PostcssTrigger. last_check_time).wont_be_nil
      _(Jekyll::PostcssTrigger.css_touched).must_equal false
    end

    it "touches CSS when HTML file changes after first build" do
      # Create HTML file BEFORE first build
      create_file("index.html", "<html>original</html>")

      # First build - establish baseline
      Jekyll::Hooks.trigger :site, :post_read, @site
      first_check_time = Jekyll::PostcssTrigger. last_check_time

      sleep 0.2

      # NOW modify HTML file (after first build)
      create_file("index.html", "<html>modified</html>")
      css_original_mtime = File. mtime("stylesheets/main.css")

      sleep 0.1

      # Second build - should detect change
      Jekyll::Hooks.trigger :site, :post_read, @site

      _(Jekyll::PostcssTrigger.css_touched).must_equal true
      _(File.mtime("stylesheets/main.css") > css_original_mtime).must_equal true
    end

    it "touches CSS when markdown file changes" do
      # Create markdown file first
      create_file("about. md", "# About Page")

      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2

      # Modify markdown file
      create_file("about.md", "# About Page Modified")
      css_original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      # Second build
      Jekyll::Hooks.trigger :site, :post_read, @site

      _(Jekyll::PostcssTrigger.css_touched).must_equal true
      _(File.mtime("stylesheets/main.css") > css_original_mtime).must_equal true
    end

    it "touches CSS when layout file changes" do
      # Create layout file first
      create_file("_layouts/default.html", "<html>{{ content }}</html>")

      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2

      # Modify layout file
      create_file("_layouts/default.html", "<html><body>{{ content }}</body></html>")
      css_original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      # Second build
      Jekyll::Hooks.trigger :site, :post_read, @site

      _(Jekyll::PostcssTrigger. css_touched).must_equal true
      _(File.mtime("stylesheets/main.css") > css_original_mtime).must_equal true
    end

    it "touches CSS when include file changes" do
      # Create include file first
      create_file("_includes/header.html", "<header>Header</header>")

      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2

      # Modify include file
      create_file("_includes/header.html", "<header>New Header</header>")
      css_original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      # Second build
      Jekyll::Hooks.trigger :site, :post_read, @site

      _(Jekyll::PostcssTrigger.css_touched).must_equal true
      _(File.mtime("stylesheets/main.css") > css_original_mtime).must_equal true
    end

    it "does not touch CSS when no HTML/MD files changed" do
      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2

      # Don't modify any files
      css_original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      # Second build
      Jekyll::Hooks.trigger :site, :post_read, @site

      _(Jekyll::PostcssTrigger.css_touched).must_equal false
      _(File.mtime("stylesheets/main.css")).must_equal css_original_mtime
    end

    it "does not touch CSS multiple times in same build" do
      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2

      # Modify multiple HTML files
      create_file("index.html", "<html>modified</html>")
      create_file("about.html", "<html>also modified</html>")
      css_original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      # Second build
      Jekyll::Hooks.trigger :site, :post_read, @site
      first_touch_mtime = File.mtime("stylesheets/main.css")

      # Try to trigger again in same "build"
      Jekyll::Hooks.trigger :site, :post_read, @site
      second_touch_mtime = File.mtime("stylesheets/main.css")

      _(first_touch_mtime).must_equal second_touch_mtime
    end

    it "resets css_touched flag after post_write" do
      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2
      create_file("index.html", "<html>modified</html>")
      sleep 0.1

      # Second build - CSS should be touched
      Jekyll::Hooks.trigger :site, :post_read, @site
      _(Jekyll::PostcssTrigger.css_touched).must_equal true

      # Trigger post_write
      Jekyll::Hooks.trigger :site, :post_write, @site

      # Flag should be reset
      _(Jekyll::PostcssTrigger.css_touched).must_equal false
    end

    it "does nothing when not in incremental mode" do
      # Create non-incremental site
      non_incremental_site = Jekyll::Site.new(
        Jekyll.configuration(
          source: ".",
          incremental: false,
          quiet: true
        )
      )

      Jekyll::PostcssTrigger.last_check_time = nil

      # Trigger hook
      Jekyll::Hooks.trigger :site, :post_read, non_incremental_site

      # Should not set check time
      _(Jekyll::PostcssTrigger.last_check_time).must_be_nil
    end

    it "handles missing CSS file gracefully" do
      # Remove CSS file
      FileUtils.rm_f("stylesheets/main.css")

      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2
      create_file("index.html", "<html>modified</html>")
      sleep 0.1

      # Should not crash when CSS file doesn't exist
      _{ Jekyll::Hooks.trigger :site, :post_read, @site }.must_be_silent
    end

    it "excludes _site directory from change detection" do
      # First build
      Jekyll::Hooks.trigger :site, :post_read, @site

      sleep 0.2

      # Modify file in _site (generated output)
      create_file("_site/index.html", "<html>generated</html>")
      css_original_mtime = File.mtime("stylesheets/main.css")

      sleep 0.1

      # Second build
      Jekyll::Hooks.trigger :site, :post_read, @site

      # CSS should NOT be touched (changes in _site are ignored)
      _(Jekyll::PostcssTrigger.css_touched).must_equal false
      _(File.mtime("stylesheets/main.css")).must_equal css_original_mtime
    end
  end
end
