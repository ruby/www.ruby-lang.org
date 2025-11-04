# frozen_string_literal: true

require "bundler/setup"
require "pathname"
require "yaml"
require "date"

require_relative "linter/document"
require_relative "linter/release"


class Linter

  EXCLUDE_PATTERNS = [
    %r{\A404\.md\z},
    %r{\AREADME\.md\z},
    %r{\Aadmin/index\.md},
    %r{\A[^/]*/examples/},
    %r{\A_includes/},
    %r{\Atest/}
  ].freeze

  WHITESPACE_EXCLUSIONS = [
    "en/news/_posts/2005-07-01-xmlrpcipimethods-vulnerability.md",
    "ja/news/_posts/2005-07-01-20050701.md",
    "de/news/_posts/2005-07-01-xmlrpcipimethods-vulnerability.md",
    "ko/news/_posts/2005-07-01-xmlrpcipimethods-vulnerability.md"
  ].freeze

  RELEASES_FILE = "_data/releases.yml"

  attr_accessor :docs, :posts, :releases, :errors

  # set to +false+ when running Linter in tests
  attr_accessor :exit_on_errors

  def initialize(exit_on_errors: true)
    @exit_on_errors = exit_on_errors
    @docs = []
    @posts = []
    @releases = []
    @errors = Hash.new {|h, k| h[k] = [] }
  end

  # Reads files and runs all checks.
  def run
    print "Checking markdown files..."

    load_files
    load_releases
    check
    check_releases
    report

    exit(1)  if errors.any? && exit_on_errors
  end

  private

  def load_files
    md_files = glob("**/*.md")

    EXCLUDE_PATTERNS.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    @docs = md_files.map {|fn| Document.new(fn) }
    @posts = @docs.select(&:post?)
  end

  def load_releases
    releases_yaml = if Pathname.new(RELEASES_FILE).exist?
                      YAML.load_file(RELEASES_FILE, fallback: [], permitted_classes: [Date])
                    else
                      []
                    end

    @releases = releases_yaml.map {|release_data| Release.new(release_data) }
  end

  def check
    docs.each do |doc|
      errors[doc] << "missing or invalid lang variable"  if doc.lang_invalid?
      errors[doc] << "lang variable not matching file location"  if doc.lang_not_matching_filename?
      errors[doc] << "no newline at end of file"  if doc.no_newline_at_eof?
      errors[doc] << "blank line(s) at end of file"  if doc.blank_line_at_eof?
      errors[doc] << "wrong line breaks (CR/LF)"  if doc.crlf_line_breaks?

      unless WHITESPACE_EXCLUSIONS.include?(doc.filename)
        errors[doc] << "trailing whitespace"  if doc.trailing_whitespace?
      end
    end

    posts.each do |doc|
      errors[doc] << "missing or invalid author variable"  if doc.author_invalid?
      errors[doc] << "invalid translator variable"  if doc.translator_invalid?
      errors[doc] << "invalid date variable"  if doc.date_invalid?
      errors[doc] << "filename not matching date variable"  if doc.date_mismatch?
      errors[doc] << "date variable with wrong time zone offset (not +0000)"  if doc.date_not_utc?

      unless doc.old_post?
        errors[doc] << "missing translator variable"  if doc.translator_missing?
        errors[doc] << "missing date variable"  if doc.date_missing?
      end

      if doc.release_post?
        errors[doc] << "invalid SHA1 length"  if doc.sha1_length_invalid?
        errors[doc] << "invalid SHA256 length"  if doc.sha256_length_invalid?
        errors[doc] << "invalid SHA512 length"  if doc.sha512_length_invalid?
      end
    end
  end

  def invalid_url_message(post_url)
    "post URL with unexpected format (`#{post_url}')"
  end

  def missing_post_message(filename)
    "no release post file that matches given post URL" \
    " (expected filename: `#{filename}')"
  end

  def check_releases
    releases.each do |release|
      errors[release] << invalid_url_message(release.post)  if release.post_url_invalid?
      errors[release] << "release date and post date do not match"  if release.date_mismatch?
      errors[release] << missing_post_message(release.post_filename)  if release.post_missing?
      errors[release] << "release date is a string, not a Date object"  if release.date.is_a?(String)
    end
  end

  def report
    if errors.empty?
      puts " ok"
    else
      errors.replace errors.sort_by {|doc, _| doc.name }.to_h

      puts
      errors.each do |doc, messages|
        puts doc.name
        puts(messages.map {|msg| "  #{msg}" })
      end
    end
  end

  def glob(pattern)
    Pathname.glob(pattern).reject {|path| path.expand_path.to_s =~ %r{\A#{Regexp.escape(Bundler.bundle_path.to_s)}/} }.map(&:to_s)
  end
end
