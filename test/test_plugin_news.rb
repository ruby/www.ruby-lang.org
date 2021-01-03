# frozen_string_literal: true

require "helper"

require "jekyll"
require_relative "../_plugins/news"


describe NewsArchivePlugin do

  before do
    chdir_tempdir

    content = <<~CONFIG
    CONFIG

    create_file("source/_config.yml", content)

    content = <<~LOCALES
      month_names:
        - January
        - February

      news:
        recent_news: Recent News
        yearly_archive_title: "%Y Archives"
        monthly_archive_title: "%B %Y Archives"
        yearly_archive_link: "%Y Archives"
        monthly_archive_link: "%B %Y"
    LOCALES

    create_file("source/_data/locales/en.yml", content)

    content = <<~LAYOUT
      ---
      layout: default
      ---
      NEWS LAYOUT

      {% for post in page.posts %}
        {{ post.title }}
      {% endfor %}
    LAYOUT

    create_file("source/_layouts/news.html", content)

    content = <<~LAYOUT
      ---
      layout: default
      ---
      NEWS ARCHIVE YEAR LAYOUT

      {% for post in page.posts %}
        {{ post.title }}
      {% endfor %}
    LAYOUT

    create_file("source/_layouts/news_archive_year.html", content)

    content = <<~LAYOUT
      ---
      layout: default
      ---
      NEWS ARCHIVE MONTH LAYOUT

      {% for post in page.posts %}
        {{ post.title }}
      {% endfor %}
    LAYOUT

    create_file("source/_layouts/news_archive_month.html", content)

    content = <<~POST
      ---
      title: "Post Jan 2020"
      author: "stomar"
      date: 2020-01-01 12:00:00 +0000
      lang: en
      ---

      Content
    POST

    create_file("source/en/news/_posts/2020-01-01-post.md", content)

    config = Jekyll.configuration(
      source: "source",
      destination: "_site",
      quiet: true
    )
    site = Jekyll::Site.new(config)

    file_wont_exist("_site")
    site.process
  end

  after do
    teardown_tempdir
  end

  it "should create news page" do
    file_must_exist("_site/en/news/index.html")
  end

  it "should use the correct layout for news page" do
    _(File.read("_site/en/news/index.html")).must_match "NEWS LAYOUT"
  end

  it "should create news/2020 page" do
    file_must_exist("_site/en/news/2020/index.html")
  end

  it "should use the correct layout for news/2020 page" do
    _(File.read("_site/en/news/2020/index.html")).must_match "YEAR LAYOUT"
  end

  it "should create news/2020/01 page" do
    file_must_exist("_site/en/news/2020/index.html")
  end

  it "should use the correct layout for news/2020/01 page" do
    _(File.read("_site/en/news/2020/01/index.html")).must_match "MONTH LAYOUT"
  end
end
