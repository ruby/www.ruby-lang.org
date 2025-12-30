# frozen_string_literal: true

begin
  require "bundler/setup"
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler"
  exit(-1)
end

LANGUAGES = %w[bg de en es fr id it ja ko pl pt ru tr ua vi zh_cn zh_tw].freeze
CONFIG = "_config.yml"

task default: [:build]

desc "Run tests (test-linter, lint, build)"
task test: %i[test-news-plugin test-html-lang-plugin test-tailwind-incremental-fix-plugin test-linter lint build]

desc "Build the Jekyll site"
task :build do
  require "jekyll"

  Jekyll::Commands::Build.process({})
end

desc "Serve the Jekyll site locally"
task :serve do
  require "jekyll"

  Jekyll::Commands::Serve.process({})
end

namespace :new_post do

  def create_template(lang)
    url_title = "short-title"
    title = "Post Title"

    now = Time.now.utc
    datetime = now.strftime("%Y-%m-%d %H:%M:%S %z")
    date = now.strftime("%Y-%m-%d")
    filename = "#{date}-#{url_title}.md"
    path = File.join(lang, "news", "_posts", filename)

    content = <<-TEMPLATE.gsub(/^ */, "")
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
        File.open(path, "w") {|f| f.write content }
        warn "done."
      end
    rescue => e
      warn e.message
    end
  end

  desc "Create a news post template for language `lang'"
  task :lang do
    puts "Please specify one of the valid language codes:"
    puts LANGUAGES.join(", ") << "."
  end

  LANGUAGES.each do |lang|
    task lang.to_sym do
      create_template(lang)
    end
  end
end

desc "Run linter on markdown files"
task :lint do
  require_relative "lib/linter"
  Linter.new.run
end

namespace :check do

  desc "Check for broken internal links"
  task :links do
    require "html-proofer"
    options = {
      checks: [
        'Links',
        'Images',
        'Scripts',
      ],
      ignore_empty_alt: true,
      ignore_missing_alt: true,
      check_external_hash: false,
      check_internal_hash: false,
    }

    HTMLProofer.check_directory('_site', options).run
  end

  desc "Validate _site markup with validate-website"
  task :markup do
    require_relative "lib/markup_checker"
    MarkupChecker.new.check
  end
end

require "rake/testtask"
Rake::TestTask.new(:"test-linter") do |t|
  t.description = "Run tests for the Linter library"
  t.libs = ["test", "lib"]
  t.test_files = FileList['test/test_linter_*.rb']
  t.verbose = true
end

require "rake/testtask"
Rake::TestTask.new(:"test-news-plugin") do |t|
  t.description = "Run tests for the news archive plugin"
  t.libs = ["test"]
  t.test_files = FileList['test/test_plugin_news.rb']
  t.verbose = true
end

require "rake/testtask"
Rake::TestTask.new(:"test-html-lang-plugin") do |t|
  t.description = "Run tests for the HTML language plugin"
  t.libs = ["test"]
  t.test_files = FileList['test/test_plugin_html_lang.rb']
  t.verbose = true
end

require "rake/testtask"
Rake::TestTask.new(:"test-tailwind-incremental-fix-plugin") do |t|
  t.description = "Run tests for the Tailwind incremental fix plugin"
  t.libs = ["test"]
  t.test_files = FileList['test/test_plugin_tailwind_incremental_fix.rb']
  t.verbose = true
end