require "bundler/setup"
require "pathname"
require 'yaml'

require_relative "linter/document"


class Linter

  attr_accessor :docs, :posts, :raise_on_error

  def initialize(raise_on_error: true)
    @raise_on_error = raise_on_error

    md_files = glob("**/*.md")
    skip_patterns = [/README.md/, %r{[^/]*/examples/}, %r{\A_includes/}]

    skip_patterns.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    @docs = md_files.map {|fn| Document.new(fn) }
    @posts = @docs.select {|doc| doc.filename =~ %r{/_posts/} }
  end

  # Run all check methods
  def check_all
    check_lang
    check_author
    check_pubdates
  end

  # Check for missing lang variables in markdown files
  def check_lang
    print "Checking for missing lang variable in markdown files..."

    lang_missing = docs.select {|doc| doc.lang_missing? }
    report_docs(lang_missing)
  end

  # Check for missing author variables in news posts
  def check_author
    print "Checking for missing author variable in news posts..."

    author_missing = posts.select {|doc| doc.author_missing? }
    report_docs(author_missing)
  end

  # Check publication dates (UTC) for consistency with filename
  def check_pubdates
    print "Checking for date mismatch in news posts (filename / YAML front matter)..."

    date_mismatch = posts.select {|doc| doc.date_mismatch? }

    report_docs(date_mismatch)
  end

  private

  def glob(pattern)
    Pathname.glob(pattern).reject {|path| path.expand_path.to_s =~ %r{\A#{Regexp.escape(Bundler.bundle_path.to_s)}/} }.map(&:to_s)
  end

  def report_docs(failed_docs)
    if failed_docs.empty?
      puts " ok"
    else
      puts
      puts failed_docs.map {|doc| "  #{doc.filename}\n"}.join

      raise  if raise_on_error
    end
  end
end
