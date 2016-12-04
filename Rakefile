# encoding: utf-8

require 'rubygems'

begin
  require 'bundler/setup'
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler"
  exit -1
end

HOST = 'www.ruby-lang.org'
LANGUAGES = %w[bg de en es fr id it ja ko pl pt ru tr vi zh_cn zh_tw]

task :default => [:build]

desc "Build the Jekyll site"
task :build do
  require "lanyon"

  Lanyon.build
end

desc "Serve the Jekyll site locally"
task :serve do
  sh "rackup config.ru"
end

namespace :new_post do

  def create_template(lang)
    url_title = 'short-title'
    title = 'Post Title'

    now = Time.now.utc
    datetime = now.strftime("%Y-%m-%d %H:%M:%S %z")
    date = now.strftime("%Y-%m-%d")
    filename = "#{date}-#{url_title}.md"
    path = File.join(lang, 'news', '_posts', filename)

    content = <<-TEMPLATE.gsub(/^ */, '')
      ---
      layout: news_post
      title: "#{title}"
      author: "Unknown Author"
      translator:
      date: #{datetime}
      lang: #{lang}
      ---

      Content.
    TEMPLATE

    $stderr.print "Creating template `#{path}'... "
    begin
      if File.exist?(path)
        warn "Could not create template, `#{path}' already exists."
      else
        File.open(path, 'w') {|f| f.write content }
        warn 'done.'
      end
    rescue => e
      warn e.message
    end
  end

  desc "Create a news post template for language `lang'"
  task :lang do
    puts 'Please specify one of the valid language codes:'
    puts LANGUAGES.join(', ') << '.'
  end

  LANGUAGES.each do |lang|
    task lang.to_sym do
      create_template(lang)
    end
  end
end

desc "Alias for `check'"
task :test => [:check]

namespace :check do

  def read_yaml(filename)
    require 'yaml'
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

  desc "Check for missing author variables in news posts"
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

  desc "Check for missing lang variables in markdown files"
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

  desc "Check publication dates (UTC) for consistency with filename"
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

  localport = 9292

  desc "Check for broken links on http://localhost:#{localport}/"
  task :links do
    gem 'spidr', '~> 0.6'
    require 'spidr'

    url_map = Hash.new { |hash,key| hash[key] = [] }

    Spidr.site("http://localhost:#{localport}/") do |agent|
      LANGUAGES.each do |lang|
        agent.enqueue("http://localhost:#{localport}/#{lang}/")
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

  desc 'Validate _site markup with validate-website'
  task :markup => :build do
    require 'jekyll'
    options = Jekyll.configuration
    Dir.chdir('_site') do
      system("validate-website-static",
               "--verbose",
               "--exclude", "examples",
               "--site", "#{options['url']}/")
      exit($?.exitstatus)
    end
  end
end

desc "Run some tests (lang, author, pubdates)"
task :check => ['check:lang', 'check:author', 'check:pubdates']
