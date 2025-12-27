# frozen_string_literal: true

require "helper"
require "jekyll"
require "yaml"
require_relative "../_plugins/fallback_generator"

describe Jekyll::FallbackGenerator do
  let(:actual_languages_path) { File.expand_path("../_data/languages.yml", __dir__) }

  before do
    chdir_tempdir
    
    # 1. Setup config
    create_file("source/_config.yml", <<~CONFIG)
      markdown: kramdown
      permalink: pretty
    CONFIG
    
    # 2. Setup languages data from actual file + add a test language 'xz'
    # 'xz' is a virtual language guaranteed to have no translation or locale file,
    # ensuring the test for fallback to English notice remains robust.
    actual_langs = YAML.load_file(actual_languages_path)
    actual_langs << { 'code' => 'xz', 'name' => 'Test Language', 'native_name' => 'Test' }
    create_file("source/_data/languages.yml", YAML.dump(actual_langs))
    
    # 3. Setup locales from actual files
    locales_dir = File.expand_path("../_data/locales", __dir__)
    Dir.glob("#{locales_dir}/*.yml").each do |actual_locale_path|
      filename = File.basename(actual_locale_path)
      create_file("source/_data/locales/#{filename}", File.read(actual_locale_path))
    end
    
    # 4. Setup layouts
    create_file("source/_layouts/default.html", "{{ content }}")
    create_file("source/_layouts/news.html", "{{ content }}")
    
    # 5. Create an English post
    create_file("source/en/news/_posts/2025-12-25-ruby-4-0-0.md", <<~MARKDOWN)
      ---
      layout: news
      title: "Ruby 4.0.0 Released"
      lang: en
      author: "matz"
      ---
      Ruby 4.0.0 is finally here!
    MARKDOWN

    # 6. Create an English page
    create_file("source/en/about.md", <<~MARKDOWN)
      ---
      layout: default
      title: "About Ruby"
      lang: en
      ---
      Ruby is a dynamic, open source programming language.
    MARKDOWN

    # 7. Create existing posts/pages to test exclusion
    # Korean post
    create_file("source/ko/news/_posts/2025-12-25-ruby-4-0-0.md", <<~MARKDOWN)
      ---
      layout: news
      title: "루비 4.0.0 출시"
      lang: ko
      author: "matz"
      ---
      기존 한국어 콘텐츠입니다.
    MARKDOWN

    # Japanese content (Plausibility: Ruby is a Japanese language)
    create_file("source/ja/news/_posts/2025-12-25-ruby-4-0-0.md", <<~MARKDOWN)
      ---
      layout: news
      title: "Ruby 4.0.0 リリース"
      lang: ja
      author: "matz"
      ---
      既存の日本語コンテンツです。
    MARKDOWN

    create_file("source/ja/about.md", <<~MARKDOWN)
      ---
      layout: default
      title: "Rubyについて"
      lang: ja
      ---
      Rubyは、オープンソースの動的なプログラミング言語です。
    MARKDOWN

    @config = Jekyll.configuration(
      "source" => "source",
      "destination" => "_site",
      "quiet" => true
    )
    @site = Jekyll::Site.new(@config)
    @site.process
  end

  after do
    teardown_tempdir
  end

  it "should generate fallback posts for all languages defined in languages.yml" do
    @site.data['languages'].map { |l| l['code'] }.each do |lang|
      next if lang == 'en'
      next if lang == 'ko' # Existing one
      next if lang == 'ja' # Existing one
      
      # Verify that the fallback post document exists in Jekyll's internal state
      post = @site.posts.docs.find { |d| d.data['lang'] == lang && d.data['fallback'] }
      _(post).wont_be_nil "Fallback post for #{lang} should be generated"
      
      # Verify the path and URL
      _(post.url).must_match %r{/#{lang}/news/2025/12/25/ruby-4-0-0/}
      
      # Verify output file exists
      file_must_exist("_site/#{lang}/news/2025/12/25/ruby-4-0-0/index.html")
    end
  end

  it "should NOT overwrite existing translated posts" do
    # Korean
    ko_post = @site.posts.docs.find { |d| d.data['lang'] == 'ko' && File.basename(d.path) == '2025-12-25-ruby-4-0-0.md' }
    _(ko_post).wont_be_nil
    _(ko_post.data['fallback']).must_be_nil
    _(File.read("_site/ko/news/2025/12/25/ruby-4-0-0/index.html")).must_match "기존 한국어 콘텐츠입니다"

    # Japanese
    ja_post = @site.posts.docs.find { |d| d.data['lang'] == 'ja' && File.basename(d.path) == '2025-12-25-ruby-4-0-0.md' }
    _(ja_post).wont_be_nil
    _(ja_post.data['fallback']).must_be_nil
    _(File.read("_site/ja/news/2025/12/25/ruby-4-0-0/index.html")).must_match "既存の日本語コンテンツです"
  end

  it "should generate fallback pages for all languages defined in languages.yml" do
    @site.data['languages'].map { |l| l['code'] }.each do |lang|
      next if lang == 'en'
      next if lang == 'ja' # Existing one
      
      page = @site.pages.find { |p| p.data['lang'] == lang && p.data['fallback'] && p.path.include?("about.md") }
      _(page).wont_be_nil "Fallback page for #{lang} should be generated"
      file_must_exist("_site/#{lang}/about/index.html")
    end
  end

  it "should wrap content with notice box and lang='en' tag" do
    # Check Korean fallback page (to test localization)
    # ko/about.md doesn't exist in source, so it should be generated as a fallback
    ko_page = File.read("_site/ko/about/index.html")
    _(ko_page).must_match "fallback-notice"
    _(ko_page).must_match "bg-sky-50"
    # Actual content from ko.yml
    _(ko_page).must_match "이 콘텐츠는 아직 한국어 번역이 제공되지 않아 영어로 표시됩니다"
    _(ko_page).must_match "<div lang=\"en\""
    _(ko_page).must_match "Ruby is a dynamic, open source programming language."
  end

  it "should use English notice when specific locale notice is missing" do
    # 'xz' is a virtual language with no locale file, so it should fallback to English notice
    xz_page = File.read("_site/xz/about/index.html")
    _(xz_page).must_match "This content is not currently available in the language you selected"
  end

  it "should not have a period at the end of the notice" do
    # Check English notice
    en_notice = YAML.load_file(File.expand_path("../_data/locales/en.yml", __dir__))['fallback_notice']
    _(en_notice).wont_match %r{\.\z}
    
    # Check Korean notice
    ko_notice = YAML.load_file(File.expand_path("../_data/locales/ko.yml", __dir__))['fallback_notice']
    _(ko_notice).wont_match %r{\.\z}
    
    # Test generated page
    ko_page = File.read("_site/ko/about/index.html")
    _(ko_page).wont_match %r{표시됩니다\.}
  end

  it "should correctly set categories for fallback posts" do
    xz_post = @site.posts.docs.find { |d| d.data['lang'] == 'xz' && d.data['fallback'] }
    _(xz_post.data['categories']).must_include 'xz'
    _(xz_post.data['categories']).wont_include 'en'
  end

  it "should maintain post sorting after adding fallback posts" do
    # The 'before' block already added posts and site.process ran.
    # FallbackGenerator calls site.posts.docs.sort!
    dates = @site.posts.docs.map(&:date)
    _(dates).must_equal dates.sort.reverse
  end

  it "should skip non-HTML/Markdown files (like XML, RSS)" do
    create_file("source/en/feed.xml", "XML content")
    
    # Re-run site process
    site = Jekyll::Site.new(@config)
    site.process
    
    # Check that no fallback for feed.xml was created
    @site.data['languages'].map { |l| l['code'] }.each do |lang|
      next if lang == 'en'
      file_wont_exist("_site/#{lang}/feed.xml")
    end
  end
end
