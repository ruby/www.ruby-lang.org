require 'rubygems'

begin
  require 'bundler/setup'
rescue LoadError
  warn e.message
  warn "Run `gem install bundler` to install Bundler"
  exit -1
end

# encoding: UTF-8
require 'yaml'

HOST = 'www.ruby-lang.org'
LANGUAGES = %w[bg de en es fr id it ja ko pl pt tr zh_TW zh_cn]
TIMEZONE = 'UTC'

desc "Generates the Jekyll site"
task :generate do
  require 'jekyll'
  # workaround for LANG=C environment
  module Jekyll::Convertible
    Encoding.default_external = Encoding::UTF_8
  end
  ENV['TZ'] = TIMEZONE

  options = Jekyll.configuration({'auto' => false, 'server' => false})
  puts "Building site: #{options['source']} -> #{options['destination']}"
  $stdout.flush
  Jekyll::Site.new(options).process
end

desc "Generates the Jekyll site and starts local server"
task :preview do
  ENV['TZ'] = TIMEZONE
  sh 'jekyll --server'
end

namespace :check do
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

  desc "Checks for missing author variables in news posts"
  task :author do
    print "Checking for missing author variables in news posts..."

    md_files = Dir["**/_posts/*.md"]

    author_missing = md_files.select {|fn| !author_variable_defined?(fn) }
    if author_missing.empty?
      puts " ok"
    else
      puts "\nNo author variable defined in:"
      puts author_missing.map {|s| "  #{s}\n"}.join
    end
  end

  desc "Checks for missing lang variables in markdown files"
  task :lang do
    print "Checking for missing lang variables in markdown files..."

    md_files = Dir["**/*.md"]
    skip_patterns = [/README.md/, %r{[^/]*/examples/}]

    skip_patterns.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    lang_missing = md_files.select {|fn| !lang_variable_defined?(fn) }
    if lang_missing.empty?
      puts " ok"
    else
      puts "\nNo lang variable defined in:"
      puts lang_missing.map {|s| "  #{s}\n"}.join
    end
  end

  desc "Checks publication dates (UTC) for consistency with filename"
  task :pubdates do
    print "Checking for date mismatch in posts (filename / YAML front matter)..."

    posts = Dir["**/_posts/*.md"]

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
    end
  end

  desc "Checks for broken links on http://localhost:4000/"
  task :links do
    gem 'spidr', '~> 0.4'
    require 'spidr'

    url_map = Hash.new { |hash,key| hash[key] = [] }

    Spidr.site('http://localhost:4000/') do |agent|
      LANGUAGES.each do |lang|
        agent.enqueue("http://localhost:4000/#{lang}/")
      end

      agent.every_link do |origin,dest|
        url_map[dest] << origin
      end

      agent.every_page do |page|
        if page.code == 404
          origin = url_map[page.url].last
          dest   = page.url.request_uri

          external = URI::HTTP.build(
            :host  => HOST,
            :path  => page.url.path,
            :query => page.url.query
          )

          if Net::HTTP.get_response(external).code == '404'
            puts "Old Broken Link: #{origin} -> #{dest}"
          else
            puts "New Broken Link: #{origin} -> #{dest}"
          end
        end
      end
    end
  end
end

desc "Carries out some tests"
task :check => ['check:lang', 'check:author', 'check:pubdates']
