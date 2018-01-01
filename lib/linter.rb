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
    print "Checking for missing lang variables in markdown files..."

    lang_missing = docs.select {|doc| doc.lang_missing? }
    if lang_missing.empty?
      puts " ok"
    else
      puts "\nNo lang variable defined in:"
      puts lang_missing.map {|doc| "  #{doc.filename}\n"}.join

      raise  if raise_on_error
    end
  end

  # Check for missing author variables in news posts
  def check_author
    print "Checking for missing author variables in news posts..."

    author_missing = posts.select {|doc| doc.author_missing? }
    if author_missing.empty?
      puts " ok"
    else
      puts "\nNo author variable defined in:"
      puts author_missing.map {|doc| "  #{doc.filename}\n"}.join

      raise  if raise_on_error
    end
  end

  # Check publication dates (UTC) for consistency with filename
  def check_pubdates
    print "Checking for date mismatch in posts (filename / YAML front matter)..."

    date_mismatch = posts.select {|doc| doc.date_mismatch? }

    if date_mismatch.empty?
      puts " ok"
    else
      puts "\nDate mismatch in:"
      puts date_mismatch.map {|doc| "  #{doc.filename}\n"}.join

      raise  if raise_on_error
    end
  end

  private

  def glob(pattern)
    Pathname.glob(pattern).reject {|path| path.expand_path.to_s =~ %r{\A#{Regexp.escape(Bundler.bundle_path.to_s)}/} }.map(&:to_s)
  end
end
