# frozen_string_literal: true

require "helper"
require "jekyll"
require_relative "../_plugins/translation_status"
require_relative "../_plugins/fallback_generator"

describe Jekyll::TranslationStatus do
  let(:actual_languages_path) { File.expand_path("../_data/languages.yml", __dir__) }

  before do
    chdir_tempdir

    # 1. Setup languages data from actual file
    create_file("source/_data/languages.yml", File.read(actual_languages_path))

    # 2. Setup locales from actual files
    locales_dir = File.expand_path("../_data/locales", __dir__)
    Dir.glob("#{locales_dir}/*.yml").each do |actual_locale_path|
      filename = File.basename(actual_locale_path)
      create_file("source/_data/locales/#{filename}", File.read(actual_locale_path))
    end

    # Setup layouts
    create_file("source/_layouts/news.html", "{{ content }}")
    create_file("source/_layouts/news_post.html", "{{ content }}")

    # Create English post (after START_DATE)
    create_file("source/en/news/_posts/2025-01-01-test-post.md", <<~MARKDOWN)
      ---
      layout: news_post
      title: "English Post"
      lang: en
      ---
      Content
    MARKDOWN

    # Create Japanese post (real translation)
    create_file("source/ja/news/_posts/2025-01-01-test-post.md", <<~MARKDOWN)
      ---
      layout: news_post
      title: "日本語のポスト"
      lang: ja
      ---
      コンテント
    MARKDOWN

    # French post is missing, will be generated as fallback

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

  it "should NOT count fallback posts as translated" do
    # Verify fallback post for French was created
    fr_post = @site.posts.docs.find { |d| d.data['lang'] == 'fr' && d.data['fallback'] }
    _(fr_post).wont_be_nil

    # Render twice to check for data leakage
    template = Liquid::Template.parse("{% translation_status %}")
    template.render!({}, registers: { site: @site })
    result = template.render!({}, registers: { site: @site })

    # 'fr' should NOT have the OK_CHAR (✓) for this post
    
    # Let's see the LANGS in the plugin
    langs = Jekyll::TranslationStatus::LANGS
    _(langs).must_include "fr"
    _(langs).must_include "ja"
    
    # Find the row for our post
    rows = result.scan(/<tr><td>.*?<\/td><\/tr>/m)
    post_row = rows.find { |r| r.include?("test-post") }
    _(post_row).wont_be_nil
    
    # Check for ✓ in ja and fr columns
    ja_idx = langs.index("ja")
    fr_idx = langs.index("fr")
    uk_idx = langs.index("uk")
    
    cells = post_row.scan(/<td>(.*?)<\/td>/).flatten
    
    _(cells[ja_idx + 1]).must_include "✓" # Japanese is translated
    _(cells[fr_idx + 1]).wont_include "✓" # French is a fallback, should be empty
    _(uk_idx).wont_be_nil # Ukrainian should be present as 'uk'
  end
end
