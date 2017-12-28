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
CONFIG = "_config.yml"

task :default => [:build]

desc "Build the Jekyll site"
task :build do
  require "lanyon"

  Lanyon.build
end

namespace :build do

  def build_subpage(lang)
    require "yaml"
    require "lanyon"

    exclude_config = YAML.load_file(CONFIG)["exclude"]
    exclude_langs  = (LANGUAGES - [lang]).map {|x| "#{x}/" }

    exclude = exclude_config + exclude_langs

    Lanyon.build(exclude: exclude)
  end

  desc "Build the Jekyll site (`lang' language part only)"
  task :lang do
    puts 'Please specify one of the valid language codes:'
    puts LANGUAGES.join(', ') << '.'
  end

  LANGUAGES.each do |lang|
    task lang.to_sym do
      build_subpage(lang)
    end
  end
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

  desc "Check for missing author variables in news posts"
  task :author do
    require_relative "lib/linter"
    Linter.new.check_author
  end

  desc "Check for missing lang variables in markdown files"
  task :lang do
    require_relative "lib/linter"
    Linter.new.check_lang
  end

  desc "Check publication dates (UTC) for consistency with filename"
  task :pubdates do
    require_relative "lib/linter"
    Linter.new.check_pubdates
  end

  localport = 9292

  desc "Check for broken internal links on http://localhost:#{localport}/"
  task :links do
    require_relative "lib/link_checker"
    LinkChecker.new.check(localport: localport, languages: LANGUAGES)
  end

  desc 'Validate _site markup with validate-website'
  task :markup do
    require_relative "lib/markup_checker"
    MarkupChecker.new.check(host: HOST)
  end
end

desc "Run some tests (lang, author, pubdates)"
task :check => ['check:lang', 'check:author', 'check:pubdates']
task :ci => [:test, :build]
