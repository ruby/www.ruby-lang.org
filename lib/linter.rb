require "bundler/setup"
require "pathname"
require 'yaml'


class Linter

  # Run all check methods
  def check_all
    check_lang
    check_author
    check_pubdates
  end

  # Check for missing lang variables in markdown files
  def check_lang
    print "Checking for missing lang variables in markdown files..."

    md_files = glob("**/*.md")
    skip_patterns = [/README.md/, %r{[^/]*/examples/}, %r{\A_includes/}]

    skip_patterns.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    lang_missing = md_files.select {|fn| !lang_variable_defined?(fn) }
    if lang_missing.empty?
      puts " ok"
    else
      puts "\nNo lang variable defined in:"
      puts lang_missing.map {|s| "  #{s}\n"}.join

      raise
    end
  end

  # Check for missing author variables in news posts
  def check_author
    print "Checking for missing author variables in news posts..."

    md_files = glob("**/_posts/*.md")

    author_missing = md_files.select {|fn| !author_variable_defined?(fn) }
    if author_missing.empty?
      puts " ok"
    else
      puts "\nNo author variable defined in:"
      puts author_missing.map {|s| "  #{s}\n"}.join

      raise
    end
  end

  # Check publication dates (UTC) for consistency with filename
  def check_pubdates
    print "Checking for date mismatch in posts (filename / YAML front matter)..."

    posts = glob("**/_posts/*.md")

    date_mismatch = []
    posts.each do |post|
      filename_date = File.basename(post).split('-',4)[0..2].join('/')
      yaml_date = pub_date_utc(post)

      date_mismatch << post  if yaml_date && yaml_date != filename_date
    end

    if date_mismatch.empty?
      puts " ok"
    else
      puts "\nDate mismatch in:"
      puts date_mismatch.map {|s| "  #{s}\n"}.join

      raise
    end
  end

  private

  def read_yaml(filename)
    match_data = File.read(filename).match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
    data = YAML.load(match_data[1])  if match_data

    data || {}
  end

  def author_variable_defined?(filename)
    read_yaml(filename).has_key?('author')
  end

  def lang_variable_defined?(filename)
    read_yaml(filename).has_key?('lang')
  end

  def pub_date_utc(filename)
    date = read_yaml(filename)['date']

    date ? date.getutc.strftime('%Y/%m/%d') : nil
  end

  def glob(pattern)
    Pathname.glob(pattern).reject {|path| path.expand_path.to_s =~ %r{\A#{Regexp.escape(Bundler.bundle_path.to_s)}/} }.map(&:to_s)
  end
end
