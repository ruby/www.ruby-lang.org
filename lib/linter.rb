require "bundler/setup"
require "pathname"
require 'yaml'

require_relative "linter/document"


class Linter

  EXCLUDE_PATTERNS = [
    %r{\AREADME\.md\z},
    %r{\A[^/]*/examples/},
    %r{\A_includes/}
  ]

  WHITESPACE_EXCLUSIONS = [
    "en/news/_posts/2005-07-01-xmlrpcipimethods-vulnerability.md",
    "ja/news/_posts/2005-07-01-20050701.md",
    "de/news/_posts/2005-07-01-xmlrpcipimethods-vulnerability.md",
    "ko/news/_posts/2005-07-01-xmlrpcipimethods-vulnerability.md"
  ]

  attr_accessor :docs, :posts, :errors

  def initialize
    @docs = []
    @posts = []
    @errors = Hash.new {|h, k| h[k] = [] }
  end

  # Reads files and runs all checks.
  def run
    print "Checking markdown files..."

    load_files
    check
    report

    exit(1)  if errors.any?
  end

  private

  def load_files
    md_files = glob("**/*.md")

    EXCLUDE_PATTERNS.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    @docs = md_files.map {|fn| Document.new(fn) }
    @posts = @docs.select {|doc| doc.filename =~ %r{/_posts/} }
  end

  def check
    docs.each do |doc|
      errors[doc] << "  missing lang variable"  if doc.lang_missing?

      unless WHITESPACE_EXCLUSIONS.include?(doc.filename)
        errors[doc] << "  trailing whitespace"  if doc.trailing_whitespace?
      end
    end

    posts.each do |doc|
      errors[doc] << "  missing author variable"  if doc.author_missing?
      errors[doc] << "  date mismatch between filename and YAML front matter (UTC)"  if doc.date_mismatch?
      errors[doc] << "  wrong time zone offset in YAML front matter (not UTC)"  if doc.yaml_date_not_utc?
    end
  end

  def report
    if errors.empty?
      puts " ok"
    else
      puts
      errors.each do |doc, messages|
        puts doc.filename
        puts messages
      end
    end
  end

  def glob(pattern)
    Pathname.glob(pattern).reject {|path| path.expand_path.to_s =~ %r{\A#{Regexp.escape(Bundler.bundle_path.to_s)}/} }.map(&:to_s)
  end
end
